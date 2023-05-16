

find_package(Protobuf REQUIRED)

protobuf_generate_cpp(GENERATED_SRC GENERATED_HEADER
    message.proto)

add_library(proto
    ${GENERATED_SRC} ${GENERATED_HEADER})

set_target_properties(proto PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED OFF
    CXX_EXTENSIONS OFF
)

target_link_libraries(proto INTERFACE ${Protobuf_LIBRARIES})

target_include_directories(proto PUBLIC
    ${Protobuf_INCLUDE_DIRS}
    ${CMAKE_CURRENT_BINARY_DIR}
    )
