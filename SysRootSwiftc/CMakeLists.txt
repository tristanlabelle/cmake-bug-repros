cmake_minimum_required(VERSION 3.30)
project(SysRootSwiftc LANGUAGES Swift C)

if("${CMAKE_TOOLCHAIN_FILE}" STREQUAL "")
    message(FATAL_ERROR "CMAKE_TOOLCHAIN_FILE should have been set when configuring the project.")
endif()

message(STATUS "CMAKE_TOOLCHAIN_FILE: ${CMAKE_TOOLCHAIN_FILE}")
message(STATUS "CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
message(STATUS "CMAKE_Swift_COMPILER: ${CMAKE_Swift_COMPILER}")
message(STATUS "CMAKE_SYSROOT: ${CMAKE_SYSROOT}") # Prints -- CMAKE_SYSROOT: DEADBEEF

file(WRITE "${CMAKE_BINARY_DIR}/main.c" "int main() { return 0; }")
add_executable(CProgram "${CMAKE_BINARY_DIR}/main.c")

file(WRITE "${CMAKE_BINARY_DIR}/main.swift" "")
add_executable(SwiftProgram "${CMAKE_BINARY_DIR}/main.swift")
