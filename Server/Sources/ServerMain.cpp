#include "Pch.h"

/*
서버의 TCP 소켓
-socket: 소켓 생성
-bind:   설정한 서버 주소를 적용
-listen: 서버 영업 개시
-accept: 클라가 접속하기를 기다림

-send: 요청한 데이터를 송신 버퍼에 복사
-recv: 수신 버퍼에 도착한 데이터를 User 수준의 버퍼에 복사
*/

int main()
{
	RxSocketUtility::Startup();

	// 논블로킹 소켓으로 생성
	SOCKET listenSocket = RxSocketUtility::CreateNonBlockingSocket(IPPROTO_TCP);

	// 전에 사용했던 주소 재사용하도록 설정!
	RxSocketUtility::ModifyReuseAddress(listenSocket, true);

	// 테스트용 주소
	RxSocketUtility::BindAnyAddress(listenSocket, 7777);

	// 서버 영업 개시
	RxSocketUtility::Listen(listenSocket, SOMAXCONN);

	// 클라이언트와 상호작용
	while (true)
	{
		SOCKADDR_IN clientAddressata;
		SOCKET clientSocket = RxSocketUtility::Accept(listenSocket, &clientAddressata);
		if ((clientSocket == INVALID_SOCKET) &&
			(::WSAGetLastError() == WSAEWOULDBLOCK)) // 원래는 블로킹해야 하지만 논블로킹이면 통과
		{
			continue;
		}

		printf("Client connected!\n");

		// Receive
		while (true)
		{
			char recvBuffer[1000];
			
			int32 recvLen = RxSocketUtility::Receive(clientSocket, recvBuffer, sizeof(recvBuffer));
			if (recvLen == SOCKET_ERROR)
			{
				// 원래는 블로킹해야 하지만 논블로킹이면 통과
				if (::WSAGetLastError() == WSAEWOULDBLOCK)
				{
					continue;
				}

				RxSocketUtility::PrintLastErrorCode();
				break;
			}

			printf("Recv data: %s\n", recvBuffer);
			printf("Recv data length: %d\n\n", recvLen);
		}
	}

	RxSocketUtility::CloseSocket(listenSocket);
	RxSocketUtility::Cleanup();

	return 0;
}