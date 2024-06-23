#pragma once

class RxSession;
class RxIocpEvent;

/*
namespace가 아니라면 Utility
Utility 클래스는 객체로 만들지 않음
*/
class RxSocketUtility
{
public:
	static void Startup();
	static void Cleanup();

	static void PrintLastErrorCode();

	static SOCKET CreateBlockingSocket(int32 protocol);
	static SOCKET CreateNonBlockingSocket(int32 protocol);
	static SOCKET CreateAsynchronousSocket(int32 protocol);

	static void BindWindowsFunction(SOCKET socket, GUID wsaGuid, LPVOID* ppFn);

	static void BindSocket(SOCKET listenSocket, const SOCKADDR_IN& netAddressData);
	static void BindAnyAddress(SOCKET listenSocket, uint16 port);
	static void Listen(SOCKET listenSocket, int32 backlog);
	static void CloseSocket(SOCKET& inoutSocket);

	static SOCKET Accept(SOCKET listenSocket, SOCKADDR_IN* pClientAddressData);
	static BOOL   AcceptEx(SOCKET listenSocket, RxSession* pSession, DWORD* pReceivedBytes, RxIocpEvent* pAcceptEvent);

	static int32 Connect(SOCKET clientSocket, const SOCKADDR_IN& netAddressData);
	static int32 Send(SOCKET socket, char* sendBuffer, int32 sendBufferSize);
	static int32 Receive(SOCKET socket, char* recvBuffer, int32 recvBufferSize);
	static int32 Select(fd_set* pReadFds, fd_set* pWrites, fd_set* pExcepts);

	static bool ModifyLinger(SOCKET socket, uint16 onOff, uint16 linger);
	static bool ModifyReuseAddress(SOCKET socket, bool bFlag);
	static bool ModifySendBufferSize(SOCKET socket, int32 newSize);
	static bool ModifyReceiveBufferSize(SOCKET socket, int32 newSize);
	static bool ModifyTcpNoDelay(SOCKET socket, bool bFlag);
	static bool ModifyUpdateAcceptSocket(SOCKET socket, SOCKET listenSocket);

	template <typename T>
	static bool ModifySocketOption(SOCKET socket, int32 level, int32 optionCode, const T& option)
	{
		if (::setsockopt(socket, level, optionCode, reinterpret_cast<const char*>(&option), sizeof(option)) == SOCKET_ERROR)
		{
			PrintLastErrorCode();
			return false;
		}

		return true;
	}
};