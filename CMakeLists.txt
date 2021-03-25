#----------
# This file specifies how the project should be built, using CMake.
#----------
cmake_minimum_required(VERSION 3.14.5 FATAL_ERROR)

message(STATUS "Setting C++ standard")
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

enable_language(CXX)

# Set a default build type if none was specified
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING
      "Choose the type of build, options are: Debug, Release, MinSizeRel, RelWithDebInfo." FORCE)
  # Set the possible values of build type for cmake-gui
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
               "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
  message(STATUS "No build type selected, default to ${CMAKE_BUILD_TYPE}")
endif()

#----------
# Superbuild for external projects - enabled by default
#----------
option (USE_SUPERBUILD "Whether or not a superbuild should be invoked" ON)

if (USE_SUPERBUILD)
  project(Superbuild)
  include(SuperBuild.cmake)
  return()
else()
  project(Hello-World VERSION 0.1.0)
endif()

# Find DCMQI library
find_package(DCMQI)
if(DCMQI_FOUND)
  message(STATUS "\nDCMQI found in\n ${DCMQI_DIR}\n")
else()
  message(FATAL_ERROR "\nCannot find DCMQI\n")
endif()

# Turn on using solution folders
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Include local project
add_subdirectory(src)
