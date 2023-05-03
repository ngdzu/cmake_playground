
set(i 0)

while(${i} LESS 10)
    message("i: " ${i})
    math(EXPR i "${i}+1")
endwhile()

message("")

foreach(i a;b;c;d)
    message("i: " ${i})
endforeach()

message("")

foreach(i RANGE 10) # zero to 10
    message("i: " ${i})
endforeach()

message("")

foreach(i RANGE 5 10) # 5 to 10
    message("i: " ${i})
endforeach()

message("")

foreach(i RANGE 5 10 2) # 5 to 10, step 2:  5, 7, 9
    message("i: " ${i})
endforeach()

message("")

set(MY_LIST 1 2 3)

foreach(VAR IN LISTS MY_LIST ITEMS e f) # 1, 2, 3, e, f
    message(${VAR})
endforeach()

message("")

set(L1 "one;two;three;four")
set(L2 "1;2;3;4;5")

foreach(num IN ZIP_LISTS L1 L2)
    message("num_0=${num_0}, num_1=${num_1}")
endforeach()