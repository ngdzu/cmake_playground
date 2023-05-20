Make sure you have libpqxx-dev and PostgresSQL installed before building this example.

```
$ brew install libpqxx
$ brew install postgresql@14
```

In this sample project, we write a custom find-packge file 
        cmake/module/FindPQXX.cmake 
to help finding the pqxx libraries and include headers. The cpp file will be 
able to include <pqxx/pqxx> and the main target will be linked to 
PQXX::PQXX target. 

