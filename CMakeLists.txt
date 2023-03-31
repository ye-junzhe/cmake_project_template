# Generate the COMPILE COMMANDS, for error not showing in Neovim
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

cmake_minimum_required(VERSION 3.10)

# The name of this project
get_filename_component(ProjectId ${CMAKE_CURRENT_SOURCE_DIR} NAME)
string(REPLACE " " "_" ProjectId ${ProjectId})
project(${ProjectId})

# Set standard
set(CMAKE_CXX_STANDARD 17)

# header file directories
include_directories(/usr/local/include)
include_directories(./dependencies/include)
# homebrew cellar packages
# include_directories(/opt/homebrew/Cellar/eigen/3.4.0_1/include)

# The name of the gernerated executable
file(GLOB_RECURSE MY_SOURCES "dependencies/lib/*.cpp")
add_executable(${ProjectId} ${CMAKE_CURRENT_SOURCE_DIR} main.cpp ${MY_SOURCES})
