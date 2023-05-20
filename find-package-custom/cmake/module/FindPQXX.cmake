# FindPQXX.cmake

function(add_imported_library library headers)
  add_library(PQXX::PQXX UNKNOWN IMPORTED)
  set_target_properties(PQXX::PQXX PROPERTIES
    IMPORTED_LOCATION ${library}
    INTERFACE_INCLUDE_DIRECTORIES ${headers}
  )
  set(PQXX_FOUND 1 CACHE INTERNAL "PQXX found" FORCE)
  set(PQXX_LIBRARIES ${library}
    CACHE STRING "Path to pqxx library" FORCE)
  set(PQXX_INCLUDES ${headers}
    CACHE STRING "Path to pqxx headers" FORCE)
  mark_as_advanced(FORCE PQXX_LIBRARIES)
  mark_as_advanced(FORCE PQXX_INCLUDES)
endfunction()

if(PQXX_LIBRARIES AND PQXX_INCLUDES)
  # This is needed or PQXX::PQXX target won't be added.
  add_imported_library(${PQXX_LIBRARIES} ${PQXX_INCLUDES})
  return()
endif()

include(CMakeFindDependencyMacro)
find_dependency(PostgreSQL)

file(TO_CMAKE_PATH "$ENV{PQXX_DIR}" _PQXX_DIR)
find_library(PQXX_LIBRARY NAMES libpqxx pqxx
  PATHS
  ${_PQXX_DIR}/lib/${CMAKE_LIBRARY_ARCHITECTURE}
  ${CMAKE_INSTALL_PREFIX}/lib/${CMAKE_LIBRARY_ARCHITECTURE}
  /usr/local/pgsql/lib/${CMAKE_LIBRARY_ARCHITECTURE}
  /usr/local/lib/${CMAKE_LIBRARY_ARCHITECTURE}
  /usr/lib/${CMAKE_LIBRARY_ARCHITECTURE}
  ${_PQXX_DIR}/lib
  ${_PQXX_DIR}
  ${CMAKE_INSTALL_PREFIX}/lib
  ${CMAKE_INSTALL_PREFIX}/bin
  /usr/local/pgsql/lib
  /usr/local/lib
  /usr/lib
  /opt/homebrew/lib
  NO_DEFAULT_PATH
)

find_path(PQXX_INCLUDES NAMES pqxx/pqxx
  PATHS
  ${_PQXX_DIR}/include
  ${_PQXX_DIR}
  ${CMAKE_INSTALL_PREFIX}/include
  /usr/local/pgsql/include
  /usr/local/include
  /usr/include
  /opt/homebrew/include
  NO_DEFAULT_PATH
)

set(PQXX_INCLUDES ${PQXX_INCLUDES})
set(PQXX_LIBRARIES ${PQXX_LIBRARY})


# using FindPackageHandleStandardArgs
include(FindPackageHandleStandardArgs)
# if the find_package_handle_standard_args is successful, PQXX_FOUND will be set to TRUE
find_package_handle_standard_args(PQXX REQUIRED_VARS PQXX_INCLUDES PQXX_LIBRARIES)

if(PQXX_FOUND)
  # This is needed or PQXX::PQXX target won't be added.
  add_imported_library(${PQXX_LIBRARIES} ${PQXX_INCLUDES})
  return()
endif()
