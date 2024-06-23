#pragma once

#include "IocpObject.h"

class RxIocpCore;
class RxNetworkAddress;

class RxListener : public RxIocpObject
{
public:
	RxListener() = default;
	virtual ~RxListener();

	virtual HANDLE BringHandle() override;
	virtual void Dispatch(RxIocpEvent* pIocpEvent, int32 numOfBytes) override;

	bool ReadyToAccept(RxIocpCore* pIocpCore, const RxNetworkAddress& netAddress);

	void RegisterAccept(RxIocpEvent* pAcceptEvent);
	void ProcessAccept(RxIocpEvent* pAcceptEvent);

private:
	SOCKET m_listenSocket = INVALID_SOCKET;
	std::vector<RxIocpEvent*> m_iocpEvents;
};