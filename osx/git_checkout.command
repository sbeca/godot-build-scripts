#!/bin/sh

CURRENT_DIRECTORY=$(dirname "$0")
source "${CURRENT_DIRECTORY}/global_variables.sh"

mkdir -p ${GIT_PARENT_FOLDER}
cd ${GIT_PARENT_FOLDER}

function DoGitStuff {
    if [ -d "./${1}" ] ; then
        echo "=== ${1} folder already exists so skipping checkout ==="
    else
        URL="https://github.com/${GIT_USERNAME}/${1}"
        curl -s --head ${URL} | head -n 1 | grep "HTTP/1.[01] [23].." > /dev/null

        if [[ "$?" -eq 1 ]] ; then
            echo === No repo exists at URL: ${URL} ===
        else
            git clone ${URL}.git
            cd ./${1}
            git remote add upstream https://github.com/godotengine/${1}.git
            cd ..
        fi
    fi
}

DoGitStuff godot
DoGitStuff godot-docs
DoGitStuff godot-demo-projects
