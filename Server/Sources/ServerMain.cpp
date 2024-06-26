#include "Pch.h"
#include "ServerCore/Sources/Thread/ThreadPool.h"
#include "ServerCore/Sources/Network/Service.h"
#include "ServerCore/Sources/Network/IocpCore.h"
#include "ServerCore/Sources/Network/Session.h"

RxServicePtr g_spServerService;
RxThreadPool g_threadPool; // 풀은 여러개 가능

/*
종료 절차
1) IOCP 핸들 닫기(관련 작업 중인 서브 쓰레드들은 작업이 중단되었으므로 대기 상태)
2) 쓰레드풀에 있는 모든 서브 쓰레드들에게 종료하라고 신호를 보냄
3) 서버 소켓 닫기
4) 모든 서브 쓰레드가 안전하게 종료되어야 하므로 메인 쓰레드는 0.1초 대기
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

		::OutputDebugStringA("서버 프로그램 종료 (서브 쓰레드들 정리중)\n");

		// 모든 서브 쓰레드들이 안전하게 종료될 때까지 시간 벌이
		std::this_thread::sleep_for(1s);
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
	멀티쓰레드 콘솔 프로그램은 종료 신호를 따로 보내야함...
	종료 처리는 ConsoleHandler에서 담당
	*/

	return 0;
}