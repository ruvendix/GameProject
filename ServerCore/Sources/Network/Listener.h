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
	DECLARE_OWNER(RxService); // 자식은 항상 부모를 weak_ptr로만 사용!

	SOCKET m_listenSocket = INVALID_SOCKET;
	std::vector<RxIocpEvent*> m_acceptEvents;
};