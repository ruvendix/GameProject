#include "Pch.h"
#include "Session.h"

#include "IocpEvent.h"
#include "Service.h"

namespace
{
	const uint32 MAX_BLOCK_SIZE = 0x10000; // 64KB
}

RxSession::RxSession() :
	m_receiveBuffer(MAX_BLOCK_SIZE)
{
	m_socket = RxSocketUtility::CreateAsynchronousSocket(IPPROTO_TCP);

	m_pConnectEvent = new RxIocpEvent(ENetworkEventType::Connect);
	m_pDisconnectEvent = new RxIocpEvent(ENetworkEventType::Disconnect);
	m_pReceiveEvent = new RxIocpEvent(ENetworkEventType::Receive);
}

RxSession::~RxSession()
{
	SAFE_DELETE(m_pConnectEvent);
	SAFE_DELETE(m_pDisconnectEvent);
	SAFE_DELETE(m_pReceiveEvent);

	RxSocketUtility::CloseSocket(m_socket);
}

HANDLE RxSession::BringHandle()
{
	return reinterpret_cast<HANDLE>(m_socket);
}

void RxSession::Dispatch(RxIocpEvent* pIocpEvent, uint32 numOfBytes)
{
	switch (pIocpEvent->GetNetworkEvent())
	{
	case ENetworkEventType::Connect:
		ProcessConnect();
		break;

	case ENetworkEventType::Disconnect:
		ProcessDisconnect();
		break;

	case ENetworkEventType::Receive:
		ProcessReceive(numOfBytes);
		break;

	case ENetworkEventType::Send:
		ProcessSend(pIocpEvent, numOfBytes);
		break;
	}
}

void RxSession::Send(BYTE* buffer, uint32 numOfBytes)
{
	/*
	�����ؾ� �ϴ� ����
	1) ���� ������?
	2) �� �۽� ó���� �ϳ���? �׾Ƽ�?
	*/

	RxIocpEvent* pSendEvent = new RxIocpEvent(shared_from_this(), ENetworkEventType::Send);
	pSendEvent->GetBuffer().resize(numOfBytes);
	::CopyMemory(pSendEvent->GetBuffer().data(), buffer, numOfBytes);

	RegisterSend(pSendEvent);
}

bool RxSession::Connect()
{
	return RegisterConnect();
}

void RxSession::Disconnect(const std::wstring_view& wszReason)
{
	if (m_bAtomicConnected == false)
	{
		return;
	}

	std::wstring wstrReason = wszReason.data();
	wstrReason += L" (���� ���� Ŭ���̾�Ʈ ������ �ߴ�)\n";
	wprintf_s(wstrReason.c_str());

	const RxSessionPtr& spThisSession = std::dynamic_pointer_cast<RxSession>(shared_from_this());
	GET_OWNER_PTR(m_spOwner)->ReleaseSession(spThisSession);

	RegisterDisconnect();
}

bool RxSession::RegisterConnect()
{
	if (IsConnected())
	{
		return false;
	}

	if (GET_OWNER_PTR(m_spOwner)->GetServiceType() != EServiceType::Client)
	{
		return false;
	}

	if (RxSocketUtility::ModifyReuseAddress(m_socket, true) == false)
	{
		return false;
	}

	RxSocketUtility::BindAnyAddress(m_socket, 0);

	// �̺�Ʈ ���ʴ� ����
	m_pConnectEvent->SetOwner(shared_from_this());

	DWORD dwNumOfBytes = 0;
	SOCKADDR_IN sockAddr = GET_OWNER_PTR(m_spOwner)->GetNetworkAddress().GetSockAddr();

	if (RxSocketUtility::ConnectEx(m_socket, sockAddr, &dwNumOfBytes, m_pConnectEvent) == FALSE)
	{
		int32 errorCode = RxSocketUtility::HandleLastError();
		if (errorCode != WSA_IO_PENDING)
		{
			m_pConnectEvent->SetOwner(nullptr);
			return false;
		}
	}

	return true;
}

bool RxSession::RegisterDisconnect()
{
	m_pDisconnectEvent->SetOwner(shared_from_this());

	if (RxSocketUtility::DisconnectEx(m_socket, m_pDisconnectEvent) == FALSE)
	{
		int32 errorCode = RxSocketUtility::HandleLastError();
		if (errorCode != WSA_IO_PENDING)
		{
			m_pDisconnectEvent->SetOwner(nullptr);
			return false;
		}
	}

	return true;
}

