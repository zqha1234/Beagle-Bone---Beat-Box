# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/q/cmpt433/work/as3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/q/cmpt433/work/as3/build

# Include any dependencies generated for this target.
include hal/CMakeFiles/hal.dir/depend.make

# Include the progress variables for this target.
include hal/CMakeFiles/hal.dir/progress.make

# Include the compile flags for this target's objects.
include hal/CMakeFiles/hal.dir/flags.make

hal/CMakeFiles/hal.dir/src/accelerometer.c.o: hal/CMakeFiles/hal.dir/flags.make
hal/CMakeFiles/hal.dir/src/accelerometer.c.o: ../hal/src/accelerometer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/q/cmpt433/work/as3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object hal/CMakeFiles/hal.dir/src/accelerometer.c.o"
	cd /home/q/cmpt433/work/as3/build/hal && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hal.dir/src/accelerometer.c.o -c /home/q/cmpt433/work/as3/hal/src/accelerometer.c

hal/CMakeFiles/hal.dir/src/accelerometer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hal.dir/src/accelerometer.c.i"
	cd /home/q/cmpt433/work/as3/build/hal && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/q/cmpt433/work/as3/hal/src/accelerometer.c > CMakeFiles/hal.dir/src/accelerometer.c.i

hal/CMakeFiles/hal.dir/src/accelerometer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hal.dir/src/accelerometer.c.s"
	cd /home/q/cmpt433/work/as3/build/hal && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/q/cmpt433/work/as3/hal/src/accelerometer.c -o CMakeFiles/hal.dir/src/accelerometer.c.s

hal/CMakeFiles/hal.dir/src/joystick.c.o: hal/CMakeFiles/hal.dir/flags.make
hal/CMakeFiles/hal.dir/src/joystick.c.o: ../hal/src/joystick.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/q/cmpt433/work/as3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object hal/CMakeFiles/hal.dir/src/joystick.c.o"
	cd /home/q/cmpt433/work/as3/build/hal && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hal.dir/src/joystick.c.o -c /home/q/cmpt433/work/as3/hal/src/joystick.c

hal/CMakeFiles/hal.dir/src/joystick.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hal.dir/src/joystick.c.i"
	cd /home/q/cmpt433/work/as3/build/hal && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/q/cmpt433/work/as3/hal/src/joystick.c > CMakeFiles/hal.dir/src/joystick.c.i

hal/CMakeFiles/hal.dir/src/joystick.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hal.dir/src/joystick.c.s"
	cd /home/q/cmpt433/work/as3/build/hal && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/q/cmpt433/work/as3/hal/src/joystick.c -o CMakeFiles/hal.dir/src/joystick.c.s

hal/CMakeFiles/hal.dir/src/udp.c.o: hal/CMakeFiles/hal.dir/flags.make
hal/CMakeFiles/hal.dir/src/udp.c.o: ../hal/src/udp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/q/cmpt433/work/as3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object hal/CMakeFiles/hal.dir/src/udp.c.o"
	cd /home/q/cmpt433/work/as3/build/hal && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hal.dir/src/udp.c.o -c /home/q/cmpt433/work/as3/hal/src/udp.c

hal/CMakeFiles/hal.dir/src/udp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hal.dir/src/udp.c.i"
	cd /home/q/cmpt433/work/as3/build/hal && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/q/cmpt433/work/as3/hal/src/udp.c > CMakeFiles/hal.dir/src/udp.c.i

hal/CMakeFiles/hal.dir/src/udp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hal.dir/src/udp.c.s"
	cd /home/q/cmpt433/work/as3/build/hal && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/q/cmpt433/work/as3/hal/src/udp.c -o CMakeFiles/hal.dir/src/udp.c.s

# Object files for target hal
hal_OBJECTS = \
"CMakeFiles/hal.dir/src/accelerometer.c.o" \
"CMakeFiles/hal.dir/src/joystick.c.o" \
"CMakeFiles/hal.dir/src/udp.c.o"

# External object files for target hal
hal_EXTERNAL_OBJECTS =

hal/libhal.a: hal/CMakeFiles/hal.dir/src/accelerometer.c.o
hal/libhal.a: hal/CMakeFiles/hal.dir/src/joystick.c.o
hal/libhal.a: hal/CMakeFiles/hal.dir/src/udp.c.o
hal/libhal.a: hal/CMakeFiles/hal.dir/build.make
hal/libhal.a: hal/CMakeFiles/hal.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/q/cmpt433/work/as3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C static library libhal.a"
	cd /home/q/cmpt433/work/as3/build/hal && $(CMAKE_COMMAND) -P CMakeFiles/hal.dir/cmake_clean_target.cmake
	cd /home/q/cmpt433/work/as3/build/hal && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hal.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
hal/CMakeFiles/hal.dir/build: hal/libhal.a

.PHONY : hal/CMakeFiles/hal.dir/build

hal/CMakeFiles/hal.dir/clean:
	cd /home/q/cmpt433/work/as3/build/hal && $(CMAKE_COMMAND) -P CMakeFiles/hal.dir/cmake_clean.cmake
.PHONY : hal/CMakeFiles/hal.dir/clean

hal/CMakeFiles/hal.dir/depend:
	cd /home/q/cmpt433/work/as3/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/q/cmpt433/work/as3 /home/q/cmpt433/work/as3/hal /home/q/cmpt433/work/as3/build /home/q/cmpt433/work/as3/build/hal /home/q/cmpt433/work/as3/build/hal/CMakeFiles/hal.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : hal/CMakeFiles/hal.dir/depend

