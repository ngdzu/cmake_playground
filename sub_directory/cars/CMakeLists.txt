
add_library(cars OBJECT car.cpp)

# allow main.cpp to include car.h without specifying the relative path
target_include_directories(cars PUBLIC .)


