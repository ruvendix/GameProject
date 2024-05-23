#include "Pch.h"

/*
<Overlapped IO ��(�̺�Ʈ ���)>
-�񵿱� ������� �����ϴ� ���� ���� + ���� �ޱ� ���� �̺�Ʈ ��ü ����
-�񵿱� ����� �Լ� ȣ��(�Ϸ� ��ƾ�� ���� �ּҸ� �Ѱ���)
-�񵿱� �۾��� �ٷ� �Ϸ���� ������ WSA_IO_PENDING ��ȯ
-�񵿱� ����� �Լ��� ȣ���� �����带 Alertable wait ���·� ����

ex) WatiForSingleObjectEx(), WaitForMultipleObjectsEx(), SleepEx(), WSAWaitForMultipleEvents()
-�񵿱� IO�� �Ϸ�Ǹ� OS�� �Ϸ� ��ƾ ȣ��
-�Ϸ� ��ƾ ȣ���� ��� ������ ������� Alertable wait ���¿��� ��������
*/

/*
<CompletionRoutine>
1) ������ �߻��ϸ� 0�� �ƴ� ��
2) ���۵� ����Ʈ ��
3) �񵿱� ����� �Լ��� ȣ���� �� �Ѱ��� WSAOVERLAPPED ����ü�� �ּҰ�
4) 0
*/

/*
<�� ��� ����>
�� Select ��
-����: ������/������ ���� ����
-����: ���� ����(�Ź� ��� �ʿ�), 64�� ����

�� WSASelect ��
-����: ���� �پ ����
-����: 64�� ����

�� Overlapped Event ��
-����: ���� ����
-����: 64�� ����

�� Overlapped Callback ��
-����: ���� ����
-����: ��� �񵿱� ���� �Լ��� �������� ����(accept), ����� Alertable wait���� ���� ���� ����

���� ���ӿ����� IOCP ���
*/

/*
Reactor pattern: ����ŷ ���� ���¸� Ȯ���� �� �ڴʰ� recv �Ǵ� send ȣ��
Proactor pattern: Overlapped WSA
*/

const uint32 MAX_BUFFER_SIZE = 1000;

// ����(Ŭ���̾�Ʈ�� ���� ���� ��ȣ�ۿ��� ���ϰ� ����� ���� ����)
struct RxSession
{
	WSAOVERLAPPED overapped; // ù �ּҸ� �̿��ؼ� ����ü ����(����ü�� �޸� ����� ����)
	SOCKET socket = INVALID_SOCKET;
	char   recvBuffer[MAX_BUFFER_SIZE];
	int32  recvBytes = 0;
};

// CompletionRoutine
void CALLBACK OnRecv(DWORD errorCode, DWORD recvLen, LPWSAOVERLAPPED pOverlapped, DWORD flags)
{
	printf("OnRecv Data received length: %d\n", recvLen);

	// ���� ������ ���� �Ŷ�� WSASend() ȣ�� �ʿ�

	RxSession* pSession = reinterpret_cast<RxSession*>(pOverlapped);
	assert(pSession != nullptr);

	printf("Recv data: %s\n", pSession->recvBuffer);
}

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