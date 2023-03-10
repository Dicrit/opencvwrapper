#/bin/sh

rm -rf build
mkdir build

cd build

build_framework()
{	
mkdir $1
cd $1

cmake -G Xcode -DCMAKE_SYSTEM_NAME=iOS -DCMAKE_OSX_DEPLOYMENT_TARGET=10.7 \
-DCMAKE_SYSTEM_PROCESSOR=$1 -DCMAKE_OSX_ARCHITECTURES=$1 ../..

cmake --build .

cd ..
}

build_framework armv7
build_framework arm64

cd ..