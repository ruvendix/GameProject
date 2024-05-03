#include "Pch.h"

int main()
{
	WSADATA wsaData;
	::ZeroMemory(&wsaData, sizeof(WSADATA));
	if (::WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		Rx::PrintServerLastErrorCode();
		return 0;
	}

	// 클라이언트 소켓 생성
	SOCKET clientSocket = ::socket(AF_INET, SOCK_STREAM, 0);
	if (clientSocket == INVALID_SOCKET)
	{
		Rx::PrintServerLastErrorCode();
		return 0;
	}

	// 접속할 서버 주소 설정
	SOCKADDR_IN serverAddr;
	::ZeroMemory(&serverAddr, sizeof(SOCKADDR_IN));
	serverAddr.sin_family = AF_INET;
	serverAddr.sin_port = ::htons(7777);
	::inet_pton(AF_INET, "127.0.0.1", &serverAddr.sin_addr);

	// 서버로 연결 시도
	if (::connect(clientSocket, reinterpret_cast<sockaddr*>(&serverAddr), sizeof(SOCKADDR_IN)) == SOCKET_ERROR)
	{
		Rx::PrintServerLastErrorCode();
		return 0;
	}

	printf("Connected To Server!\n");

	while (true)
	{
		// 서버로 데이터 송신
		char sendBuffer[100] = "Hello! I am Client";
		if (::send(clientSocket, sendBuffer, sizeof(sendBuffer), 0) == SOCKET_ERROR)
		{
			Rx::PrintServerLastErrorCode();
			return 0;
		}

		// 서버로부터 데이터 수신
		char recvBuffer[100];
		int recvLen = ::recv(clientSocket, recvBuffer, sizeof(recvBuffer), 0);
		if (recvLen <= 0)
		{
			Rx::PrintServerLastErrorCode();
			return 0;
		}

		printf("Echo Data: %s\n", recvBuffer);
		std::this_thread::sleep_for(1s);
	}

	if (::closesocket(clientSocket) != 0)
	{
		Rx::PrintServerLastErrorCode();
		return 0;
	}

	if (::WSACleanup() == SOCKET_ERROR)
	{
		Rx::PrintServerLastErrorCode();
		return 0;
	}

	return 0;
}