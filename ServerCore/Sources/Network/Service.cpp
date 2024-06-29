#include "Pch.h"
#include "Service.h"

#include "IocpCore.h"
#include "Listener.h"
#include "Session.h"

RxService::RxService(const RxServiceInfo& serviceInfo)
{
	m_serviceInfo = serviceInfo;
}

RxService::~RxService()
{

}

bool RxService::Startup()
{
	GetIocpCorePtr()->Startup();
	return true;
}

void RxService::Cleanup()
{

}

class Parent : public std::enable_shared_from_this<Parent>
{
public:
	Parent() = default;
	virtual ~Parent() = default;
};

class Child : public Parent
{
public:
	Child() = default;
	virtual ~Child() = default;
};

RxSessionPtr RxService::CreateSession()
{
	RxSessionPtr spSession = std::make_shared<RxSession>();

	if (m_serviceInfo.spIocpCore->Register(spSession) == false)
	{
		return nullptr;
	}

	return spSession;
}
/////////////////////////////////////////////////////////////////
RxClientService::~RxClientService()
{

}

bool RxClientService::Startup()
{
	return Parent::Startup();
}

void RxClientService::Cleanup()
{
	Parent::Cleanup();
}
/////////////////////////////////////////////////////////////////
RxServerService::~RxServerService()
{

}

bool RxServerService::Startup()
{
	Parent::Startup();

	if (IsExistSessionFactory() == false)
	{
		return false;
	}

	SOCKET listenSocket = RxSocketUtility::CreateAsynchronousSocket(IPPROTO_TCP);
	if (listenSocket == INVALID_SOCKET)
	{
		return false;
	}

	m_spListener = std::make_shared<RxListener>(shared_from_this(), listenSocket);
	assert(m_spListener != nullptr);

	if (GetIocpCorePtr()->Register(m_spListener) == false)
	{
		return false;
	}

	if (m_spListener->ReadyToAccept() == false)
	{
		return false;
	}

	return true;
}

void RxServerService::Cleanup()
{
	Parent::Cleanup();
}