# 1. If paths to library and headers are known (either provided by a user or coming from
# the cache of a previous run), use these paths and create an IMPORTED target. End
# here.
# 2. Otherwise, find the library and headers of the nested dependency – PostgreSQL.
# 3. Search the known paths for the binary version of the PostgreSQL client library.
# 4. Search the known paths for the PostgreSQL client include headers.
# 5. Check whether the library and include headers were found; if so, create an
# IMPORTED target.function(add_imported_library library headers)
function(add_imported_library library headers)
    add_library(PQXX::PQXX UNKNOWN IMPORTED) # we don't know if it is shared of static lib
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

# if PQXX_LIBRARIES is passed by command line argument
# or the configuration was done in the past, therefore
# variable PQXX_LIBRARIES is cached.
if(PQXX_LIBRARIES AND PQXX_INCLUDES)
    add_imported_library(${PQXX_LIBRARIES} ${PQXX_INCLUDES})
    return()
endif()

message("hello world")

# deliberately used in mind-module against the documentation
include(CMakeFindDependencyMacro)
find_dependency(PostgreSQL)

# if PQXX_DIR environment variable was defined
file(TO_CMAKE_PATH "$ENV{PQXX_DIR}" _PQXX_DIR)

# set up PQXX_LIBRARY_PATH
# find libpqxx in paths listed after PATHS
# if found, PQXX_LIBRARY_PATH will be assigned the path to PQXX
find_library(PQXX_LIBRARY_PATH NAMES libpqxx pqxx
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
    /opt/homebrew/lib # we know it is in here on Mac
    NO_DEFAULT_PATH
)

# find the file pqxx/pqxx (without extensions)
# in the paths listed after PATHS
find_path(PQXX_HEADER_PATH NAMES pqxx/pqxx
    PATHS
    ${_PQXX_DIR}/include
    ${_PQXX_DIR}
    ${CMAKE_INSTALL_PREFIX}/include
    /usr/local/pgsql/include
    /usr/local/include
    /usr/include
    /opt/homebrew/include # we know we install it here on Mac
    NO_DEFAULT_PATH
)

message("PQXX_LIBRARY_PATH")
message("PQXX_LIBRARY_PATH: ${PQXX_LIBRARY_PATH}")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
    PQXX DEFAULT_MSG PQXX_LIBRARY_PATH PQXX_HEADER_PATH
)

if(PQXX_FOUND)
    add_imported_library(
        "${PQXX_LIBRARY_PATH};${POSTGRES_LIBRARIES}"
        "${PQXX_HEADER_PATH};${POSTGRES_INCLUDE_DIRECTORIES}"
    )
endif()
