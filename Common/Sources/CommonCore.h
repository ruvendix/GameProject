#pragma once

#define WIN32_LEAN_AND_MEAN // ���� ������ �ʴ� ������ Windows ������� �����մϴ�.
#include <Windows.h>

#include <WinSock2.h>
#include <WS2tcpip.h>

#include <cstdio>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <memory>
#include <string>
#include <vector>
#include <queue>
#include <functional>

#pragma comment(lib, "ws2_32.lib")

using namespace std::chrono_literals;