project(CapnpZmqExample)
cmake_minimum_required(VERSION 3.5)
set(CMAKE_CXX_STANDARD 17)
include(FetchContent)

# --- 1. Fetch ZeroMQ (libzmq) ---
FetchContent_Declare(
    ZeroMQ
    GIT_REPOSITORY https://github.com/zeromq/libzmq.git
    GIT_TAG v4.3.5
)
set(ZMQ_BUILD_TESTS OFF CACHE BOOL "" FORCE)
# Use OVERRIDE_FIND_PACKAGE to help dependencies find this fetched version
FetchContent_MakeAvailable(ZeroMQ)

# --- 2. Fetch ZeroMQ C++ Bindings (cppzmq) ---
FetchContent_Declare(
    cppzmq
    GIT_REPOSITORY https://github.com/zeromq/cppzmq.git
    GIT_TAG v4.10.0
)
set(CPPZMQ_BUILD_TESTS OFF CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(cppzmq)

# --- 3. Fetch Cap'n Proto ---
FetchContent_Declare(
    CapnProto
    GIT_REPOSITORY https://github.com/capnproto/capnproto.git
    GIT_TAG v1.0.1
)
FetchContent_MakeAvailable(CapnProto)

# --- 4. Application Setup ---
# Generate C++ files from schema.capnp
capnp_generate_cpp(CAPNP_SRCS CAPNP_HDRS schema.capnp)

# Publisher
add_executable(publisher cli.cpp ${CAPNP_SRCS})
target_link_libraries(publisher PRIVATE CapnProto::capnp-rpc cppzmq "${CMAKE_CURRENT_BINARY_DIR}")
target_include_directories(publisher PRIVATE "${CMAKE_CURRENT_BINARY_DIR}")
add_executable(subscriber sub.cpp ${CAPNP_SRCS})
target_link_libraries(subscriber PRIVATE CapnProto::capnp-rpc cppzmq)
target_include_directories(subscriber PRIVATE "${CMAKE_CURRENT_BINARY_DIR}")

