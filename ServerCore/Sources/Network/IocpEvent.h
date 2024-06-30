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

// OVERLAPPED 때문에 스마트 포인터로 사용할 수 없음
class RxIocpEvent
{
public:
	RxIocpEvent(ENetworkEventType netEvent);
	RxIocpEvent(const RxIocpObjectPtr& spOwner, ENetworkEventType netEvent);
	~RxIocpEvent() = default;

	ENetworkEventType GetNetworkEvent() const { return m_netEvent; }

	OVERLAPPED* GetOverlapped() { return &m_overlapped; }
	const RxSessionPtr& GetSession() const { return m_spSession; }
	void SetSession(const RxSessionPtr& spSession) { m_spSession = spSession; }
	
	RxIocpObjectPtr GetOwner() const { return GET_OWNER_PTR(m_spOwner); }
	void SetOwner(const RxIocpObjectPtr& spOwner) { SET_OWNER_PTR(spOwner); }

	std::vector<BYTE>& GetBuffer() { return m_buffer; }

private:
	OVERLAPPED m_overlapped; // 무조건 처음에 둬야 함!
	DECLARE_OWNER(RxIocpObject);

	ENetworkEventType m_netEvent = ENetworkEventType::Unknown;
	RxSessionPtr m_spSession = nullptr;

	// 임시
	std::vector<BYTE> m_buffer;
};