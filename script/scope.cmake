
function(Inner)
    message(" > Inner: ${V}") # V = 2
    set(V 3) 
    message(" < Inner: ${V}") # V = 3
endfunction()

function(Outer)
    message(" > Outer: ${V}") # V = 1
    set(V 2) 
    Inner() # V = 2
    message(" < Outer: ${V}") # V = 2
endfunction()

set(V 1)
message("> Global: ${V}") # V = 1
Outer()
message("< Global: ${V}") # V = 1