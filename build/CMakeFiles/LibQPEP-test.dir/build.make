# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cranesoar/LibQPEP

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cranesoar/LibQPEP/build

# Include any dependencies generated for this target.
include CMakeFiles/LibQPEP-test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/LibQPEP-test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/LibQPEP-test.dir/flags.make

CMakeFiles/LibQPEP-test.dir/main.cpp.o: CMakeFiles/LibQPEP-test.dir/flags.make
CMakeFiles/LibQPEP-test.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cranesoar/LibQPEP/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/LibQPEP-test.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LibQPEP-test.dir/main.cpp.o -c /home/cranesoar/LibQPEP/main.cpp

CMakeFiles/LibQPEP-test.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LibQPEP-test.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cranesoar/LibQPEP/main.cpp > CMakeFiles/LibQPEP-test.dir/main.cpp.i

CMakeFiles/LibQPEP-test.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LibQPEP-test.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cranesoar/LibQPEP/main.cpp -o CMakeFiles/LibQPEP-test.dir/main.cpp.s

CMakeFiles/LibQPEP-test.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/LibQPEP-test.dir/main.cpp.o.requires

CMakeFiles/LibQPEP-test.dir/main.cpp.o.provides: CMakeFiles/LibQPEP-test.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/LibQPEP-test.dir/build.make CMakeFiles/LibQPEP-test.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/LibQPEP-test.dir/main.cpp.o.provides

CMakeFiles/LibQPEP-test.dir/main.cpp.o.provides.build: CMakeFiles/LibQPEP-test.dir/main.cpp.o


# Object files for target LibQPEP-test
LibQPEP__test_OBJECTS = \
"CMakeFiles/LibQPEP-test.dir/main.cpp.o"

# External object files for target LibQPEP-test
LibQPEP__test_EXTERNAL_OBJECTS =

LibQPEP-test: CMakeFiles/LibQPEP-test.dir/main.cpp.o
LibQPEP-test: CMakeFiles/LibQPEP-test.dir/build.make
LibQPEP-test: libLibQPEP.a
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_dnn.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_highgui.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_ml.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_objdetect.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_shape.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_stitching.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_superres.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_videostab.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_viz.so.3.4.12
LibQPEP-test: /usr/lib/x86_64-linux-gnu/liblapack.so
LibQPEP-test: /usr/lib/x86_64-linux-gnu/libf77blas.so
LibQPEP-test: /usr/lib/x86_64-linux-gnu/libatlas.so
LibQPEP-test: /usr/lib/x86_64-linux-gnu/libSM.so
LibQPEP-test: /usr/lib/x86_64-linux-gnu/libICE.so
LibQPEP-test: /usr/lib/x86_64-linux-gnu/libX11.so
LibQPEP-test: /usr/lib/x86_64-linux-gnu/libXext.so
LibQPEP-test: /usr/lib/x86_64-linux-gnu/libf77blas.so
LibQPEP-test: /usr/lib/x86_64-linux-gnu/libatlas.so
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_calib3d.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_features2d.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_flann.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_photo.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_video.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_videoio.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_imgcodecs.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_imgproc.so.3.4.12
LibQPEP-test: /usr/local/opencv3.4.12/lib/libopencv_core.so.3.4.12
LibQPEP-test: /usr/lib/x86_64-linux-gnu/libSM.so
LibQPEP-test: /usr/lib/x86_64-linux-gnu/libICE.so
LibQPEP-test: /usr/lib/x86_64-linux-gnu/libX11.so
LibQPEP-test: /usr/lib/x86_64-linux-gnu/libXext.so
LibQPEP-test: CMakeFiles/LibQPEP-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cranesoar/LibQPEP/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable LibQPEP-test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LibQPEP-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/LibQPEP-test.dir/build: LibQPEP-test

.PHONY : CMakeFiles/LibQPEP-test.dir/build

CMakeFiles/LibQPEP-test.dir/requires: CMakeFiles/LibQPEP-test.dir/main.cpp.o.requires

.PHONY : CMakeFiles/LibQPEP-test.dir/requires

CMakeFiles/LibQPEP-test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/LibQPEP-test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/LibQPEP-test.dir/clean

CMakeFiles/LibQPEP-test.dir/depend:
	cd /home/cranesoar/LibQPEP/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cranesoar/LibQPEP /home/cranesoar/LibQPEP /home/cranesoar/LibQPEP/build /home/cranesoar/LibQPEP/build /home/cranesoar/LibQPEP/build/CMakeFiles/LibQPEP-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/LibQPEP-test.dir/depend

