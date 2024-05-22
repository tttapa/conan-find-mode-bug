cmake_minimum_required(VERSION 3.20)
project(conan_find_mode)

message(STATUS "CMAKE_FIND_ROOT_PATH_MODE_PROGRAM: ${CMAKE_FIND_ROOT_PATH_MODE_PROGRAM}")
message(STATUS "CMAKE_FIND_ROOT_PATH_MODE_LIBRARY: ${CMAKE_FIND_ROOT_PATH_MODE_LIBRARY}")
message(STATUS "CMAKE_FIND_ROOT_PATH_MODE_INCLUDE: ${CMAKE_FIND_ROOT_PATH_MODE_INCLUDE}")
message(STATUS "CMAKE_FIND_ROOT_PATH_MODE_PACKAGE: ${CMAKE_FIND_ROOT_PATH_MODE_PACKAGE}")

set(CMAKE_FIND_DEBUG_MODE On)
# libreadline.so is in /usr/lib on the build system (not in the sysroot)
find_library(LIBREADLINE "libreadline.so")
if (LIBREADLINE)
    message(SEND_ERROR "LIBREADLINE=${LIBREADLINE}")
else()
    message(STATUS "Could not find libreadline.so (good): ${LIBREADLINE}")
endif()

# example.h is in the sysroot
find_file(EXAMPLE_H "example.h")
if (EXAMPLE_H)
    message(STATUS "EXAMPLE_H=${EXAMPLE_H}")
else()
    message(SEND_ERROR "Could not find example.h: ${EXAMPLE_H}")
endif()

# find.h is in the CMAKE_FIND_ROOT_PATH
find_file(FIND_H "find.h")
if (FIND_H)
    message(STATUS "FIND_H=${FIND_H}")
else()
    message(SEND_ERROR "Could not find find.h: ${FIND_H}")
endif()

# syspkg is in the sysroot
find_package(syspkg REQUIRED)

# findrootpkg is in the CMAKE_FIND_ROOT_PATH
find_package(findrootpkg REQUIRED)
