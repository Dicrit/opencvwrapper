cmake_minimum_required(VERSION 3.22.1)

project("opencvwrapper")

set(OPENCVWPAPPER_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/opencvwrapperlib")

add_subdirectory(opencvwrapperlib)

if(${ANDROID})
    add_subdirectory(Android/opencvwrapperlib/src/main/cpp/jni_lib)
endif()