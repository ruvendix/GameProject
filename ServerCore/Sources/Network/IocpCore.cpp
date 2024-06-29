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
	return (::CreateIoCompletionPort(pIocpObj->BringHandle(), m_hIocp, 0, 0));
}

bool RxIocpCore::Dispatch(uint32 timeMilliseconds)
{
	DWORD dwNumOfBytes = 0;
	ULONG_PTR key = 0;
	RxIocpEvent* pIocpEvent = nullptr;

	if (::GetQueuedCompletionStatus(m_hIocp, &dwNumOfBytes, &key, reinterpret_cast<LPOVERLAPPED*>(&pIocpEvent), timeMilliseconds) == FALSE)
	{
		RxIocpObjectPtr spIocpObj = nullptr;

		int32 errCode = ::WSAGetLastError();
		switch (errCode)
		{
		case WSA_OPERATION_ABORTED: // 다시 시도			
			RxSocketUtility::PrintLastErrorCode();

			spIocpObj = pIocpEvent->GetOwner();
			spIocpObj->Dispatch(pIocpEvent, dwNumOfBytes);

			break;

		default: // 무조건 아웃
			::OutputDebugStringA("무조건 아웃임!\n");
			break;
		}
	}
	else
	{
		RxIocpObjectPtr spIocpObj = pIocpEvent->GetOwner();
		spIocpObj->Dispatch(pIocpEvent, dwNumOfBytes);
	}

	return true;
}
