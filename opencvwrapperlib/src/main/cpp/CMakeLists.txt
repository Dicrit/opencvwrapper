cmake_minimum_required(VERSION 3.22.1)

project("opencvwrapperlib")

add_library( # Sets the name of the library.
        opencvwrapperlib

        # Sets the library as a shared library.
        SHARED

        # Provides a relative path to your source file(s).
        opencvwrapperlib_jni.cpp
        opencvwrapperlib.cpp)

find_library( # Defines the name of the path variable that stores the
        # location of the NDK library.
        log-lib

        # Specifies the name of the NDK library that
        # CMake needs to locate.
        log )

target_include_directories(
        opencvwrapperlib
        PUBLIC
        #"D:\\opencv-3.4.3-android-sdk\\OpenCV-android-sdk\\sdk\\native\\jni\\include"
        "E:\\OpenCVBuild\\opencv\\modules\\core\\include"
        "E:\\OpenCVBuild\\opencv\\include"
        "E:\\OpenCVBuild\\opencv\\build"
)

set(OPENCV_BUILD_ROOT "E:\\OpenCVBuild\\build\\${ANDROID_ABI}\\")
set(OPENCV_THIRD_PARTY "${OPENCV_BUILD_ROOT}3rdparty\\lib\\${ANDROID_ABI}\\")

list(APPEND EXTRA_LIBS "${OPENCV_THIRD_PARTY}libcpufeatures.a")
list(APPEND EXTRA_LIBS "${OPENCV_THIRD_PARTY}libcpufeatures.a")
list(APPEND EXTRA_LIBS "${OPENCV_THIRD_PARTY}libittnotify.a")
list(APPEND EXTRA_LIBS "${OPENCV_THIRD_PARTY}liblibopenjp2.a")


if(${ANDROID_ABI} STREQUAL "x86" )
    list(APPEND EXTRA_LIBS "${OPENCV_THIRD_PARTY}libippiw.a")
    list(APPEND EXTRA_LIBS "${OPENCV_BUILD_ROOT}3rdparty\\ippicv\\ippicv_lnx\\icv\\lib\\ia32\\libippicv.a")

elseif(${ANDROID_ABI} STREQUAL "x86_64")
    list(APPEND EXTRA_LIBS "${OPENCV_THIRD_PARTY}libippiw.a")
    list(APPEND EXTRA_LIBS "${OPENCV_BUILD_ROOT}3rdparty\\ippicv\\ippicv_lnx\\icv\\lib\\intel64\\libippicv.a")
else()
    list(APPEND EXTRA_LIBS "${OPENCV_THIRD_PARTY}libtegra_hal.a")
endif()

target_link_libraries( # Specifies the target library.
        opencvwrapperlib

        ${log-lib}
        "${OPENCV_BUILD_ROOT}lib\\${ANDROID_ABI}\\libopencv_core.a"

        ${EXTRA_LIBS}
        )
