# unquoted: evaluate to true unless OFF, NO,
# FALSE, N, IGNORE, NOTFOUND, varname_NOTFOUND
set(FOO BAR) # true
message ("FOO value: ${FOO}")
message ("BAR value: ${BAR}")

if(FOO)
    message("unquoted FOO=BAR is true")
else()
    message("unquoted FOO=BAR is false")
endif()

message ("set BAR to NO")
set (BAR NO)
message ("FOO value: ${FOO}")
message ("\${\${FOO}} value: ${${FOO}}")
message ("BAR value: ${BAR}")


set (FOO ${BAR}) # false
if(FOO)
    message("unquoted FOO=\${BAR} is true")
else()
    message("unquoted FOO=\${BAR} is false")
endif()

# Set FOO to FALSE
set(FOO FALSE) # false

if(FOO)
    message("unquoted FOO=FALSE is true")
else()
    message("unquoted FOO=FALSE is false")
endif()

# Set FOO to NOTFOUND
set(FOO NOTFOUND) # false
if(FOO)
    message("unquoted FOO=NOTFOUND is true")
else()
    message("unquoted FOO=NOTFOUND is false")
endif()

# unquoted argument: evaluate to true ONLY IF the string is
# YES, ON, Y, TRUE, or non-zero number
set(FOO YES) # true
if(FOO)
    message("unquoted FOO=YES is true")
else()
    message("unquoted FOO=YES is false")
endif()

# quoted arguement: evaluated to false only if FOO is
#   FALSE, OFF, NO, N, NOTFOUND, IGNORE. 
set(FOO "BAR") # true
if(FOO)
    message("quoted FOO=\"BAR\" is true")
else()
    message("quoted FOO=\"BAR\" is false")
endif()

set(FOO "FALSE") #false
if(FOO)
    message("quoted FOO=\"FALSE\" is true")
else()
    message("quoted FOO=\"FALSE\" is false")
endif()

set(FOO "IGNORE") #false
if(FOO)
    message("quoted FOO=\"IGNORE\" is true")
else()
    message("quoted FOO=\"IGNORE\" is false")
endif()

# undefined variable evaluated to false,
# same as 
#       if(DEFINED newvar)
if(newvar) # false - undefined variable
    message("undefined newvar is true")
else()
    message("undefined newvar is false")
endif()

# defined variable evaluated to true
# same as 
#       if(DEFINED newvar)
set(newvar "newvar")
if(newvar) # true - already defined variable
    message("defined newvar is true")
else()
    message("defined newvar is false")
endif()


