# Generate the COMPILE COMMANDS, for error not showing in Neovim
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

cmake_minimum_required(VERSION 3.10)

# The name of this project
project($PROJ_NAME)

set(CMAKE_CXX_STANDARD 17)

# header file directories
include_directories(/usr/local/include)
include_directories(/opt/homebrew/Cellar/eigen/3.4.0_1/include)

# The name of the gernerated executable
add_executable(Rasterizer main.cpp)

# find package
# dont how it works yet
find_package(OpenCV REQUIRED)
target_link_libraries(Rasterizer ${OpenCV_LIBRARIES})
