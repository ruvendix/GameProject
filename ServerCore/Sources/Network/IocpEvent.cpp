#include "Pch.h"
#include "IocpEvent.h"

RxIocpEvent::RxIocpEvent(ENetworkEventType netEvent)
{
	::ZeroMemory(&m_overlapped, sizeof(OVERLAPPED));
	m_netEvent = netEvent;
}

RxIocpEvent::RxIocpEvent(const RxIocpObjectPtr& spOwner, ENetworkEventType netEvent) :
	RxIocpEvent(netEvent)
{
	SET_OWNER_PTR(spOwner);
}