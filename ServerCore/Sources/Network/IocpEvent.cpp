#include "Pch.h"
#include "IocpEvent.h"

RxIocpEvent::RxIocpEvent(const RxIocpObjectPtr& spOwner)
{
	DEFINE_OWNER(RxIocpObject, spOwner);
	::ZeroMemory(&m_overlapped, sizeof(OVERLAPPED));
}