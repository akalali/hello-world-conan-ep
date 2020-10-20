#----------
# DCMQI
#----------

ExternalProject_Add(DCMQI
  GIT_REPOSITORY https://github.com/QIICR/dcmqi.git
  GIT_TAG ea4f0809c8ba771e262a69b5f81d547a3945b264
  UPDATE_COMMAND ""
  INSTALL_COMMAND ""
  CMAKE_CACHE_ARGS
    -DCMAKE_MODULE_PATH:PATH=${CMAKE_MODULE_PATH}
    -DCMAKE_PREFIX_PATH:PATH=${CMAKE_PREFIX_PATH}
  CMAKE_ARGS
    -DBUILD_SHARED_LIBS:BOOL=ON
    -DDCMQI_BUILD_APPS:BOOL=OFF
    -DITK_NO_IO_FACTORY_REGISTER_MANAGER:BOOL=ON
    -DDCMQI_SUPERBUILD:BOOL=OFF
)
