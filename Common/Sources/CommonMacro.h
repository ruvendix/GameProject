#pragma once

#define SAFE_DELETE(ptr) \
	if (ptr != nullptr) \
	{ \
		delete ptr; \
		ptr = nullptr; \
	}

#define DEFINE_OWNER(OwnerCastType, spOwner) \
m_spOwner = spOwner; \
assert(m_spOwner.expired() == false)

#define DEFINE_DYNAMIC_CAST_OWNER(OwnerCastType, spOwner) \
m_spOwner = std::dynamic_pointer_cast<OwnerCastType>(spOwner); \
assert(m_spOwner.expired() == false)

#define DECLARE_OWNER(OwnerType) std::weak_ptr<OwnerType> m_spOwner
#define GET_OWNER_PTR(spOwner) spOwner.lock()

#define USE_PARENT(parentType) using Parent = parentType