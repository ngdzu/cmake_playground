

project(FindPackageProtobufVariables CXX)

add_executable(main main.cpp)

set_target_properties(main PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED OFF
    CXX_EXTENSIONS OFF
)

target_link_libraries(main proto)
