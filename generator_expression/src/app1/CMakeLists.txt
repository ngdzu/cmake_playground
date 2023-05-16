
add_subdirectory(lib3)
add_executable(app1 app1.cpp)

add_library(compiler_options INTERFACE)

target_compile_options(compiler_options INTERFACE
    $<$<OR:$<CXX_COMPILER_ID:GNU>,$<CXX_COMPILER_ID:Clang>>:-rtti>
)

target_compile_options(compiler_options INTERFACE $<$<CONFIG:Debug>:-g>)

target_compile_definitions(app1 PRIVATE $<$<PLATFORM_ID:Linux>:LINUX=1>)

target_link_libraries(app1 PRIVATE lib1 lib3 compiler_options)

set(myvar "small text")
set(myvar2 "small > text")
file(GENERATE OUTPUT nesting CONTENT
    "1 $<PLATFORM_ID>
2 $<UPPER_CASE:$<PLATFORM_ID>>
3 $<UPPER_CASE:hello world>
4 $<UPPER_CASE:${myvar}>
5 $<UPPER_CASE:${myvar2}>
")

# 5 becomes $<UPPER_CASE:small> text>


file(GENERATE OUTPUT boolean CONTENT
"1 $<0:TRUE>
2 $<0:TRUE,FALSE>(won't print)
3 $<1:TRUE,FALSE>
4 $<IF:0,TRUE,FALSE>
5 $<IF:0,TRUE,>
6 $$<$<IF:TRUE>TRUE,FALSE>
")

message("]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]configure stage - in app1")
