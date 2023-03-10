# Opencvwrapper
Hello. This is my framework which wraps opencv functionality. Only for demonstration purposes.
It's a complete Android Studio project.

## Android
### Android library
opencvwrapperlib is an adndroid library that includes shared libraries for the framework (potentially can be changed into static), headers and a ready-to-use kotlin file.
### Demo app
Demo app sources are located inside app directory.
## iOS
The project is intended to build an iOS framework

# How to build
## build opencv
1. Clone the opencv repository into the 'opencv_build_scripts' directory (so the path of repository root is 'opencv_build_scripts/opencv')
2. Switch to 4.x branch (this is the branch I've tested)
3. Build it using one of the build_opencv_xxx build scripts depending on your OS (for now iOS builds are only from macOS, Android from Linux and from Windows) (probably you'll need to make them executable using chmod)
4. The script will create a build directory and fill this directory with needed build variants.
## Build the ios framework
1. Make the build_ios_framework.sh script executable using chmod.
2. Run `./build_ios_framework.sh`

No other actions or parameters available for now. You can also use cmake directly.
## Build the android library (and test app)
1. Open the Android directory in Android Studio
2. Build the project

Probably I'll add some build scripts later to be able to avoid Android Studio installation.
