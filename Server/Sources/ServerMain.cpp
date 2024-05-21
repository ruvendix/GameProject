#include "Pch.h"

/*
<서버의 TCP 소켓>
-socket: 소켓 생성
-bind:   설정한 서버 주소를 적용
-listen: 서버 영업 개시
-accept: 클라가 접속하기를 기다림

-send: 요청한 데이터를 송신 버퍼에 복사
-recv: 수신 버퍼에 도착한 데이터를 User 수준의 버퍼에 복사
*/

/*
<Select 모델>
-select 함수가 핵심!
-소켓 Api가 성공할 시점을 미리 알 수 있음!
--recv 버퍼에 데이터가 없는데 read하는 상황
--send 버퍼가 꽉 찼는데 send하는 상황
-블로킹과 논블로킹 둘 다 가능(동기 비동기 개념이 아님!)
--블로킹 소켓: 조건이 만족되지 않아서 블로킹되는 상황 예방 (게임에서는 안씀)
--논블로킹 소켓: 조건이 만족되지 않아서 불필요하게 자주 체크하는 상황 예방
*/

/*
<소켓 설정 방법>
1) read, write, except(out of band)를 관찰 대상으로 등록
--OOB는 send()에 마지막 인자로 MSG_OOB를 보내는 특별한 데이터
  받는 쪽인 recv()에도 같은 설정을 해야 사용 가능
2) select(read, write, except)로 관찰 시작
3) 관찰한 것들 중에서 하나라도 준비되면 반환(낙오자는 자동 패스)
4) 낙오자 체크해서 반복 진행
*/

/*
<FD(File Descriptor, 입출력 고유 식별자) 설정>
-fd는 쉽게 말하면 소켓의 식별자(관찰할 수 있는 소켓은 64개로 제한)
-fd_set 구조체를 사용
-FD_ZERO: 관찰 목록 초기화
-FD_SET: 관찰할 소켓 추가
-FD_CLR: 관찰 중인 소켓 제거
-FD_ISSET: 해당 소켓이 관찰 중이면 0이 아닌값 반환
*/

/*
서버를 아무 모델로 구현해도 클라이언트는 기본 구조에서 변하지 않음
즉, 동기 블로킹 모델이든 비동기 논블로킹 모델이든 클라이언트는 같음
*/

const uint32 MAX_BUFFER_SIZE = 1000;

// 세션(클라이언트와 서버 간의 상호작용을 편하게 만드는 보조 도구)
struct RxClientSession
{
	SOCKET socket = INVALID_SOCKET;
	char   recvBuffer[MAX_BUFFER_SIZE];
	int32  recvBytes = 0;
};

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

	// 클라이언트 세션
	std::vector<RxClientSession> clientSessionList;
	clientSessionList.reserve(100);

	// 클라이언트와 상호작용
	while (true)
	{
		fd_set readFds;

		// 관찰 소켓 목록 초기화
		FD_ZERO(&readFds);

		// 리슨 소켓 등록
		FD_SET(listenSocket, &readFds);

		// 클라이언트 소켓 등록
		for (auto& clientSession : clientSessionList)
		{
			FD_SET(clientSession.socket, &readFds);
		}

		// 마지막 인자는 timeout 설정할 때 사용
		int32 ret = ::RxSocketUtility::Select(&readFds, nullptr, nullptr);
		if (ret == SOCKET_ERROR)
		{
			RxSocketUtility::PrintLastErrorCode();
			break;
		}

		// 항상 관찰 중인지 검사!
		if (FD_ISSET(listenSocket, &readFds) != 0)
		{
			SOCKADDR_IN clientAddressData;
			SOCKET clientSocket = RxSocketUtility::Accept(listenSocket, &clientAddressData);
			if (clientSocket == INVALID_SOCKET)
			{
				// 원래는 블로킹해야 하지만 논블로킹이면 통과
				if (::WSAGetLastError() == WSAEWOULDBLOCK)
				{
					continue;
				}
			}

			printf("Client connected!\n\n");

			// 연결되었으니 클라이언트 세션 추가
			RxClientSession newCientSession;
			newCientSession.socket = clientSocket;
			clientSessionList.push_back(newCientSession);
		}

		// 클라이언트 세션들로 진행
		for (auto& clientSesseion : clientSessionList)
		{
			if (FD_ISSET(clientSesseion.socket, &readFds) == 0)
			{
				continue;
			}

			clientSesseion.recvBytes = RxSocketUtility::Receive(clientSesseion.socket, clientSesseion.recvBuffer, sizeof(clientSesseion.recvBuffer));
			if (clientSesseion.recvBytes == SOCKET_ERROR)
			{
				// 원래는 블로킹해야 하지만 논블로킹이면 통과
				if (::WSAGetLastError() == WSAEWOULDBLOCK)
				{
					continue;
				}

				RxSocketUtility::PrintLastErrorCode();
				break;
			}

			printf("Recv data: %s\n", clientSesseion.recvBuffer);
			printf("Recv data length: %d\n\n", clientSesseion.recvBytes);
		}
	}

	RxSocketUtility::CloseSocket(listenSocket);
	RxSocketUtility::Cleanup();

	return 0;
}