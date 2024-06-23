#pragma once

class RxIocpObject;

class RxIocpCore
{
public:
	RxIocpCore();
	~RxIocpCore();

	void Startup();
	void Cleanup();

	bool Register(RxIocpObject* pIocpObj);
	bool Dispatch(uint32 timeMilliseconds);

	HANDLE GetIocpHandle() const { return m_hIocp; }

private:
	HANDLE m_hIocp = nullptr;
};