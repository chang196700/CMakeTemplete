cmake_minimum_required(VERSION 3.21)
include(cmake/config.cmake)
include(cmake/vcpkg.cmake)

project(ProjectName VERSION 0.0.1)
include(cmake/cpack.cmake)

add_subdirectory("src")
