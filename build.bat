set buildtype=%1%
@REM Copyright (c) 2012-2018 Sebastien Rombauts (sebastien.rombauts@gmail.com)
@REM
@REM Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
@REM or copy at http://opensource.org/licenses/MIT)
mkdir build
cd build

@REM Generate a Visual Studio solution for latest version found
cmake -DSQLITECPP_BUILD_EXAMPLES=OFF -DSQLITECPP_BUILD_TESTS=OFF -DSQLITECPP_RUN_CPPLINT=OFF ..
if ERRORLEVEL 1 goto onError

@REM Build default configuration (ie 'Debug')
cmake --build . --config %buildtype%
if ERRORLEVEL 1 goto onError

@REM Build and run tests
ctest --output-on-failure
if ERRORLEVEL 1 goto onError

cd ..
exit

:onError
@echo An error occured!
cd ..