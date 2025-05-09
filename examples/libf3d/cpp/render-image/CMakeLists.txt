cmake_minimum_required(VERSION 3.10)

project(render-image)

find_package(f3d REQUIRED COMPONENTS library)

add_executable(render-image main.cxx)
target_link_libraries(render-image f3d::libf3d)
set_target_properties(render-image PROPERTIES CXX_STANDARD 17)

add_executable(check-image check.cxx)
target_link_libraries(check-image f3d::libf3d)
set_target_properties(check-image PROPERTIES CXX_STANDARD 17)

# Simple testing
if(BUILD_TESTING)
  enable_testing()
  add_test(NAME test_render-image COMMAND "$<TARGET_FILE:render-image>" "${CMAKE_CURRENT_SOURCE_DIR}/data/cow.vtp" "${CMAKE_CURRENT_BINARY_DIR}/cow.png")
  add_test(NAME test_check-image COMMAND "$<TARGET_FILE:check-image>" "${CMAKE_CURRENT_BINARY_DIR}/cow.png" "${CMAKE_CURRENT_SOURCE_DIR}/baselines/cow.png")
  set_tests_properties(test_check-image PROPERTIES DEPENDS "test_render-image")
endif()
