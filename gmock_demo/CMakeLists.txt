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

enable_testing()

add_executable(mock_demo
  MyInterface.h
  mywork.h
  mywork.cpp
  mywork_test.cpp
)

target_link_libraries(
  mock_demo PRIVATE
  GTest::gtest
  GTest::gmock_main
)

include(GoogleTest)

gtest_discover_tests(mock_demo)

# gtest_discover_tests replace all these
# add_test(NAME test_AssertionResult COMMAND hello_test)

# add_test(NAME test_expect_pred COMMAND hello_test)
