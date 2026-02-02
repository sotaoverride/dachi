# Install script for directory: /home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/aatir/capcrunch/build/_deps/capnproto-build/c++/src/kj/libkj.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj" TYPE FILE FILES
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/cidr.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/common.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/units.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/memory.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/refcount.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/array.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/list.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/vector.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/string.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/string-tree.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/source-location.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/hash.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/table.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/map.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/encoding.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/exception.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/debug.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/arena.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/io.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/tuple.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/one-of.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/function.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/mutex.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/thread.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/threadlocal.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/filesystem.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/time.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/main.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/win32-api-version.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/windows-sanity.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj/parse" TYPE FILE FILES
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/parse/common.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/parse/char.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj/std" TYPE FILE FILES "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/std/iostream.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/aatir/capcrunch/build/_deps/capnproto-build/c++/src/kj/libkj-test.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj" TYPE FILE FILES "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/test.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj/compat" TYPE FILE FILES "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/compat/gtest.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/aatir/capcrunch/build/_deps/capnproto-build/c++/src/kj/libkj-async.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj" TYPE FILE FILES
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/async-prelude.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/async.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/async-inl.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/async-unix.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/async-win32.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/async-io.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/async-queue.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/cidr.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/timer.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/aatir/capcrunch/build/_deps/capnproto-build/c++/src/kj/libkj-http.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj/compat" TYPE FILE FILES
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/compat/url.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/compat/http.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/aatir/capcrunch/build/_deps/capnproto-build/c++/src/kj/libkj-tls.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj/compat" TYPE FILE FILES
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/compat/readiness-io.h"
    "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/compat/tls.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/aatir/capcrunch/build/_deps/capnproto-build/c++/src/kj/libkj-gzip.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj/compat" TYPE FILE FILES "/home/aatir/capcrunch/build/_deps/capnproto-src/c++/src/kj/compat/gzip.h")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/aatir/capcrunch/build/_deps/capnproto-build/c++/src/kj/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
