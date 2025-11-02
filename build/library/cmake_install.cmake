# Install script for directory: /home/bluesbreaker/Development/f3d/library

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/bluesbreaker/Development/f3d/build/library/testing/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "sdk")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d" TYPE FILE FILES
    "/home/bluesbreaker/Development/f3d/build/cmake/f3dConfig.cmake"
    "/home/bluesbreaker/Development/f3d/build/cmake/f3dConfigVersion.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "library" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libf3d.so.3.3"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libf3d.so.3"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "\$ORIGIN")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/bluesbreaker/Development/f3d/build/lib/libf3d.so.3.3"
    "/home/bluesbreaker/Development/f3d/build/lib/libf3d.so.3"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libf3d.so.3.3"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libf3d.so.3"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/usr/local/lib:/home/bluesbreaker/Development/f3d/build/lib:"
           NEW_RPATH "\$ORIGIN")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "library" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/bluesbreaker/Development/f3d/build/lib/libf3d.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dependencies")
  file(GET_RUNTIME_DEPENDENCIES
    RESOLVED_DEPENDENCIES_VAR _CMAKE_DEPS
    LIBRARIES
      "/home/bluesbreaker/Development/f3d/build/lib/libf3d.so"
    PRE_EXCLUDE_REGEXES
      "api-ms-"
      "ext-ms-"
    POST_EXCLUDE_REGEXES
      ".*system32/.*"
      "^/usr/lib.*"
      "^/lib.*"
      "^/var/lib.*"
    POST_EXCLUDE_FILES_STRICT
      "/home/bluesbreaker/Development/f3d/build/lib/libvtkext.so"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dependencies")
  foreach(_CMAKE_TMP_dep IN LISTS _CMAKE_DEPS)
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES ${_CMAKE_TMP_dep}
      FOLLOW_SYMLINK_CHAIN)
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "sdk")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/f3d" TYPE FILE FILES
    "/home/bluesbreaker/Development/f3d/build/library/public/export.h"
    "/home/bluesbreaker/Development/f3d/build/library/public/options.h"
    "/home/bluesbreaker/Development/f3d/library/plugin/plugin.h"
    "/home/bluesbreaker/Development/f3d/library/plugin/reader.h"
    "/home/bluesbreaker/Development/f3d/library/public/camera.h"
    "/home/bluesbreaker/Development/f3d/library/public/context.h"
    "/home/bluesbreaker/Development/f3d/library/public/engine.h"
    "/home/bluesbreaker/Development/f3d/library/public/exception.h"
    "/home/bluesbreaker/Development/f3d/library/public/image.h"
    "/home/bluesbreaker/Development/f3d/library/public/interactor.h"
    "/home/bluesbreaker/Development/f3d/library/public/log.h"
    "/home/bluesbreaker/Development/f3d/library/public/scene.h"
    "/home/bluesbreaker/Development/f3d/library/public/types.h"
    "/home/bluesbreaker/Development/f3d/library/public/utils.h"
    "/home/bluesbreaker/Development/f3d/library/public/window.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "sdk")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d/f3dLibraryTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d/f3dLibraryTargets.cmake"
         "/home/bluesbreaker/Development/f3d/build/library/CMakeFiles/Export/b837c8e1dffe8e5616e49eed5af44cb9/f3dLibraryTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d/f3dLibraryTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d/f3dLibraryTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d" TYPE FILE FILES "/home/bluesbreaker/Development/f3d/build/library/CMakeFiles/Export/b837c8e1dffe8e5616e49eed5af44cb9/f3dLibraryTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d" TYPE FILE FILES "/home/bluesbreaker/Development/f3d/build/library/CMakeFiles/Export/b837c8e1dffe8e5616e49eed5af44cb9/f3dLibraryTargets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "sdk")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d" TYPE FILE FILES
    "/home/bluesbreaker/Development/f3d/cmake/library-config.cmake"
    "/home/bluesbreaker/Development/f3d/cmake/f3dEmbed.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "plugin_sdk")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/f3d" TYPE FILE FILES
    "/home/bluesbreaker/Development/f3d/library/plugin/reader.h"
    "/home/bluesbreaker/Development/f3d/library/plugin/plugin.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "plugin_sdk")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d" TYPE FILE FILES
    "/home/bluesbreaker/Development/f3d/cmake/pluginsdk-config.cmake"
    "/home/bluesbreaker/Development/f3d/cmake/f3dPlugin.cmake"
    "/home/bluesbreaker/Development/f3d/cmake/plugin.cxx.in"
    "/home/bluesbreaker/Development/f3d/cmake/plugin.desktop.in"
    "/home/bluesbreaker/Development/f3d/cmake/plugin.thumbnailer.in"
    "/home/bluesbreaker/Development/f3d/cmake/readerBoilerPlate.h.in"
    )
endif()

