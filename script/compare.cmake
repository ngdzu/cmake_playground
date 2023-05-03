# EQUAL, LESS, LESS_EQUAL, GREATER, and GREATER_EQUAL
if(1 LESS 2)
    message("1 less than 2")
else()
    message("1 is not less than 2")
endif()

if(1 EQUAL 2)
    message("1 is equal to 2")
else()
    message("1 is not equal to 2")
endif()

# Version compare
# VERSION_EQUAL, VERSION_LESS, VERSION_LESS_EQUAL,
# VERSION_GREATER, and VERSION_GREATER_EQUAL
if(1.3.4 VERSION_LESS_EQUAL 1.4)
    message("1.3.4 is less than or equal to 1.4")
else()
    message("1.3.4 is not less than or equal to 1.4")
endif()

# String compare
# STREQUAL, STRLESS, STRLESS_EQUAL, STRGREATER, and STRGREATER_EQUAL
if("A" STREQUAL "B")
    message("A is equal to B")
else()
    message("A is not equal to B")
endif()