void RxSession::RegisterReceive()
{
	if (IsConnected() == false)
	{
		return;
	}

	m_pReceiveEvent->SetOwner(shared_from_this());

	WSABUF wsaBuffer;
	wsaBuffer.buf = reinterpret_cast<char*>(m_receiveBuffer.GetWrtiePosition());
	wsaBuffer.len = static_cast<ULONG>(m_receiveBuffer.GetRemainSize()); // ��ŭ ���� ����?

	DWORD flags = 0;
	DWORD dwNumOfBytes = 0;

	if (::WSARecv(m_socket, &wsaBuffer, 1, &dwNumOfBytes, &flags, m_pReceiveEvent->GetOverlapped(), nullptr) == SOCKET_ERROR)
	{
		int32 errorCode = HandleLastError();
		if (errorCode != WSA_IO_PENDING)
		{
			m_pReceiveEvent->SetOwner(nullptr);
		}
	}
}

void RxSession::RegisterSend(RxIocpEvent* pSendEvent)
{
	if (IsConnected() == false)
	{
		return;
	}

	WSABUF wsaBuffer;
	wsaBuffer.buf = reinterpret_cast<char*>(pSendEvent->GetBuffer().data());
	wsaBuffer.len = static_cast<ULONG>(pSendEvent->GetBuffer().size());

	DWORD dwNumOfBytes = 0;
	if (::WSASend(m_socket, &wsaBuffer, 1, &dwNumOfBytes, 0, pSendEvent->GetOverlapped(), nullptr) == SOCKET_ERROR)
	{
		int32 errorCode = RxSocketUtility::HandleLastError();
		if (errorCode != WSA_IO_PENDING)
		{
			pSendEvent->SetOwner(nullptr);
			SAFE_DELETE(pSendEvent);
		}
	}
}

void RxSession::ProcessConnect()
{
	m_pConnectEvent->SetOwner(nullptr);
	m_bAtomicConnected = true;

	// ���� ���
	const RxSessionPtr& spThisSession = std::dynamic_pointer_cast<RxSession>(shared_from_this());
	GET_OWNER_PTR(m_spOwner)->AddSession(spThisSession);

	ProcessConnectImpl();

	// ���� ���
	RegisterReceive();
}

void RxSession::ProcessDisconnect()
{
	m_pDisconnectEvent->SetOwner(nullptr);
	ProcessDisconnectImpl();
}

void RxSession::ProcessReceive(uint32 numOfBytes)
{
	m_pReceiveEvent->SetOwner(nullptr);

	if (numOfBytes == 0)
	{
		Disconnect(L"���� ���� �����Ͱ� ����");
		return;
	}

	if (m_receiveBuffer.ProcessWrite(numOfBytes) == false)
	{
		Disconnect(L"���� ���� �����Ͱ� �ʹ� ���Ƽ� �� �� ����");
		return;
	}

	uint32 dataSize = m_receiveBuffer.GetDataSize();
	uint32 processedDataSize = ProcessReceiveImpl(m_receiveBuffer.GetReadPosition(), dataSize);

	if ((processedDataSize < 0) || // ó���� ������ ũ�Ⱑ 0���� ������ ��������
		(processedDataSize < dataSize)) // ��û�Ѹ�ŭ ó���� �������� ��������
	{
		Disconnect(L"��û�Ѹ�ŭ ���� ó���� ������");
		return;
	}

	// ���� ���� ����
	m_receiveBuffer.Cleanup();

	// ���� ���
	RegisterReceive();
}

void RxSession::ProcessSend(RxIocpEvent* pSendEvent, uint32 numOfBytes)
{
	pSendEvent->SetOwner(nullptr);
	SAFE_DELETE(pSendEvent);

	if (numOfBytes == 0)
	{
		Disconnect(L"�۽��� �����Ͱ� ����");
		return;
	}

	ProcessSendImpl(numOfBytes);
}

int32 RxSession::HandleLastError()
{
	int32 errorCode = RxSocketUtility::HandleLastError();

	switch (errorCode)
	{
	case WSAECONNRESET:
	case WSAECONNABORTED:
		Disconnect(L"ġ������ ����");
		break;
	}

	return errorCode;
}