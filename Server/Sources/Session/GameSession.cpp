#include "Pch.h"
#include "GameSession.h"

#include "GameSessionManager.h"

RxGameSession::RxGameSession()
{
	printf("RxGameSession »ý¼º!\n");
}

RxGameSession::~RxGameSession()
{
	printf("RxGameSession ¼Ò¸ê!\n");
}

void RxGameSession::ProcessConnectImpl()
{
	const RxGameSessionPtr& refSpGameSession = std::dynamic_pointer_cast<RxGameSession>(shared_from_this());
	RxGameSessionManager::I()->AddGameSession(refSpGameSession);
}

void RxGameSession::ProcessDisconnectImpl()
{
	const RxGameSessionPtr& refSpGameSession = std::dynamic_pointer_cast<RxGameSession>(shared_from_this());
	RxGameSessionManager::I()->RemoveGameSession(refSpGameSession);
}

uint32 RxGameSession::ProcessReceiveImpl(BYTE* buffer, uint32 numOfBytes)
{
	// Echo
	printf("ProcessReceiveImpl numOfBytes(%d)\n", numOfBytes);

	RxSendBufferPtr spSendBuffer = std::make_shared<RxSendBuffer>(4096);
	spSendBuffer->CopyBuffer(buffer, numOfBytes);

	RxGameSessionManager::I()->Broadcast(spSendBuffer);
	return numOfBytes;
}

void RxGameSession::ProcessSendImpl(uint32 numOfBytes)
{
	printf("ProcessSendImpl numOfBytes(%d)\n", numOfBytes);
}