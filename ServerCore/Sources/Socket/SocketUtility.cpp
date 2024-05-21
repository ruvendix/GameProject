#include "Pch.h"
#include "SocketUtility.h"

namespace
{
	LPFN_CONNECTEX    s_connectExFn = nullptr;
	LPFN_DISCONNECTEX s_disconnectExFn = nullptr;
	LPFN_ACCEPTEX     s_acceptExFn = nullptr;
}

void RxSocketUtility::Startup()
{
	// WSA => Window Socket Application Interface
	WSADATA wsaData;
	if (::WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		PrintLastErrorCode();
		return;
	}

	// 소켓 생성
	SOCKET dummySocket = CreateAsynchronousSocket(IPPROTO_TCP);

	// 원하는 함수를 런타임에 등록하는 부분
	BindWindowsFunction(dummySocket, WSAID_CONNECTEX, reinterpret_cast<LPVOID*>(&s_connectExFn));
	BindWindowsFunction(dummySocket, WSAID_DISCONNECTEX, reinterpret_cast<LPVOID*>(&s_disconnectExFn));
	BindWindowsFunction(dummySocket, WSAID_ACCEPTEX, reinterpret_cast<LPVOID*>(&s_acceptExFn));
}

void RxSocketUtility::Cleanup()
{
	::WSACleanup();
}

void RxSocketUtility::PrintLastErrorCode()
{
	printf("Socket error code: %d\n", ::WSAGetLastError());
}

SOCKET RxSocketUtility::CreateBlockingSocket(int32 protocol)
{
	return (::socket(AF_INET, SOCK_STREAM, protocol));
}

// 논블로킹 소켓은 블로킹 소켓에서 바꿔주는 역할
SOCKET RxSocketUtility::CreateNonBlockingSocket(int32 protocol)
{
	SOCKET socket = CreateBlockingSocket(protocol);

	u_long socketMode = 1; // 논블로킹, 0이면 블로킹
	if (::ioctlsocket(socket, FIONBIO, &socketMode) == INVALID_SOCKET)
	{
		PrintLastErrorCode();
	}

	return socket;
}

SOCKET RxSocketUtility::CreateAsynchronousSocket(int32 protocol)
{
	return (::WSASocket(AF_INET, SOCK_STREAM, protocol, nullptr, 0, WSA_FLAG_OVERLAPPED));
}

void RxSocketUtility::BindWindowsFunction(SOCKET socket, GUID wsaGuid, LPVOID* pFn)
{
	DWORD retBytes = 0;

	// SIO_GET_EXTENSION_FUNCTION_POINTER는 함수 포인터를 알려주므로 외부 함수로 받을 때는 더블 포인터를 사용!
	if (::WSAIoctl(socket, SIO_GET_EXTENSION_FUNCTION_POINTER, &wsaGuid, sizeof(wsaGuid), pFn, sizeof(*pFn), &retBytes, nullptr, nullptr) == SOCKET_ERROR)
	{
		PrintLastErrorCode();
	}
}

void RxSocketUtility::BindSocket(SOCKET listenSocket, const SOCKADDR_IN& netAddressData)
{
	if (::bind(listenSocket, reinterpret_cast<const SOCKADDR*>(&netAddressData), sizeof(netAddressData)) == SOCKET_ERROR)
	{
		PrintLastErrorCode();
	}
}

void RxSocketUtility::BindAnyAddress(SOCKET listenSocket, uint16 port)
{
	SOCKADDR_IN netAddressData;
	netAddressData.sin_family = AF_INET;
	netAddressData.sin_addr.s_addr = ::htonl(INADDR_ANY);
	netAddressData.sin_port = ::htons(port);

	BindSocket(listenSocket, netAddressData);
}

void RxSocketUtility::Listen(SOCKET listenSocket, int32 backlog)
{
	if (::listen(listenSocket, backlog) == SOCKET_ERROR)
	{
		PrintLastErrorCode();
	}
}

int32 RxSocketUtility::Connect(SOCKET clientSocket, const SOCKADDR_IN& netAddressData)
{
	return (::connect(clientSocket, reinterpret_cast<const SOCKADDR*>(&netAddressData), sizeof(netAddressData)));
}

SOCKET RxSocketUtility::Accept(SOCKET listenSocket, SOCKADDR_IN* pClientAddressData)
{
	int32 addressLength = sizeof(SOCKADDR_IN);
	return (::accept(listenSocket, reinterpret_cast<SOCKADDR*>(pClientAddressData), &addressLength));
}

int32 RxSocketUtility::Send(SOCKET socket, char* sendBuffer, int32 sendBufferSize)
{
	return (::send(socket, sendBuffer, sendBufferSize, 0));
}

int32 RxSocketUtility::Receive(SOCKET socket, char* recvBuffer, int32 recvBufferSize)
{
	return (::recv(socket, recvBuffer, recvBufferSize, 0));
}

int32 RxSocketUtility::Select(fd_set* pReadFds, fd_set* pWrites, fd_set* pExcepts)
{
	return (::select(0, pReadFds, pWrites, pExcepts, nullptr)); // 준비될 때까지 무한 대기
}

void RxSocketUtility::CloseSocket(SOCKET& inoutSocket)
{
	if (inoutSocket != INVALID_SOCKET)
	{
		::closesocket(inoutSocket);
	}

	inoutSocket = INVALID_SOCKET;
}

void RxSocketUtility::ModifyLinger(SOCKET socket, uint16 onOff, uint16 linger)
{
	LINGER lingerData;
	lingerData.l_onoff = onOff;
	lingerData.l_linger = linger;
	
	ModifySocketOption(socket, SOL_SOCKET, SO_LINGER, lingerData);
}

void RxSocketUtility::ModifyReuseAddress(SOCKET socket, bool bFlag)
{
	ModifySocketOption(socket, SOL_SOCKET, SO_REUSEADDR, bFlag);
}

void RxSocketUtility::ModifySendBufferSize(SOCKET socket, int32 newSize)
{
	ModifySocketOption(socket, SOL_SOCKET, SO_SNDBUF, newSize);
}

void RxSocketUtility::ModifyReceiveBufferSize(SOCKET socket, int32 newSize)
{
	ModifySocketOption(socket, SOL_SOCKET, SO_RCVBUF, newSize);
}

void RxSocketUtility::ModifyTcpNoDelay(SOCKET socket, bool bFlag)
{
	ModifySocketOption(socket, SOL_SOCKET, TCP_NODELAY, bFlag);
}

void RxSocketUtility::ModifyUpdateAcceptSocket(SOCKET socket, SOCKET listenSocket)
{
	ModifySocketOption(socket, SOL_SOCKET, SO_UPDATE_ACCEPT_CONTEXT, listenSocket);
}