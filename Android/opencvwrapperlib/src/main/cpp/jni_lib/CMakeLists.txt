
project("opencvwrapperlib_jni")

find_library(log-lib log)

add_library(
        opencvwrapperlib_jni
        SHARED
        opencvwrapperlib_jni.cpp)

target_include_directories(
        opencvwrapperlib_jni
        PRIVATE
        "${OPENCVWPAPPER_INCLUDE_DIR}"
)

target_link_libraries(
        opencvwrapperlib_jni

        ${log-lib}
        opencvwrapperlib
)