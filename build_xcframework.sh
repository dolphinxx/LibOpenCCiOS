#!/bin/bash

xcodebuild clean build \
  -scheme opencc \
  -arch x86_64 \
  -sdk iphonesimulator \
  -project build/opencc.xcodeproj \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild clean build \
  -scheme opencc \
  -arch armv7 -arch armv7s -arch arm64 \
  -sdk iphoneos \
  -project build/opencc.xcodeproj \
  ONLY_ACTIVE_ARCH=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

rm -rf build/LibOpenCCiOS.xcframework

xcodebuild -create-xcframework \
  -library build/Debug-iphoneos/libopencc.a \
  -headers ./include \
  -library build/Debug-iphonesimulator/libopencc.a \
  -headers ./include \
  -output build/LibOpenCCiOS.xcframework


rm -vrf CocoaPodsPub/LibOpenCCiOS.xcframework
rm -rv CocoaPodsPub/LibOpenCCiOS.tar.gz

cp -R build/LibOpenCCiOS.xcframework CocoaPodsPub
cd CocoaPodsPub
tar zcvf LibOpenCCiOS.tar.gz ./*