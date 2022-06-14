#!/bin/bash

rm -rf build
mkdir build
cd build
cmake .. -G Xcode -DCMAKE_TOOLCHAIN_FILE=../ios.toolchain.cmake -DPLATFORM=OS64COMBINED
#cmake --build . --config Release
rm -rf opencc.xcodeproj/project.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings
cd ..