# Find DCMQI library
find_package(DCMQI)
if(DCMQI_FOUND)
  message(STATUS "\nDCMQI version ${DCMQI_VERSION} found in\n ${DCMQI_BUILD}\n")
else()
  message(FATAL_ERROR "\nCannot find DCMQI\n")
endif()

# Add sub directories with local source code
add_subdirectory(app)
add_subdirectory(libs/Hello)

# Set the properties required for the given targets
set_target_properties(Hello Main
  PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
)
