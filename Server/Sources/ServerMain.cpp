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

// ����(Ŭ���̾�Ʈ�� ���� ���� ��ȣ�ۿ��� ���ϰ� ����� ���� ����)
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

		// Key�� OVERLAPPED�� �и��ϴ� �� �� �� �������� ���� �� ����
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
		�ѹ� ����� Ŭ���̾�Ʈ�� ���� ����� ������ �����ϹǷ� �ش� �����忡�� Completion Port�� �ٽ� �۾��� ��û�ؾ� �����尡 ��� ���·� ��
		��, Recv�� ��� �۾��� ó�� �Ϸ��߾ �� �۾��� ���� ������ Ŭ���̾�Ʈ�� �ٽ� Send�� �ص� �ش� �����尡 ť���� �۾��� �� ������...
		*/
		::WSARecv(pSession->socket, &wsaBuf, 1, &recvLength, &flags, &(pSession->overlapped), nullptr);
	}
}

int main()
{
	RxSocketUtility::Startup();

	// ����ŷ �������� ����
	SOCKET listenSocket = RxSocketUtility::CreateAsynchronousSocket(IPPROTO_TCP);

	// ���� ����ߴ� �ּ� �����ϵ��� ����!
	//RxSocketUtility::ModifyReuseAddress(listenSocket, true);

	// �׽�Ʈ�� �ּ�
	RxSocketUtility::BindAnyAddress(listenSocket, 7777);

	// ���� ���� ����
	RxSocketUtility::Listen(listenSocket, SOMAXCONN);

	/*
	<Overlapped IO ��>
	-�񵿱� ����� �Լ��� �Ϸ�Ǹ� �����帶�� �ִ� APC ť�� �ϰ��� ����
	-Alertable Wait ���·� ���� APC ť�� ���
	-����: APCť�� �����帶�� �ְ� Alertable Wait�� �� �δ��
	-����: �̺�Ʈ ����� ���Ͽ����� �̺�Ʈ�� 1:1 ����
	*/

	/*
	<IOCP>
	-Overlapped IO�� ��Ƽ�������� ȥ��
	-�⺻������ Overlapped IO���� ũ�� �޶����� �κ��� ����
	-Completion Port(�����帶�� �ִ� �� �ƴ϶� �ü���� �����ϴ� �� �ϳ��� ����)
	-Alertable Wait�� ��Ƽ�����忡 �ſ� ����ѵ� IOCP�� ��Ƽ������� ������ ����!
	*/

	// ��Ƽ�����忡�� ����ؾ� �ϹǷ� ������ �ʼ�!
	std::vector<RxSession*> sessions;

	// Completion Port ����
	HANDLE hIocp = ::CreateIoCompletionPort(INVALID_HANDLE_VALUE, nullptr, 0, 0);

	// ������Ǯ ����
	RxThreadPool threadPool;
	for (uint32 i = 0; i < 5; ++i)
	{
		threadPool.AddTask([=]() { CompletionRoutineWorkerThread(hIocp); });
	}

	// Ŭ���̾�Ʈ�� ��ȣ�ۿ�
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

		// Ŭ���̾�Ʈ ������ Completion Port�� ���
		::CreateIoCompletionPort(reinterpret_cast<HANDLE>(clientSocket), hIocp, reinterpret_cast<ULONG_PTR>(pClientSession), 0);

		WSABUF wsaBuf;
		::ZeroMemory(&wsaBuf, sizeof(wsaBuf));
		wsaBuf.buf = pClientSession->recvBuffer;
		wsaBuf.len = MAX_BUFFER_SIZE;

		pClientSession->networkEvent = ENetworkEventType::Read;

		DWORD recvLen = 0;
		DWORD flags = 0;

		// LPWSAOVERLAPPED��� �Ǿ������� ������ OVERLAPPED ��ü�� �Ѱ���� ��!
		::WSARecv(clientSocket, &wsaBuf, 1, &recvLen, &flags, reinterpret_cast<LPOVERLAPPED>(&(pClientSession->overlapped)), nullptr);
	}

	RxSocketUtility::CloseSocket(listenSocket);
	RxSocketUtility::Cleanup();

	return 0;
}