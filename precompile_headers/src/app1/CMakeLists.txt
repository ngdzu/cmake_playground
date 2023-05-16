

add_subdirectory(lib)

add_executable(main main.cpp)

target_precompile_headers(main PRIVATE <iostream>
    PRIVATE [["calc.h"]]) # calc.h is found in include directories

target_link_libraries(main calc)