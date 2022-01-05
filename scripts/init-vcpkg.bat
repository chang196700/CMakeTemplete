@echo off
if "%VCPKG_ROOT%" == "" (
    cd %~dp0 && cd ..
    echo Initializing vcpkg...
    if not exist vcpkg (
        git clone https://github.com/microsoft/vcpkg.git vcpkg
    ) else (
        cd vcpkg
        git pull
        cd ..
    )
    cd vcpkg
) else (
    cd "%VCPKG_ROOT%"
    git pull
)
if not exist vcpkg.exe .\bootstrap-vcpkg.bat -disableMetrics
