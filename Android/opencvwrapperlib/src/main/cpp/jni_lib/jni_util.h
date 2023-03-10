#pragma once

#include <jni.h>
#include <stdexcept>

namespace ccpw
{
    struct jni_double_array_guard
    {
        jni_double_array_guard(JNIEnv* env, jdoubleArray array, jint mode = JNI_ABORT)
        : env_(env)
        , array_(array)
        , mode_(mode)
        , data_(env->GetDoubleArrayElements(array, nullptr))
        , size_(env->GetArrayLength(array))
        {
            if (!data_)
            {
                throw std::runtime_error("GetDoubleArrayElements failed");
            }
        }

        constexpr int size() const
        {
            return size_;
        }

        constexpr jdouble* data() const
        {
            return data_;
        }

        ~jni_double_array_guard()
        {
            env_->ReleaseDoubleArrayElements(array_, data_, mode_);
        }

    private:
        JNIEnv* env_;
        jdoubleArray array_;
        jint mode_;
        jdouble* data_;
        int size_;
    };
}
