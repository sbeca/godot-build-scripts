@echo off

CALL ".\global_variables.bat"

IF NOT DEFINED VC_PATH (
    echo === Could not find Visual C++ vcvarsall.bat file so can not start compile ===
    PAUSE
    EXIT /b
)

cd "%GIT_PARENT_FOLDER%\godot"

%VC_PATH% amd64 && scons platform=windows tools=yes target=release_debug -j %CPU_CORE_COUNT% && PAUSE
