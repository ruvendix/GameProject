#pragma once

#include "Common/Sources/CommonCore.h"
#include "Common/Sources/CommonTypes.h"
#include "Common/Sources/CommonConstant.h"
#include "Common/Sources/CommonMacro.h"

#include "ServerCore/Sources/Global/Types.h"
#include "ServerCore/Sources/Thread/ThreadPool.h"

#include "ServerCore/Sources/Network/IocpCore.h"
#include "ServerCore/Sources/Network/IocpObject.h"
#include "ServerCore/Sources/Network/NetworkAddress.h"
#include "ServerCore/Sources/Network/Buffer/ReceiveBuffer.h"
#include "ServerCore/Sources/Network/Buffer/SendBuffer.h"
#include "ServerCore/Sources/Network/Session/PacketSession.h"
#include "ServerCore/Sources/Network/Service.h"

#include "ServerCore/Sources/Socket/SocketUtility.h"

#include "Global/Types.h"

// 생성된 소스 파일이 무조건 프로젝트에 있어야 함!
#include "Packet/ProtoBuffer/Enum.pb.h"
#include "Packet/ProtoBuffer/Struct.pb.h"
#include "Packet/ProtoBuffer/Protocol.pb.h"

#ifdef _DEBUG
#pragma comment(lib, "ServerCore_Debug.lib")
#pragma comment(lib, "libprotobufd.lib")
#else
#pragma comment(lib, "ServerCore.lib")
#pragma comment(lib, "libprotobuf.lib")
#endif