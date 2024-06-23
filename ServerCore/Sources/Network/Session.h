#pragma once

#include "IocpObject.h"
#include "NetworkAddress.h"

class RxIocpEvent;

class RxSession : public RxIocpObject
{
public:
	RxSession();
	virtual ~RxSession();

	virtual HANDLE BringHandle() override;
	virtual void Dispatch(RxIocpEvent* pIocpEvent, int32 numOfBytes) override;

	SOCKET GetSocket() const { return m_socket; }
	char* GetReceiveBuffer() { return m_receiveBuffer; }
	void SetNetworkAddress(const RxNetworkAddress& netAddr) { m_netAddr = netAddr; }

private:
	SOCKET m_socket = INVALID_SOCKET;
	RxNetworkAddress m_netAddr;
	char m_receiveBuffer[MAX_RECEIVE_BUFFER_SIZE];
};