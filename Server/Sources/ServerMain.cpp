#include "Pch.h"

/*
<WSAEventSelect>
-WSAEventSelect()�� �ٽ�!
-����: WSACreateEvent(Manual reset + NonSignaled ���·� ����)
-����: WSACloseEvent
-�ñ׳� ���� ����: WSAWaitForMultipleEvents
-��ü���� ��Ʈ��ũ �̺�Ʈ �˾Ƴ���: WSAEnumNetworksEvents

�� ���ϰ� ������ �̺�Ʈ�� �����Ǹ� �� ���������� ���� ���� �Լ��� ȣ���� �غ� �Ϸ�Ǿ��ٴ� �ǹ�! (�׷��� ���� Ȯ���� �ʼ�)
*/

/*
<���ϰ� �̺�Ʈ ��ü ����>
-WSAEventSelect(socket, event, networkEvents)
-�����ִ� ��Ʈ��ũ �̺�Ʈ ���
--FD_ACCEPT: ������ Ŭ�� ����(accept)
--FD_READ: ������ ���� ����(recv, recvfrom)
--FD_WRITE: ������ �۽� ����(send, sendto)
--FD_CLOSE: ��밡 ���� ����
--FD_CONNECT: ����� ���� ���� ���� �Ϸ�
--FD_OOB
*/

/*
<���� ����>
-WSAEventSelect()�� ȣ���ϸ� �ش� ������ �ڵ����� ����ŷ ��ȯ
-accept()�� ��ȯ�ϴ� ������ ���� ���ϰ� ���� �Ӽ��� ����
--���� Ŭ���̾�Ʈ ������ FD_READ, FD_WRITE ���� ���� �ʿ�
--�幰�� WSAEWOULDBLOCK ������ �� �� ������ ����ó�� �ʿ�

<�߿�!>
�̺�Ʈ �߻� �� ������ ���� �Լ� ȣ�� �ʿ�!
�׷��� ������ ���� ������ ������ ��Ʈ��ũ �̺�Ʈ�� �߻����� ����
ex) FD_READ �̺�Ʈ�� �߻��ϸ� recv() ȣ�� �ʿ�, �����ϸ� ���� FD_READ �̺�Ʈ�� �߻����� ����
*/

/*
<WSAWaitForMultipleEvents>
1) event
2) waitAll: ���� ��ٸ� ����? �ϳ��� �Ϸ�Ǿ �н�����?
3) timeout: Ÿ�Ӿƿ�
4) false�� ����

��ȯ���� �غ� �Ϸ�� ���� �տ� �ִ� �̺�Ʈ ��ü�� �ε���
*/

/*
<WSAEnumNetworkEvents>
1) socket
2) eventObject: ���ϰ� ������ �̺�Ʈ ��ü �ڵ��� �Ѱ��ָ� �ش�Ǵ� �̺�Ʈ ��ü�� NonSignaled�� �����
3) networkEvent: ��Ʈ��ũ �̺�Ʈ, ��Ʈ��ũ ���� ������ �����
*/

const uint32 MAX_BUFFER_SIZE = 1000;

// ����(Ŭ���̾�Ʈ�� ���� ���� ��ȣ�ۿ��� ���ϰ� ����� ���� ����)
struct RxSession
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

	// ���ǰ� �̺�Ʈ ���
	std::vector<RxSession> sessionList;
	std::vector<WSAEVENT>  wsaEvents;

	// ���� ����
	RxSession listenSession;
	listenSession.socket = listenSocket;
	sessionList.push_back(listenSession);

	// ���� ������ �̺�Ʈ ���� ������� ����
	WSAEVENT listenSocketEvent = ::WSACreateEvent();
	wsaEvents.push_back(listenSocketEvent);

	// ���� ������ ������ �̺�Ʈ�� ����
	if (::WSAEventSelect(listenSocket, listenSocketEvent, FD_ACCEPT | FD_CLOSE) == SOCKET_ERROR)
	{
		RxSocketUtility::PrintLastErrorCode();
		return 0;
	}

	// Ŭ���̾�Ʈ�� ��ȣ�ۿ�
	while (true)
	{
		// ���Ͽ� �̺�Ʈ�� ������ ������ ���
		int32 eventObjIdx = ::WSAWaitForMultipleEvents(wsaEvents.size(), wsaEvents.data(), FALSE, WSA_INFINITE, FALSE);
		if (eventObjIdx == WSA_WAIT_FAILED)
		{
			continue;
		}

		// �ùٸ� �̺�Ʈ �ε����� ����ؾ� ��!
		eventObjIdx -= WSA_WAIT_EVENT_0; // ������ 0�ε� �������� ���� �߰�

		// �̺�Ʈ�� �����ƴٸ� ���⿡ ���� ������ �����
		WSANETWORKEVENTS networkEvents;
		::ZeroMemory(&networkEvents, sizeof(networkEvents));

		// ���ϰ� ������ �̺�Ʈ�� ������
		if (::WSAEnumNetworkEvents(sessionList[eventObjIdx].socket, wsaEvents[eventObjIdx], &networkEvents) == SOCKET_ERROR)
		{
			RxSocketUtility::PrintLastErrorCode();
			continue;
		}

		// Ŭ���̾�Ʈ�� ������ �޾��� �غ� �ƴ���?
		if (networkEvents.lNetworkEvents & FD_ACCEPT)
		{
			// ���� Ȯ��
			if (networkEvents.iErrorCode[FD_ACCEPT_BIT] != 0)
			{
				continue;
			}

			SOCKADDR_IN clientAddressData;
			::ZeroMemory(&clientAddressData, sizeof(clientAddressData));

			SOCKET clientSocket = RxSocketUtility::Accept(listenSocket, &clientAddressData);
			if (clientSocket != INVALID_SOCKET) // ���ǿ� ���
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

		// Ŭ���̾�Ʈ ���� Ȯ��
		if (networkEvents.lNetworkEvents & FD_READ)
		{
			// ���� Ȯ��
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