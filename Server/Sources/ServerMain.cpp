#include "Pch.h"

const uint32 MAX_BUFFER_SIZE = 1000;

// 세션(클라이언트와 서버 간의 상호작용을 편하게 만드는 보조 도구)
struct RxSession
{
	SOCKET socket = INVALID_SOCKET;
	char   recvBuffer[MAX_BUFFER_SIZE];
	int32  recvBytes = 0;
	WSAOVERLAPPED overapped;
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

	/*
	<Overlapped IO(비동기 + 논블로킹)>
	-Overlapped 함수를 건다(WSARecv, WSASend)
	-OVerlapped 함수가 성공했는지 확인 후
	--성공했으면 결과를 얻어서 처리
	--실패했으면 이유를 확인해서 처리
	*/

	/*
	<WSASend, WSARecv>
	1) 비동기 입출력 소켓
	2) WSABUF 배열의 시작 주소 + 개수 => Scatter-Gather
	3) 보내고 받은 바이트수
	4) 상세 옵션은 0
	5) WSAOVERLAPPED 구조체 주소값
	6) 입출력이 완료되면 OS가 호출할 콜백 함수
	*/

	/*
	<Overlapped IO 모델(이벤트 기반)>
	-비동기 입출력을 지원하는 소켓 생성 + 통지 받기 위한 이벤트 객체 생성
	-비동기 입출력 함수 호출(이벤트 객체도 넘겨줌)
	-비동기 작업이 바로 완료되지 않으면 WSA_IO_PENDING 반환
	-OS는 이벤트 객체를 signaled 상태로 만들어서 계속 관찰
	-WSAWaitForMultipleEvents()를 호출해서 이벤트 객체의 signal 상태 판별
	-WSAGetOverlappedResult()를 호출해서 비동기 입출력 결과 확인 및 데이터 처리
	*/

	/*
	<WSAGetOverlappedResult>
	1) 비동기 소켓
	2) 사용할 Overlapped 구조체
	3) 전송된 바이트수
	4) 비동기 입출력 작업이 끝날 떄까지 대기할지? FALSE
	5) 비동기 입출력 작업 관련 부가 정보(거의 사용하지 않음)
	*/

	// 클라이언트와 상호작용
	while (true)
	{
		SOCKADDR_IN clientAddressData;
		::ZeroMemory(&clientAddressData, sizeof(clientAddressData));

		SOCKET clientSocket = 0;
		while (true)
		{
			clientSocket = RxSocketUtility::Accept(listenSocket, &clientAddressData);
			if (clientSocket != INVALID_SOCKET)
			{
				break;
			}
			else
			{
				// 논블로킹이라서
				if (::WSAGetLastError() == WSAEWOULDBLOCK)
				{
					continue;
				}

				// 문제가 있는 상황
				RxSocketUtility::PrintLastErrorCode();
				return 0;
			}
		}

		RxSession clientSession;
		::ZeroMemory(&clientSession, sizeof(clientSession));
		clientSession.socket = clientSocket;
		clientSession.overapped.hEvent = ::WSACreateEvent();
		printf("Client connected!\n");

		while (true)
		{
			WSABUF wsaBuf;
			::ZeroMemory(&wsaBuf, sizeof(wsaBuf));
			wsaBuf.buf = clientSession.recvBuffer;
			wsaBuf.len = MAX_BUFFER_SIZE;

			DWORD recvLen = 0;
			DWORD flags = 0;

			if (::WSARecv(clientSocket, &wsaBuf, 1, &recvLen, &flags, &clientSession.overapped, nullptr) == SOCKET_ERROR)
			{
				if (::WSAGetLastError() == WSA_IO_PENDING)
				{
					// Pending
					::WSAWaitForMultipleEvents(1, &clientSession.overapped.hEvent, TRUE, WSA_INFINITE, FALSE);
					::WSAGetOverlappedResult(clientSocket, &clientSession.overapped, &recvLen, FALSE, &flags);
				}
				else
				{
					RxSocketUtility::PrintLastErrorCode();
					break;
				}
			}

			printf("Recv data: %s\n", clientSession.recvBuffer);
			printf("Recv data length: %d\n\n", recvLen);
		}

		::WSACloseEvent(&clientSession.overapped.hEvent);
	}

	RxSocketUtility::CloseSocket(listenSocket);
	RxSocketUtility::Cleanup();

	return 0;
}