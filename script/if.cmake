# unquoted: evaluate to true unless OFF, NO,
# FALSE, N, IGNORE, NOTFOUND, varname_NOTFOUND
set(FOO BAR) # true

if(FOO)
    message("FOO is true")
else()
    message("FOO is false")
endif()

# Set FOO to FALSE
set(FOO FALSE) # false

if(FOO)
    message("FOO is true")
else()
    message("FOO is false")
endif()

# Set FOO to NOTFOUND
set(FOO NOTFOUND) # false
if(FOO)
    message("FOO is true")
else()
    message("FOO is false")
endif()

# quoted argument: evaluate to true ONLY IF the string is
# YES, ON, Y, TRUE, or non-zero number
set(FOO YES) # true
if(FOO)
    message("FOO is true")
else()
    message("FOO is false")
endif()

# unquoted arguement: evaluated to false only if FOO is
#   OFF, NO, N, NOTFOUND, IGNORE. 
set(FOO "BAR") # true
if(FOO)
    message("FOO is true")
else()
    message("FOO is false")
endif()

# undefined variable evaluated to false,
# same as 
#       if(DEFINED newvar)
if(newvar) # false - undefined variable
    message("newvar is true")
else()
    message("newvar is false")
endif()

# defined variable evaluated to true
# same as 
#       if(DEFINED newvar)
set(newvar "newvar")
if(newvar) # true - already defined variable
    message("newvar is true")
else()
    message("newvar is false")
endif()


