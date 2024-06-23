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
			// �ٽ� �õ�
			RxSocketUtility::PrintLastErrorCode();
			pIocpObj->Dispatch(pIocpEvent, dwNumOfBytes);
			break;

		default: // ������ �ƿ�
			::OutputDebugStringA("������ �ƿ���!\n");
			break;
		}
	}
	else
	{
		pIocpObj->Dispatch(pIocpEvent, dwNumOfBytes);
	}

	return true;
}
