## C++ hello-world project using CMake, Conan and external project.

This simple hello-world project uses two third party libraries. [DCMTK][dcmtk-github] is included in this project via [Conan][conan]. The recipe can be found at the [ConanCenter package repository][conan-center-dcmtk]. [DCMQI][dcmqi-github] is included in this project via CMake's [ExternalProject][cmake-externalproject].

## Getting started
...

### Prerequisites - Setting up Conan
...

### Developing - How to use this project

There are two variants of how to use this repository. You can switch between them by enabling or disabling the CMake variable `CONAN_CMAKE`.

For the _Conan install variant_, see [Conan install][conan-install].

For the _Conan cmake variant_, see [Conan CMake][conan-cmake].

[dcmtk-github]: https://github.com/DCMTK/dcmtk
[conan]: https://conan.io/
[conan-center-dcmtk]: https://github.com/conan-io/conan-center-index/tree/master/recipes/dcmtk/all
[dcmqi-github]: https://github.com/QIICR/dcmqi
[cmake-externalproject]: https://cmake.org/cmake/help/latest/module/ExternalProject.html
[conan-install]: https://github.com/akalali/hello-world-conan-ep/blob/1.0.0/documentation/conan-install.md
[conan-cmake]: https://github.com/akalali/hello-world-conan-ep/blob/1.0.0/documentation/conan-cmake.md
