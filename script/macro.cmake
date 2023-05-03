

macro(MyMacro myVar)
    set(myVar "new value") # set the global variable myVar
    message("argument: ${myVar}") # still called value because parameter myVar is constant
    
endmacro()

set(myVar "first value")
message("myVar is now: ${myVar}")
MyMacro("called value")
message("myVar is now: ${myVar}") # global variable myVar was changed inside the macro