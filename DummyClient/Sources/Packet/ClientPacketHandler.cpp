#include "Pch.h"
#include "ClientPacketHandler.h"

#include "ServerCore/Sources/Network/Buffer/BufferReader.h"

// 이런 건 Common
struct BuffData
{
	uint64 buffId;
	float remainTime;
};

struct TestPacket
{
	uint64 id;
	uint32 hp;
	uint16 attack;

	// 가변 데이터
	// 1) 문자열 (ex. name)
	// 2) 그냥 바이트 배열 (ex. 길드 이미지)
	// 3) 일반 리스트
	std::vector<BuffData> vecBuff;
};

RxClientPacketHandler* RxClientPacketHandler::s_pInstance = nullptr;

RxClientPacketHandler::RxClientPacketHandler()
{

}

RxClientPacketHandler::~RxClientPacketHandler()
{

}

RxClientPacketHandler* RxClientPacketHandler::I()
{
	if (s_pInstance == nullptr)
	{
		s_pInstance = new RxClientPacketHandler;
	}

	return s_pInstance;
}

void RxClientPacketHandler::Destory()
{
	SAFE_DELETE(s_pInstance);
}

void RxClientPacketHandler::HandlePacket(BYTE* buffer, int32 numOfBytes)
{
	RxBufferReader bufferReader(buffer, numOfBytes, 0);

	RxPacketHeader packetHeader;
	bufferReader.Read(&packetHeader);

	// 테스트
	if (packetHeader.protocolId == 1)
	{
		printf("클라이언트 프로토콜(%d)\n", packetHeader.protocolId);
		PasingTestPacket(buffer, numOfBytes);
	}
}

void RxClientPacketHandler::PasingTestPacket(BYTE* buffer, int32 numOfBytes)
{
	RxBufferReader bufferReader(buffer, numOfBytes, 0);

	RxPacketHeader packetHeader;
	bufferReader.Read(&packetHeader);

	TestPacket testPacket;	
	bufferReader >> testPacket.id >> testPacket.hp >> testPacket.attack;
	printf("(Id: %llu, Hp: %d, Attack: %d)\n", testPacket.id, testPacket.hp, testPacket.attack);

	uint16 buffCount = 0;
	bufferReader >> buffCount;

	std::vector<BuffData> vecBuff(buffCount);
	for (int32 i = 0; i < buffCount; i++)
	{
		bufferReader >> vecBuff[i].buffId >> vecBuff[i].remainTime;
	}

	printf("BufCount: %d\n", buffCount);
	for (int32 i = 0; i < buffCount; i++)
	{
		printf("BufInfo: (Id: %llu, remainTime: %f)\n", vecBuff[i].buffId, vecBuff[i].remainTime);
	}
}