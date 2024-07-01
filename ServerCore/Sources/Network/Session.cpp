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
	생각해야 하는 문제
	1) 버퍼 관리는?
	2) 각 송신 처리는 하나씩? 쌓아서?
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
	wstrReason += L" (접속 중인 클라이언트 강제로 중단)\n";
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

	// 이벤트 오너는 세션
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
	wsaBuffer.len = static_cast<ULONG>(m_receiveBuffer.GetRemainSize()); // 얼만큼 읽을 건지?

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

	// 세션 등록
	const RxSessionPtr& spThisSession = std::dynamic_pointer_cast<RxSession>(shared_from_this());
	GET_OWNER_PTR(m_spOwner)->AddSession(spThisSession);

	ProcessConnectImpl();

	// 수신 등록
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
		Disconnect(L"수신 받은 데이터가 없음");
		return;
	}

	if (m_receiveBuffer.ProcessWrite(numOfBytes) == false)
	{
		Disconnect(L"수신 받은 데이터가 너무 많아서 쓸 수 없음");
		return;
	}

	uint32 dataSize = m_receiveBuffer.GetDataSize();
	uint32 processedDataSize = ProcessReceiveImpl(m_receiveBuffer.GetReadPosition(), dataSize);

	if ((processedDataSize < 0) || // 처리된 데이터 크기가 0보다 작으면 문제있음
		(processedDataSize < dataSize)) // 요청한만큼 처리를 못했으니 문제있음
	{
		Disconnect(L"요청한만큼 수신 처리를 못했음");
		return;
	}

	// 수신 버퍼 정리
	m_receiveBuffer.Cleanup();

	// 수신 등록
	RegisterReceive();
}

void RxSession::ProcessSend(RxIocpEvent* pSendEvent, uint32 numOfBytes)
{
	pSendEvent->SetOwner(nullptr);
	SAFE_DELETE(pSendEvent);

	if (numOfBytes == 0)
	{
		Disconnect(L"송신할 데이터가 없음");
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
		Disconnect(L"치명적인 오류");
		break;
	}

	return errorCode;
}