#include "Pch.h"
#include "ServerCore/Sources/Thread/ThreadPool.h"

enum class ENetworkEventType
{
	None = 0,
	Accept,
	Connect,
	Read,
	Write,
};

const uint32 MAX_BUFFER_SIZE = 1000;

// 세션(클라이언트와 서버 간의 상호작용을 편하게 만드는 보조 도구)
struct RxSession
{
	WSAOVERLAPPED overlapped;
	SOCKET socket = INVALID_SOCKET;
	ENetworkEventType networkEvent = ENetworkEventType::None;
	char recvBuffer[MAX_BUFFER_SIZE];
	int32 recvBytes = 0;
};

// CompletionRoutine
void CompletionRoutineWorkerThread(HANDLE hIocp)
{
	while (true)
	{
		DWORD bytesTransferred = 0;
		RxSession* pSession = nullptr;

		// Key와 OVERLAPPED는 분리하는 게 좀 더 가독성이 좋을 거 같음
		BOOL bRet = ::GetQueuedCompletionStatus(hIocp, &bytesTransferred, reinterpret_cast<ULONG_PTR*>(&pSession), reinterpret_cast<LPOVERLAPPED*>(&pSession), INFINITE);
		if ((bRet == FALSE) ||
			(bytesTransferred == 0))
		{
			continue;
		}

		assert(pSession->networkEvent == ENetworkEventType::Read);

		printf("Recv data: %s\n", pSession->recvBuffer);
		printf("Recv data length: %d\n", bytesTransferred);

		WSABUF wsaBuf;
		::ZeroMemory(&wsaBuf, sizeof(wsaBuf));
		wsaBuf.buf = pSession->recvBuffer;
		wsaBuf.len = MAX_BUFFER_SIZE;

		DWORD recvLength = 0;
		DWORD flags = 0;

		/*
		한번 연결된 클라이언트는 접속 종료될 때까지 유지하므로 해당 쓰레드에서 Completion Port로 다시 작업을 요청해야 쓰레드가 대기 상태로 들어감
		즉, Recv인 경우 작업을 처리 완료했어도 이 작업을 하지 않으면 클라이언트가 다시 Send를 해도 해당 쓰레드가 큐에서 작업을 못 가져옴...
		*/
		::WSARecv(pSession->socket, &wsaBuf, 1, &recvLength, &flags, &(pSession->overlapped), nullptr);
	}
}

int main()
{
	RxSocketUtility::Startup();

	// 논블로킹 소켓으로 생성
	SOCKET listenSocket = RxSocketUtility::CreateAsynchronousSocket(IPPROTO_TCP);

	// 전에 사용했던 주소 재사용하도록 설정!
	//RxSocketUtility::ModifyReuseAddress(listenSocket, true);

	// 테스트용 주소
	RxSocketUtility::BindAnyAddress(listenSocket, 7777);

	// 서버 영업 개시
	RxSocketUtility::Listen(listenSocket, SOMAXCONN);

	/*
	<Overlapped IO 모델>
	-비동기 입출력 함수가 완료되면 쓰레드마다 있는 APC 큐에 일감이 쌓임
	-Alertable Wait 상태로 들어가서 APC 큐를 비움
	-단점: APC큐가 쓰레드마다 있고 Alertable Wait가 좀 부담됨
	-단점: 이벤트 방식의 소켓에서는 이벤트와 1:1 대응
	*/

	/*
	<IOCP>
	-Overlapped IO와 멀티쓰레드의 혼합
	-기본적으로 Overlapped IO에서 크게 달라지는 부분은 없음
	-Completion Port(쓰레드마다 있는 게 아니라 운영체제가 관리하는 딱 하나만 존재)
	-Alertable Wait은 멀티쓰레드에 매우 취약한데 IOCP는 멀티쓰레드와 궁합이 좋음!
	*/

	// 멀티쓰레드에서 사용해야 하므로 포인터 필수!
	std::vector<RxSession*> sessions;

	// Completion Port 생성
	HANDLE hIocp = ::CreateIoCompletionPort(INVALID_HANDLE_VALUE, nullptr, 0, 0);

	// 쓰레드풀 가동
	RxThreadPool threadPool;
	for (uint32 i = 0; i < 5; ++i)
	{
		threadPool.AddTask([=]() { CompletionRoutineWorkerThread(hIocp); });
	}

	// 클라이언트와 상호작용
	while (true)
	{
		SOCKADDR_IN clientAddressData;
		::ZeroMemory(&clientAddressData, sizeof(clientAddressData));
		SOCKET clientSocket = RxSocketUtility::Accept(listenSocket, &clientAddressData);
		if (clientSocket == INVALID_SOCKET)
		{
			RxSocketUtility::PrintLastErrorCode();
			return 0;
		}

		RxSession* pClientSession = new RxSession;
		::ZeroMemory(pClientSession, sizeof(RxSession));
		pClientSession->socket = clientSocket;
		sessions.push_back(pClientSession);

		printf("Client Connected !\n");

		// 클라이언트 소켓을 Completion Port에 등록
		::CreateIoCompletionPort(reinterpret_cast<HANDLE>(clientSocket), hIocp, reinterpret_cast<ULONG_PTR>(pClientSession), 0);

		WSABUF wsaBuf;
		::ZeroMemory(&wsaBuf, sizeof(wsaBuf));
		wsaBuf.buf = pClientSession->recvBuffer;
		wsaBuf.len = MAX_BUFFER_SIZE;

		pClientSession->networkEvent = ENetworkEventType::Read;

		DWORD recvLen = 0;
		DWORD flags = 0;

		// LPWSAOVERLAPPED라고 되어있으면 무조건 OVERLAPPED 자체만 넘겨줘야 함!
		::WSARecv(clientSocket, &wsaBuf, 1, &recvLen, &flags, reinterpret_cast<LPOVERLAPPED>(&(pClientSession->overlapped)), nullptr);
	}

	RxSocketUtility::CloseSocket(listenSocket);
	RxSocketUtility::Cleanup();

	return 0;
}