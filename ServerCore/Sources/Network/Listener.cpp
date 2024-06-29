#include "Pch.h"
#include "Listener.h"

#include "IocpCore.h"
#include "IocpEvent.h"
#include "NetworkAddress.h"
#include "Session.h"

RxListener::RxListener()
{
}

RxListener::~RxListener()
{
	for (RxIocpEvent* pIocpEvent : m_iocpEvents)
	{
		SAFE_DELETE(pIocpEvent);
	}

	RxSocketUtility::CloseSocket(m_listenSocket);
}

HANDLE RxListener::BringHandle()
{
	return (reinterpret_cast<HANDLE>(m_listenSocket));
}

void RxListener::Dispatch(RxIocpEvent* pIocpEvent, int32 numOfBytes)
{
	assert(pIocpEvent->GetNetworkEvent() == ENetworkEventType::Accept);
	ProcessAccept(pIocpEvent);
}

bool RxListener::ReadyToAccept(RxIocpCore* pIocpCore, const RxNetworkAddress& netAddress)
{
	m_listenSocket = RxSocketUtility::CreateAsynchronousSocket(IPPROTO_TCP);
	if (m_listenSocket == INVALID_SOCKET)
	{
		return false;
	}

	assert(pIocpCore != nullptr);
	if (pIocpCore->Register(this) == false)
	{
		return false;
	}

	if (RxSocketUtility::ModifyReuseAddress(m_listenSocket, true) == false)
	{
		return false;
	}

	if (RxSocketUtility::ModifyLinger(m_listenSocket, 0, 0) == false)
	{
		return false;
	}

	RxSocketUtility::BindSocket(m_listenSocket, netAddress.GetSockAddr());
	RxSocketUtility::Listen(m_listenSocket, SOMAXCONN);

	const uint32 acceptCount = 1;
	for (uint32 i = 0; i < acceptCount; ++i)
	{
		RxIocpEvent* pIocpEvent = new RxIocpEvent(shared_from_this());
		pIocpEvent->SetNetworkEvent(ENetworkEventType::Accept);

		m_iocpEvents.push_back(pIocpEvent);
		RegisterAccept(pIocpEvent);
	}

	return true;
}

void RxListener::RegisterAccept(RxIocpEvent* pAcceptEvent)
{
	RxSessionPtr spSession = std::make_shared<RxSession>();
	pAcceptEvent->SetSession(spSession);

	DWORD dwReceivedBytes = 0;
	if (RxSocketUtility::AcceptEx(m_listenSocket, spSession, &dwReceivedBytes, pAcceptEvent) == FALSE)
	{
		int32 errCode = ::WSAGetLastError();
		if (errCode != WSA_IO_PENDING)
		{
			// 다시 시도
			RegisterAccept(pAcceptEvent);
		}
	}
}

void RxListener::ProcessAccept(RxIocpEvent* pAcceptEvent)
{
	RxSessionPtr spSession = pAcceptEvent->GetSession();
	if (RxSocketUtility::ModifyUpdateAcceptSocket(spSession->GetSocket(), m_listenSocket) == false)
	{
		// 다시 시도
		RegisterAccept(pAcceptEvent);
		return;
	}

	SOCKADDR_IN sockAddr;
	int32 sockAddrSize = sizeof(SOCKADDR_IN);
	::ZeroMemory(&sockAddr, sockAddrSize);

	if (::getpeername(spSession->GetSocket(), reinterpret_cast<SOCKADDR*>(&sockAddr), &sockAddrSize) == SOCKET_ERROR)
	{
		// 다시 시도
		RegisterAccept(pAcceptEvent);
		return;
	}

	RxNetworkAddress networkAddr(sockAddr);
	spSession->SetNetworkAddress(networkAddr);
	printf("Client connected!\n");

	// TODO

	// 비동기 함수니까 반드시 재호출 필요!
	RegisterAccept(pAcceptEvent);
}