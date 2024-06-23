#pragma once

enum class ENetworkEventType : uint8
{
	Unknown = 0,
	Connect,
	Disconnect,
	Accept,
	Receive,
	Send,
};

class RxSession;

class RxIocpEvent
{
public:
	RxIocpEvent();
	~RxIocpEvent() = default;

	void Initialize();

	ENetworkEventType GetNetworkEvent() const { return m_networkEvent; }
	void SetNetworkEvent(ENetworkEventType networkEvent) { m_networkEvent = networkEvent; }

	OVERLAPPED* GetOverlapped() { return &m_overlapped; }
	RxSession* GetSession() const { return m_pSession; }
	void SetSession(RxSession* pSession) { m_pSession = pSession; }

private:
	OVERLAPPED m_overlapped;
	ENetworkEventType m_networkEvent = ENetworkEventType::Unknown;
	RxSession* m_pSession = nullptr;
};