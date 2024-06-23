#include "Pch.h"
#include "IocpEvent.h"

RxIocpEvent::RxIocpEvent()
{
	Initialize();
}

void RxIocpEvent::Initialize()
{
	::ZeroMemory(&m_overlapped, sizeof(OVERLAPPED));
}