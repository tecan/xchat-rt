# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.3

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
CMAKE_SOURCE_DIR = /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working

# Utility rule file for cscope.

# Include the progress variables for this target.
include CMakeFiles/cscope.dir/progress.make

CMakeFiles/cscope: cscope.out


cscope.out: otr_key.c
cscope.out: otr_ops.c
cscope.out: xchat_otr.c
cscope.out: otr_util.c
cscope.out: irssi_otr.c
cscope.out: irssi_otr.h
cscope.out: io-config.h
cscope.out: otr.h
cscope.out: otr-formats.h
cscope.out: xchat-plugin.h
cscope.out: xchat_otr.h
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating cscope.out"
	echo '/home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working/otr_key.c /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working/otr_ops.c /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working/xchat_otr.c /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working/otr_util.c /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working/irssi_otr.c /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working/irssi_otr.h /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working/io-config.h /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working/otr.h /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working/otr-formats.h /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working/xchat-plugin.h /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working/xchat_otr.h' | tr ' ' '\n' >cscope.files
	cscope -b `echo /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working /usr/include/glib-2.0 /usr/lib64/glib-2.0/include /usr/local/include /usr/include/irssi /usr/include/irssi/src /usr/include/irssi/src/core /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working/irssi-headers /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working/irssi-headers ./xchat | xargs -n1 bash -c 'echo -I$$0'`

cscope: CMakeFiles/cscope
cscope: cscope.out
cscope: CMakeFiles/cscope.dir/build.make

.PHONY : cscope

# Rule to build all files generated by this target.
CMakeFiles/cscope.dir/build: cscope

.PHONY : CMakeFiles/cscope.dir/build

CMakeFiles/cscope.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cscope.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cscope.dir/clean

CMakeFiles/cscope.dir/depend:
	cd /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working /home/clayton/.xchat2-dev/otr/irssi-xchat-otr-0.3-working/CMakeFiles/cscope.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/cscope.dir/depend

