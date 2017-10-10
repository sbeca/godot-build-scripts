@echo off

CALL ".\global_variables.bat"

echo ==============================================================================
IF NOT DEFINED VC_PATH (
    echo Visual C++ vcvarsall.bat not found
    echo Please install Visual C++ from here: https://www.visualstudio.com/vs/community/
    echo IMPORTANT: C++ is not selected by default within the installer so make sure to select it
) ELSE (
    echo Visual C++ vcvarsall.bat was found successfully
)

echo ==============================================================================
git --version >nul 2>&1 && (
    echo Git was found successfully
) || (
    echo Git not found
    echo Please install Git from here: https://git-scm.com/download/win
)

echo ==============================================================================
python --version >nul 2>&1 && (
    echo Python was found successfully
) || (
    echo Python not found
    echo Please install Python 2.7+ from here: https://www.python.org/downloads/
    echo NOTE 1: 3.0 is untested as of now
    echo NOTE 2: Using the 32-bits installer is recommended
)

echo ==============================================================================
scons --version >nul 2>&1 && (
    echo SCons was found successfully

    REM This needs to be inside the parentheses because for some reason
    REM scons breaks the flow and nothing after the parentheses gets called
    echo ==============================================================================
    PAUSE
) || (
    echo SCons not found
    echo Please install SCons from here: http://www.scons.org/

    echo ==============================================================================
    PAUSE
)
