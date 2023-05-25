cmake_minimum_required(VERSION 3.20.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

project(GitSubmoduleManual CXX)
add_executable(welcome main.cpp)
configure_file(config.yaml config.yaml COPYONLY)

find_package(yaml-cpp QUIET)

if(NOT yaml-cpp_FOUND)
    message("yaml-cpp not found, initializing git submodule")
    execute_process(
        COMMAND git submodule update --init -- extern/yaml-cpp
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    )
    add_subdirectory(extern/yaml-cpp)
endif()

target_link_libraries(welcome PRIVATE yaml-cpp)