#/bin/sh

#use your own path
#this will build needed libraries of opencv in the directory build
#this script still needs lots of improves.

export ANDROID_SDK_ROOT=E:/Android/SDK
export ANDROID_NDK=E:/Android/SDK/ndk/23.1.7779620

export ANDROID_HOME=${ANDROID_SDK_ROOT}
export ANDROID_NDK_HOME=${ANDROID_NDK}

rm -rf build

mkdir build
cd build

create_lib()
{
rm -rf $1
mkdir $1
cd $1
cmake -G "MinGW Makefiles" \
-DCMAKE_TOOLCHAIN_FILE=${ANDROID_NDK}/23.1.7779620/build/cmake/android.toolchain.cmake \
-DANDROID_ABI=$1 \
-D BUILD_SHARED_LIBS=OFF \
-D CMAKE_BUILD_TYPE=Release \
-D ANDROID_NATIVE_API_LEVEL=24 \
-D BUILD_ANDROID_EXAMPLES=OFF \
-D BUILD_DOCS=OFF \
-D BUILD_PERF_TESTS=OFF -D BUILD_TESTS=OFF -D ANDROID_STL=c++_static \
-D BUILD_opencv_objdetect=OFF -D BUILD_opencv_video=OFF -D BUILD_opencv_videoio=OFF -D BUILD_opencv_features2d=OFF \
-D BUILD_opencv_flann=OFF -D BUILD_opencv_highgui=OFF -D BUILD_opencv_ml=OFF -D BUILD_opencv_photo=OFF \
-D BUILD_opencv_dnn=OFF -D BUILD_opencv_gapi=OFF -D BUILD_opencv_imgcodes=OFF -D BUILD_opencv_imgproc=OFF \
-D BUILD_opencv_python=OFF -D BUILD_opencv_shape=OFF -D BUILD_opencv_stitching=OFF -D BUILD_opencv_superres=OFF \
-D BUILD_opencv_ts=OFF -D BUILD_opencv_videostab=OFF -DBUILD_ANDROID_PROJECTS=OFF ../../opencv

cmake --build .

cd ..
}

create_lib armeabi-v7a
create_lib arm64-v8a
create_lib x86
create_lib x86_64

cd ..
