# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\moving_circle_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\moving_circle_autogen.dir\\ParseCache.txt"
  "moving_circle_autogen"
  )
endif()
