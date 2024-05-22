# System information
set(CMAKE_SYSTEM_NAME "Linux")
set(CMAKE_SYSTEM_PROCESSOR "x86_64")

# Search path configuration
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# These are the only places where CMake is allowed to look for libraries etc.
set(CMAKE_FIND_ROOT_PATH ${CMAKE_CURRENT_LIST_DIR}/find_root)
set(CMAKE_SYSROOT ${CMAKE_CURRENT_LIST_DIR}/sysroot)
