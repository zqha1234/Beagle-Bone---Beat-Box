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
include app/CMakeFiles/wave_player_cmake.dir/depend.make

# Include the progress variables for this target.
include app/CMakeFiles/wave_player_cmake.dir/progress.make

# Include the compile flags for this target's objects.
include app/CMakeFiles/wave_player_cmake.dir/flags.make

app/CMakeFiles/wave_player_cmake.dir/src/audioGenerator.c.o: app/CMakeFiles/wave_player_cmake.dir/flags.make
app/CMakeFiles/wave_player_cmake.dir/src/audioGenerator.c.o: ../app/src/audioGenerator.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/q/cmpt433/work/as3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object app/CMakeFiles/wave_player_cmake.dir/src/audioGenerator.c.o"
	cd /home/q/cmpt433/work/as3/build/app && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/wave_player_cmake.dir/src/audioGenerator.c.o -c /home/q/cmpt433/work/as3/app/src/audioGenerator.c

app/CMakeFiles/wave_player_cmake.dir/src/audioGenerator.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wave_player_cmake.dir/src/audioGenerator.c.i"
	cd /home/q/cmpt433/work/as3/build/app && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/q/cmpt433/work/as3/app/src/audioGenerator.c > CMakeFiles/wave_player_cmake.dir/src/audioGenerator.c.i

app/CMakeFiles/wave_player_cmake.dir/src/audioGenerator.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wave_player_cmake.dir/src/audioGenerator.c.s"
	cd /home/q/cmpt433/work/as3/build/app && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/q/cmpt433/work/as3/app/src/audioGenerator.c -o CMakeFiles/wave_player_cmake.dir/src/audioGenerator.c.s

app/CMakeFiles/wave_player_cmake.dir/src/audioMixer.c.o: app/CMakeFiles/wave_player_cmake.dir/flags.make
app/CMakeFiles/wave_player_cmake.dir/src/audioMixer.c.o: ../app/src/audioMixer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/q/cmpt433/work/as3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object app/CMakeFiles/wave_player_cmake.dir/src/audioMixer.c.o"
	cd /home/q/cmpt433/work/as3/build/app && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/wave_player_cmake.dir/src/audioMixer.c.o -c /home/q/cmpt433/work/as3/app/src/audioMixer.c

app/CMakeFiles/wave_player_cmake.dir/src/audioMixer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wave_player_cmake.dir/src/audioMixer.c.i"
	cd /home/q/cmpt433/work/as3/build/app && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/q/cmpt433/work/as3/app/src/audioMixer.c > CMakeFiles/wave_player_cmake.dir/src/audioMixer.c.i

app/CMakeFiles/wave_player_cmake.dir/src/audioMixer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wave_player_cmake.dir/src/audioMixer.c.s"
	cd /home/q/cmpt433/work/as3/build/app && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/q/cmpt433/work/as3/app/src/audioMixer.c -o CMakeFiles/wave_player_cmake.dir/src/audioMixer.c.s

app/CMakeFiles/wave_player_cmake.dir/src/main.c.o: app/CMakeFiles/wave_player_cmake.dir/flags.make
app/CMakeFiles/wave_player_cmake.dir/src/main.c.o: ../app/src/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/q/cmpt433/work/as3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object app/CMakeFiles/wave_player_cmake.dir/src/main.c.o"
	cd /home/q/cmpt433/work/as3/build/app && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/wave_player_cmake.dir/src/main.c.o -c /home/q/cmpt433/work/as3/app/src/main.c

app/CMakeFiles/wave_player_cmake.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wave_player_cmake.dir/src/main.c.i"
	cd /home/q/cmpt433/work/as3/build/app && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/q/cmpt433/work/as3/app/src/main.c > CMakeFiles/wave_player_cmake.dir/src/main.c.i

app/CMakeFiles/wave_player_cmake.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wave_player_cmake.dir/src/main.c.s"
	cd /home/q/cmpt433/work/as3/build/app && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/q/cmpt433/work/as3/app/src/main.c -o CMakeFiles/wave_player_cmake.dir/src/main.c.s

app/CMakeFiles/wave_player_cmake.dir/src/output.c.o: app/CMakeFiles/wave_player_cmake.dir/flags.make
app/CMakeFiles/wave_player_cmake.dir/src/output.c.o: ../app/src/output.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/q/cmpt433/work/as3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object app/CMakeFiles/wave_player_cmake.dir/src/output.c.o"
	cd /home/q/cmpt433/work/as3/build/app && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/wave_player_cmake.dir/src/output.c.o -c /home/q/cmpt433/work/as3/app/src/output.c

app/CMakeFiles/wave_player_cmake.dir/src/output.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wave_player_cmake.dir/src/output.c.i"
	cd /home/q/cmpt433/work/as3/build/app && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/q/cmpt433/work/as3/app/src/output.c > CMakeFiles/wave_player_cmake.dir/src/output.c.i

