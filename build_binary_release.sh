#!/bin/bash

rm -rf CocoaPodsPubBinary/libopencc.zip
rm -rf CocoaPodsPubBinary/libopencc.a

cp build/Release-iphoneos/libopencc.a CocoaPodsPubBinary/

zip -j CocoaPodsPubBinary/libopencc.zip CocoaPodsPubBinary/opencc.h CocoaPodsPubBinary/libopencc.a CocoaPodsPubBinary/LICENSE CocoaPodsPubBinary/LibOpenCCiOS.podspec