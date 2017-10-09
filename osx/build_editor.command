#!/bin/sh

GIT_PARENT_FOLDER="${HOME}/Documents/GitHub"
EDITOR_BUILD_PATH="${GIT_PARENT_FOLDER}/Godot.app"
CPU_CORE_COUNT=8

if [ ! -d ${GIT_PARENT_FOLDER} ] ; then
    echo === Git parent folder does not exist: ${GIT_PARENT_FOLDER} ===
    exit 1
fi

if [ ! -d ${GIT_PARENT_FOLDER}/godot ] ; then
    echo === Godot source folder does not exist: ${GIT_PARENT_FOLDER}/godot ===
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
