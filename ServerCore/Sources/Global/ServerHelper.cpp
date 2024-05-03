#include "Pch.h"
#include "ServerHelper.h"

namespace Rx
{
	void PrintServerLastErrorCode()
	{
		printf("Server error code: %d\n", ::WSAGetLastError());
	}
}