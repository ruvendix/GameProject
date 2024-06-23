#pragma once

class RxIocpEvent;

class RxIocpObject
{
public:
	RxIocpObject() = default;
	virtual ~RxIocpObject() = default;

	virtual HANDLE BringHandle() abstract;
	virtual void Dispatch(RxIocpEvent* pIocpEvent, int32 numOfBytes) abstract;
};