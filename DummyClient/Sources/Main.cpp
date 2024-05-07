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
	SOCKET clientSocket = ::socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
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

	while (true)
	{
		// 서버로 데이터 송신
		char sendBuffer[100] = "Hello! I am Client";
		if (::sendto(clientSocket, sendBuffer, sizeof(sendBuffer), 0, reinterpret_cast<SOCKADDR*>(&serverAddr), sizeof(SOCKADDR_IN)) == SOCKET_ERROR)
		{
			Rx::PrintServerLastErrorCode();
			return 0;
		}

		int addrLen = sizeof(SOCKADDR_IN);

		// 서버로부터 데이터 수신
		char recvBuffer[100];
		int recvLen = ::recvfrom(clientSocket, recvBuffer, sizeof(recvBuffer), 0, reinterpret_cast<SOCKADDR*>(&serverAddr), &addrLen);
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