package com.dimabolsunov.opencvwrapperlib

class NativeLib {

    external fun getCurrentTime() : Int

    external fun multiplyWithOpenCV(doubleArray: DoubleArray, multiplier: Double): DoubleArray

    companion object {
        // Used to load the 'opencvwrapperlib' library on application startup.
        init {
            System.loadLibrary("opencvwrapperlib_jni")
        }
    }
}