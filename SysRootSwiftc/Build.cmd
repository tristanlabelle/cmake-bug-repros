@echo off
rmdir /s /q build >NUL 2>&1
cmake -S . -B build -G "Ninja" -DCMAKE_TOOLCHAIN_FILE=Toolchain.cmake
cmake --build build
