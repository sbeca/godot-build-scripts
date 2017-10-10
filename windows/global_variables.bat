@echo off

SET GIT_PARENT_FOLDER="%USERPROFILE%\Documents\GitHub"
SET GIT_USERNAME="sbeca"

SET TEMPLATE_FOLDER="%USERPROFILE%\AppData\Roaming\Godot\templates\3.0-alpha"
SET EDITOR_BUILD_PATH="%GIT_PARENT_FOLDER%\Godot-3.0-alpha.exe"
SET CPU_CORE_COUNT=%NUMBER_OF_PROCESSORS%

IF exist "C:\Program Files (x86)\Microsoft Visual Studio 15.0\VC\vcvarsall.bat" (
    SET VC_PATH="C:\Program Files (x86)\Microsoft Visual Studio 15.0\VC\vcvarsall.bat"
)
IF NOT DEFINED VC_PATH IF exist "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" (
    SET VC_PATH="C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"
)
IF NOT DEFINED VC_PATH IF exist "C:\Program Files (x86)\Microsoft Visual Studio 13.0\VC\vcvarsall.bat" (
    SET VC_PATH="C:\Program Files (x86)\Microsoft Visual Studio 13.0\VC\vcvarsall.bat"
)
IF NOT DEFINED VC_PATH IF exist "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" (
    SET VC_PATH="C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat"
)
