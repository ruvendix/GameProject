#pragma once

// 서버 또는 클라이언트가 처리하는 가장 큰 작업 단위

enum class ERxServiceType
{
	Unknown = -1,
	Client,
	Server
};

using SessionFactoryFunc = std::function<RxSessionPtr(void)>;

struct RxServiceInfo
{
	ERxServiceType serviceType = ERxServiceType::Unknown;
	RxNetworkAddress netAddress;
	RxIocpCorePtr spIocpCore = nullptr;
	SessionFactoryFunc sessionFactoryFunc = nullptr;
	uint32 maxSessionCount = 1;
};

class RxService : public std::enable_shared_from_this<RxService>
{
public:
	RxService(const RxServiceInfo& serviceInfo);
	virtual ~RxService();

	virtual bool Startup() abstract;
	virtual void Cleanup() abstract;

	RxSessionPtr CreateSession();

	bool IsExistSessionFactory() const { return (m_serviceInfo.sessionFactoryFunc != nullptr); }

	uint32 GetMaxSessionCount() const { return m_serviceInfo.maxSessionCount; }
	const RxNetworkAddress& GetNetworkAddress() const { return m_serviceInfo.netAddress; }
	const RxIocpCorePtr& GetIocpCorePtr() const { return m_serviceInfo.spIocpCore; }

private:
	RxServiceInfo m_serviceInfo;
};
/////////////////////////////////////////////////////////////////
class RxClientService : public RxService
{
public:
	USE_PARENT(RxService);

public:
	using RxService::RxService;
	virtual ~RxClientService();

	virtual bool Startup() override;
	virtual void Cleanup() override;

private:

};
/////////////////////////////////////////////////////////////////
class RxServerService : public RxService
{
public:
	USE_PARENT(RxService);

public:
	using RxService::RxService;
	virtual ~RxServerService();

	virtual bool Startup() override;
	virtual void Cleanup() override;

private:
	RxListenerPtr m_spListener = nullptr;
};