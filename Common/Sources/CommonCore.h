#pragma once

#include <cstdio>
#include <cassert>

#include <thread>
#include <mutex>
#include <condition_variable>
#include <future>
#include <memory>
#include <string>
#include <vector>
#include <queue>
#include <functional>

#define WIN32_LEAN_AND_MEAN // 거의 사용되지 않는 내용을 Windows 헤더에서 제외합니다.
#include <Windows.h>

#include <WinSock2.h>
#include <mswsock.h>
#include <WS2tcpip.h>

#pragma comment(lib, "ws2_32.lib")

using namespace std::chrono_literals;