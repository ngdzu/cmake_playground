cmake_minimum_required(VERSION 3.20.0)
project(FindPkgConfig CXX)

find_package(PkgConfig REQUIRED)
pkg_check_modules(PQXX REQUIRED IMPORTED_TARGET libpqxx)
message("PQXX_FOUND: ${PQXX_FOUND}")

add_executable(main main.cpp)
set_target_properties(main PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED OFF
    CXX_EXTENSIONS OFF
)


target_link_libraries(main PRIVATE PkgConfig::PQXX)
