#include "Pch.h"
#include "ThreadPool.h"

#include "Tls.h"

RxThreadPool::RxThreadPool()
{
	m_hardwareConcurrencyThreadCount = std::thread::hardware_concurrency();

	for (int i = 0; i < m_hardwareConcurrencyThreadCount; ++i)
	{
		m_threads.push_back(std::thread(
			[this]()
			{
				StartupTls();
				ProcessWorkerThread();
				CleanupTls();
			}));
	}
}

RxThreadPool::~RxThreadPool()
{
	m_bAllStop = true;
	m_conditionVar.notify_all();

	for (std::thread& refThread : m_threads)
	{
		if (refThread.joinable() == true)
		{
			refThread.join();
		}
	}
}

// 어떤 쓰레드가 일을 할지는 모름... (쓰레드 순서대로 일을 하는 게 아님!)
void RxThreadPool::ProcessWorkerThread()
{
	while (true)
	{
		TaskFuncType taskFuncObj = nullptr;

		// Critical section
		{
			std::unique_lock<std::mutex> lock(m_mutex);
			m_conditionVar.wait(lock, [this]() { return ((m_taskQueue.empty() == false) || (m_bAllStop == true)); });

			// 작업할 게 없는데 중단 시그널이 왔으면 탈출 (락은 자동 해제)
			if ((m_bAllStop == true) &&
				(m_taskQueue.empty() == true))
			{
				return;
			}

			taskFuncObj = std::move(m_taskQueue.front());
			m_taskQueue.pop();
		}

		taskFuncObj();
	}
}

void RxThreadPool::StartupTls()
{
	std::hash<std::thread::id> threadIdHash;

	// Critical section
	{
		std::lock_guard<std::mutex> lock(m_mutex); // Tls도 크리티컬 섹션에 넣어야 함...
		uint32 hashValue = threadIdHash(std::this_thread::get_id());
		printf("ThreadId: %u\n", hashValue);
		m_threadIds.push_back(hashValue);
	}
}

void RxThreadPool::CleanupTls()
{

}