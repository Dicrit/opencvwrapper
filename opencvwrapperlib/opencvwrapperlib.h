#pragma once

#define EXPORT __attribute__((visibility("default")))

extern "C" EXPORT
    int opencvwrapper_get_current_time();

// in_array and out_array allocated size should not be less than in_array_size.
extern "C" EXPORT
    void opencvwrapper_multiply_with_opencv(double* in_array, int in_array_size, double in_multiplier, double* out_array);
