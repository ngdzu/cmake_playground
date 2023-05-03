

# run
# cmake -P message_context.cmake --log-context

function(foo)
    list(APPEND CMAKE_MESSAGE_CONTEXT "foo") # only effect in foo
    message("foo message")
endfunction()

list(APPEND CMAKE_MESSAGE_CONTEXT "top")
message("Before `foo`")
foo()
message("After `foo`")
