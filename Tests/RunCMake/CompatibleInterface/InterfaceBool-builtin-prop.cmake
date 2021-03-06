# Sniperkit-Bot
# - Status: analyzed


add_library(foo UNKNOWN IMPORTED)
add_library(bar UNKNOWN IMPORTED)

set_property(TARGET foo APPEND PROPERTY COMPATIBLE_INTERFACE_BOOL INCLUDE_DIRECTORIES)
set_property(TARGET foo PROPERTY INTERFACE_INCLUDE_DIRECTORIES ON)
set_property(TARGET bar PROPERTY INTERFACE_INCLUDE_DIRECTORIES ON)

add_executable(user main.cpp)
set_property(TARGET user PROPERTY INCLUDE_DIRECTORIES OFF)
target_link_libraries(user foo bar)
