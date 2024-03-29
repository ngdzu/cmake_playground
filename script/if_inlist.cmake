# enbale IN_LIST

if(POLICY CMP0057)
    message("IN_LIST is supported") # but is using the old behavior
else()
    message("IN_LIST is not supported")
endif()

message("enable new behavior policy CMP0057")
cmake_policy(SET CMP0057 NEW)

set(li a b c d)

if("a" IN_LIST li)
    message("a is in list li")
else()
    message("a is not in list li")
endif()
message("==============================")
if(b IN_LIST li)
    message("b is in list li")
else()
    message("b is not in list li")
endif()
message("==============================")
if(z IN_LIST li)
    message("z is in list li")
else()
    message("z is not in list li")
endif()
