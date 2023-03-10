#/bin/sh

OPENCV_ROOT="../opencv"

#rm -rf opencv
#git clone https://github.com/Itseez/opencv.git

rm -rf build

mkdir build
cd build

#this may fail for cmake 3.24. Use 3.23 instead if you have build errors
python ${OPENCV_ROOT}/platforms/ios/build_framework.py ios \
 --without calib3d --without dnn --without features2d --without flann \
 --without gapi --without highgui --without imgcodecs --without imgproc \
 --without ml --without objdetect --without photo --without stitching \
 --without video --without videoio --without world --without objc

cd ..
