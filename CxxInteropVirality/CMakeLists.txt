cmake_minimum_required(VERSION 3.30)
project(CxxInteropVirality LANGUAGES Swift CXX)

file(WRITE ${CMAKE_BINARY_DIR}/Library.swift "")
add_library(Library STATIC ${CMAKE_BINARY_DIR}/Library.swift)
target_compile_options(Library PRIVATE -cxx-interoperability-mode=default)

file(WRITE ${CMAKE_BINARY_DIR}/main.swift "import Library")
add_executable(Program ${CMAKE_BINARY_DIR}/main.swift)
target_link_libraries(Program PRIVATE Library)
