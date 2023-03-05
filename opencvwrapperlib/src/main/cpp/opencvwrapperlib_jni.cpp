#include "opencvwrapperlib.h"
#include <jni.h>
#include "jni_util.h"

extern "C" JNIEXPORT jint JNICALL
Java_com_dimabolsunov_opencvwrapperlib_NativeLib_getCurrentTime(JNIEnv* env,
    jobject /* this */)
{
    return opencvwrapper_get_current_time();
}

extern "C" JNIEXPORT jdoubleArray JNICALL
Java_com_dimabolsunov_opencvwrapperlib_NativeLib_multiplyWithOpenCV(JNIEnv* env,
    jobject /* this */, jdoubleArray array, jdouble multiplier)
{
    ccpw::jni_double_array_guard in_array(env, array);

    jdoubleArray res = env->NewDoubleArray(in_array.size());
    ccpw::jni_double_array_guard out_array(env, res, JNI_COMMIT);
    try
    {
        opencvwrapper_multiply_with_opencv(in_array.data(), in_array.size(), multiplier, out_array.data());
    }
    catch(const std::exception& ex)
    {
        //LOG something?
    }
    return res;
}