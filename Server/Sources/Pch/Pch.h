#pragma once

#include "Common/Sources/CommonCore.h"
#include "Common/Sources/CommonTypes.h"

#include "ServerCore/Sources/Socket/SocketUtility.h"

#ifdef _DEBUG
#pragma comment(lib, "ServerCore_Debug.lib")
#else
#pragma comment(lib, "ServerCore.lib")
#endif