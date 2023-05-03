
set(myList1 "a;list;of;five;elements")
set(myList2 a list "of;five;elements")

message("the list1 is:" ${myList1}) # the list1 is:alistoffiveelements
message("the list2 is:" ${myList2}) # the list1 is:alistoffiveelements

# list(LENGTH <list> <out-var>)
list(LENGTH myList1 n )
message("length of list1: " ${n})


# list(GET <list> <element index> [<index> ...] <out-var>)
# pass at least one index
list(GET myList1 0 item)
list(GET myList1 3 4 sublist)
message("first element: " ${item})
message("list of element 3 and 4: " ${sublist})

# list(SUBLIST <list> <begin> <length> <out-var>)
list(SUBLIST myList1 2 3 sublist)
message("list of element 2, 3 and 4: " ${sublist})

# list(FIND <list> <value> <out-var>)
list(FIND myList1 list foundIndex)
message("did it find \"list\"?: " ${foundIndex}) # foundIndex 1
list(FIND myList1 of foundIndex)
message("did it find \"of\"?: " ${foundIndex}) # foundIndex 2
list(FIND myList1 haha foundIndex)
message("did it find \"haha\"?: " ${foundIndex}) # foundIndex -1


