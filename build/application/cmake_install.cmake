# Install script for directory: /home/bluesbreaker/Development/f3d/application

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
  include("/home/bluesbreaker/Development/f3d/build/application/testing/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "application" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/f3d" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/f3d")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/f3d"
         RPATH "\$ORIGIN/../lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/bluesbreaker/Development/f3d/build/bin/f3d")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/f3d" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/f3d")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/f3d"
         OLD_RPATH "/home/bluesbreaker/Development/f3d/build/lib:/usr/local/lib:"
         NEW_RPATH "\$ORIGIN/../lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/f3d")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "sdk")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d/f3dTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d/f3dTargets.cmake"
         "/home/bluesbreaker/Development/f3d/build/application/CMakeFiles/Export/b837c8e1dffe8e5616e49eed5af44cb9/f3dTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d/f3dTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d/f3dTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d" TYPE FILE FILES "/home/bluesbreaker/Development/f3d/build/application/CMakeFiles/Export/b837c8e1dffe8e5616e49eed5af44cb9/f3dTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d" TYPE FILE FILES "/home/bluesbreaker/Development/f3d/build/application/CMakeFiles/Export/b837c8e1dffe8e5616e49eed5af44cb9/f3dTargets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "sdk")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/f3d" TYPE FILE FILES "/home/bluesbreaker/Development/f3d/cmake/application-config.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "configuration")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/etc/f3d/")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/etc/f3d" TYPE DIRECTORY FILES "/home/bluesbreaker/Development/f3d/resources/configs/")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "colormaps")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/f3d/colormaps" TYPE DIRECTORY FILES "/home/bluesbreaker/Development/f3d/resources/colormaps/")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "assets" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/applications" TYPE FILE FILES "/home/bluesbreaker/Development/f3d/resources/f3d.desktop")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "assets" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/icons/hicolor/16x16/apps" TYPE FILE RENAME "f3d.png" FILES "/home/bluesbreaker/Development/f3d/resources/logo16.png")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "assets" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/icons/hicolor/24x24/apps" TYPE FILE RENAME "f3d.png" FILES "/home/bluesbreaker/Development/f3d/resources/logo24.png")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "assets" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/icons/hicolor/32x32/apps" TYPE FILE RENAME "f3d.png" FILES "/home/bluesbreaker/Development/f3d/resources/logo32.png")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "assets" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/icons/hicolor/48x48/apps" TYPE FILE RENAME "f3d.png" FILES "/home/bluesbreaker/Development/f3d/resources/logo48.png")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "assets" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/icons/hicolor/64x64/apps" TYPE FILE RENAME "f3d.png" FILES "/home/bluesbreaker/Development/f3d/resources/logo64.png")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "assets" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/icons/hicolor/256x256/apps" TYPE FILE RENAME "f3d.png" FILES "/home/bluesbreaker/Development/f3d/resources/logo256.png")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "assets" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/icons/hicolor/scalable/apps" TYPE FILE RENAME "f3d.svg" FILES "/home/bluesbreaker/Development/f3d/resources/logo.svg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "assets" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/icons/HighContrast/scalable/apps" TYPE FILE RENAME "f3d.svg" FILES "/home/bluesbreaker/Development/f3d/resources/logo-mono.svg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "shellext" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/bash-completion/completions" TYPE FILE RENAME "f3d" FILES "/home/bluesbreaker/Development/f3d/resources/completion.bash")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "shellext" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/zsh/site-functions" TYPE FILE RENAME "_f3d" FILES "/home/bluesbreaker/Development/f3d/resources/completion.zsh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "shellext" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fish/vendor_completions.d" TYPE FILE RENAME "f3d.fish" FILES "/home/bluesbreaker/Development/f3d/resources/completion.fish")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "assets" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/metainfo" TYPE FILE FILES "/home/bluesbreaker/Development/f3d/resources/app.f3d.F3D.metainfo.xml")
endif()

