#include "Pch.h"

/*
<Overlapped IO 모델(이벤트 기반)>
-비동기 입출력을 지원하는 소켓 생성 + 통지 받기 위한 이벤트 객체 생성
-비동기 입출력 함수 호출(완료 루틴의 시작 주소를 넘겨줌)
-비동기 작업이 바로 완료되지 않으면 WSA_IO_PENDING 반환
-비동기 입출력 함수를 호출한 쓰레드를 Alertable wait 상태로 만듦

ex) WatiForSingleObjectEx(), WaitForMultipleObjectsEx(), SleepEx(), WSAWaitForMultipleEvents()
-비동기 IO가 완료되면 OS는 완료 루틴 호출
-완료 루틴 호출이 모두 끝나면 쓰레드는 Alertable wait 상태에서 빠져나옴
*/

/*
<CompletionRoutine>
1) 오류가 발생하면 0이 아닌 값
2) 전송된 바이트 수
3) 비동기 입출력 함수를 호출할 때 넘겨준 WSAOVERLAPPED 구조체의 주소값
4) 0
*/

/*
<각 모드 정리>
※ Select 모델
-장점: 윈도우/리눅스 공용 가능
-단점: 성능 최하(매번 등록 필요), 64개 제한

※ WSASelect 모델
-장점: 비교적 뛰어난 성능
-단점: 64개 제한

※ Overlapped Event 모델
-장점: 성능 좋음
-단점: 64개 제한

※ Overlapped Callback 모델
-장점: 성능 좋음
-단점: 모든 비동기 소켓 함수를 지원하지 않음(accept), 빈번한 Alertable wait으로 인한 성능 저하

요즘 게임에서는 IOCP 사용
*/

/*
Reactor pattern: 논블로킹 소켓 상태를 확인한 후 뒤늦게 recv 또는 send 호출
Proactor pattern: Overlapped WSA
*/

const uint32 MAX_BUFFER_SIZE = 1000;

// 세션(클라이언트와 서버 간의 상호작용을 편하게 만드는 보조 도구)
struct RxSession
{
	WSAOVERLAPPED overapped; // 첫 주소를 이용해서 구조체 접근(구조체는 메모리 덩어리라서 가능)
	SOCKET socket = INVALID_SOCKET;
	char   recvBuffer[MAX_BUFFER_SIZE];
	int32  recvBytes = 0;
};

// CompletionRoutine
void CALLBACK OnRecv(DWORD errorCode, DWORD recvLen, LPWSAOVERLAPPED pOverlapped, DWORD flags)
{
	printf("OnRecv Data received length: %d\n", recvLen);

	// 에코 서버를 만들 거라면 WSASend() 호출 필요

	RxSession* pSession = reinterpret_cast<RxSession*>(pOverlapped);
	assert(pSession != nullptr);

	printf("Recv data: %s\n", pSession->recvBuffer);
}

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
		printf("Client connected!\n");

		while (true)
		{
			WSABUF wsaBuf;
			::ZeroMemory(&wsaBuf, sizeof(wsaBuf));
			wsaBuf.buf = clientSession.recvBuffer;
			wsaBuf.len = MAX_BUFFER_SIZE;

			DWORD recvLen = 0;
			DWORD flags = 0;

			if (::WSARecv(clientSocket, &wsaBuf, 1, &recvLen, &flags, &clientSession.overapped, OnRecv) == SOCKET_ERROR)
			{
				if (::WSAGetLastError() == WSA_IO_PENDING)
				{
					// Alertable wait
					::SleepEx(INFINITE, TRUE);
				}
				else
				{
					RxSocketUtility::PrintLastErrorCode();
					break;
				}
			}
			else
			{
				printf("Data received length: %d\n", recvLen);
			}
		}
	}

	RxSocketUtility::CloseSocket(listenSocket);
	RxSocketUtility::Cleanup();

	return 0;
}