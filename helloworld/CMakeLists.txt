# set minimum cmake version
cmake_minimum_required(VERSION 3.19 FATAL_ERROR)

# project name and language
project(helloworld LANGUAGES CXX)

# require C++11
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)

# example library
add_library(echo STATIC 
    echo.cpp echo.hpp)

# main code
add_executable(main main.cpp)
target_link_libraries(main echo)



