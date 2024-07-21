# Install script for directory: C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files/protobuf")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/third_party/abseil-cpp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/third_party/utf8_range/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "libprotobuf-lite" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Debug/libprotobuf-lited.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Release/libprotobuf-lite.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/MinSizeRel/libprotobuf-lite.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/RelWithDebInfo/libprotobuf-lite.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "libprotobuf" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Debug/libprotobufd.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Release/libprotobuf.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/MinSizeRel/libprotobuf.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/RelWithDebInfo/libprotobuf.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "libprotoc" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Debug/libprotocd.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Release/libprotoc.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/MinSizeRel/libprotoc.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/RelWithDebInfo/libprotoc.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "libupb" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Debug/libupbd.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Release/libupb.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/MinSizeRel/libupb.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/RelWithDebInfo/libupb.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protoc" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Debug/protoc.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Release/protoc.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/MinSizeRel/protoc.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/RelWithDebInfo/protoc.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "upb-generators" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Debug/protoc-gen-upb.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Release/protoc-gen-upb.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/MinSizeRel/protoc-gen-upb.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/RelWithDebInfo/protoc-gen-upb.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "upb-generators" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Debug/protoc-gen-upbdefs.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Release/protoc-gen-upbdefs.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/MinSizeRel/protoc-gen-upbdefs.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/RelWithDebInfo/protoc-gen-upbdefs.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "upb-generators" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Debug/protoc-gen-upb_minitable.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/Release/protoc-gen-upb_minitable.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/MinSizeRel/protoc-gen-upb_minitable.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/RelWithDebInfo/protoc-gen-upb_minitable.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES
    "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/protobuf.pc"
    "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/protobuf-lite.pc"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/upb.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE FILES
    "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/cmake/google/protobuf/descriptor.upb.h"
    "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/cmake/google/protobuf/descriptor.upb_minitable.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "any.pb.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/any.pb.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "api.pb.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/api.pb.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "duration.pb.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/duration.pb.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "empty.pb.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/empty.pb.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "field_mask.pb.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/field_mask.pb.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "source_context.pb.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/source_context.pb.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "struct.pb.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/struct.pb.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "timestamp.pb.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/timestamp.pb.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "type.pb.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/type.pb.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "wrappers.pb.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/wrappers.pb.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "any.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/any.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "arena.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/arena.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "arena_align.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/arena_align.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "arena_allocation_policy.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/arena_allocation_policy.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "arena_cleanup.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/arena_cleanup.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "arenastring.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/arenastring.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "arenaz_sampler.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/arenaz_sampler.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler" TYPE FILE RENAME "importer.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/importer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler" TYPE FILE RENAME "parser.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/parser.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "cpp_edition_defaults.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/cpp_edition_defaults.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "cpp_features.pb.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/cpp_features.pb.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "descriptor.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/descriptor.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "descriptor.pb.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/descriptor.pb.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "descriptor_database.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/descriptor_database.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "descriptor_legacy.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/descriptor_legacy.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "descriptor_lite.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/descriptor_lite.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "descriptor_visitor.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/descriptor_visitor.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "dynamic_message.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/dynamic_message.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "endian.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/endian.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "explicitly_constructed.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/explicitly_constructed.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "extension_set.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/extension_set.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "extension_set_inl.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/extension_set_inl.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "feature_resolver.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/feature_resolver.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "field_access_listener.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/field_access_listener.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "generated_enum_reflection.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/generated_enum_reflection.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "generated_enum_util.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/generated_enum_util.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "generated_message_bases.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/generated_message_bases.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "generated_message_reflection.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/generated_message_reflection.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "generated_message_tctable_decl.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/generated_message_tctable_decl.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "generated_message_tctable_gen.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/generated_message_tctable_gen.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "generated_message_tctable_impl.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/generated_message_tctable_impl.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "generated_message_util.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/generated_message_util.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "has_bits.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/has_bits.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "implicit_weak_message.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/implicit_weak_message.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "inlined_string_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/inlined_string_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "internal_visibility.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/internal_visibility.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/io" TYPE FILE RENAME "coded_stream.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/io/coded_stream.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/io" TYPE FILE RENAME "gzip_stream.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/io/gzip_stream.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/io" TYPE FILE RENAME "io_win32.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/io/io_win32.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/io" TYPE FILE RENAME "printer.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/io/printer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/io" TYPE FILE RENAME "strtod.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/io/strtod.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/io" TYPE FILE RENAME "tokenizer.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/io/tokenizer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/io" TYPE FILE RENAME "zero_copy_sink.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/io/zero_copy_sink.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/io" TYPE FILE RENAME "zero_copy_stream.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/io/zero_copy_stream.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/io" TYPE FILE RENAME "zero_copy_stream_impl.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/io/zero_copy_stream_impl.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/io" TYPE FILE RENAME "zero_copy_stream_impl_lite.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/io/zero_copy_stream_impl_lite.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/json/internal" TYPE FILE RENAME "descriptor_traits.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/json/internal/descriptor_traits.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/json/internal" TYPE FILE RENAME "lexer.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/json/internal/lexer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/json/internal" TYPE FILE RENAME "message_path.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/json/internal/message_path.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/json/internal" TYPE FILE RENAME "parser.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/json/internal/parser.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/json/internal" TYPE FILE RENAME "parser_traits.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/json/internal/parser_traits.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/json/internal" TYPE FILE RENAME "unparser.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/json/internal/unparser.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/json/internal" TYPE FILE RENAME "unparser_traits.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/json/internal/unparser_traits.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/json/internal" TYPE FILE RENAME "untyped_message.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/json/internal/untyped_message.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/json/internal" TYPE FILE RENAME "writer.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/json/internal/writer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/json/internal" TYPE FILE RENAME "zero_copy_buffered_stream.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/json/internal/zero_copy_buffered_stream.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/json" TYPE FILE RENAME "json.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/json/json.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "map.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/map.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "map_entry.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/map_entry.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "map_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/map_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "map_field_inl.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/map_field_inl.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "map_field_lite.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/map_field_lite.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "map_type_handler.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/map_type_handler.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "message.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/message.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "message_lite.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/message_lite.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "metadata.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/metadata.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "metadata_lite.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/metadata_lite.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "parse_context.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/parse_context.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "port.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/port.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "port_def.inc" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/port_def.inc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "port_undef.inc" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/port_undef.inc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "raw_ptr.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/raw_ptr.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "reflection.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/reflection.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "reflection_internal.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/reflection_internal.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "reflection_mode.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/reflection_mode.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "reflection_ops.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/reflection_ops.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "reflection_visit_field_info.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/reflection_visit_field_info.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "reflection_visit_fields.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/reflection_visit_fields.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "repeated_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/repeated_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "repeated_ptr_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/repeated_ptr_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "runtime_version.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/runtime_version.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "serial_arena.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/serial_arena.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "service.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/service.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "string_block.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/string_block.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/stubs" TYPE FILE RENAME "callback.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/stubs/callback.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/stubs" TYPE FILE RENAME "common.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/stubs/common.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/stubs" TYPE FILE RENAME "platform_macros.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/stubs/platform_macros.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/stubs" TYPE FILE RENAME "port.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/stubs/port.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/stubs" TYPE FILE RENAME "status_macros.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/stubs/status_macros.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "text_format.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/text_format.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "thread_safe_arena.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/thread_safe_arena.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "unknown_field_set.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/unknown_field_set.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/util" TYPE FILE RENAME "delimited_message_util.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/util/delimited_message_util.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/util" TYPE FILE RENAME "field_comparator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/util/field_comparator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/util" TYPE FILE RENAME "field_mask_util.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/util/field_mask_util.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/util" TYPE FILE RENAME "json_util.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/util/json_util.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/util" TYPE FILE RENAME "message_differencer.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/util/message_differencer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/util" TYPE FILE RENAME "time_util.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/util/time_util.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/util" TYPE FILE RENAME "type_resolver.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/util/type_resolver.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/util" TYPE FILE RENAME "type_resolver_util.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/util/type_resolver_util.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "varint_shuffle.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/varint_shuffle.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "wire_format.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/wire_format.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "wire_format_lite.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/wire_format_lite.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler" TYPE FILE RENAME "code_generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/code_generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler" TYPE FILE RENAME "command_line_interface.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/command_line_interface.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "enum.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/enum.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "extension.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/extension.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp/field_generators" TYPE FILE RENAME "generators.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/field_generators/generators.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "file.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/file.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "helpers.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/helpers.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "ifndef_guard.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/ifndef_guard.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "message.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/message.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "message_layout_helper.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/message_layout_helper.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "names.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/names.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "namespace_printer.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/namespace_printer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "options.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/options.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "padding_optimizer.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/padding_optimizer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "parse_function_generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/parse_function_generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "service.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/service.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/cpp" TYPE FILE RENAME "tracker.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/cpp/tracker.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_doc_comment.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_doc_comment.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_enum.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_enum.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_enum_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_enum_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_field_base.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_field_base.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_helpers.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_helpers.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_map_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_map_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_message.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_message.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_message_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_message_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_options.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_options.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_primitive_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_primitive_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_reflection_class.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_reflection_class.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_repeated_enum_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_repeated_enum_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_repeated_message_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_repeated_message_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_repeated_primitive_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_repeated_primitive_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_source_generator_base.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_source_generator_base.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "csharp_wrapper_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/csharp_wrapper_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/csharp" TYPE FILE RENAME "names.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/csharp/names.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "context.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/context.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "doc_comment.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/doc_comment.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "field_common.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/field_common.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "file.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/file.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/full" TYPE FILE RENAME "enum.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/full/enum.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/full" TYPE FILE RENAME "enum_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/full/enum_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/full" TYPE FILE RENAME "extension.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/full/extension.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/full" TYPE FILE RENAME "field_generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/full/field_generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/full" TYPE FILE RENAME "generator_factory.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/full/generator_factory.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/full" TYPE FILE RENAME "make_field_gens.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/full/make_field_gens.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/full" TYPE FILE RENAME "map_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/full/map_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/full" TYPE FILE RENAME "message.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/full/message.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/full" TYPE FILE RENAME "message_builder.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/full/message_builder.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/full" TYPE FILE RENAME "message_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/full/message_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/full" TYPE FILE RENAME "primitive_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/full/primitive_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/full" TYPE FILE RENAME "service.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/full/service.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/full" TYPE FILE RENAME "string_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/full/string_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "generator_common.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/generator_common.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "generator_factory.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/generator_factory.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "helpers.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/helpers.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "internal_helpers.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/internal_helpers.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "java_features.pb.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/java_features.pb.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "kotlin_generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/kotlin_generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/lite" TYPE FILE RENAME "enum.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/lite/enum.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/lite" TYPE FILE RENAME "enum_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/lite/enum_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/lite" TYPE FILE RENAME "extension.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/lite/extension.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/lite" TYPE FILE RENAME "field_generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/lite/field_generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/lite" TYPE FILE RENAME "generator_factory.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/lite/generator_factory.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/lite" TYPE FILE RENAME "make_field_gens.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/lite/make_field_gens.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/lite" TYPE FILE RENAME "map_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/lite/map_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/lite" TYPE FILE RENAME "message.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/lite/message.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/lite" TYPE FILE RENAME "message_builder.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/lite/message_builder.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/lite" TYPE FILE RENAME "message_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/lite/message_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/lite" TYPE FILE RENAME "primitive_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/lite/primitive_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java/lite" TYPE FILE RENAME "string_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/lite/string_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "message_serialization.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/message_serialization.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "name_resolver.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/name_resolver.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "names.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/names.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "options.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/options.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/java" TYPE FILE RENAME "shared_code_generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/java/shared_code_generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "enum.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/enum.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "enum_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/enum_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "extension.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/extension.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "file.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/file.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "helpers.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/helpers.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "import_writer.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/import_writer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "line_consumer.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/line_consumer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "map_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/map_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "message.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/message.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "message_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/message_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "names.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/names.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "nsobject_methods.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/nsobject_methods.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "oneof.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/oneof.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "options.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/options.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "primitive_field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/primitive_field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/objectivec" TYPE FILE RENAME "tf_decode_data.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/objectivec/tf_decode_data.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/php" TYPE FILE RENAME "names.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/php/names.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/php" TYPE FILE RENAME "php_generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/php/php_generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler" TYPE FILE RENAME "plugin.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/plugin.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler" TYPE FILE RENAME "plugin.pb.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/plugin.pb.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/python" TYPE FILE RENAME "generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/python/generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/python" TYPE FILE RENAME "helpers.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/python/helpers.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/python" TYPE FILE RENAME "pyi_generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/python/pyi_generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler" TYPE FILE RENAME "retention.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/retention.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/ruby" TYPE FILE RENAME "ruby_generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/ruby/ruby_generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/rust/accessors" TYPE FILE RENAME "accessor_case.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/rust/accessors/accessor_case.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/rust/accessors" TYPE FILE RENAME "accessors.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/rust/accessors/accessors.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/rust/accessors" TYPE FILE RENAME "default_value.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/rust/accessors/default_value.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/rust/accessors" TYPE FILE RENAME "generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/rust/accessors/generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/rust" TYPE FILE RENAME "context.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/rust/context.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/rust" TYPE FILE RENAME "crate_mapping.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/rust/crate_mapping.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/rust" TYPE FILE RENAME "enum.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/rust/enum.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/rust" TYPE FILE RENAME "generator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/rust/generator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/rust" TYPE FILE RENAME "message.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/rust/message.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/rust" TYPE FILE RENAME "naming.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/rust/naming.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/rust" TYPE FILE RENAME "oneof.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/rust/oneof.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/rust" TYPE FILE RENAME "relative_path.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/rust/relative_path.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/rust" TYPE FILE RENAME "rust_field_type.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/rust/rust_field_type.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler/rust" TYPE FILE RENAME "rust_keywords.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/rust/rust_keywords.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler" TYPE FILE RENAME "scc.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/scc.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler" TYPE FILE RENAME "subprocess.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/subprocess.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler" TYPE FILE RENAME "versions.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/versions.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler" TYPE FILE RENAME "zip_writer.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/zip_writer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/testing" TYPE FILE RENAME "file.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/testing/file.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb_generator" TYPE FILE RENAME "mangle.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb_generator/mangle.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "any.proto" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/any.proto")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "api.proto" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/api.proto")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "duration.proto" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/duration.proto")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "empty.proto" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/empty.proto")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "field_mask.proto" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/field_mask.proto")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "source_context.proto" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/source_context.proto")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "struct.proto" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/struct.proto")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "timestamp.proto" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/timestamp.proto")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "type.proto" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/type.proto")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "wrappers.proto" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/wrappers.proto")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "cpp_features.proto" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/cpp_features.proto")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf" TYPE FILE RENAME "descriptor.proto" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/descriptor.proto")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/google/protobuf/compiler" TYPE FILE RENAME "plugin.proto" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/src/google/protobuf/compiler/plugin.proto")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/java/core/src/main/resources/google/protobuf" TYPE FILE RENAME "java_features.proto" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/java/core/src/main/resources/google/protobuf/java_features.proto")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/base" TYPE FILE RENAME "descriptor_constants.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/base/descriptor_constants.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/base/internal" TYPE FILE RENAME "endian.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/base/internal/endian.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/base/internal" TYPE FILE RENAME "log2.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/base/internal/log2.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/base" TYPE FILE RENAME "status.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/base/status.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/base" TYPE FILE RENAME "status.hpp" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/base/status.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/base" TYPE FILE RENAME "string_view.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/base/string_view.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/base" TYPE FILE RENAME "upcast.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/base/upcast.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb" TYPE FILE RENAME "generated_code_support.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/generated_code_support.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/hash" TYPE FILE RENAME "common.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/hash/common.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/hash" TYPE FILE RENAME "int_table.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/hash/int_table.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/hash" TYPE FILE RENAME "str_table.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/hash/str_table.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/json" TYPE FILE RENAME "decode.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/json/decode.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/json" TYPE FILE RENAME "encode.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/json/encode.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/lex" TYPE FILE RENAME "atoi.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/lex/atoi.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/lex" TYPE FILE RENAME "round_trip.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/lex/round_trip.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/lex" TYPE FILE RENAME "strtod.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/lex/strtod.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/lex" TYPE FILE RENAME "unicode.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/lex/unicode.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mem" TYPE FILE RENAME "alloc.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mem/alloc.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mem" TYPE FILE RENAME "arena.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mem/arena.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mem" TYPE FILE RENAME "arena.hpp" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mem/arena.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mem/internal" TYPE FILE RENAME "arena.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mem/internal/arena.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message" TYPE FILE RENAME "accessors.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/accessors.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message" TYPE FILE RENAME "array.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/array.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message" TYPE FILE RENAME "compare.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/compare.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message" TYPE FILE RENAME "compat.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/compat.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message" TYPE FILE RENAME "copy.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/copy.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message/internal" TYPE FILE RENAME "accessors.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/internal/accessors.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message/internal" TYPE FILE RENAME "array.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/internal/array.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message/internal" TYPE FILE RENAME "compare_unknown.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/internal/compare_unknown.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message/internal" TYPE FILE RENAME "extension.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/internal/extension.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message/internal" TYPE FILE RENAME "iterator.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/internal/iterator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message/internal" TYPE FILE RENAME "map.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/internal/map.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message/internal" TYPE FILE RENAME "map_entry.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/internal/map_entry.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message/internal" TYPE FILE RENAME "map_sorter.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/internal/map_sorter.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message/internal" TYPE FILE RENAME "message.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/internal/message.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message/internal" TYPE FILE RENAME "tagged_ptr.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/internal/tagged_ptr.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message/internal" TYPE FILE RENAME "types.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/internal/types.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message" TYPE FILE RENAME "map.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/map.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message" TYPE FILE RENAME "map_gencode_util.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/map_gencode_util.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message" TYPE FILE RENAME "merge.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/merge.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message" TYPE FILE RENAME "message.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/message.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message" TYPE FILE RENAME "tagged_ptr.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/tagged_ptr.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/message" TYPE FILE RENAME "value.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/message/value.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_descriptor" TYPE FILE RENAME "build_enum.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_descriptor/build_enum.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_descriptor" TYPE FILE RENAME "decode.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_descriptor/decode.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_descriptor/internal" TYPE FILE RENAME "base92.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_descriptor/internal/base92.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_descriptor/internal" TYPE FILE RENAME "decoder.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_descriptor/internal/decoder.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_descriptor/internal" TYPE FILE RENAME "encode.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_descriptor/internal/encode.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_descriptor/internal" TYPE FILE RENAME "encode.hpp" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_descriptor/internal/encode.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_descriptor/internal" TYPE FILE RENAME "modifiers.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_descriptor/internal/modifiers.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_descriptor/internal" TYPE FILE RENAME "wire_constants.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_descriptor/internal/wire_constants.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_descriptor" TYPE FILE RENAME "link.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_descriptor/link.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_table" TYPE FILE RENAME "enum.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_table/enum.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_table" TYPE FILE RENAME "extension.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_table/extension.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_table" TYPE FILE RENAME "extension_registry.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_table/extension_registry.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_table" TYPE FILE RENAME "field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_table/field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_table" TYPE FILE RENAME "file.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_table/file.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_table/internal" TYPE FILE RENAME "enum.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_table/internal/enum.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_table/internal" TYPE FILE RENAME "extension.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_table/internal/extension.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_table/internal" TYPE FILE RENAME "field.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_table/internal/field.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_table/internal" TYPE FILE RENAME "file.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_table/internal/file.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_table/internal" TYPE FILE RENAME "message.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_table/internal/message.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_table/internal" TYPE FILE RENAME "size_log2.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_table/internal/size_log2.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_table/internal" TYPE FILE RENAME "sub.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_table/internal/sub.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_table" TYPE FILE RENAME "message.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_table/message.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/mini_table" TYPE FILE RENAME "sub.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/mini_table/sub.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/port" TYPE FILE RENAME "atomic.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/port/atomic.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/port" TYPE FILE RENAME "def.inc" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/port/def.inc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/port" TYPE FILE RENAME "undef.inc" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/port/undef.inc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/port" TYPE FILE RENAME "vsnprintf_compat.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/port/vsnprintf_compat.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "common.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/common.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "def.hpp" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/def.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "def_pool.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/def_pool.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "def_type.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/def_type.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "enum_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/enum_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "enum_reserved_range.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/enum_reserved_range.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "enum_value_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/enum_value_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "extension_range.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/extension_range.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "field_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/field_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "file_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/file_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection/internal" TYPE FILE RENAME "def_pool.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/internal/def_pool.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection/internal" TYPE FILE RENAME "desc_state.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/internal/desc_state.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection/internal" TYPE FILE RENAME "enum_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/internal/enum_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection/internal" TYPE FILE RENAME "enum_reserved_range.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/internal/enum_reserved_range.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection/internal" TYPE FILE RENAME "enum_value_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/internal/enum_value_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection/internal" TYPE FILE RENAME "extension_range.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/internal/extension_range.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection/internal" TYPE FILE RENAME "field_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/internal/field_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection/internal" TYPE FILE RENAME "file_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/internal/file_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection/internal" TYPE FILE RENAME "message_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/internal/message_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection/internal" TYPE FILE RENAME "message_reserved_range.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/internal/message_reserved_range.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection/internal" TYPE FILE RENAME "method_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/internal/method_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection/internal" TYPE FILE RENAME "oneof_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/internal/oneof_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection/internal" TYPE FILE RENAME "service_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/internal/service_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection/internal" TYPE FILE RENAME "upb_edition_defaults.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/internal/upb_edition_defaults.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "message.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/message.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "message.hpp" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/message.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "message_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/message_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "message_reserved_range.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/message_reserved_range.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "method_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/method_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "oneof_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/oneof_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/reflection" TYPE FILE RENAME "service_def.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/reflection/service_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/text" TYPE FILE RENAME "encode.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/text/encode.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/text/internal" TYPE FILE RENAME "encode.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/text/internal/encode.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/text" TYPE FILE RENAME "options.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/text/options.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/util" TYPE FILE RENAME "def_to_proto.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/util/def_to_proto.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/util" TYPE FILE RENAME "required_fields.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/util/required_fields.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/wire" TYPE FILE RENAME "decode.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/wire/decode.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/wire" TYPE FILE RENAME "encode.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/wire/encode.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/wire" TYPE FILE RENAME "eps_copy_input_stream.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/wire/eps_copy_input_stream.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/wire/internal" TYPE FILE RENAME "decode_fast.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/wire/internal/decode_fast.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/wire" TYPE FILE RENAME "reader.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/wire/reader.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/upb/wire" TYPE FILE RENAME "types.h" FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/protobuf/upb/wire/types.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-export" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/protobuf/protobuf-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/protobuf/protobuf-targets.cmake"
         "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/CMakeFiles/Export/5a0f10ea4324979995731323bb365f6f/protobuf-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/protobuf/protobuf-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/protobuf/protobuf-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/protobuf" TYPE FILE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/CMakeFiles/Export/5a0f10ea4324979995731323bb365f6f/protobuf-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/protobuf" TYPE FILE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/CMakeFiles/Export/5a0f10ea4324979995731323bb365f6f/protobuf-targets-debug.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/protobuf" TYPE FILE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/CMakeFiles/Export/5a0f10ea4324979995731323bb365f6f/protobuf-targets-minsizerel.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/protobuf" TYPE FILE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/CMakeFiles/Export/5a0f10ea4324979995731323bb365f6f/protobuf-targets-relwithdebinfo.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/protobuf" TYPE FILE FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/CMakeFiles/Export/5a0f10ea4324979995731323bb365f6f/protobuf-targets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "protobuf-export" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/protobuf" TYPE DIRECTORY FILES "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/cmake/protobuf/" REGEX "/protobuf\\-targets\\.cmake$" EXCLUDE)
endif()

if(CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_COMPONENT MATCHES "^[a-zA-Z0-9_.+-]+$")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
  else()
    string(MD5 CMAKE_INST_COMP_HASH "${CMAKE_INSTALL_COMPONENT}")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INST_COMP_HASH}.txt")
    unset(CMAKE_INST_COMP_HASH)
  endif()
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
  file(WRITE "C:/Users/user/Desktop/Backup/Study/Cpp/GameProject/ThirdParty/ProtobufPackage/VS2022/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
