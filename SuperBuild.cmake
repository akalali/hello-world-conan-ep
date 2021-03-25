#----------
# Conan projects
#----------
option (USE_CONAN "Whether or not Conan should be used" ON)
if (USE_CONAN)
  set(CONAN_CMAKE FALSE CACHE BOOL
    "Enable to download third party dependencies with Conan via CMake. Disable to install them with Conan separately.")
  set(CONAN_CMD "" CACHE FILEPATH
    "File-path to the Conan executable")

  if(CONAN_CMAKE)
    # Run Conan from CMake to install third party libraries
    message(STATUS "\nInstall libraries using Conan")
    include(Conan/download_conan.cmake)
    include(Conan/dcmtk_conan_options.cmake)
    include(Conan/itk_conan_options.cmake)
    include(Conan/conan_run.cmake)
  else()
    message(FATAL_ERROR "Requirements not installed\n"
                        "Please enable CONAN_CMAKE and set the path to the Conan executable with CONAN_CMD.")
  endif()

  set(CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR} ${CMAKE_MODULE_PATH})
  set(CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR} ${CMAKE_PREFIX_PATH})
endif()

#----------
# External project settings
#----------

# Set EP_BASE PROPERTY for a more compact ep-directory structure
set(EP_BASE "${CMAKE_BINARY_DIR}/ep")
set_property(DIRECTORY PROPERTY EP_BASE ${EP_BASE})

# Add external projects
include(ExternalProject)
include(CMakeExternals/DCMQI.cmake)

# Add custom external project to process inner build
ExternalProject_Add(ConfigureBuild
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}
  DOWNLOAD_COMMAND ""
  UPDATE_COMMAND ""
  INSTALL_COMMAND ""
  CMAKE_CACHE_ARGS
    "-DCMAKE_PREFIX_PATH:PATH=${EP_BASE}/Build/DCMQI;${CMAKE_PREFIX_PATH}"
    -DUSE_CONAN:BOOL=OFF
    -DUSE_SUPERBUILD:BOOL=OFF
  BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/Hello-World
  DEPENDS DCMQI
)
