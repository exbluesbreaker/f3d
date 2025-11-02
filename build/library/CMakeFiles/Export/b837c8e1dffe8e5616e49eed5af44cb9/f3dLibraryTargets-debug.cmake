#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "f3d::libf3d" for configuration "Debug"
set_property(TARGET f3d::libf3d APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(f3d::libf3d PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG "VTK::CommonSystem;VTK::CommonColor;VTK::IOImage;VTK::InteractionWidgets;f3d::vtkext;VTK::RenderingGridAxes"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libf3d.so.3.3"
  IMPORTED_SONAME_DEBUG "libf3d.so.3"
  )

list(APPEND _cmake_import_check_targets f3d::libf3d )
list(APPEND _cmake_import_check_files_for_f3d::libf3d "${_IMPORT_PREFIX}/lib/libf3d.so.3.3" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
