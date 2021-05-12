# - Config file for the LibQPEP package
# It defines the following variables
#  LibQPEP_INCLUDE_DIRS - include directories for qpep
#  LibQPEP_LIBRARIES    - libraries to link against

include(CMakeFindDependencyMacro)
message("LibQPEP Compiler version is: ${CMAKE_SYSTEM_VERSION}")
message("LibQPEP System version is: ${CMAKE_SYSTEM_NAME}")

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Darwin")
    set(CMAKE_CXX_COMPILER clang++)
    set(CMAKE_C_COMPILER clang)
    add_definitions(-D COMPILER_CLANG)

    if("${CMAKE_SYSTEM_VERSION}" GREATER "20.0.0")
        message("LibQPEP Using OS X Big Sur")
        set(OSX_BIGSUR True)
    elseif("${CMAKE_SYSTEM_VERSION}" GREATER "15.6.0" AND "${CMAKE_SYSTEM_VERSION}" LESS "20.0.0")
        message("LibQPEP Detected Mac OS X")
        set(OSX True)
    else()
        message("LibQPEP Detected old Mac OS X system, while 10.7 is the lowest version supported")
        set(OSX_10_9 True)
    endif()

    if(OSX_BIGSUR)
        add_definitions(-D OSX_BIG_SUR)
        set(CMAKE_EXE_LINKER_FLAGS "-framework CoreGraphics")
    elseif(OSX_10_9)
        add_definitions(-D NO_OMP)
        add_definitions(-D OSX_10_9)
        set(CMAKE_EXE_LINKER_FLAGS "-framework CoreGraphics")
        message("LibQPEP Operating system is Mac OS X 10.9 or below, disabling OpenMP")
    else()
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Ofast -ffast-math -Xclang -fopenmp -pthread")
    endif()
endif()

if(${CMAKE_COMPILER_IS_GNUCC} OR ${CMAKE_COMPILER_IS_GNUCXX})
    add_definitions(-D COMPILER_GCC)
endif()

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
    set(LINUX_OS True)
endif()

if(LINUX_OS)
    include_directories(/opt/intel/mkl/include /opt/intel/oneapi/mkl/latest/include)
    link_directories(
    	/opt/intel/mkl/lib/intel64
    	/opt/intel/lib/intel64
    	/opt/intel/oneapi/mkl/latest/lib/intel64
    	/opt/intel/oneapi/intelpython/python3.7/lib/)
endif()

find_package(Eigen3 REQUIRED)
find_package(BLAS REQUIRED)
find_package(LAPACK REQUIRED)

if(OSX OR OSX_BIGSUR)
    if(EXISTS /usr/local/lib/libomp.a)
        set(OMP_LIB /usr/local/lib/libomp.a)
    elseif(EXISTS /usr/local/lib/libomp.dylib)
        set(OMP_LIB /usr/local/lib/libomp.dylib)
    elseif(EXISTS /opt/local/lib/libomp.a)
        set(OMP_LIB /opt/local/lib/libomp.a)
    elseif(EXISTS /opt/local/lib/libomp.dylib)
        set(OMP_LIB /opt/local/lib/libomp.dylib)
    elseif(EXISTS /usr/lib/libomp.a)
        set(OMP_LIB /usr/lib/libomp.a)
    elseif(EXISTS /usr/lib/libomp.dylib)
        set(OMP_LIB /usr/lib/libomp.dylib)
    else()
        message(FATAL_ERROR "LibQPEP Mac OS Detected but No OpenMP Library Found!")
    endif()
else()
endif()
include(${CMAKE_CURRENT_LIST_DIR}/LibQPEP-config.cmake)

