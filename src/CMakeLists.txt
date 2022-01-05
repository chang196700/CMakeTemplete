cmake_minimum_required(VERSION 3.21)

find_package(wxWidgets REQUIRED COMPONENTS core base)
include(${wxWidgets_USE_FILE})

set(SOURCES pch.h
        )

add_subdirectory(ui)

add_executable(NetworkAnalyzer WIN32)
target_include_directories(NetworkAnalyzer PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_sources(NetworkAnalyzer PRIVATE ${SOURCES})
target_link_libraries(NetworkAnalyzer ${wxWidgets_LIBRARIES} ${Boost_LIBRARIES})
target_precompile_headers(NetworkAnalyzer PRIVATE pch.h)
target_compile_definitions(NetworkAnalyzer PRIVATE $<$<CONFIG:DEBUG>:DEBUG>)

if (MSVC)
    set_property(TARGET NetworkAnalyzer PROPERTY
            MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
endif ()
