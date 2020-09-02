#----------
# This file specifies how the project should be built, using CMake.
#----------
cmake_minimum_required(VERSION 3.14.5 FATAL_ERROR)

project(Hello-World VERSION 0.1.0 LANGUAGES CXX)

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
# Conan projects
#----------
set(CONAN_CMAKE FALSE CACHE BOOL
    "Enable to download third party dependencies withing CMake. Disable to install them with Conan separately.")
set(CONAN_CMD "" CACHE FILEPATH
    "File-path to the Conan executable")

if(CONAN_CMAKE)
  # Run Conan from CMake to install third party libraries
  message(STATUS "Install libraries using CMake")
  include(Conan/conan_options.cmake)
  include(Conan/conan_run.cmake)
endif()

set(CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR} ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR} ${CMAKE_PREFIX_PATH})

# Find DCMTK library created by Conan
find_package(DCMTK CONFIG)
if(TARGET DCMTK::DCMTK)
  message(STATUS "\nDCMTK version ${DCMTK_VERSION} found in\n ${CONAN_DCMTK_ROOT}\n")
else()
  message(FATAL_ERROR "\nCannot find DCMTK\n")
endif()

#----------
# Superbuild for external projects
#----------
option (USE_SUPERBUILD "Whether or not a superbuild should be invoked" ON)

if (USE_SUPERBUILD)
  project(Superbuild)
  include(SuperBuild.cmake)
  return()
else()
  project(Hello-World VERSION 0.1.0 LANGUAGES CXX)
endif()

# Turn on using solution folders
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Include local project
add_subdirectory(src)