#!/bin/bash
mkdir build
cd build
cmake ..
cp compile_commands.json ../
make
