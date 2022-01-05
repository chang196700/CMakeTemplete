
if (DEFINED ENV{VCPKG_ROOT})
    set(VCPKG_ROOT "$ENV{VCPKG_ROOT}")
else()
    set(VCPKG_ROOT "${CMAKE_SOURCE_DIR}/vcpkg")
endif ()

message(NOTICE ${VCPKG_ROOT})

set(VCPKG_OVERLAY_TRIPLETS "${CMAKE_SOURCE_DIR}/triplets")

if (EXISTS "${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake")
    include(${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake)
endif ()

if (NOT wxWidgets_ROOT_DIR)
    set(wxWidgets_ROOT_DIR "${VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}")
endif ()

if (CMAKE_BUILD_TYPE STREQUAL Debug)
    cmake_path(APPEND wxWidgets_ROOT_DIR "debug/lib" OUTPUT_VARIABLE wxWidgets_LIB_DIR)
    set(wxWidgets_CONFIGURATION "mswud")
else()
    cmake_path(APPEND wxWidgets_ROOT_DIR "lib" OUTPUT_VARIABLE wxWidgets_LIB_DIR)
    set(wxWidgets_CONFIGURATION "mswu")
endif ()

set(Boost_NO_WARN_NEW_VERSIONS ON)
