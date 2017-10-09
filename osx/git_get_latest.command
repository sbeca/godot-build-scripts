#!/bin/sh

GIT_PARENT_FOLDER="${HOME}/Documents/GitHub"

if [ ! -d ${GIT_PARENT_FOLDER} ] ; then
    echo === Git parent folder does not exist: ${GIT_PARENT_FOLDER} ===
    exit 1
fi

cd ${GIT_PARENT_FOLDER}

function DoGitStuff {
    if [ -d "./${1}" ] ; then
        cd ./${1}
        git pull
        git fetch upstream
        git pull upstream master
        git push
        cd ..
    fi
}

DoGitStuff godot
DoGitStuff godot-docs
DoGitStuff godot-demo-projects
