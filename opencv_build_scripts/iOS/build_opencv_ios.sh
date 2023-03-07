#/bin/sh

OPENCV_ROOT="../opencv"

#rm -rf opencv
#git clone https://github.com/Itseez/opencv.git

rm -rf build

mkdir build
cd build

cmake -G Xcode \
-DCMAKE_SYSTEM_NAME=iOS \
-DPLATFORM=OS64 \
-DCMAKE_OSX_DEPLOYMENT_TARGET=11.0 \
-DCMAKE_TOOLCHAIN_FILE=${OPENCV_ROOT}/platforms/ios/cmake/Modules/Platform/iOS.cmake \
-D BUILD_SHARED_LIBS=OFF \
-D CMAKE_BUILD_TYPE=Release \
-D BUILD_DOCS=OFF \
-D BUILD_PERF_TESTS=OFF -D BUILD_TESTS=OFF -D ANDROID_STL=c++_static \
-D BUILD_opencv_objdetect=OFF -D BUILD_opencv_video=OFF -D BUILD_opencv_videoio=OFF -D BUILD_opencv_features2d=OFF \
-D BUILD_opencv_flann=OFF -D BUILD_opencv_highgui=OFF -D BUILD_opencv_ml=OFF -D BUILD_opencv_photo=OFF \
-D BUILD_opencv_dnn=OFF -D BUILD_opencv_gapi=OFF -D BUILD_opencv_imgcodes=OFF -D BUILD_opencv_imgproc=OFF \
-D BUILD_opencv_python=OFF -D BUILD_opencv_shape=OFF -D BUILD_opencv_stitching=OFF -D BUILD_opencv_superres=OFF \
-D BUILD_opencv_ts=OFF -D BUILD_opencv_videostab=OFF ${OPENCV_ROOT}

#cmake --build .

cd ..
