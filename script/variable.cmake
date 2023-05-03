
cmake_minimum_required(VERSION 3.20.0)

message(hello world) # helloworld
message(hello\ world) # hello world
message("hello world") # hello world
message(${CMAKE_ARGV0}) # cmake
message(${CMAKE_ARGV1}) # -P
message(${CMAKE_ARGV2}) # variable.cmake
# message(${CMAKE_ARGV3}) # will print the argument or error 
# message(${CMAKE_ARGV4}) # will print the argument or error 

set(MYVAR van\ bien)
message(${MYVAR}) # print "van bien"

set(ENV{CXX} "clang++") # the value is interpolation
message($ENV{CXX})



