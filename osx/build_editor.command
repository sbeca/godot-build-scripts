#!/bin/sh

CURRENT_DIRECTORY=$(dirname "$0")
source "${CURRENT_DIRECTORY}/global_variables.sh"

if [ ! -d ${GIT_PARENT_FOLDER} ] ; then
    echo "\033[1;31m==============================================================================\033[0m"
    echo "\033[1;31mGit parent folder does not exist: ${GIT_PARENT_FOLDER}\033[0m"
    echo "\033[1;31m==============================================================================\033[0m"
    exit 1
fi

if [ ! -d ${GIT_PARENT_FOLDER}/godot ] ; then
    echo "\033[1;31m==============================================================================\033[0m"
    echo "\033[1;31mGodot source folder does not exist: ${GIT_PARENT_FOLDER}/godot\033[0m"
    echo "\033[1;31m==============================================================================\033[0m"
    exit 1
fi

cd ${GIT_PARENT_FOLDER}/godot

# Remove previous build
rm -rf ${EDITOR_BUILD_PATH}

# Build Godot Editor
scons platform=osx bits=64 tools=yes target=release_debug -j ${CPU_CORE_COUNT}

# Make Editor MacOS .app file to easily run Godot on MacOS
cp -r ./misc/dist/osx_tools.app ${EDITOR_BUILD_PATH}
mkdir -p ${EDITOR_BUILD_PATH}/Contents/MacOS
cp ./bin/godot.osx.opt.tools.64 ${EDITOR_BUILD_PATH}/Contents/MacOS/Godot
chmod +x ${EDITOR_BUILD_PATH}/Contents/MacOS/Godot
