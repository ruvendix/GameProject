#include "Pch.h"
#include "Session.h"

RxSession::RxSession()
{
	::ZeroMemory(m_receiveBuffer, sizeof(m_receiveBuffer));
	m_socket = RxSocketUtility::CreateAsynchronousSocket(IPPROTO_TCP);
}

RxSession::~RxSession()
{
	RxSocketUtility::CloseSocket(m_socket);
}

HANDLE RxSession::BringHandle()
{
	return reinterpret_cast<HANDLE>(m_socket);
}

void RxSession::Dispatch(RxIocpEvent* pIocpEvent, int32 numOfBytes)
{

}