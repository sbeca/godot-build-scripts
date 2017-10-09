#!/bin/sh

GIT_PARENT_FOLDER="${HOME}/Documents/GitHub"
GIT_USERNAME="sbeca"

TEMPLATE_FOLDER="${HOME}/.godot/templates/3.0-alpha"
EDITOR_BUILD_PATH="${GIT_PARENT_FOLDER}/Godot.app"
CPU_CORE_COUNT=`sysctl -n hw.ncpu`
