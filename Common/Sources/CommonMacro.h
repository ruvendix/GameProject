#pragma once

#define SAFE_DELETE(ptr) \
	if (ptr != nullptr) \
	{ \
		delete ptr; \
		ptr = nullptr; \
	}

#define DECLARE_OWNER(OwnerType) std::weak_ptr<class OwnerType> m_spOwner
#define GET_OWNER_PTR(spOwner) spOwner.lock()

#define SET_OWNER_PTR(spOwner) \
m_spOwner = spOwner; \
if (spOwner != nullptr) \
{ \
	assert(m_spOwner.expired() == false); \
}

#define DYNAMIC_CAST_OWNER(OwnerCastType, spOwner) \
std::dynamic_pointer_cast<OwnerCastType>(spOwner)

#define USE_PARENT(parentType) using Parent = parentType