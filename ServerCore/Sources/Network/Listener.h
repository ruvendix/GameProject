#pragma once

#include "IocpObject.h"

class RxListener : public RxIocpObject
{
public:
	RxListener(const RxServicePtr& spOwner);
	virtual ~RxListener();

	virtual HANDLE BringHandle() override;
	virtual void Dispatch(RxIocpEvent* pIocpEvent, uint32 numOfBytes) override;

	bool ReadyToAccept();

	void RegisterAccept(RxIocpEvent* pAcceptEvent);
	void ProcessAccept(RxIocpEvent* pAcceptEvent);

private:
	DECLARE_OWNER(RxService); // �ڽ��� �׻� �θ� weak_ptr�θ� ���!

	SOCKET m_listenSocket = INVALID_SOCKET;
	std::vector<RxIocpEvent*> m_acceptEvents;
};