include(${CMAKE_BINARY_DIR}/Conan/conan.cmake)

conan_cmake_run(REQUIRES dcmtk/3.6.5
                         itk/5.1.0
                BASIC_SETUP
                GENERATORS cmake_find_package_multi
                BUILD missing
)
