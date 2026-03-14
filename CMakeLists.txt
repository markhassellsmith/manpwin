# =========================================================
# ManpWIN Root CMake Script
# Copyright 2026 Paul de Leeuw
# =========================================================

cmake_minimum_required(VERSION 3.23)

project(ManpWIN LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>DLL")
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

file(GLOB MANPWIN64_SOURCES
    ManpWIN64/*.cpp
    ManpWIN64/*.c
    ManpWIN64/*.rc
)

add_executable(ManpWIN64 WIN32 ${MANPWIN64_SOURCES})

target_include_directories(ManpWIN64 PRIVATE
    ${CMAKE_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/ManpWIN64
    ${CMAKE_SOURCE_DIR}/parser
    ${CMAKE_SOURCE_DIR}/external/include
)

add_subdirectory(parser)
add_subdirectory(qdlib)
add_subdirectory(pnglib)
add_subdirectory(ZLib)
add_subdirectory(MPEG)

# Vendored MPFR and GMP libraries
add_library(mpfr STATIC IMPORTED)
set_target_properties(mpfr PROPERTIES
    IMPORTED_LOCATION_DEBUG "${CMAKE_SOURCE_DIR}/external/lib/x64/Debug/mpfr.lib"
    IMPORTED_LOCATION_RELEASE "${CMAKE_SOURCE_DIR}/external/lib/x64/Release/mpfr.lib"
    IMPORTED_LOCATION_RELWITHDEBINFO "${CMAKE_SOURCE_DIR}/external/lib/x64/Release/mpfr.lib"
    IMPORTED_LOCATION_MINSIZEREL "${CMAKE_SOURCE_DIR}/external/lib/x64/Release/mpfr.lib"
)

add_library(gmp STATIC IMPORTED)
set_target_properties(gmp PROPERTIES
    IMPORTED_LOCATION_DEBUG "${CMAKE_SOURCE_DIR}/external/lib/x64/Debug/gmp.lib"
    IMPORTED_LOCATION_RELEASE "${CMAKE_SOURCE_DIR}/external/lib/x64/Release/gmp.lib"
    IMPORTED_LOCATION_RELWITHDEBINFO "${CMAKE_SOURCE_DIR}/external/lib/x64/Release/gmp.lib"
    IMPORTED_LOCATION_MINSIZEREL "${CMAKE_SOURCE_DIR}/external/lib/x64/Release/gmp.lib"
)

target_link_libraries(ManpWIN64 PRIVATE
    pnglib
    zlib
    parser
    mpeg
    qdlib
    mpfr
    gmp
    htmlhelp
)