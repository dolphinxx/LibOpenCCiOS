#
# Be sure to run `pod lib lint LibOpenCCiOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LibOpenCCiOS'
  s.version          = '0.0.2'
  s.summary          = 'OpenCC iOS binary for flutter_opencc_ffi.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
OpenCC iOS fat binary for flutter_opencc_ffi.
                       DESC

  s.homepage         = 'https://github.com/dolphinxx/LibOpenCCiOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache License 2.0', :file => 'LICENSE' }
  s.author           = { 'dolphinxx' => 'bravedolphinxx@gmail.com' }
  s.source           = { :git => 'https://github.com/dolphinxx/LibOpenCCiOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.requires_arc = true

  s.source_files = [
    "OpenCC/src/BinaryDict.{hpp,cpp}",
    "OpenCC/src/Common.hpp",
    "OpenCC/src/BinaryDict.{hpp,cpp}",
    "OpenCC/src/Config.{hpp,cpp}",
    "OpenCC/src/Conversion.{hpp,cpp}",
    "OpenCC/src/ConversionChain.{hpp,cpp}",
    "OpenCC/src/Converter.{hpp,cpp}",
    "OpenCC/src/Dict.{hpp,cpp}",
    "OpenCC/src/DictConverter.{hpp,cpp}",
    "OpenCC/src/DictEntry.{hpp,cpp}",
    "OpenCC/src/DictGroup.{hpp,cpp}",
    "OpenCC/src/Exception.hpp",
    "OpenCC/src/Export.hpp",
    "OpenCC/src/Lexicon.{hpp,cpp}",
    "OpenCC/src/MarisaDict.{hpp,cpp}",
    "OpenCC/src/MaxMatchSegmentation.{hpp,cpp}",
    "OpenCC/src/Optional.hpp",
    "OpenCC/src/PhraseExtract.{hpp,cpp}",
    "OpenCC/src/Segmentation.{hpp,cpp}",
    "OpenCC/src/Segments.hpp",
    "OpenCC/src/SerializableDict.hpp",
    "OpenCC/src/SerializedValues.{hpp,cpp}",
    "OpenCC/src/SimpleConverter.{hpp,cpp}",
    "OpenCC/src/TextDict.{hpp,cpp}",
    "OpenCC/src/UTF8StringSlice.{hpp,cpp}",
    "OpenCC/src/UTF8Util.{hpp,cpp}",
    "OpenCC/src/opencc.h",

    "OpenCC/deps/darts-clone/*.h",

    "OpenCC/deps/marisa-0.2.6/lib/marisa/trie.cc",
    "OpenCC/deps/marisa-0.2.6/lib/marisa/agent.cc",
    "OpenCC/deps/marisa-0.2.6/lib/marisa/grimoire/io/reader.cc",
    "OpenCC/deps/marisa-0.2.6/lib/marisa/grimoire/io/writer.cc",
    "OpenCC/deps/marisa-0.2.6/lib/marisa/grimoire/io/mapper.cc",
    "OpenCC/deps/marisa-0.2.6/lib/marisa/grimoire/trie/louds-trie.cc",
    "OpenCC/deps/marisa-0.2.6/lib/marisa/grimoire/trie/tail.cc",
    "OpenCC/deps/marisa-0.2.6/lib/marisa/grimoire/vector/bit-vector.cc",
    "OpenCC/deps/marisa-0.2.6/lib/marisa/keyset.cc",

    "opencc_config.h",
    "interface.cpp",
    "LibOpenCCiOS.h",
    "LibOpenCCiOSHeader.h",
    "opencc.h"
  ]

  s.public_header_files = ["opencc.h"]

  # There are two vector.h files in marisa, so make all third-part header files preserved instead of
  # included into source_files to prevent conflict.
  s.preserve_paths = [
    "OpenCC/deps/marisa-0.2.6/include/**/*.h",
    "OpenCC/deps/marisa-0.2.6/lib/marisa/**/*.h",
    "OpenCC/deps/rapidjson-1.1.0/**/*.h",
    "OpenCC/deps/tclap-1.2.2/**/*.h"
  ]

  s.pod_target_xcconfig = {
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
    "CLANG_CXX_LIBRARY" => "libc++",
    "OTHER_CFLAGS" => "-stdlib=libc++",
    "ENABLE_BITCODE" => "NO",
    "USE_HEADERMAP" => "NO",
    "HEADER_SEARCH_PATHS" => [
      '"$(PODS_TARGET_SRCROOT)"',
      '"$(PODS_TARGET_SRCROOT)/OpenCC/deps/marisa-0.2.6/include"',
      '"$(PODS_TARGET_SRCROOT)/OpenCC/deps/marisa-0.2.6/lib"',
      '"$(PODS_TARGET_SRCROOT)/OpenCC/deps/rapidjson-1.1.0"',
      '"$(PODS_TARGET_SRCROOT)/OpenCC/deps/tclap-1.2.2"'
    ].join(" ")
  }
  s.user_target_xcconfig = { "ENABLE_BITCODE" => "NO" }

  s.libraries = 'c++'

  # s.resource_bundles = {
  #   'LibOpenCCiOS' => ['LibOpenCCiOS/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
