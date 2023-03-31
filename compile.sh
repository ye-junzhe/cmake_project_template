#!/bin/bash
set -xe

# get current path at the project root
current_path=$(pwd)

# get the project name by using "basename" on the dir_path
# as our binary target's name will be the same(CMakeLists.txt)
project_name="$(basename "$current_path")"

if [ ! -d "build" ]; then
	mkdir build
fi

cd build || return
cmake ..

make -Wall -Wextra

binary_path="./$project_name"

if [ -f "$binary_path" ]; then
	"$binary_path"
else
	echo "Error: Binary file not found at $binary_path"
fi
