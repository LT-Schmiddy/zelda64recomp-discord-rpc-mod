# Finding extracted directory: DISCORD_SOCIAL_SDK_EXTRACTED_DIR is passed in by the Makefile
set(DISCORD_SOCIAL_SDK_ROOT "${CMAKE_CURRENT_LIST_DIR}/${DISCORD_SOCIAL_SDK_EXTRACTED_DIR}/discord_social_sdk")

# Setting include location:
set(DISCORD_SOCIAL_SDK_INCLUDE_DIR "${DISCORD_SOCIAL_SDK_ROOT}/include")

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(DISCORD_LIB_SUBDIR "debug")
else()
    set(DISCORD_LIB_SUBDIR "release")
endif()

set(DISCORD_SOCIAL_SDK_LIB_DIR "${DISCORD_SOCIAL_SDK_ROOT}/lib/${DISCORD_LIB_SUBDIR}")

if (CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(DISCORD_SOCIAL_SDK_LIB "${DISCORD_SOCIAL_SDK_LIB_DIR}/discord_partner_sdk.lib")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    set(DISCORD_SOCIAL_SDK_LIB "${DISCORD_SOCIAL_SDK_LIB_DIR}/libdiscord_partner_sdk.dylib")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(DISCORD_SOCIAL_SDK_LIB "${DISCORD_SOCIAL_SDK_LIB_DIR}/libdiscord_partner_sdk.so")
else()
    message(FATAL_ERROR "`import_discord_social_sdk.cmake` doesn't recognize CMAKE_SYSTEM_NAME = ${CMAKE_SYSTEM_NAME}. Unable to link to Discord Social SDK. Aborting.")
endif()