#pragma once

#include "IocpObject.h"
#include "NetworkAddress.h"
#include "ReceiveBuffer.h"

class RxIocpEvent;

class RxSession : public RxIocpObject
{
public:
	RxSession();
	virtual ~RxSession();

	virtual HANDLE BringHandle() override;
	virtual void Dispatch(RxIocpEvent* pIocpEvent, uint32 numOfBytes) override;

	// 컨텐츠 코드에서 재정의 필요
	virtual void   ProcessConnectImpl() { }
	virtual void   ProcessDisconnectImpl() { }
	virtual uint32 ProcessReceiveImpl(BYTE* buffer, uint32 numOfBytes) { return numOfBytes; }
	virtual void   ProcessSendImpl(uint32 numOfBytes) { }

	// 가장 큰 업무 단위
	void Send(BYTE* buffer, uint32 numOfBytes);
	bool Connect();
	void Disconnect(const std::wstring_view& wszReason);

	bool RegisterConnect();
	bool RegisterDisconnect();
	void RegisterReceive();
	void RegisterSend(RxIocpEvent* pSendEvent);
		 
	void ProcessConnect();
	void ProcessDisconnect();
	void ProcessReceive(uint32 numOfBytes);
	void ProcessSend(RxIocpEvent* pSendEvent, uint32 numOfBytes);

	int32 HandleLastError();

	SOCKET GetSocket() const { return m_socket; }
	BYTE* GetReceiveBufferWritePosition() { return m_receiveBuffer.GetWrtiePosition(); }
	void SetNetworkAddress(const RxNetworkAddress& netAddr) { m_netAddr = netAddr; }
	void SetOwner(const RxServicePtr& spService) { SET_OWNER_PTR(spService); }

	bool IsConnected() const { return (m_bAtomicConnected == true); }

private:
	DECLARE_OWNER(RxService);
	
	std::mutex m_mutex; // 여러 쓰레드들이 하나의 세션을 처리할 수 있음
	std::atomic<bool> m_bAtomicConnected = false;

	SOCKET m_socket = INVALID_SOCKET;
	RxNetworkAddress m_netAddr;

	// 송수신 버퍼
	RxReceiveBuffer m_receiveBuffer;

	// 재사용하는 IocpEvent
	RxIocpEvent* m_pConnectEvent = nullptr;
	RxIocpEvent* m_pDisconnectEvent = nullptr;
	RxIocpEvent* m_pReceiveEvent = nullptr;
};