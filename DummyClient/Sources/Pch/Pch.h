#pragma once

#include "Common/Sources/CommonCore.h"
#include "Common/Sources/CommonTypes.h"
#include "Common/Sources/CommonConstant.h"
#include "Common/Sources/CommonMacro.h"

#include "ServerCore/Sources/Global/Types.h"
#include "ServerCore/Sources/Thread/ThreadPool.h"

#include "ServerCore/Sources/Network/IocpCore.h"
#include "ServerCore/Sources/Network/NetworkAddress.h"
#include "ServerCore/Sources/Network/Session.h"
#include "ServerCore/Sources/Network/SendBuffer.h"
#include "ServerCore/Sources/Network/Service.h"

#include "ServerCore/Sources/Socket/SocketUtility.h"

#ifdef _DEBUG
#pragma comment(lib, "ServerCore_Debug.lib")
#else
#pragma comment(lib, "ServerCore.lib")
#endif