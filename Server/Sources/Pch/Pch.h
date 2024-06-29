#pragma once

#include "Common/Sources/CommonCore.h"
#include "Common/Sources/CommonTypes.h"
#include "Common/Sources/CommonConstant.h"
#include "Common/Sources/CommonMacro.h"

#include "ServerCore/Sources/Global/Types.h"
#include "ServerCore/Sources/Socket/SocketUtility.h"

#include "ServerCore/Sources/Network/NetworkAddress.h"

#ifdef _DEBUG
#pragma comment(lib, "ServerCore_Debug.lib")
#else
#pragma comment(lib, "ServerCore.lib")
#endif