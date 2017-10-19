@ECHO off

CALL ".\global_variables.bat"

IF NOT EXIST "%GIT_PARENT_FOLDER%" mkdir "%GIT_PARENT_FOLDER%"
cd "%GIT_PARENT_FOLDER%"

CALL :DoGitStuff "godot"
CALL :DoGitStuff "godot-docs"
CALL :DoGitStuff "godot-demo-projects"

PAUSE
EXIT /B 0


:DoGitStuff
SET URL=https://github.com/%GIT_USERNAME%/%~1
IF EXIST "%GIT_PARENT_FOLDER%\%~1" (
    ECHO === %~1 folder already exists so skipping checkout ===
) ELSE (
    git clone %URL%.git
    cd "%GIT_PARENT_FOLDER%\%~1"
    git remote add upstream https://github.com/godotengine/%~1.git
    cd "%GIT_PARENT_FOLDER%"
)
EXIT /B 0
