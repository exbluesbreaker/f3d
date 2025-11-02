# CMake generated Testfile for 
# Source directory: /home/bluesbreaker/Development/f3d/vtkext/public/module/Testing
# Build directory: /home/bluesbreaker/Development/f3d/build/vtkext/public/module/Testing
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[f3d::vtkextCxx-TestF3DBitonicSort]=] "/home/bluesbreaker/Development/f3d/build/bin/vtkextTests" "TestF3DBitonicSort" "/home/bluesbreaker/Development/f3d/testing/" "/home/bluesbreaker/Development/f3d/build/Testing/Temporary/")
set_tests_properties([=[f3d::vtkextCxx-TestF3DBitonicSort]=] PROPERTIES  ENVIRONMENT "VTK_TESTING=1;VTK_TESTING_IMAGE_COMPARE_METHOD=TIGHT_VALID" FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;ERR\\|;instance(s)? still around;Failed Image Test;DartMeasurement name=.ImageNotFound" LABELS "f3d::vtkext;vtkext" SKIP_REGULAR_EXPRESSION "Attempt to use a texture buffer exceeding your hardware's limits;vulkan: No DRI3 support detected - required for presentation;a line width has been requested that is larger than your system supports" SKIP_RETURN_CODE "125" _BACKTRACE_TRIPLES "/usr/share/cmake-3.28/Modules/ExternalData.cmake;356;add_test;/usr/local/lib/cmake/vtk-9.5/vtkModuleTesting.cmake;468;ExternalData_add_test;/home/bluesbreaker/Development/f3d/vtkext/public/module/Testing/CMakeLists.txt;10;vtk_add_test_cxx;/home/bluesbreaker/Development/f3d/vtkext/public/module/Testing/CMakeLists.txt;0;")