# Compute paths
get_filename_component(QPEP_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
message("LibQPEP Found in: ${QPEP_CMAKE_DIR}")
set(LibQPEP_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/../../../include" "/opt/intel/mkl/include;/opt/intel/oneapi/mkl/latest/include;/usr/include/eigen3;/home/cranesoar/LibQPEP/./csdp/include;/usr/include;/usr/local/opencv3.4.12/include;/usr/local/opencv3.4.12/include/opencv")
set(qpep_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/../../../include" "/opt/intel/mkl/include;/opt/intel/oneapi/mkl/latest/include;/usr/include/eigen3;/home/cranesoar/LibQPEP/./csdp/include;/usr/include;/usr/local/opencv3.4.12/include;/usr/local/opencv3.4.12/include/opencv")
set(QPEP_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/../../../include" "/opt/intel/mkl/include;/opt/intel/oneapi/mkl/latest/include;/usr/include/eigen3;/home/cranesoar/LibQPEP/./csdp/include;/usr/include;/usr/local/opencv3.4.12/include;/usr/local/opencv3.4.12/include/opencv")
set(LibQPEP_INCLUDE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../include" "/opt/intel/mkl/include;/opt/intel/oneapi/mkl/latest/include;/usr/include/eigen3;/home/cranesoar/LibQPEP/./csdp/include;/usr/include;/usr/local/opencv3.4.12/include;/usr/local/opencv3.4.12/include/opencv")

find_package(OpenCV)
    if(OpenCV_FOUND)
        set(LibQPEP_LIBRARIES "${CMAKE_CURRENT_LIST_DIR}/../../../lib/libLibQPEP.a;;-fopenmp;opencv_calib3d;opencv_core;opencv_dnn;opencv_features2d;opencv_flann;opencv_highgui;opencv_imgcodecs;opencv_imgproc;opencv_ml;opencv_objdetect;opencv_photo;opencv_shape;opencv_stitching;opencv_superres;opencv_video;opencv_videoio;opencv_videostab;opencv_viz;/usr/lib/x86_64-linux-gnu/liblapack.so;/usr/lib/x86_64-linux-gnu/libf77blas.so;/usr/lib/x86_64-linux-gnu/libatlas.so;/usr/lib/x86_64-linux-gnu/libSM.so;/usr/lib/x86_64-linux-gnu/libICE.so;/usr/lib/x86_64-linux-gnu/libX11.so;/usr/lib/x86_64-linux-gnu/libXext.so")
        set(LibQPEP_LIBRARIES "${CMAKE_CURRENT_LIST_DIR}/../../../lib/libLibQPEP.a;;-fopenmp;opencv_calib3d;opencv_core;opencv_dnn;opencv_features2d;opencv_flann;opencv_highgui;opencv_imgcodecs;opencv_imgproc;opencv_ml;opencv_objdetect;opencv_photo;opencv_shape;opencv_stitching;opencv_superres;opencv_video;opencv_videoio;opencv_videostab;opencv_viz;/usr/lib/x86_64-linux-gnu/liblapack.so;/usr/lib/x86_64-linux-gnu/libf77blas.so;/usr/lib/x86_64-linux-gnu/libatlas.so;/usr/lib/x86_64-linux-gnu/libSM.so;/usr/lib/x86_64-linux-gnu/libICE.so;/usr/lib/x86_64-linux-gnu/libX11.so;/usr/lib/x86_64-linux-gnu/libXext.so")
        set(qpep_LIBRARIES "${CMAKE_CURRENT_LIST_DIR}/../../../lib/libLibQPEP.a;;-fopenmp;opencv_calib3d;opencv_core;opencv_dnn;opencv_features2d;opencv_flann;opencv_highgui;opencv_imgcodecs;opencv_imgproc;opencv_ml;opencv_objdetect;opencv_photo;opencv_shape;opencv_stitching;opencv_superres;opencv_video;opencv_videoio;opencv_videostab;opencv_viz;/usr/lib/x86_64-linux-gnu/liblapack.so;/usr/lib/x86_64-linux-gnu/libf77blas.so;/usr/lib/x86_64-linux-gnu/libatlas.so;/usr/lib/x86_64-linux-gnu/libSM.so;/usr/lib/x86_64-linux-gnu/libICE.so;/usr/lib/x86_64-linux-gnu/libX11.so;/usr/lib/x86_64-linux-gnu/libXext.so")
        set(QPEP_LIBRARIES "${CMAKE_CURRENT_LIST_DIR}/../../../lib/libLibQPEP.a;;-fopenmp;opencv_calib3d;opencv_core;opencv_dnn;opencv_features2d;opencv_flann;opencv_highgui;opencv_imgcodecs;opencv_imgproc;opencv_ml;opencv_objdetect;opencv_photo;opencv_shape;opencv_stitching;opencv_superres;opencv_video;opencv_videoio;opencv_videostab;opencv_viz;/usr/lib/x86_64-linux-gnu/liblapack.so;/usr/lib/x86_64-linux-gnu/libf77blas.so;/usr/lib/x86_64-linux-gnu/libatlas.so;/usr/lib/x86_64-linux-gnu/libSM.so;/usr/lib/x86_64-linux-gnu/libICE.so;/usr/lib/x86_64-linux-gnu/libX11.so;/usr/lib/x86_64-linux-gnu/libXext.so")
    else()
        set(LibQPEP_LIBRARIES "${CMAKE_CURRENT_LIST_DIR}/../../../lib/libLibQPEP.a;;-fopenmp;/usr/lib/x86_64-linux-gnu/liblapack.so;/usr/lib/x86_64-linux-gnu/libf77blas.so;/usr/lib/x86_64-linux-gnu/libatlas.so;/usr/lib/x86_64-linux-gnu/libSM.so;/usr/lib/x86_64-linux-gnu/libICE.so;/usr/lib/x86_64-linux-gnu/libX11.so;/usr/lib/x86_64-linux-gnu/libXext.so")
        set(LibQPEP_LIBRARIES "${CMAKE_CURRENT_LIST_DIR}/../../../lib/libLibQPEP.a;;-fopenmp;/usr/lib/x86_64-linux-gnu/liblapack.so;/usr/lib/x86_64-linux-gnu/libf77blas.so;/usr/lib/x86_64-linux-gnu/libatlas.so;/usr/lib/x86_64-linux-gnu/libSM.so;/usr/lib/x86_64-linux-gnu/libICE.so;/usr/lib/x86_64-linux-gnu/libX11.so;/usr/lib/x86_64-linux-gnu/libXext.so")
        set(qpep_LIBRARIES "${CMAKE_CURRENT_LIST_DIR}/../../../lib/libLibQPEP.a;;-fopenmp;/usr/lib/x86_64-linux-gnu/liblapack.so;/usr/lib/x86_64-linux-gnu/libf77blas.so;/usr/lib/x86_64-linux-gnu/libatlas.so;/usr/lib/x86_64-linux-gnu/libSM.so;/usr/lib/x86_64-linux-gnu/libICE.so;/usr/lib/x86_64-linux-gnu/libX11.so;/usr/lib/x86_64-linux-gnu/libXext.so")
        set(QPEP_LIBRARIES "${CMAKE_CURRENT_LIST_DIR}/../../../lib/libLibQPEP.a;;-fopenmp;/usr/lib/x86_64-linux-gnu/liblapack.so;/usr/lib/x86_64-linux-gnu/libf77blas.so;/usr/lib/x86_64-linux-gnu/libatlas.so;/usr/lib/x86_64-linux-gnu/libSM.so;/usr/lib/x86_64-linux-gnu/libICE.so;/usr/lib/x86_64-linux-gnu/libX11.so;/usr/lib/x86_64-linux-gnu/libXext.so")
    endif()

# This causes catkin simple to link against these libraries
set(LibQPEP_FOUND_CATKIN_PROJECT true)
set(LibQPEP_FOUND_CATKIN_PROJECT true)
set(qpep_FOUND_CATKIN_PROJECT true)
set(QPEP_FOUND_CATKIN_PROJECT true)
