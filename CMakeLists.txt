cmake_minimum_required(VERSION 3.29)
project(LSLExample
        VERSION 1.0
        DESCRIPTION "LSL Example"
        LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)

# Specify the path to liblsl in the external directory (which is now outside the build directory)
set(LSL_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/external/liblsl")


# Include directories for liblsl headers
include_directories(${LSL_ROOT}/include)

# Link the LSL library from the lib directory
link_directories(${LSL_ROOT}/lib)

# Add your executable
add_executable(LSLExample main.cpp)

# Link the LSL library to your executable
target_link_libraries(LSLExample lsl)


add_custom_command(TARGET LSLExample POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${LSL_ROOT}/bin/lsl.dll" $<TARGET_FILE_DIR:LSLExample>)


