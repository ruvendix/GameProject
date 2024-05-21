#include "Pch.h"

/*
<������ TCP ����>
-socket: ���� ����
-bind:   ������ ���� �ּҸ� ����
-listen: ���� ���� ����
-accept: Ŭ�� �����ϱ⸦ ��ٸ�

-send: ��û�� �����͸� �۽� ���ۿ� ����
-recv: ���� ���ۿ� ������ �����͸� User ������ ���ۿ� ����
*/

/*
<Select ��>
-select �Լ��� �ٽ�!
-���� Api�� ������ ������ �̸� �� �� ����!
--recv ���ۿ� �����Ͱ� ���µ� read�ϴ� ��Ȳ
--send ���۰� �� á�µ� send�ϴ� ��Ȳ
-���ŷ�� ����ŷ �� �� ����(���� �񵿱� ������ �ƴ�!)
--���ŷ ����: ������ �������� �ʾƼ� ���ŷ�Ǵ� ��Ȳ ���� (���ӿ����� �Ⱦ�)
--����ŷ ����: ������ �������� �ʾƼ� ���ʿ��ϰ� ���� üũ�ϴ� ��Ȳ ����
*/

/*
<���� ���� ���>
1) read, write, except(out of band)�� ���� ������� ���
--OOB�� send()�� ������ ���ڷ� MSG_OOB�� ������ Ư���� ������
  �޴� ���� recv()���� ���� ������ �ؾ� ��� ����
2) select(read, write, except)�� ���� ����
3) ������ �͵� �߿��� �ϳ��� �غ�Ǹ� ��ȯ(�����ڴ� �ڵ� �н�)
4) ������ üũ�ؼ� �ݺ� ����
*/

/*
<FD(File Descriptor, ����� ���� �ĺ���) ����>
-fd�� ���� ���ϸ� ������ �ĺ���(������ �� �ִ� ������ 64���� ����)
-fd_set ����ü�� ���
-FD_ZERO: ���� ��� �ʱ�ȭ
-FD_SET: ������ ���� �߰�
-FD_CLR: ���� ���� ���� ����
-FD_ISSET: �ش� ������ ���� ���̸� 0�� �ƴѰ� ��ȯ
*/

/*
������ �ƹ� �𵨷� �����ص� Ŭ���̾�Ʈ�� �⺻ �������� ������ ����
��, ���� ���ŷ ���̵� �񵿱� ����ŷ ���̵� Ŭ���̾�Ʈ�� ����
*/

const uint32 MAX_BUFFER_SIZE = 1000;

// ����(Ŭ���̾�Ʈ�� ���� ���� ��ȣ�ۿ��� ���ϰ� ����� ���� ����)
struct RxClientSession
{
	SOCKET socket = INVALID_SOCKET;
	char   recvBuffer[MAX_BUFFER_SIZE];
	int32  recvBytes = 0;
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

	// Ŭ���̾�Ʈ ����
	std::vector<RxClientSession> clientSessionList;
	clientSessionList.reserve(100);

	// Ŭ���̾�Ʈ�� ��ȣ�ۿ�
	while (true)
	{
		fd_set readFds;

		// ���� ���� ��� �ʱ�ȭ
		FD_ZERO(&readFds);

		// ���� ���� ���
		FD_SET(listenSocket, &readFds);

		// Ŭ���̾�Ʈ ���� ���
		for (auto& clientSession : clientSessionList)
		{
			FD_SET(clientSession.socket, &readFds);
		}

		// ������ ���ڴ� timeout ������ �� ���
		int32 ret = ::RxSocketUtility::Select(&readFds, nullptr, nullptr);
		if (ret == SOCKET_ERROR)
		{
			RxSocketUtility::PrintLastErrorCode();
			break;
		}

		// �׻� ���� ������ �˻�!
		if (FD_ISSET(listenSocket, &readFds) != 0)
		{
			SOCKADDR_IN clientAddressData;
			SOCKET clientSocket = RxSocketUtility::Accept(listenSocket, &clientAddressData);
			if (clientSocket == INVALID_SOCKET)
			{
				// ������ ���ŷ�ؾ� ������ ����ŷ�̸� ���
				if (::WSAGetLastError() == WSAEWOULDBLOCK)
				{
					continue;
				}
			}

			printf("Client connected!\n\n");

			// ����Ǿ����� Ŭ���̾�Ʈ ���� �߰�
			RxClientSession newCientSession;
			newCientSession.socket = clientSocket;
			clientSessionList.push_back(newCientSession);
		}

		// Ŭ���̾�Ʈ ���ǵ�� ����
		for (auto& clientSesseion : clientSessionList)
		{
			if (FD_ISSET(clientSesseion.socket, &readFds) == 0)
			{
				continue;
			}

			clientSesseion.recvBytes = RxSocketUtility::Receive(clientSesseion.socket, clientSesseion.recvBuffer, sizeof(clientSesseion.recvBuffer));
			if (clientSesseion.recvBytes == SOCKET_ERROR)
			{
				// ������ ���ŷ�ؾ� ������ ����ŷ�̸� ���
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