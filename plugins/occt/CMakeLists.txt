cmake_minimum_required(VERSION 3.21)

project(f3d-plugin-occt)

include(GNUInstallDirs)

# Check if the plugin is built externally
if(PROJECT_IS_TOP_LEVEL)
  find_package(f3d REQUIRED COMPONENTS pluginsdk)
else()
  include(f3dPlugin)
endif()

find_package(OpenCASCADE REQUIRED)

if("${OpenCASCADE_VERSION}" VERSION_LESS "7.6.3")
  message(FATAL_ERROR "Plugin: OpenCASCADE: ${OpenCASCADE_VERSION} is not supported by F3D, please update your OpenCASCADE installation.")
endif()

if("${OpenCASCADE_VERSION}" VERSION_LESS "7.8.0")
  if((NOT TARGET "TKSTEP") AND (NOT TARGET "TKIGES") AND (NOT TARGET "TKMesh"))
    message(FATAL_ERROR "Plugin: OpenCASCADE does not contain required modules")
  endif()
endif()

if((NOT TARGET "TKDESTEP") AND (NOT TARGET "TKDEIGES") AND (NOT TARGET "TKMesh"))
    message(FATAL_ERROR "Plugin: OpenCASCADE does not contain required modules")
endif()

message(STATUS "Plugin: OpenCASCADE ${OpenCASCADE_VERSION} found")

# For 7_8_0 and above, coloring is always available in TKDE* modules
if("${OpenCASCADE_VERSION}" VERSION_LESS "7.8.0")
  option(F3D_PLUGIN_OCCT_COLORING_SUPPORT "Enable coloring support in occt plugin" ON)
  mark_as_advanced(F3D_PLUGIN_OCCT_COLORING_SUPPORT)
  if(F3D_PLUGIN_OCCT_COLORING_SUPPORT)
    if (NOT (TARGET "TKXDESTEP") OR NOT (TARGET "TKXDEIGES") OR NOT (TARGET "TKBinXCAF"))
      message(FATAL_ERROR "occt plugin: TKXDESTEP, TKXDEIGES, TKBinXCAF OCCT modules are not found. Turn off F3D_PLUGIN_OCCT_COLORING_SUPPORT or enable them in your OpenCascade build.")
    endif()
  endif()
else()
  set(F3D_PLUGIN_OCCT_COLORING_SUPPORT ON CACHE INTERNAL "")
endif()

set(_occt_formats "STEP;IGES;BREP")
if(F3D_PLUGIN_OCCT_COLORING_SUPPORT)
  list(APPEND _occt_formats "XBF")
endif()

foreach(_occt_format IN LISTS _occt_formats)
  configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/FORMAT.inl.in"
    "${CMAKE_CURRENT_BINARY_DIR}/${_occt_format}.inl"
    @ONLY)
endforeach()

f3d_plugin_init()

f3d_plugin_declare_reader(
  NAME STEP
  EXTENSIONS stp step stpnc p21 210
  MIMETYPES application/vnd.step
  VTK_READER vtkF3DOCCTReader
  FORMAT_DESCRIPTION "STEP ISO 10303"
  CUSTOM_CODE "${CMAKE_CURRENT_BINARY_DIR}/STEP.inl"
  OPTIONS linear_deflection angular_deflection read_wire relative_deflection
)

f3d_plugin_declare_reader(
  NAME IGES
  EXTENSIONS igs iges
  MIMETYPES model/iges
  VTK_READER vtkF3DOCCTReader
  FORMAT_DESCRIPTION "Initial Graphics Exchange Specification"
  CUSTOM_CODE "${CMAKE_CURRENT_BINARY_DIR}/IGES.inl"
  OPTIONS linear_deflection angular_deflection read_wire relative_deflection
)

f3d_plugin_declare_reader(
  NAME BREP
  EXTENSIONS brep
  MIMETYPES application/vnd.brep
  VTK_READER vtkF3DOCCTReader
  FORMAT_DESCRIPTION "Open CASCADE BRep"
  CUSTOM_CODE "${CMAKE_CURRENT_BINARY_DIR}/BREP.inl"
  OPTIONS linear_deflection angular_deflection read_wire relative_deflection
)

if (F3D_PLUGIN_OCCT_COLORING_SUPPORT)
  f3d_plugin_declare_reader(
    NAME XBF
    EXTENSIONS xbf
    MIMETYPES application/vnd.xbf
    VTK_READER vtkF3DOCCTReader
    FORMAT_DESCRIPTION "Open CASCADE XBF"
    CUSTOM_CODE "${CMAKE_CURRENT_BINARY_DIR}/XBF.inl"
    OPTIONS linear_deflection angular_deflection read_wire relative_deflection
  )
endif()

set(rpaths "")
get_target_property(target_type TKernel TYPE)
if (target_type STREQUAL SHARED_LIBRARY)
  list(APPEND rpaths "${OpenCASCADE_LIBRARY_DIR}")
endif ()

# RenderingOpenGL2 is needed as OpenCascade itself can expose some VTK libs that we need to link against
f3d_plugin_build(
  NAME occt
  VERSION 1.0
  DESCRIPTION "OpenCASCADE support (version ${OpenCASCADE_VERSION})"
  VTK_MODULES FiltersGeneral RenderingOpenGL2
  ADDITIONAL_RPATHS ${rpaths}
  MIMETYPE_XML_FILES "${CMAKE_CURRENT_SOURCE_DIR}/f3d-occt-formats.xml"
  CONFIGURATION_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/configs/config.d" "${CMAKE_CURRENT_SOURCE_DIR}/configs/thumbnail.d"
  FREEDESKTOP
)
