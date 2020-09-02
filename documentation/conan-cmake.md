## C++ hello-world project using CMake and _Conan cmake_.

This variant is enabled if the CMake variable `CONAN_CMAKE` is enabled.
Installing the dependencies is done during the configuration-step in CMake, which is described in the following section.

### Installing dependencies
With the [conan_run.cmake](../Cona/conan_run.cmake) we can tell Conan to install the required dependencies and set the correct paths for our project to use.
If you look at the [conan_run.cmake](../Conan/conan_run.cmake#L10) you'll see that `dcmtk/3.6.5` is the package recipe that is required for this project to be built.

The `conan_run.cmake` is the file that is being used by the project's [CMakeLists.txt](../CMakeLists.txt#L30).
It downloads another file - `conan.cmake` - and uses its function [`conan_cmake_run`](../Conan/conan_run.cmake#L10) to call Conan.
This will install the required dependencies. The [conan_run.cmake](../Conan/conan_run.cmake#L13) additionally defines some customized build options.
These options can be found in [conan_options.cmake](../Conan/conan_options.cmake).

Since we recommend doing an out-of-source-build you should create a `build-release`-directory next to the `src`-directory
(for more information about different build types and their limitations see [Build types][conan-buildtypes]).

Using your favorite way to configure and generate a CMake project will set up your build files so that you can build and run the application using DCMTK.
If you configure your project using CMake, you will get an error, stating that the Conan executable was not found.
You have to set the variable `CONAN_CMD` to your Conan executable (see [Prerequisites - Setting up Conan][conan-setup]).

If your Conan executable was successfully found, you will see Conan installing the DCMTK library into your local cache. Note how the transitive dependenciy for DCMTK - OpenJPEG - will be installed, too.

### Using packages
If you look into your `build`-directory you will find some files that have been created by Conan, e.g.:

- conanbuildinfo.cmake
- DCMTKConfig.cmake

The `DCMTKConfig.cmake` is the file that is being used by the project's [CMakeLists.txt](../CMakeLists.txt#L37).

Now you can run the application using some DCMTK includes.

[conan-setup]: https://github.com/akalali/hello-world-conan/blob/1.0.0/README.md#setting-up-conan
[conan-buildtypes]: https://github.com/akalali/hello-world-conan/blob/1.0.0/README.md#build-types
