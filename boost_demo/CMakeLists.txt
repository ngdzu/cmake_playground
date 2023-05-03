cmake_minimum_required(VERSION 3.20)
project(myapp)

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 14)

include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)


add_subdirectory(boost-cmake)


enable_testing()

add_executable(
  filesystem
  filesystem.cpp
)
target_link_libraries(
  filesystem PRIVATE
  GTest::gtest_main
  Boost::filesystem
)

add_executable(
  thread
  thread.cpp
)

target_link_libraries(
  thread PRIVATE
  GTest::gtest_main
  Boost::thread
)

add_executable(
  atomic
  atomic.cpp
)

target_link_libraries(
  atomic PRIVATE
  GTest::gtest_main
  Boost::atomic
  Boost::thread
)


add_executable(
  atomic_test
  atomic_test.cpp
)

target_link_libraries(
  atomic_test PRIVATE
  GTest::gtest_main
  Boost::atomic
  Boost::thread
)

# include(GoogleTest)
# gtest_discover_tests(filesystem)

