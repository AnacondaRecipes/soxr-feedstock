cmake -GNinja -B build ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DBUILD_TESTING=ON ^
    %SRC_DIR%
if errorlevel 1 exit 1

:: Build.
cmake --build build --config Release
if errorlevel 1 exit 1

:: Install.
cmake --build build --config Release --target install
if errorlevel 1 exit 1

:: Test.
cd build && ctest --output-on-failure -C Release
if errorlevel 1 exit 1
