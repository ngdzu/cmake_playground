

project(FindPackageProtobufVariables CXX)
find_package(Protobuf REQUIRED)

protobuf_generate_cpp(GENERATED_SRC GENERATED_HEADER
    ../proto/message.proto)

add_executable(main main.cpp
    ${GENERATED_SRC} ${GENERATED_HEADER})

set_target_properties(main PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED OFF
    CXX_EXTENSIONS OFF
)

target_link_libraries(main PRIVATE ${Protobuf_LIBRARIES})

target_include_directories(main PRIVATE
    ${Protobuf_INCLUDE_DIRS}
    ${CMAKE_CURRENT_BINARY_DIR})
