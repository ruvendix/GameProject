// Generated by the protocol buffer compiler.  DO NOT EDIT!
// NO CHECKED-IN PROTOBUF GENCODE
// source: Enum.proto
// Protobuf C++ Version: 5.29.0-dev

#include "Enum.pb.h"

#include <algorithm>
#include <type_traits>
#include "google/protobuf/io/coded_stream.h"
#include "google/protobuf/generated_message_tctable_impl.h"
#include "google/protobuf/extension_set.h"
#include "google/protobuf/wire_format_lite.h"
#include "google/protobuf/descriptor.h"
#include "google/protobuf/generated_message_reflection.h"
#include "google/protobuf/reflection_ops.h"
#include "google/protobuf/wire_format.h"
// @@protoc_insertion_point(includes)

// Must be included last.
#include "google/protobuf/port_def.inc"
PROTOBUF_PRAGMA_INIT_SEG
namespace _pb = ::google::protobuf;
namespace _pbi = ::google::protobuf::internal;
namespace _fl = ::google::protobuf::internal::field_layout;
namespace Protocol {
}  // namespace Protocol
static const ::_pb::EnumDescriptor* file_level_enum_descriptors_Enum_2eproto[1];
static constexpr const ::_pb::ServiceDescriptor**
    file_level_service_descriptors_Enum_2eproto = nullptr;
const ::uint32_t TableStruct_Enum_2eproto::offsets[1] = {};
static constexpr ::_pbi::MigrationSchema* schemas = nullptr;
static constexpr ::_pb::Message* const* file_default_instances = nullptr;
const char descriptor_table_protodef_Enum_2eproto[] ABSL_ATTRIBUTE_SECTION_VARIABLE(
    protodesc_cold) = {
    "\n\nEnum.proto\022\010Protocol*a\n\013EPlayerType\022\022\n"
    "\016PlayerTypeNone\020\000\022\024\n\020PlayerTypeKnight\020\001\022"
    "\022\n\016PlayerTypeMage\020\002\022\024\n\020PlayerTypeArcher\020"
    "\003b\006proto3"
};
static ::absl::once_flag descriptor_table_Enum_2eproto_once;
PROTOBUF_CONSTINIT const ::_pbi::DescriptorTable descriptor_table_Enum_2eproto = {
    false,
    false,
    129,
    descriptor_table_protodef_Enum_2eproto,
    "Enum.proto",
    &descriptor_table_Enum_2eproto_once,
    nullptr,
    0,
    0,
    schemas,
    file_default_instances,
    TableStruct_Enum_2eproto::offsets,
    file_level_enum_descriptors_Enum_2eproto,
    file_level_service_descriptors_Enum_2eproto,
};
namespace Protocol {
const ::google::protobuf::EnumDescriptor* EPlayerType_descriptor() {
  ::google::protobuf::internal::AssignDescriptors(&descriptor_table_Enum_2eproto);
  return file_level_enum_descriptors_Enum_2eproto[0];
}
PROTOBUF_CONSTINIT const uint32_t EPlayerType_internal_data_[] = {
    262144u, 0u, };
bool EPlayerType_IsValid(int value) {
  return 0 <= value && value <= 3;
}
// @@protoc_insertion_point(namespace_scope)
}  // namespace Protocol
namespace google {
namespace protobuf {
}  // namespace protobuf
}  // namespace google
// @@protoc_insertion_point(global_scope)
PROTOBUF_ATTRIBUTE_INIT_PRIORITY2 static ::std::false_type
    _static_init2_ PROTOBUF_UNUSED =
        (::_pbi::AddDescriptors(&descriptor_table_Enum_2eproto),
         ::std::false_type{});
#include "google/protobuf/port_undef.inc"
