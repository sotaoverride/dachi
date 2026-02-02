# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/home/aatir/capcrunch/build/_deps/cppzmq-src")
  file(MAKE_DIRECTORY "/home/aatir/capcrunch/build/_deps/cppzmq-src")
endif()
file(MAKE_DIRECTORY
  "/home/aatir/capcrunch/build/_deps/cppzmq-build"
  "/home/aatir/capcrunch/build/_deps/cppzmq-subbuild/cppzmq-populate-prefix"
  "/home/aatir/capcrunch/build/_deps/cppzmq-subbuild/cppzmq-populate-prefix/tmp"
  "/home/aatir/capcrunch/build/_deps/cppzmq-subbuild/cppzmq-populate-prefix/src/cppzmq-populate-stamp"
  "/home/aatir/capcrunch/build/_deps/cppzmq-subbuild/cppzmq-populate-prefix/src"
  "/home/aatir/capcrunch/build/_deps/cppzmq-subbuild/cppzmq-populate-prefix/src/cppzmq-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/aatir/capcrunch/build/_deps/cppzmq-subbuild/cppzmq-populate-prefix/src/cppzmq-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/aatir/capcrunch/build/_deps/cppzmq-subbuild/cppzmq-populate-prefix/src/cppzmq-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
