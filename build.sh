#!/bin/bash
# set -xe

# Ninja as default generator,
# But if Ninja is not installed, just select cmake
build_system="Ninja"

read -rp "Build from source? (y/n): " build_from_source
read -rp "Use CMake or Ninja as the build system? (cmake/ninja): " selected_build_system

# get current path at the project root
current_path=$(pwd)

# get the project name by calling "basename" on the dir_path
# as our binary target's name will be the same(CMakeLists.txt)
project_name="$(basename "$current_path")"

if [[ $build_from_source == [Y/y] ]]; then
    echo "Building from ground up using $build_system."
    if [[ $build_system == "Ninja" ]]; then
        rm -rf ninja-build
        cmake -S . -B ninja-build -DCMAKE_C_COMPILER=$(which clang) -DCMAKE_CXX_COMPILER=$(which clang++) -DCMAKE_BUILD_TYPE=Release -G"$build_system"
        cd ninja-build || exit
        ninja
    else
        rm -rf build
        rm -rf build
        cmake -S . -B build -DCMAKE_C_COMPILER=$(which clang) -DCMAKE_CXX_COMPILER=$(which clang++) -DCMAKE_BUILD_TYPE=Release -G"$build_system"
        cd build || exit
        make
    fi

else
    echo "Building Only "$project_name""

    if [[ $build_system == "Ninja" ]]; then
        cmake --build ./ninja-build --target "$project_name"
        cd ninja-build || exit
        ninja
    else
        cmake --build ./build --target "$project_name"
        cd build || exit
        make
    fi
fi

./"$project_name"
