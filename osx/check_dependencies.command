#!/bin/sh

echo "=============================================================================="
if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}" ; then
    echo "\033[0;32mXcode command line tools were found successfully\033[0m"
else
    echo "\033[1;31mXcode command line tools not found.\033[0m"
    echo "\033[1;31mPlease run install_dependencies.command\033[0m"
fi

echo "=============================================================================="
command -v brew >/dev/null 2>&1 && {
    echo "\033[0;32mbrew was found successfully\033[0m";
    BREW_INSTALLED="YES"
} || {
    echo "\033[1;31mbrew not found.\033[0m";
    echo "\033[1;31mPlease run install_dependencies.command\033[0m"
}

echo "=============================================================================="
command -v scons >/dev/null 2>&1 && {
    echo "\033[0;32mscons was found successfully\033[0m";
} || {
    echo "\033[1;31mscons not found.\033[0m";
    echo "\033[1;31mPlease run install_dependencies.command\033[0m"
}

echo "=============================================================================="
if [ "${BREW_INSTALLED}" = "YES" ] ; then
    brew list mingw-w64 >/dev/null 2>&1 && {
        echo "\033[0;32mmingw-w64 was found successfully\033[0m";
    } || {
        echo "\033[1;31mmingw-w64 not found.\033[0m";
        echo "\033[1;31mThis is needed to be able to compile for Windows.\033[0m";
        echo "\033[1;31mPlease run install_dependencies.command\033[0m"
    }
else
    echo "\033[1;31mbrew not found so can't check for mingw-w64\033[0m";
fi

echo "=============================================================================="
command -v javac >/dev/null 2>&1 && {
    echo "\033[0;32mjavac was found successfully\033[0m";
} || {
    echo "\033[1;31mjavac not found.\033[0m";
    echo "\033[1;31mThis is needed to be able to compile for Android.\033[0m";
    echo "\033[1;31mPlease install the JDK\033[0m"
}

echo "=============================================================================="
if [ "${ANDROID_HOME}" = "" ] ; then
    echo "\033[1;31mANDROID_HOME environment variable not set.\033[0m";
    echo "\033[1;31mPlease make sure that you have installed the Android SDK and then\033[0m";
    echo "\033[1;31madd the following to your ~/.bash_profile file:\033[0m";
    echo "\033[1;31mexport ANDROID_HOME=/path/to/android-sdk\033[0m";
else
    echo "\033[0;32mANDROID_HOME environment variable is set\033[0m";
fi

echo "=============================================================================="
if [ "${ANDROID_NDK_ROOT}" = "" ] ; then
    echo "\033[1;31mANDROID_NDK_ROOT environment variable not set.\033[0m";
    echo "\033[1;31mPlease make sure that you have installed the Android NDK (r13+) and then\033[0m";
    echo "\033[1;31madd the following to your ~/.bash_profile file:\033[0m";
    echo "\033[1;31mexport ANDROID_NDK_ROOT=/path/to/android-ndk\033[0m";
else
    echo "\033[0;32mANDROID_NDK_ROOT environment variable is set\033[0m";
fi

echo "=============================================================================="
