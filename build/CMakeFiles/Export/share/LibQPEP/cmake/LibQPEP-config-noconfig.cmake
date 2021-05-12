#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "LibQPEP" for configuration ""
set_property(TARGET LibQPEP APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(LibQPEP PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "C;CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/include/../lib/libLibQPEP.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS LibQPEP )
list(APPEND _IMPORT_CHECK_FILES_FOR_LibQPEP "${_IMPORT_PREFIX}/include/../lib/libLibQPEP.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
