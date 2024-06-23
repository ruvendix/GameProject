#include "Pch.h"

/*
<Ŭ���̾�Ʈ�� TCP ����>
-socket:  ���� ����
-connect: ������ ���� �õ�

-send: ��û�� �����͸� �۽� ���ۿ� ����
-recv: ���� ���ۿ� ������ �����͸� User ������ ���ۿ� ����
*/

int main()
{
	//RxSocketUtility::Startup();

	// WSA => Window Socket Application Interface
	WSADATA wsaData;
	if (::WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		return 0;
	}

	// ����ŷ �������� ����
	SOCKET clientSocket = RxSocketUtility::CreateNonBlockingSocket(IPPROTO_TCP);

	// ������ ���� �ּ� ����
	SOCKADDR_IN serverAddressData;
	serverAddressData.sin_family = AF_INET;
	::inet_pton(AF_INET, "127.0.0.1", &serverAddressData.sin_addr);
	serverAddressData.sin_port = ::htons(7777);

	// ������ ���� �õ�
	while (true)
	{
		//if (RxSocketUtility::Connect(clientSocket, serverAddressData) == SOCKET_ERROR)
		if (::connect(clientSocket, (SOCKADDR*)&serverAddressData, sizeof(serverAddressData)) == SOCKET_ERROR)
		{
			int32 errorCode = ::WSAGetLastError();

			// ������ ���ŷ�ؾ� ������ ����ŷ�̸� ���
			if (errorCode == WSAEWOULDBLOCK)
			{
				continue;
			}

			// �̹� ����� ���¶�� ��������(���� �ƴ�)
			if (errorCode == WSAEISCONN)
			{
				break;
			}
		}
	}

	// ������ ��ȣ�ۿ�
	while (true)
	{
		char sendBuffer[1000] = "Hello i am client!";
		int32 sendSize = sizeof(sendBuffer);

		int32 sendLength = RxSocketUtility::Send(clientSocket, sendBuffer, sizeof(sendBuffer));
		if (sendLength == SOCKET_ERROR)
		{
			int32 errorCode = ::WSAGetLastError();

			// ������ ���ŷ�ؾ� ������ ����ŷ�̸� ���
			if (errorCode == WSAEWOULDBLOCK)
			{
				continue;
			}
			else if (errorCode == WSAECONNRESET)
			{
				break;
			}

			printf("Send data length: %d (NonBlocking)\n", sendLength);
		}

		printf("Send data length: %d\n", sendLength);
		std::this_thread::sleep_for(1s);
	}

	RxSocketUtility::CloseSocket(clientSocket);
	RxSocketUtility::Cleanup();

	return 0;
}