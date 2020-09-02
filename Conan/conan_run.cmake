# Download external conan.cmake automatically, if it does not already exist
if(NOT EXISTS "${CMAKE_BINARY_DIR}/Conan/conan.cmake")
  message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
  file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake"
                "${CMAKE_BINARY_DIR}/Conan/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/Conan/conan.cmake)

conan_cmake_run(REQUIRES dcmtk/3.6.5
				BASIC_SETUP CMAKE_TARGETS
				GENERATORS cmake_find_package_multi
				OPTIONS ${CONAN_OPTIONS}
				BUILD missing
)
