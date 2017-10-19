@ECHO off

CALL ".\global_variables.bat"

IF NOT EXIST "%GIT_PARENT_FOLDER%" (
    ECHO ==============================================================================
    ECHO Git parent folder does not exist: %GIT_PARENT_FOLDER%
    ECHO ==============================================================================
    EXIT /B 1
)

cd "%GIT_PARENT_FOLDER%"

CALL :DoGitStuff "godot"
CALL :DoGitStuff "godot-docs"
CALL :DoGitStuff "godot-demo-projects"

PAUSE
EXIT /B 0


:DoGitStuff
IF EXIST "%GIT_PARENT_FOLDER%\%~1" (
    cd "%GIT_PARENT_FOLDER%\%~1"
    git pull
    git fetch upstream
    git pull upstream master
    git push
    cd "%GIT_PARENT_FOLDER%"
)
EXIT /B 0
