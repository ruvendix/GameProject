#include "Pch.h"

/*
<클라이언트의 TCP 소켓>
-socket:  소켓 생성
-connect: 서버에 접속 시도

-send: 요청한 데이터를 송신 버퍼에 복사
-recv: 수신 버퍼에 도착한 데이터를 User 수준의 버퍼에 복사
*/

int main()
{
	//RxSocketUtility::Startup();

	// WSA => Window Socket Application Interface
	WSADATA wsaData;
	if (::WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		return 0;
	}

	// 논블로킹 소켓으로 생성
	SOCKET clientSocket = RxSocketUtility::CreateNonBlockingSocket(IPPROTO_TCP);

	// 접속할 서버 주소 정보
	SOCKADDR_IN serverAddressData;
	serverAddressData.sin_family = AF_INET;
	::inet_pton(AF_INET, "127.0.0.1", &serverAddressData.sin_addr);
	serverAddressData.sin_port = ::htons(7777);

	// 서버에 연결 시도
	while (true)
	{
		//if (RxSocketUtility::Connect(clientSocket, serverAddressData) == SOCKET_ERROR)
		if (::connect(clientSocket, (SOCKADDR*)&serverAddressData, sizeof(serverAddressData)) == SOCKET_ERROR)
		{
			int32 errorCode = ::WSAGetLastError();

			// 원래는 블로킹해야 하지만 논블로킹이면 통과
			if (errorCode == WSAEWOULDBLOCK)
			{
				continue;
			}

			// 이미 연결된 상태라면 빠져나감(오류 아님)
			if (errorCode == WSAEISCONN)
			{
				break;
			}
		}
	}

	// 서버와 상호작용
	while (true)
	{
		char sendBuffer[1000] = "Hello i am client!";
		int32 sendSize = sizeof(sendBuffer);

		int32 sendLength = RxSocketUtility::Send(clientSocket, sendBuffer, sizeof(sendBuffer));
		if (sendLength == SOCKET_ERROR)
		{
			int32 errorCode = ::WSAGetLastError();

			// 원래는 블로킹해야 하지만 논블로킹이면 통과
			if (errorCode == WSAEWOULDBLOCK)
			{
				continue;
			}
			else if (errorCode == WSAECONNRESET)
			{
				break;
			}

			printf("Send data length: %d (NonBlocking)\n", sendLength);
		}

		printf("Send data length: %d\n", sendLength);
		std::this_thread::sleep_for(1s);
	}

	RxSocketUtility::CloseSocket(clientSocket);
	RxSocketUtility::Cleanup();

	return 0;
}