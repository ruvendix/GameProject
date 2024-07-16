#pragma once

struct BuffData
{
	uint64 buffId;
	float remainTime;
};

class RxServerPacketHandler
{
public:
	static RxServerPacketHandler* I();
	static void Destory();

public:
	RxServerPacketHandler();
	~RxServerPacketHandler();

	void HandlePacket(BYTE* buffer, int32 numOfBytes);
	RxSendBufferPtr MakeTestPacket(uint64 id, uint32 hp, uint16 attack, const std::vector<BuffData>& vecBuff);

private:
	static RxServerPacketHandler* s_pInstance;
};