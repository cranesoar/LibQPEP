cmake_minimum_required(VERSION 3.6)
project(LibQPEP)

message("Compiler version is: ${CMAKE_SYSTEM_VERSION}")
message("System version is: ${CMAKE_SYSTEM_NAME}")
message("Architecture is: ${CMAKE_SYSTEM_PROCESSOR}")
set(NO_OPENMP FALSE)

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Darwin")
    set(CMAKE_CXX_COMPILER clang++)
    set(CMAKE_C_COMPILER clang)
    add_definitions(-D COMPILER_CLANG)

    if("${CMAKE_SYSTEM_VERSION}" GREATER "20.0.0")
        message("Using OS X Big Sur")
        set(OSX_BIGSUR True)
    elseif("${CMAKE_SYSTEM_VERSION}" GREATER "15.6.0" AND "${CMAKE_SYSTEM_VERSION}" LESS "20.0.0")
        message("Detected Mac OS X")
        set(OSX True)
    else()
        message("Detected old Mac OS X system, while 10.7 is the lowest version supported")
        set(OSX_10_9 True)
    endif()

    if(OSX_BIGSUR)
        add_definitions(-D OSX_BIG_SUR)
	set(CMAKE_EXE_LINKER_FLAGS "-framework CoreGraphics")
	if("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "arm64")
		message("Using Apple M1 processors, disabling OpenMP")
		add_definitions(-D NO_OMP)
		set(NO_OPENMP TRUE)
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Ofast -ffast-math -Xclang -fopenmp -pthread")
	else()
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Ofast -ffast-math -Xclang -fopenmp -pthread")
	endif()
    elseif(OSX_10_9)
        add_definitions(-D NO_OMP)
        add_definitions(-D OSX_10_9)
        set(CMAKE_EXE_LINKER_FLAGS "-framework CoreGraphics")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Ofast -ffast-math -pthread -stdlib=libc++")
        message("Operating system is Mac OS X 10.9 or below, disabling OpenMP")
    else()
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Ofast -ffast-math -Xclang -fopenmp -pthread")
    endif()
endif()

if(${CMAKE_COMPILER_IS_GNUCC} OR ${CMAKE_COMPILER_IS_GNUCXX})
    add_definitions(-D COMPILER_GCC)
endif()

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
#    set(CMAKE_CXX_COMPILER g++-8)
#    set(CMAKE_C_COMPILER gcc-8)
    set(LINUX_OS True)
endif()

if(LINUX_OS)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Ofast -ffast-math -pthread -lpthread -lrt -lm -lz")
    #add_definitions(-D NO_OMP)
    include_directories(/opt/intel/mkl/include /opt/intel/oneapi/mkl/latest/include)
    link_directories(
    	/opt/intel/mkl/lib/intel64 
    	/opt/intel/lib/intel64
    	/opt/intel/oneapi/mkl/latest/lib/intel64
    	/opt/intel/oneapi/intelpython/python3.7/lib/)
endif()

set(CMAKE_CXX_STANDARD 11)
find_package(Eigen3 REQUIRED)
find_package(OpenCV)
find_package(BLAS REQUIRED)
find_package(LAPACK REQUIRED)
find_package(X11)

if(SUPERLU)
    find_package(superlu)
    add_definitions(-DUSE_SUPERLU)
    message("Using SuperLU for Acceleration of Linear System Solving")
endif()

include_directories(${EIGEN3_INCLUDE_DIR} ./csdp/include)

if(OpenCV_FOUND)
    include_directories(${X11_INCLUDE_DIR})

    if("${OpenCV_VERSION}" GREATER_EQUAL "4")
        include_directories(${OpenCV_INCLUDE_DIRS})
        add_definitions(-D USE_OPENCV)
        add_definitions(-D USE_OPENCV4)
    elseif("${OpenCV_VERSION}" GREATER_EQUAL "3")
        include_directories(${OpenCV_INCLUDE_DIRS})
        add_definitions(-D USE_OPENCV)
        add_definitions(-D USE_OPENCV3)
    else()
        message(FATAL_ERROR "OpenCV Version: ${OPENCV_VERSION} is too old for this project!")
    endif()
endif()

if(LAPACK_FOUND)
    add_definitions(-D EIGEN_USE_BLAS)
endif()

add_definitions(-D BIT64)
if(NOT OSX_10_9 AND NOT LINUX_OS AND NOT NO_OPENMP)
    add_definitions(-D USEOPENMP)
    add_definitions(-D SETNUMTHREADS)
    add_definitions(-D USESIGTERM)
    add_definitions(-D USEGETTIME)
endif()

if(NOT LINUX_OS)
add_definitions(-D CAPSLAPACK)
endif()

if(OSX OR OSX_BIGSUR)
    if(NOT NO_OPENMP)
	if(EXISTS /usr/local/lib/libomp.a)
        		set(OMP_LIB /usr/local/lib/libomp.a)
    	elseif(EXISTS /usr/local/lib/libomp.dylib)
        		set(OMP_LIB /usr/local/lib/libomp.dylib)
    	elseif(EXISTS /opt/local/lib/libomp.a)
        		set(OMP_LIB /opt/local/lib/libomp.a)
        		include_directories(/opt/local/include /opt/local/include/libomp)
    	elseif(EXISTS /opt/local/lib/libomp.dylib)
        		set(OMP_LIB /opt/local/lib/libomp.dylib)
        		include_directories(/opt/local/include /opt/local/include/libomp)
    	elseif(EXISTS /usr/lib/libomp.a)
        		set(OMP_LIB /usr/lib/libomp.a)
    	elseif(EXISTS /usr/lib/libomp.dylib)
        		set(OMP_LIB /usr/lib/libomp.dylib)
    	else()
        		message(FATAL_ERROR "Mac OS Detected but No OpenMP Library Found!")
    	endif()	
    endif()
else()
    find_package(OpenMP REQUIRED)
    set(OMP_LIB ${OpenMP_CXX_FLAGS})
endif()


set(srcs
        generateProjectedPoints.cpp
        pnp_WQD.cpp
        solver_WQ_1_2_3_4_5_9_13_17_33_49_approx.cpp
        QPEP_grobner.cpp
        misc_pnp_funcs.cpp
        QPEP_lm_single.cpp
        misc_pTop_funcs.cpp
        pTop_WQD.cpp
        solver_WQ_approx_helper.cpp
        solver_WQ_1_2_3_4_5_9_13_17_33_49_approx_helper.cpp
        solver_WQ_approx.cpp
        solver_WQ.cpp
        solver_WQ_helper.cpp
        CVLib.cpp
        ./csdp/lib/Fnorm.c
        ./csdp/lib/chol.c
        ./csdp/lib/linesearch.c
        ./csdp/lib/norms.c
        ./csdp/lib/qreig.c
        ./csdp/lib/sym_mat.c
        ./csdp/lib/zero_mat.c
        ./csdp/lib/add_mat.c
        ./csdp/lib/copy_mat.c
        ./csdp/lib/make_i.c
        ./csdp/lib/op_a.c
        ./csdp/lib/readprob.c
        ./csdp/lib/trace_prod.c
        ./csdp/lib/addscaledmat.c
        ./csdp/lib/easysdp.c
        ./csdp/lib/makefill.c
        ./csdp/lib/op_at.c
        ./csdp/lib/readsol.c
        ./csdp/lib/tweakgap.c
        ./csdp/lib/allocmat.c
        ./csdp/lib/freeprob.c
        ./csdp/lib/mat_mult.c
        ./csdp/lib/op_o.c
        ./csdp/lib/sdp.c
        ./csdp/lib/user_exit.c
        ./csdp/lib/calc_dobj.c
        ./csdp/lib/initparams.c
        ./csdp/lib/mat_multsp.c
        ./csdp/lib/packed.c
        ./csdp/lib/solvesys.c
        ./csdp/lib/writeprob.c
        ./csdp/lib/calc_pobj.c
        ./csdp/lib/initsoln.c
        ./csdp/lib/matvec.c
        ./csdp/lib/psd_feas.c
        ./csdp/lib/sortentries.c
        ./csdp/lib/writesol.c
        CovEstimation.cpp
        )

set(incs
        generateProjectedPoints.h
        pnp_WQD.h
        solver_WQ_1_2_3_4_5_9_13_17_33_49_approx.h
        solver_WQ_1_2_3_4_5_9_13_17_33_49_approx_helper.h
        QPEP_grobner.h
        utils.h
        misc_pnp_funcs.h
        QPEP_lm_single.h
        pTop_WQD.h
        misc_pTop_funcs.h
        solver_WQ_approx_helper.h
        solver_WQ_approx.h
        QPEP.h
        solver_WQ.h
        solver_WQ_helper.h
        CVLib.h
        CovEstimation.h)

add_executable(LibQPEP-test main.cpp)
add_library (LibQPEP ${srcs})

if(NOT LINUX_OS)
    target_link_libraries(LibQPEP ${OMP_LIB} ${OpenCV_LIBS} ${LAPACK_LIBRARIES} ${X11_LIBRARIES} ${BLAS_LIBRARIES})
    target_link_libraries(LibQPEP-test LibQPEP ${OMP_LIB} ${OpenCV_LIBS} ${LAPACK_LIBRARIES} ${X11_LIBRARIES} ${BLAS_LIBRARIES})
else()
    target_link_libraries(LibQPEP ${OMP_LIB} ${OpenCV_LIBS} ${LAPACK_LIBRARIES} ${X11_LIBRARIES} ${BLAS_LIBRARIES} mkl_gf_lp64 mkl_intel_thread mkl_gnu_thread mkl_blas95_lp64 mkl_intel_lp64 mkl_sequential mkl_core pthread iomp5 X11)
    target_link_libraries(LibQPEP-test LibQPEP ${OMP_LIB} ${OpenCV_LIBS} ${LAPACK_LIBRARIES} ${X11_LIBRARIES} ${BLAS_LIBRARIES} mkl_gf_lp64 mkl_intel_thread mkl_gnu_thread mkl_blas95_lp64 mkl_intel_lp64 mkl_sequential mkl_core pthread iomp5 X11)
endif()

include(GNUInstallDirs)
install(TARGETS LibQPEP
        EXPORT ${PROJECT_NAME}-config
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/../lib/
        )
install(FILES ${incs} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME})

export(
        TARGETS LibQPEP
        FILE ${PROJECT_NAME}-config.cmake
)
install(
        EXPORT ${PROJECT_NAME}-config
        DESTINATION share/${PROJECT_NAME}/cmake
)


# Create variable for the local build tree
get_property(CONF_INCLUDE_DIRS DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)

# Create variable with the library location
set(QPEP_LIB ${PROJECT_NAME})

# Configure config file for local build tree
configure_file(${PROJECT_NAME}Config.cmake.in
        "${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake" @ONLY)

# 2- installation build #

# Change the include location for the case of an install location
set(CONF_INCLUDE_DIRS ${INSTALL_INCLUDE_DIR} ${CONF_INCLUDE_DIRS} )

configure_file(${PROJECT_NAME}Config.cmake.in
        "${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/${PROJECT_NAME}Config.cmake" @ONLY)

#install(
#        FILES
#        "${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/${PROJECT_NAME}Config.cmake"
#        DESTINATION "${INSTALL_CMAKE_DIR}" COMPONENT dev
#)

install (
        FILES
        "${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/${PROJECT_NAME}Config.cmake"
        DESTINATION "share/${PROJECT_NAME}/cmake/"
)
