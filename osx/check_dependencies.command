#!/bin/sh

echo "=============================================================================="
if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}" ; then
    echo "\033[0;32mXcode command line tools were found successfully\033[0m"
else
    echo "\033[1;31mXcode command line tools not found\033[0m"
    echo "\033[1;31mPlease run install_dependencies.command\033[0m"
fi

echo "=============================================================================="
command -v brew >/dev/null 2>&1 && {
    echo "\033[0;32mbrew was found successfully\033[0m";
    BREW_INSTALLED="YES"
} || {
    echo "\033[1;31mbrew not found\033[0m";
    echo "\033[1;31mPlease run install_dependencies.command\033[0m"
}

echo "=============================================================================="
command -v scons >/dev/null 2>&1 && {
    echo "\033[0;32mscons was found successfully\033[0m";
} || {
    echo "\033[1;31mscons not found\033[0m";
    echo "\033[1;31mPlease run install_dependencies.command\033[0m"
}

echo "=============================================================================="
if [ "${BREW_INSTALLED}" = "YES" ] ; then
    brew list mingw-w64 >/dev/null 2>&1 && {
        echo "\033[0;32mmingw-w64 was found successfully\033[0m";
    } || {
        echo "\033[1;31mmingw-w64 not found\033[0m";
        echo "\033[1;31mPlease run install_dependencies.command\033[0m"
    }
else
    echo "\033[1;31mbrew not found so can't check for mingw-w64\033[0m";
fi

echo "=============================================================================="
