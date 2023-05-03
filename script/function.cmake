

function(MyFunction FirstArg)
    message("Function: ${CMAKE_CURRENT_FUNCTION}")
    message("File: ${CMAKE_CURRENT_FUNCTION_LIST_FILE}")
    message("FirstArg: ${FirstArg}")
    set(FirstArg "new value")
    message("FirstArg again: ${FirstArg}")
    message("ARGV0: ${ARGV0} ARGV1: ${ARGV1} ARGC: ${ARGC}")
endfunction()

set(FirstArg "first value") # global scope FirstArg
MyFunction("Value1" "Value2") # "Value1" as FirstArg of MyFunction scope
message("FirstArg in global scope: ${FirstArg}")
