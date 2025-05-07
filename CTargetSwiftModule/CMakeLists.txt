cmake_minimum_required(VERSION 3.30)
project(CTargetSwiftModule LANGUAGES Swift C)

file(WRITE ${CMAKE_BINARY_DIR}/Module.swift "")
add_library(SwiftModule STATIC ${CMAKE_BINARY_DIR}/Module.swift)

file(WRITE ${CMAKE_BINARY_DIR}/Module.c "")
add_library(CModule STATIC ${CMAKE_BINARY_DIR}/Module.c)
target_include_directories(CModule PUBLIC include)
target_link_libraries(CModule PRIVATE SwiftModule)

file(WRITE ${CMAKE_BINARY_DIR}/main.swift "import CModule")
add_executable(Program ${CMAKE_BINARY_DIR}/main.swift)
target_link_libraries(Program PRIVATE CModule)

# ninja: error: 'CModule.swiftmodule', needed by 'Program.exe', missing and no known rule to make it
