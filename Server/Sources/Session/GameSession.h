#pragma once

class RxGameSession : public RxSession
{
public:
	RxGameSession();
	virtual ~RxGameSession();

	virtual void   ProcessConnectImpl() override;
	virtual void   ProcessDisconnectImpl() override;
	virtual uint32 ProcessReceiveImpl(BYTE* buffer, uint32 numOfBytes) override;
	virtual void   ProcessSendImpl(uint32 numOfBytes) override;
};