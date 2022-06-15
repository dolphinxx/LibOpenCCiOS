#!/bin/bash

rm -rf build
mkdir build
cd build
cmake .. -G Xcode -DCMAKE_TOOLCHAIN_FILE=../ios.toolchain.cmake -DPLATFORM=OS64COMBINED
cmake --build . --config Release
# use modern build system
rm -rf opencc.xcodeproj/project.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings
cd ..