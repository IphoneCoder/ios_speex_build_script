#!/bin/bash
rm -rf `pwd`/speex
XY_Speex_VERSION=1.2.0 #ogg版本，请输入最新的版本

XY_iPhone_SDK_VERSION=`xcrun --sdk iphoneos --show-sdk-version` #用当前电脑iPhoneSDK版本编译

echo  $XY_iPhone_SDK_VERSION

source_dir=speex-$XY_Speex_VERSION #ogg上svn名字规则是libogg-1.3.2

`pwd`/speex_configure.sh i386 $XY_iPhone_SDK_VERSION `pwd`/$source_dir/configure
`pwd`/speex_configure.sh x86_64 $XY_iPhone_SDK_VERSION `pwd`/$source_dir/configure
`pwd`/speex_configure.sh armv6 $XY_iPhone_SDK_VERSION `pwd`/$source_dir/configure
`pwd`/speex_configure.sh armv7 $XY_iPhone_SDK_VERSION `pwd`/$source_dir/configure
`pwd`/speex_configure.sh armv7s $XY_iPhone_SDK_VERSION `pwd`/$source_dir/configure
`pwd`/speex_configure.sh arm64 $XY_iPhone_SDK_VERSION `pwd`/$source_dir/configure



