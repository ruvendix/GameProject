#include "Pch.h"

/*
������ TCP ����
-socket: ���� ����
-bind:   ������ ���� �ּҸ� ����
-listen: ���� ���� ����
-accept: Ŭ�� �����ϱ⸦ ��ٸ�

-send: ��û�� �����͸� �۽� ���ۿ� ����
-recv: ���� ���ۿ� ������ �����͸� User ������ ���ۿ� ����
*/

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
		SOCKADDR_IN clientAddressata;
		SOCKET clientSocket = RxSocketUtility::Accept(listenSocket, &clientAddressata);
		if ((clientSocket == INVALID_SOCKET) &&
			(::WSAGetLastError() == WSAEWOULDBLOCK)) // ������ ���ŷ�ؾ� ������ ����ŷ�̸� ���
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
				// ������ ���ŷ�ؾ� ������ ����ŷ�̸� ���
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