#include "Pch.h"
#include "ServerPacketHandler.h"

#include "ServerCore/Sources/Network/Buffer/BufferWriter.h"
#include "ServerCore/Sources/Network/Buffer/BufferReader.h"

RxServerPacketHandler* RxServerPacketHandler::s_pInstance = nullptr;

RxServerPacketHandler::RxServerPacketHandler()
{

}

RxServerPacketHandler::~RxServerPacketHandler()
{

}

RxServerPacketHandler* RxServerPacketHandler::I()
{
	if (s_pInstance == nullptr)
	{
		s_pInstance = new RxServerPacketHandler;
	}

	return s_pInstance;
}

void RxServerPacketHandler::Destory()
{
	SAFE_DELETE(s_pInstance);
}

void RxServerPacketHandler::HandlePacket(BYTE* buffer, int32 numOfBytes)
{
	RxBufferReader bufferReader(buffer, numOfBytes, 0);

	RxPacketHeader packetHeader;
	bufferReader.Read(&packetHeader);

	// �׽�Ʈ
	if (packetHeader.protocolId == 1)
	{
		printf("���� ��������(%d)\n", packetHeader.protocolId);
	}
}

RxSendBufferPtr RxServerPacketHandler::MakeTestPacket(uint64 id, uint32 hp, uint16 attack, const std::vector<BuffData>& vecBuff)
{
	RxSendBufferPtr spSendBuffer = std::make_shared<RxSendBuffer>(4096);

	RxBufferWriter bufferWriter(spSendBuffer->GetBufferPointer(), spSendBuffer->GetCapacity(), 0);

	// ������� Ȯ��
	RxPacketHeader* pPacketHeader = bufferWriter.Reserve<RxPacketHeader>();

	// id(uint64), ü��(uint32), ���ݷ�(uint16)
	bufferWriter << id << hp << attack;

	// ���� ������
	bufferWriter << static_cast<uint16>(vecBuff.size());
	for (const BuffData& buffData : vecBuff)
	{
		bufferWriter << buffData.buffId << buffData.remainTime;
	}

	// ������� �� ��ġ�� ����Ʈ�����δ� ũ�⸦ �ǹ�
	pPacketHeader->packetSize = bufferWriter.GetCurrentWritePos();
	pPacketHeader->protocolId = 1;

	spSendBuffer->SetWriteSize(pPacketHeader->packetSize);
	return spSendBuffer;
}