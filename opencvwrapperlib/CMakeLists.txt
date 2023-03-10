cmake_minimum_required(VERSION 3.22.1)

project("opencvwrapperlib")

#set(CMAKE_CXX_STANDERD 14)

if(${IOS})
    set (CMAKE_CXX_FLAGS "-std=c++0x -stdlib=libc++ -g3 -Wall -O0")
endif()



set(OPENCV_BUILD_BASE "${CMAKE_CURRENT_SOURCE_DIR}/../opencv_build_scripts")
set(OPENCV_INCLUDE_ROOT "${OPENCV_BUILD_BASE}/opencv")

if(${ANDROID})
    set(OPENCV_BUILD_ROOT "${OPENCV_BUILD_BASE}/build/${ANDROID_ABI}")
    set(OPENCV_THIRD_PARTY "${OPENCV_BUILD_ROOT}/3rdparty/lib/${ANDROID_ABI}")
else()
    set(OPENCV_BUILD_ROOT "${OPENCV_BUILD_BASE}/build/ios/build/build-${CMAKE_OSX_ARCHITECTURES}-iphoneos")
    set(OPENCV_THIRD_PARTY "${OPENCV_BUILD_ROOT}/3rdparty/lib/Release")
endif()

add_library(
        opencvwrapperlib
        SHARED
        opencvwrapperlib.cpp)
        
if (${IOS})
    set_target_properties(opencvwrapperlib PROPERTIES
    FRAMEWORK TRUE
    FRAMEWORK_VERSION CXX
    PUBLIC_HEADER ${CMAKE_CURRENT_SOURCE_DIR}opencvwrapperlib.h
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
)
endif()

target_include_directories(
        opencvwrapperlib
        PUBLIC
        "${OPENCV_INCLUDE_ROOT}/modules/core/include"
        "${OPENCV_INCLUDE_ROOT}/include"
        "${OPENCV_BUILD_ROOT}"
)

if(${ANDROID})

    list(APPEND EXTRA_LIBS "${OPENCV_BUILD_ROOT}lib/${ANDROID_ABI}/libopencv_core.a")

    list(APPEND EXTRA_LIBS "${OPENCV_THIRD_PARTY}libcpufeatures.a")
    list(APPEND EXTRA_LIBS "${OPENCV_THIRD_PARTY}libittnotify.a")
    list(APPEND EXTRA_LIBS "${OPENCV_THIRD_PARTY}liblibopenjp2.a")
    
    if(${ANDROID_ABI} STREQUAL "x86")
        list(APPEND EXTRA_LIBS "${OPENCV_THIRD_PARTY}/libippiw.a")
        list(APPEND EXTRA_LIBS "${OPENCV_BUILD_ROOT}/3rdparty/ippicv/ippicv_lnx/icv/lib/ia32/libippicv.a")
    
    elseif(${ANDROID_ABI} STREQUAL "x86_64")
        list(APPEND EXTRA_LIBS "${OPENCV_THIRD_PARTY}/libippiw.a")
        list(APPEND EXTRA_LIBS "${OPENCV_BUILD_ROOT}/3rdparty/ippicv/ippicv_lnx/icv/lib/intel64/libippicv.a")
    else()
        list(APPEND EXTRA_LIBS "${OPENCV_THIRD_PARTY}/libtegra_hal.a")
    endif()

    find_library(log-lib log)
    list(APPEND EXTRA_LIBS "${log-lib}")
else()
    list(APPEND EXTRA_LIBS "${OPENCV_BUILD_ROOT}/lib/Release/libopencv_core.a")

    list(APPEND EXTRA_LIBS "${OPENCV_THIRD_PARTY}/libzlib.a")
endif()


target_link_libraries(opencvwrapperlib
        ${EXTRA_LIBS}
        )
