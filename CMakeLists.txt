cmake_minimum_required(VERSION 3.20)

project(recomp_mod_native_lib)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# LIB_NAME is defined in the mod.toml, and is passed in by the Makefile
if (NOT DEFINED LIB_NAME)
    set(LIB_NAME RECOMP_EXTLIB)
endif()

set(TARGET_NAME ${LIB_NAME})

include ("import_discord_social_sdk.cmake")

include_directories("./offline_build")
include_directories("./include/extlib")
include_directories("./include/shared")
include_directories("./src/extlib")

include_directories(${DISCORD_SOCIAL_SDK_INCLUDE_DIR})

add_library(${TARGET_NAME} SHARED)
target_link_libraries(${TARGET_NAME} ${DISCORD_SOCIAL_SDK_LIB})

add_subdirectory("./src/extlib")

set_target_properties(${TARGET_NAME}
    PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "./arc/"
    LIBRARY_OUTPUT_DIRECTORY "./lib/"
    RUNTIME_OUTPUT_DIRECTORY "./bin/"
)
