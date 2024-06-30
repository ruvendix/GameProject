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
	virtual void Dispatch(RxIocpEvent* pIocpEvent, uint32 numOfBytes) override;

	// ������ �ڵ忡�� ������ �ʿ�
	virtual void   ProcessConnectImpl() { }
	virtual void   ProcessDisconnectImpl() { }
	virtual uint32 ProcessReceiveImpl(BYTE* buffer, uint32 numOfBytes) { return numOfBytes; }
	virtual void   ProcessSendImpl(uint32 numOfBytes) { }

	// ���� ū ���� ����
	void Send(BYTE* buffer, uint32 numOfBytes);
	bool Connect();
	void Disconnect();

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
	BYTE* GetReceiveBuffer() { return m_receiveBuffer; }
	void SetNetworkAddress(const RxNetworkAddress& netAddr) { m_netAddr = netAddr; }
	void SetOwner(const RxServicePtr& spService) { SET_OWNER_PTR(spService); }

	bool IsConnected() const { return (m_bAtomicConnected == true); }

private:
	DECLARE_OWNER(RxService);
	
	std::mutex m_mutex; // ���� ��������� �ϳ��� ������ ó���� �� ����
	std::atomic<bool> m_bAtomicConnected = false;

	SOCKET m_socket = INVALID_SOCKET;
	RxNetworkAddress m_netAddr;
	BYTE m_receiveBuffer[MAX_RECEIVE_BUFFER_SIZE];

	// �����ϴ� IocpEvent
	RxIocpEvent* m_pConnectEvent = nullptr;
	RxIocpEvent* m_pDisconnectEvent = nullptr;
	RxIocpEvent* m_pReceiveEvent = nullptr;
};