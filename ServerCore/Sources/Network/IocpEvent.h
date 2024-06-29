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
	RxIocpEvent(const RxIocpObjectPtr& spOwner);
	~RxIocpEvent() = default;

	ENetworkEventType GetNetworkEvent() const { return m_networkEvent; }
	void SetNetworkEvent(ENetworkEventType networkEvent) { m_networkEvent = networkEvent; }

	OVERLAPPED* GetOverlapped() { return &m_overlapped; }
	const RxSessionPtr& GetSession() const { return m_spSession; }
	void SetSession(const RxSessionPtr& spSession) { m_spSession = spSession; }

	RxIocpObjectPtr GetOwner() const { return (m_spOwner.lock()); }

private:
	OVERLAPPED m_overlapped;
	DECLARE_OWNER(RxIocpObject);

	ENetworkEventType m_networkEvent = ENetworkEventType::Unknown;
	RxSessionPtr m_spSession = nullptr;
};