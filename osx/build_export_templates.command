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

# Build Godot export templates
scons platform=osx bits=64 tools=no target=release -j ${CPU_CORE_COUNT}
scons platform=osx bits=64 tools=no target=release_debug -j ${CPU_CORE_COUNT}

scons platform=windows bits=64 tools=no target=release -j ${CPU_CORE_COUNT}
scons platform=windows bits=64 tools=no target=release_debug -j ${CPU_CORE_COUNT}

scons platform=iphone bits=64 tools=no target=release -j ${CPU_CORE_COUNT}
scons platform=iphone bits=64 tools=no target=release_debug -j ${CPU_CORE_COUNT}

# Copy the Godot export templates to the right location
rm -rf ${TEMPLATE_FOLDER}
mkdir -p ${TEMPLATE_FOLDER}

cp -r ./misc/dist/osx_template.app ${TEMPLATE_FOLDER}/osx_template.app
mkdir -p ${TEMPLATE_FOLDER}/osx_template.app/Contents/MacOS
cp ./bin/godot.osx.opt.64 ${TEMPLATE_FOLDER}/osx_template.app/Contents/MacOS/godot_osx_release.64
cp ./bin/godot.osx.opt.debug.64 ${TEMPLATE_FOLDER}/osx_template.app/Contents/MacOS/godot_osx_debug.64
cd ${TEMPLATE_FOLDER}
zip -r osx.zip osx_template.app
rm -rf osx_template.app
cd ${GIT_PARENT_FOLDER}/godot

cp ./bin/godot.windows.opt.64.exe ${TEMPLATE_FOLDER}/windows_64_release.exe
cp ./bin/godot.windows.opt.debug.64.exe ${TEMPLATE_FOLDER}/windows_64_debug.exe

cp -r ./misc/dist/ios_xcode ${TEMPLATE_FOLDER}/iphone
cp ./bin/godot.iphone.opt.debug.arm64 ${TEMPLATE_FOLDER}/iphone/godot.iphone.debug.arm64
cp ./bin/godot.iphone.opt.arm64 ${TEMPLATE_FOLDER}/iphone/godot.iphone.release.arm64
rm -f ${TEMPLATE_FOLDER}/iphone/godot.iphone.debug.arm
rm -f ${TEMPLATE_FOLDER}/iphone/godot.iphone.debug.fat
rm -f ${TEMPLATE_FOLDER}/iphone/godot.iphone.release.arm
rm -f ${TEMPLATE_FOLDER}/iphone/godot.iphone.release.fat
cd ${TEMPLATE_FOLDER}
zip -r iphone.zip iphone
rm -rf iphone
cd ${GIT_PARENT_FOLDER}/godot
