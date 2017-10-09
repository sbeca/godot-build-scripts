@echo off

echo =======================================
python --version >nul 2>&1 && (
    echo Python was found successfully
) || (
    echo Python not found
    echo Please install Python 2.7+ from here: https://www.python.org/downloads/
    echo NOTE 1: 3.0 is untested as of now
    echo NOTE 2: Using the 32-bits installer is recommended
)

echo =======================================
scons --version >nul 2>&1 && (
    echo SCons was found successfully
) || (
    echo SCons not found
    echo Please install SCons from here: http://www.scons.org/
)

echo =======================================
pause
