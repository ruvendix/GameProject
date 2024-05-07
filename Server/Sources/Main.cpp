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

	// 서버 소켓을 TCP로 생성
	SOCKET serverSocket = ::socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
	if (serverSocket == INVALID_SOCKET)
	{
		Rx::PrintServerLastErrorCode();
		return 0;
	}

	// 서버 주소 설정
	SOCKADDR_IN serverAddr;
	::ZeroMemory(&serverAddr, sizeof(SOCKADDR_IN));
	serverAddr.sin_family = AF_INET;
	serverAddr.sin_port = ::htons(7777);
	serverAddr.sin_addr.s_addr = ::htonl(INADDR_ANY);

	// 설정한 주소로 소켓에 바인딩
	if (::bind(serverSocket, reinterpret_cast<sockaddr*>(&serverAddr), sizeof(SOCKADDR_IN)) == SOCKET_ERROR)
	{
		Rx::PrintServerLastErrorCode();
		return 0;
	}

	while (true)
	{
		SOCKADDR_IN clientAddr;
		::ZeroMemory(&clientAddr, sizeof(SOCKADDR_IN));
		int addrLen = sizeof(SOCKADDR_IN);

		char ip[16]; // 접속한 클라이언트의 ip 정보 알아내기
		if (inet_ntop(AF_INET, &clientAddr.sin_addr, ip, sizeof(ip)) == nullptr)
		{
			Rx::PrintServerLastErrorCode();
			return 0;
		}

		char recvBuffer[100]; // 클라이언트가 보낸 데이터를 수신
		int recvLen = ::recvfrom(serverSocket, recvBuffer, sizeof(recvBuffer), 0, reinterpret_cast<SOCKADDR*>(&clientAddr), &addrLen);
		if (recvLen <= 0)
		{
			Rx::PrintServerLastErrorCode();
			return 0;
		}

		printf("Recv Data: %s\n", recvBuffer);
		printf("Recv Data Len: %d\n", recvLen);

		// 수신한 데이터를 다시 클라이언트로 보냄
		if (::sendto(serverSocket, recvBuffer, sizeof(recvBuffer), 0, reinterpret_cast<SOCKADDR*>(&clientAddr), addrLen) == SOCKET_ERROR)
		{
			Rx::PrintServerLastErrorCode();
			return 0;
		}
	}

	if (::closesocket(serverSocket) != 0)
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