app/CMakeFiles/wave_player_cmake.dir/src/output.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wave_player_cmake.dir/src/output.c.s"
	cd /home/q/cmpt433/work/as3/build/app && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/q/cmpt433/work/as3/app/src/output.c -o CMakeFiles/wave_player_cmake.dir/src/output.c.s

app/CMakeFiles/wave_player_cmake.dir/src/periodTimer.c.o: app/CMakeFiles/wave_player_cmake.dir/flags.make
app/CMakeFiles/wave_player_cmake.dir/src/periodTimer.c.o: ../app/src/periodTimer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/q/cmpt433/work/as3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object app/CMakeFiles/wave_player_cmake.dir/src/periodTimer.c.o"
	cd /home/q/cmpt433/work/as3/build/app && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/wave_player_cmake.dir/src/periodTimer.c.o -c /home/q/cmpt433/work/as3/app/src/periodTimer.c

app/CMakeFiles/wave_player_cmake.dir/src/periodTimer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wave_player_cmake.dir/src/periodTimer.c.i"
	cd /home/q/cmpt433/work/as3/build/app && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/q/cmpt433/work/as3/app/src/periodTimer.c > CMakeFiles/wave_player_cmake.dir/src/periodTimer.c.i

app/CMakeFiles/wave_player_cmake.dir/src/periodTimer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wave_player_cmake.dir/src/periodTimer.c.s"
	cd /home/q/cmpt433/work/as3/build/app && arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/q/cmpt433/work/as3/app/src/periodTimer.c -o CMakeFiles/wave_player_cmake.dir/src/periodTimer.c.s

# Object files for target wave_player_cmake
wave_player_cmake_OBJECTS = \
"CMakeFiles/wave_player_cmake.dir/src/audioGenerator.c.o" \
"CMakeFiles/wave_player_cmake.dir/src/audioMixer.c.o" \
"CMakeFiles/wave_player_cmake.dir/src/main.c.o" \
"CMakeFiles/wave_player_cmake.dir/src/output.c.o" \
"CMakeFiles/wave_player_cmake.dir/src/periodTimer.c.o"

# External object files for target wave_player_cmake
wave_player_cmake_EXTERNAL_OBJECTS =

app/wave_player_cmake: app/CMakeFiles/wave_player_cmake.dir/src/audioGenerator.c.o
app/wave_player_cmake: app/CMakeFiles/wave_player_cmake.dir/src/audioMixer.c.o
app/wave_player_cmake: app/CMakeFiles/wave_player_cmake.dir/src/main.c.o
app/wave_player_cmake: app/CMakeFiles/wave_player_cmake.dir/src/output.c.o
app/wave_player_cmake: app/CMakeFiles/wave_player_cmake.dir/src/periodTimer.c.o
app/wave_player_cmake: app/CMakeFiles/wave_player_cmake.dir/build.make
app/wave_player_cmake: hal/libhal.a
app/wave_player_cmake: app/CMakeFiles/wave_player_cmake.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/q/cmpt433/work/as3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking C executable wave_player_cmake"
	cd /home/q/cmpt433/work/as3/build/app && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wave_player_cmake.dir/link.txt --verbose=$(VERBOSE)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying ARM executable to public NFS directory"
	cd /home/q/cmpt433/work/as3/build/app && /usr/bin/cmake -E copy /home/q/cmpt433/work/as3/build/app/wave_player_cmake ~/cmpt433/public/myApps/wave_player_cmake
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying WAVE files to public NFS directory"
	cd /home/q/cmpt433/work/as3/build/app && /usr/bin/cmake -E copy_directory /home/q/cmpt433/work/as3/wave-files ~/cmpt433/public/myApps/wave-files

# Rule to build all files generated by this target.
app/CMakeFiles/wave_player_cmake.dir/build: app/wave_player_cmake

.PHONY : app/CMakeFiles/wave_player_cmake.dir/build

app/CMakeFiles/wave_player_cmake.dir/clean:
	cd /home/q/cmpt433/work/as3/build/app && $(CMAKE_COMMAND) -P CMakeFiles/wave_player_cmake.dir/cmake_clean.cmake
.PHONY : app/CMakeFiles/wave_player_cmake.dir/clean

app/CMakeFiles/wave_player_cmake.dir/depend:
	cd /home/q/cmpt433/work/as3/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/q/cmpt433/work/as3 /home/q/cmpt433/work/as3/app /home/q/cmpt433/work/as3/build /home/q/cmpt433/work/as3/build/app /home/q/cmpt433/work/as3/build/app/CMakeFiles/wave_player_cmake.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : app/CMakeFiles/wave_player_cmake.dir/depend

