cmake_minimum_required(VERSION 3.7)
set (PACKAGE_NAME opencc)
project (${PACKAGE_NAME} CXX)

set (CMAKE_XCODE_BUILD_SYSTEM 12)

set (OPENCC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/OpenCC)

######## Options
option(BUILD_SHARED_LIBS "Build opencc as shared library" OFF)
option(ENABLE_DARTS "Build DartsDict (ocd format)." ON)
option(USE_SYSTEM_DARTS "Use system version of Darts" OFF)
option(USE_SYSTEM_MARISA "Use system version of Marisa" OFF)
option(USE_SYSTEM_RAPIDJSON "Use system version of RapidJSON" OFF)
option(USE_SYSTEM_TCLAP "Use system version of TCLAP" OFF)

######## Package information
set (PACKAGE_URL https://github.com/BYVoid/Opencc)
set (PACKAGE_BUGREPORT https://github.com/BYVoid/Opencc/issues)
set (OPENCC_VERSION_MAJOR 1)
set (OPENCC_VERSION_MINOR 1)
set (OPENCC_VERSION_REVISION 4)


set (
  OPENCC_VERSION
  ${OPENCC_VERSION_MAJOR}.${OPENCC_VERSION_MINOR}.${OPENCC_VERSION_REVISION}${version_suffix}
)

set(CMAKE_MACOSX_RPATH 1)

######## Compiler flags

add_definitions(
  -DVERSION="${OPENCC_VERSION}"
  -DPACKAGE_NAME="${PACKAGE_NAME}"
)


if ("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang")
  add_definitions(
    -std=c++14
    -Wall
  )
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -pthread")
  if (CMAKE_BUILD_TYPE MATCHES Debug)
    add_definitions(-O0 -g3)
  endif ()
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
  add_definitions(
    -std=c++14
    -Wall
  )
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -pthread")
  if (CMAKE_BUILD_TYPE MATCHES Debug)
    add_definitions(-O0 -g3)
  endif ()
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
  add_definitions(
    /W4
    /D "_CRT_SECURE_NO_WARNINGS"
  )
endif()

#NOT BUILD_SHARED_LIBS
  add_definitions(
    -DOpencc_BUILT_AS_STATIC
  )


#ENABLE_DARTS
  add_definitions(
    -DENABLE_DARTS
  )


set(MARISA_DIR ${OPENCC_DIR}/deps/marisa-0.2.6)
set(MARISA_SOURCES "")

#NOT USE_SYSTEM_MARISA
  message(STATUS "Use bundled marisa library.")
#  add_subdirectory(${OPENCC_DIR}/deps/marisa-0.2.6 marisa)

  set(MARISA_SOURCES
    ${MARISA_SOURCES}
    ${MARISA_DIR}/lib/marisa/trie.cc
    ${MARISA_DIR}/lib/marisa/agent.cc
    ${MARISA_DIR}/lib/marisa/grimoire/io/reader.cc
    ${MARISA_DIR}/lib/marisa/grimoire/io/writer.cc
    ${MARISA_DIR}/lib/marisa/grimoire/io/mapper.cc
    ${MARISA_DIR}/lib/marisa/grimoire/trie/louds-trie.cc
    ${MARISA_DIR}/lib/marisa/grimoire/trie/tail.cc
    ${MARISA_DIR}/lib/marisa/grimoire/vector/bit-vector.cc
    ${MARISA_DIR}/lib/marisa/keyset.cc
  )

######## Subdirectories

include (GenerateExportHeader)

#NOT USE_SYSTEM_MARISA
  include_directories(${MARISA_DIR}/include)
  include_directories(${MARISA_DIR}/lib)

#NOT USE_SYSTEM_RAPIDJSON
  include_directories(${OPENCC_DIR}/deps/rapidjson-1.1.0)

#NOT USE_SYSTEM_TCLAP
  include_directories(${OPENCC_DIR}/deps/tclap-1.2.2)



set (OPENCC_SRC_DIR ${OPENCC_DIR}/src)

# Library

set(
  LIBOPENCC_HEADERS
  ${OPENCC_SRC_DIR}/Common.hpp
  ${OPENCC_SRC_DIR}/Config.hpp
  ${OPENCC_SRC_DIR}/Conversion.hpp
  ${OPENCC_SRC_DIR}/ConversionChain.hpp
  ${OPENCC_SRC_DIR}/Converter.hpp
  ${OPENCC_SRC_DIR}/Dict.hpp
  ${OPENCC_SRC_DIR}/DictConverter.hpp
  ${OPENCC_SRC_DIR}/DictEntry.hpp
  ${OPENCC_SRC_DIR}/DictGroup.hpp
  ${OPENCC_SRC_DIR}/Exception.hpp
  ${OPENCC_SRC_DIR}/Export.hpp
  ${OPENCC_SRC_DIR}/Lexicon.hpp
  ${OPENCC_SRC_DIR}/MarisaDict.hpp
  ${OPENCC_SRC_DIR}/MaxMatchSegmentation.hpp
  ${OPENCC_SRC_DIR}/Optional.hpp
  ${OPENCC_SRC_DIR}/PhraseExtract.hpp
  ${OPENCC_SRC_DIR}/Segmentation.hpp
  ${OPENCC_SRC_DIR}/Segments.hpp
  ${OPENCC_SRC_DIR}/SerializableDict.hpp
  ${OPENCC_SRC_DIR}/SerializedValues.hpp
  ${OPENCC_SRC_DIR}/SimpleConverter.hpp
  ${OPENCC_SRC_DIR}/TextDict.hpp
  ${OPENCC_SRC_DIR}/UTF8StringSlice.hpp
  ${OPENCC_SRC_DIR}/UTF8Util.hpp
  ${OPENCC_SRC_DIR}/opencc.h
  "${PROJECT_BINARY_DIR}/src/opencc_config.h"
)

set(
  LIBOPENCC_SOURCES
  ${OPENCC_SRC_DIR}/Config.cpp
  ${OPENCC_SRC_DIR}/Conversion.cpp
  ${OPENCC_SRC_DIR}/ConversionChain.cpp
  ${OPENCC_SRC_DIR}/Converter.cpp
  ${OPENCC_SRC_DIR}/Dict.cpp
  ${OPENCC_SRC_DIR}/DictConverter.cpp
  ${OPENCC_SRC_DIR}/DictEntry.cpp
  ${OPENCC_SRC_DIR}/DictGroup.cpp
  ${OPENCC_SRC_DIR}/Lexicon.cpp
  ${OPENCC_SRC_DIR}/MarisaDict.cpp
  ${OPENCC_SRC_DIR}/MaxMatchSegmentation.cpp
  ${OPENCC_SRC_DIR}/PhraseExtract.cpp
  ${OPENCC_SRC_DIR}/SerializedValues.cpp
  ${OPENCC_SRC_DIR}/SimpleConverter.cpp
  ${OPENCC_SRC_DIR}/Segmentation.cpp
  ${OPENCC_SRC_DIR}/TextDict.cpp
  ${OPENCC_SRC_DIR}/UTF8StringSlice.cpp
  ${OPENCC_SRC_DIR}/UTF8Util.cpp
)

#ENABLE_DARTS
  set(OPENCC_ENABLE_DARTS 1)
  if(NOT USE_SYSTEM_DARTS)
    include_directories(${OPENCC_DIR}/deps/darts-clone)
  endif()
  set(
    LIBOPENCC_HEADERS
    ${LIBOPENCC_HEADERS}
    ${OPENCC_SRC_DIR}/BinaryDict.hpp
    ${OPENCC_SRC_DIR}/DartsDict.hpp
  )
  set(
    LIBOPENCC_SOURCES
    ${LIBOPENCC_SOURCES}
    ${OPENCC_SRC_DIR}/BinaryDict.cpp
    ${OPENCC_SRC_DIR}/DartsDict.cpp
  )

configure_file(
  "${OPENCC_SRC_DIR}/opencc_config.h.in"
  "${PROJECT_BINARY_DIR}/src/opencc_config.h")

include_directories(${PROJECT_BINARY_DIR}/src)

add_library(opencc
  ${LIBOPENCC_SOURCES}
  ${LIBOPENCC_HEADERS}
  ${MARISA_SOURCES}
  ${CMAKE_CURRENT_SOURCE_DIR}/interface.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/interface.def
)
set_target_properties(opencc PROPERTIES POSITION_INDEPENDENT_CODE ON)

#GENERATE_EXPORT_HEADER(
#  libopencc
#  BASE_NAME OPENCC
#  EXPORT_MACRO_NAME OPENCC_EXPORT
#  EXPORT_FILE_NAME Opencc_Export.h
#  STATIC_DEFINE Opencc_BUILT_AS_STATIC
#)

#set_target_properties(
#  libopencc
#  PROPERTIES
#    LINKER_LANGUAGE
#      CXX
#    OUTPUT_NAME
#      opencc
#    VERSION
#      1.1.4
#    SOVERSION
#      1.1
#)
