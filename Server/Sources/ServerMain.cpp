#include "Pch.h"
#include "ServerCore/Sources/Thread/ThreadPool.h"
#include "ServerCore/Sources/Network/IocpCore.h"
#include "ServerCore/Sources/Network/Listener.h"
#include "ServerCore/Sources/Network/NetworkAddress.h"

RxThreadPool g_threadPool;
RxIocpCore g_iocpCore;

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
		g_iocpCore.Cleanup();
		g_threadPool.Cleanup();
		RxSocketUtility::Cleanup();

		::OutputDebugStringA("���� ���α׷� ���� (���� ������� ������)\n");

		// ��� ���� ��������� �����ϰ� ����� ������ �ð� ����
		std::this_thread::sleep_for(1ms);
		return TRUE;
	}
	return FALSE;
}

void TestFunc()
{
	while (true)
	{

	}
}

int main()
{
	if (!SetConsoleCtrlHandler(OnClose_ConsoleHandler, TRUE))
	{
		return EXIT_FAILURE;
	}

	RxSocketUtility::Startup();

	g_iocpCore.Startup();

	RxListener listener;
	listener.ReadyToAccept(&g_iocpCore, RxNetworkAddress(L"127.0.0.1", 7777));

	for (uint32 i = 0; i < 5; ++i)
	{
		g_threadPool.AddTask(
			[&]()
			{
				g_iocpCore.Dispatch(INFINITE);
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