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

	// ���� ����
	SOCKET dummySocket = CreateAsynchronousSocket(IPPROTO_TCP);

	// ���ϴ� �Լ��� ��Ÿ�ӿ� ����ϴ� �κ�
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

// ����ŷ ������ ���ŷ ���Ͽ��� �ٲ��ִ� ����
SOCKET RxSocketUtility::CreateNonBlockingSocket(int32 protocol)
{
	SOCKET socket = CreateBlockingSocket(protocol);

	u_long socketMode = 1; // ����ŷ, 0�̸� ���ŷ
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

	// SIO_GET_EXTENSION_FUNCTION_POINTER�� �Լ� �����͸� �˷��ֹǷ� �ܺ� �Լ��� ���� ���� ���� �����͸� ���!
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
	return (::select(0, pReadFds, pWrites, pExcepts, nullptr)); // �غ�� ������ ���� ���
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