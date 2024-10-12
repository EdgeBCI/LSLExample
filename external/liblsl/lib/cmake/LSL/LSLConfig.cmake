if(TARGET lsl AND NOT TARGET LSL::lsl)
	add_library(LSL::lsl ALIAS lsl)
endif()

if(NOT TARGET LSL::lsl)
	include("LSLTargets.cmake")
endif()
include("LSLCMake.cmake")
