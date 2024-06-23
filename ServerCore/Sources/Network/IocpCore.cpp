#include "Pch.h"
#include "IocpCore.h"

#include "IocpObject.h"
#include "IocpEvent.h"

RxIocpCore::RxIocpCore()
{

}

RxIocpCore::~RxIocpCore()
{
	
}

void RxIocpCore::Startup()
{
	m_hIocp = ::CreateIoCompletionPort(INVALID_HANDLE_VALUE, 0, 0, 0);
	assert(m_hIocp != INVALID_HANDLE_VALUE);
}

void RxIocpCore::Cleanup()
{
	::CloseHandle(m_hIocp);
}

bool RxIocpCore::Register(RxIocpObject* pIocpObj)
{
	assert(pIocpObj != nullptr);
	return (::CreateIoCompletionPort(pIocpObj->BringHandle(), m_hIocp, reinterpret_cast<ULONG_PTR>(pIocpObj), 0));
}

bool RxIocpCore::Dispatch(uint32 timeMilliseconds)
{
	DWORD dwNumOfBytes = 0;
	RxIocpObject* pIocpObj = nullptr;
	RxIocpEvent*  pIocpEvent = nullptr;

	if (::GetQueuedCompletionStatus(m_hIocp, &dwNumOfBytes, reinterpret_cast<ULONG_PTR*>(&pIocpObj), reinterpret_cast<LPOVERLAPPED*>(&pIocpEvent), timeMilliseconds) == FALSE)
	{
		int32 errCode = ::WSAGetLastError();
		switch (errCode)
		{
		case WSA_OPERATION_ABORTED:
			// 다시 시도
			RxSocketUtility::PrintLastErrorCode();
			pIocpObj->Dispatch(pIocpEvent, dwNumOfBytes);
			break;

		default: // 무조건 아웃
			::OutputDebugStringA("무조건 아웃임!\n");
			break;
		}
	}
	else
	{
		pIocpObj->Dispatch(pIocpEvent, dwNumOfBytes);
	}

	return true;
}
