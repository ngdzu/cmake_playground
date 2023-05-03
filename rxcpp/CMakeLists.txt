cmake_minimum_required(VERSION 3.2)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

project(rxcpp_example)


# set(vcpkg "$ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake")
# if(NOT CMAKE_TOOLCHAIN_FILE AND EXISTS "${vcpkg}")
#   set(CMAKE_TOOLCHAIN_FILE "${vcpkg}"
#       CACHE FILEPATH "CMake toolchain file")
#   message(STATUS "vcpkg toolchain found: ${CMAKE_TOOLCHAIN_FILE}")
# endif()


add_executable(main main.cpp)

find_package(rxcpp CONFIG REQUIRED)
target_link_libraries(main PRIVATE rxcpp)