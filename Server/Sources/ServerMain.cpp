#include "Pch.h"
#include "ServerCore/Sources/Thread/ThreadPool.h"
#include "ServerCore/Sources/Network/Service.h"
#include "ServerCore/Sources/Network/IocpCore.h"
#include "ServerCore/Sources/Network/Session.h"

RxServicePtr g_spServerService;
RxThreadPool g_threadPool; // Ǯ�� ������ ����

/*
���� ����
1) IOCP �ڵ� �ݱ�(���� �۾� ���� ���� ��������� �۾��� �ߴܵǾ����Ƿ� ��� ����)
2) ������Ǯ�� �ִ� ��� ���� ������鿡�� �����϶�� ��ȣ�� ����
3) ���� ���� �ݱ�
4) ��� ���� �����尡 �����ϰ� ����Ǿ�� �ϹǷ� ���� ������� 0.1�� ���
*/
BOOL WINAPI OnClose_ConsoleHandler(DWORD signal)
{
	if ((signal == CTRL_C_EVENT) ||
		(signal == CTRL_CLOSE_EVENT) ||
		(signal == CTRL_LOGOFF_EVENT) ||
		(signal == CTRL_SHUTDOWN_EVENT))
	{
		g_spServerService->GetIocpCorePtr()->Cleanup();
		g_threadPool.Cleanup();
		RxSocketUtility::Cleanup();

		::OutputDebugStringA("���� ���α׷� ���� (���� ������� ������)\n");

		// ��� ���� ��������� �����ϰ� ����� ������ �ð� ����
		std::this_thread::sleep_for(1ms);
		return TRUE;
	}
	return FALSE;
}

class GameSession : public RxSession
{
public:
	GameSession() = default;
	virtual ~GameSession() = default;

	virtual void ProcessConnectImpl() override
	{
		printf("ProcessConnectImpl\n");
	}

	virtual void ProcessDisconnectImpl() override
	{
		printf("ProcessDisconnectImpl\n");
	}

	virtual uint32 ProcessReceiveImpl(BYTE* buffer, uint32 numOfBytes) override
	{
		printf("ProcessReceiveImpl (Recevied numOfBytes: %d)\n", numOfBytes);
		//Send(buffer, numOfBytes);
		return numOfBytes;
	}

	virtual void ProcessSendImpl(uint32 numOfBytes) override
	{
		printf("ProcessSendImpl (send numOfBytes: %d)\n", numOfBytes);
	}
};

int main()
{
	if (!SetConsoleCtrlHandler(OnClose_ConsoleHandler, TRUE))
	{
		return EXIT_FAILURE;
	}

	RxSocketUtility::Startup();

	RxServiceInfo serviceInfo =
	{
		EServiceType::Server,
		RxNetworkAddress(L"127.0.0.1", 7777),
		std::make_shared<RxIocpCore>(),
		[]() { return std::make_shared<GameSession>(); },
		100
	};

	g_spServerService = std::make_shared<RxServerService>(serviceInfo);
	g_spServerService->Startup();

	for (uint32 i = 0; i < 5; ++i)
	{
		g_threadPool.AddTask(
			[&]()
			{
				bool bDrive = true;
				while (bDrive == true)
				{
					bDrive = g_spServerService->GetIocpCorePtr()->Dispatch(INFINITE);
				}
			}
		);
	}

	g_threadPool.Join();

	/*
	��Ƽ������ �ܼ� ���α׷��� ���� ��ȣ�� ���� ��������...
	���� ó���� ConsoleHandler���� ���
	*/

	return 0;
}