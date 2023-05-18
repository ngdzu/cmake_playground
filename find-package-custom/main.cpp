#include <pqxx/pqxx>
#include <iostream>
int main()
{
  try
  {
    std::string connection_string = "dbname=mydatabase user=myuser password=mypassword host=localhost port=5432";
    pqxx::connection conn(connection_string);
    if (conn.is_open())
    {
      // Connection successful
      std::cout << "Connected to PostgreSQL database" << std::endl;
    }
    else
    {
      // Connection failed
      std::cout << "Failed to connect to PostgreSQL database" << std::endl;
    }
  }
  catch (const std::exception &e)
  {
    // Handle connection error
    std::cerr << "Connection error: " << e.what() << std::endl;
  }


  return 0;
}
