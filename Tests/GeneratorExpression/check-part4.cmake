# Sniperkit-Bot
# - Status: analyzed

include(${CMAKE_CURRENT_LIST_DIR}/check-common.cmake)

string(REPLACE ${path_prefix} "" test_shell_path ${test_shell_path})

if(WIN32)
  if(CMAKE_GENERATOR STREQUAL "MSYS Makefiles")
    check(test_shell_path [[/c/shell/path]])
  elseif(CMAKE_GENERATOR STREQUAL "Unix Makefiles")
    check(test_shell_path [[c:/shell/path]])
  else()
    check(test_shell_path [[c:\shell\path]])
  endif()
else()
  check(test_shell_path [[/shell/path]])
endif()

check(if_1 "a")
check(if_2 "b")
check(if_3 "b")
check(if_4 "a")
