#include "opencvwrapperlib.h"
#include <ctime>
#include <opencv2/opencv.hpp>

extern "C" int opencvwrapper_get_current_time()
{
    return time(0);
}

extern "C" void opencvwrapper_multiply_with_opencv(
        double* in_array,
        int in_array_size,
        double in_multiplier,
        double* out_array)
{
    std::vector<double> stub(in_array_size, 1.0);
    const double mp = 8.0;
    cv::multiply({in_array, in_array_size}, stub, {out_array, in_array_size}, in_multiplier);
}
