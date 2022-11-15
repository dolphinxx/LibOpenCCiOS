#!/bin/bash

rm -rf tmp
mkdir tmp
wget "https://ci.appveyor.com/api/projects/Carbo/opencc/artifacts/OpenCC.zip?branch=master&job=Environment:%20nodejs_version=none;%20Platform:%20x64" -O tmp/opencc.zip

unzip tmp/opencc.zip -d tmp/

cd ..
