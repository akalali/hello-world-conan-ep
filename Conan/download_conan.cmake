# Download external conan.cmake automatically, if it does not already exist
if(NOT EXISTS "${CMAKE_BINARY_DIR}/Conan/conan.cmake")
  message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
  file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake"
                "${CMAKE_BINARY_DIR}/Conan/conan.cmake")
endif()
