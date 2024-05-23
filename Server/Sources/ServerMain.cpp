#include "Pch.h"

const uint32 MAX_BUFFER_SIZE = 1000;

// ����(Ŭ���̾�Ʈ�� ���� ���� ��ȣ�ۿ��� ���ϰ� ����� ���� ����)
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

	// ����ŷ �������� ����
	SOCKET listenSocket = RxSocketUtility::CreateNonBlockingSocket(IPPROTO_TCP);

	// ���� ����ߴ� �ּ� �����ϵ��� ����!
	RxSocketUtility::ModifyReuseAddress(listenSocket, true);

	// �׽�Ʈ�� �ּ�
	RxSocketUtility::BindAnyAddress(listenSocket, 7777);

	// ���� ���� ����
	RxSocketUtility::Listen(listenSocket, SOMAXCONN);

	/*
	<Overlapped IO(�񵿱� + ����ŷ)>
	-Overlapped �Լ��� �Ǵ�(WSARecv, WSASend)
	-OVerlapped �Լ��� �����ߴ��� Ȯ�� ��
	--���������� ����� �� ó��
	--���������� ������ Ȯ���ؼ� ó��
	*/

	/*
	<WSASend, WSARecv>
	1) �񵿱� ����� ����
	2) WSABUF �迭�� ���� �ּ� + ���� => Scatter-Gather
	3) ������ ���� ����Ʈ��
	4) �� �ɼ��� 0
	5) WSAOVERLAPPED ����ü �ּҰ�
	6) ������� �Ϸ�Ǹ� OS�� ȣ���� �ݹ� �Լ�
	*/

	/*
	<Overlapped IO ��(�̺�Ʈ ���)>
	-�񵿱� ������� �����ϴ� ���� ���� + ���� �ޱ� ���� �̺�Ʈ ��ü ����
	-�񵿱� ����� �Լ� ȣ��(�̺�Ʈ ��ü�� �Ѱ���)
	-�񵿱� �۾��� �ٷ� �Ϸ���� ������ WSA_IO_PENDING ��ȯ
	-OS�� �̺�Ʈ ��ü�� signaled ���·� ���� ��� ����
	-WSAWaitForMultipleEvents()�� ȣ���ؼ� �̺�Ʈ ��ü�� signal ���� �Ǻ�
	-WSAGetOverlappedResult()�� ȣ���ؼ� �񵿱� ����� ��� Ȯ�� �� ������ ó��
	*/

	/*
	<WSAGetOverlappedResult>
	1) �񵿱� ����
	2) ����� Overlapped ����ü
	3) ���۵� ����Ʈ��
	4) �񵿱� ����� �۾��� ���� ������ �������? FALSE
	5) �񵿱� ����� �۾� ���� �ΰ� ����(���� ������� ����)
	*/

	// Ŭ���̾�Ʈ�� ��ȣ�ۿ�
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
				// ����ŷ�̶�
				if (::WSAGetLastError() == WSAEWOULDBLOCK)
				{
					continue;
				}

				// ������ �ִ� ��Ȳ
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