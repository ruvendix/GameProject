#include "Pch.h"

/*
<WSAEventSelect>
-WSAEventSelect()가 핵심!
-생성: WSACreateEvent(Manual reset + NonSignaled 상태로 시작)
-삭제: WSACloseEvent
-시그널 상태 감지: WSAWaitForMultipleEvents
-구체적인 네트워크 이벤트 알아내기: WSAEnumNetworksEvents

※ 소켓과 연동한 이벤트가 감지되면 그 시점에서는 관련 소켓 함수를 호출할 준비가 완료되었다는 의미! (그래도 오류 확인은 필수)
*/

/*
<소켓과 이벤트 객체 연동>
-WSAEventSelect(socket, event, networkEvents)
-관심있는 네트워크 이벤트 목록
--FD_ACCEPT: 접속한 클라가 있음(accept)
--FD_READ: 데이터 수신 가능(recv, recvfrom)
--FD_WRITE: 데이터 송신 가능(send, sendto)
--FD_CLOSE: 상대가 접속 종료
--FD_CONNECT: 통신을 위한 연결 절차 완료
--FD_OOB
*/

/*
<주의 사항>
-WSAEventSelect()를 호출하면 해당 소켓은 자동으로 논블로킹 전환
-accept()가 반환하는 소켓은 리슨 소켓과 같은 속성을 지님
--따라서 클라이언트 소켓은 FD_READ, FD_WRITE 등의 재등록 필요
--드물게 WSAEWOULDBLOCK 오류가 뜰 수 있으니 예외처리 필요

<중요!>
이벤트 발생 시 적절한 소켓 함수 호출 필요!
그렇지 않으면 다음 번에는 동일한 네트워크 이벤트가 발생하지 않음
ex) FD_READ 이벤트가 발생하면 recv() 호출 필요, 생략하면 더는 FD_READ 이벤트가 발생하지 않음
*/

/*
<WSAWaitForMultipleEvents>
1) event
2) waitAll: 전부 기다릴 건지? 하나만 완료되어도 패스인지?
3) timeout: 타임아웃
4) false로 고정

반환값은 준비가 완료된 가장 앞에 있는 이벤트 객체의 인덱스
*/

/*
<WSAEnumNetworkEvents>
1) socket
2) eventObject: 소켓과 연동된 이벤트 객체 핸들을 넘겨주면 해당되는 이벤트 객체는 NonSignaled로 변경됨
3) networkEvent: 네트워크 이벤트, 네트워크 오류 정보가 저장됨
*/

const uint32 MAX_BUFFER_SIZE = 1000;

// 세션(클라이언트와 서버 간의 상호작용을 편하게 만드는 보조 도구)
struct RxSession
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

	// 세션과 이벤트 목록
	std::vector<RxSession> sessionList;
	std::vector<WSAEVENT>  wsaEvents;

	// 리슨 세션
	RxSession listenSession;
	listenSession.socket = listenSocket;
	sessionList.push_back(listenSession);

	// 리슨 소켓을 이벤트 감지 대상으로 설정
	WSAEVENT listenSocketEvent = ::WSACreateEvent();
	wsaEvents.push_back(listenSocketEvent);

	// 리슨 소켓을 감지할 이벤트와 연동
	if (::WSAEventSelect(listenSocket, listenSocketEvent, FD_ACCEPT | FD_CLOSE) == SOCKET_ERROR)
	{
		RxSocketUtility::PrintLastErrorCode();
		return 0;
	}

	// 클라이언트와 상호작용
	while (true)
	{
		// 소켓에 이벤트가 감지될 때까지 대기
		int32 eventObjIdx = ::WSAWaitForMultipleEvents(wsaEvents.size(), wsaEvents.data(), FALSE, WSA_INFINITE, FALSE);
		if (eventObjIdx == WSA_WAIT_FAILED)
		{
			continue;
		}

		// 올바른 이벤트 인덱스를 계산해야 함!
		eventObjIdx -= WSA_WAIT_EVENT_0; // 어차피 0인데 가독성을 위해 추가

		// 이벤트가 감지됐다면 여기에 관련 정보가 저장됨
		WSANETWORKEVENTS networkEvents;
		::ZeroMemory(&networkEvents, sizeof(networkEvents));

		// 소켓과 연동된 이벤트를 가져옴
		if (::WSAEnumNetworkEvents(sessionList[eventObjIdx].socket, wsaEvents[eventObjIdx], &networkEvents) == SOCKET_ERROR)
		{
			RxSocketUtility::PrintLastErrorCode();
			continue;
		}

		// 클라이언트의 접속을 받아줄 준비가 됐는지?
		if (networkEvents.lNetworkEvents & FD_ACCEPT)
		{
			// 오류 확인
			if (networkEvents.iErrorCode[FD_ACCEPT_BIT] != 0)
			{
				continue;
			}

			SOCKADDR_IN clientAddressData;
			::ZeroMemory(&clientAddressData, sizeof(clientAddressData));

			SOCKET clientSocket = RxSocketUtility::Accept(listenSocket, &clientAddressData);
			if (clientSocket != INVALID_SOCKET) // 세션에 등록
			{
				RxSession clientSession;
				clientSession.socket = clientSocket;
				sessionList.push_back(clientSession);

				WSAEVENT clientSocketEvent = ::WSACreateEvent();
				wsaEvents.push_back(clientSocketEvent);

				if (::WSAEventSelect(clientSocket, clientSocketEvent, FD_READ | FD_WRITE | FD_CLOSE) == SOCKET_ERROR)
				{
					return 0;
				}
			}
		}

		// 클라이언트 소켓 확인
		if (networkEvents.lNetworkEvents & FD_READ)
		{
			// 오류 확인
			if (networkEvents.iErrorCode[FD_READ_BIT] != 0)
			{
				continue;
			}

			RxSession& refClientSesseion = sessionList[eventObjIdx];

			int32 recvBytes = RxSocketUtility::Receive(refClientSesseion.socket, refClientSesseion.recvBuffer, MAX_BUFFER_SIZE);
			if ((recvBytes == SOCKET_ERROR) &&
				(::WSAGetLastError() == WSAEWOULDBLOCK))
			{
				continue;
			}

			refClientSesseion.recvBytes = recvBytes;

			printf("Recv data: %s\n", refClientSesseion.recvBuffer);
			printf("Recv data length: %d\n\n", refClientSesseion.recvBytes);
		}
	}

	RxSocketUtility::CloseSocket(listenSocket);
	RxSocketUtility::Cleanup();

	return 0;
}