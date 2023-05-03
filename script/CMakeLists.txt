cmake_minimum_required(VERSION 3.20.0)

project(Environment)

# will print during generation
message("generated with " $ENV{myenv})

# will print during build
add_custom_target(EchoEnv ALL COMMAND echo "myenv in build is" $ENV{myenv})

