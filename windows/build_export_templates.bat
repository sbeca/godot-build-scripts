@echo off

CALL ".\global_variables.bat"

IF NOT DEFINED VC_PATH (
    echo === Could not find Visual C++ vcvarsall.bat file so can not start compile ===
    PAUSE
    EXIT /b
)

cd "%GIT_PARENT_FOLDER%\godot"

IF exist "%TEMPLATE_FOLDER%" @RD /S /Q "%TEMPLATE_FOLDER%"
MD "%TEMPLATE_FOLDER%"

%VC_PATH% amd64_x86 && (
    scons platform=windows tools=no target=release -j %CPU_CORE_COUNT%
    scons platform=windows tools=no target=release_debug -j %CPU_CORE_COUNT%

    %VC_PATH% amd64 && (
        scons platform=windows tools=no target=release -j %CPU_CORE_COUNT%
        scons platform=windows tools=no target=release_debug -j %CPU_CORE_COUNT%

        COPY ".\bin\godot.windows.opt.32.exe" "%TEMPLATE_FOLDER%\windows_32_release.exe"
        COPY ".\bin\godot.windows.opt.debug.32.exe" "%TEMPLATE_FOLDER%\windows_32_debug.exe"
        COPY ".\bin\godot.windows.opt.64.exe" "%TEMPLATE_FOLDER%\windows_64_release.exe"
        COPY ".\bin\godot.windows.opt.debug.64.exe" "%TEMPLATE_FOLDER%\windows_64_debug.exe"

        PAUSE
    )
)
