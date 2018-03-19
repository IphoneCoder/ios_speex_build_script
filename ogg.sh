#!/bin/bash

XY_OGG_VERSION=1.3.2 #ogg版本，请输入最新的版本

XY_iPhone_SDK_VERSION=`xcrun --sdk iphoneos --show-sdk-version` #用当前电脑iPhoneSDK版本编译

echo  $XY_iPhone_SDK_VERSION

mkdir -p libogg/$XY_OGG_VERSION #创建目录

pushd  libogg/$XY_OGG_VERSION #cd进入到这个目录

ogg_svn_dir=libogg-$XY_OGG_VERSION #ogg上svn名字规则是libogg-1.3.2

svn co http://svn.xiph.org/tags/ogg/$ogg_svn_dir #把代码克隆下来

pushd $ogg_svn_dir

./autogen.sh  #执行

make distclean #每次执行脚本后，需要执行clean

popd #返回上个操作
popd
`pwd`/ogg_configure.sh i386 $XY_iPhone_SDK_VERSION `pwd`/libogg/$XY_OGG_VERSION/$ogg_svn_dir/configure
`pwd`/ogg_configure.sh x86_64 $XY_iPhone_SDK_VERSION `pwd`/libogg/$XY_OGG_VERSION/$ogg_svn_dir/configure
`pwd`/ogg_configure.sh armv6 $XY_iPhone_SDK_VERSION `pwd`/libogg/$XY_OGG_VERSION/$ogg_svn_dir/configure
`pwd`/ogg_configure.sh armv7 $XY_iPhone_SDK_VERSION `pwd`/libogg/$XY_OGG_VERSION/$ogg_svn_dir/configure
`pwd`/ogg_configure.sh armv7s $XY_iPhone_SDK_VERSION `pwd`/libogg/$XY_OGG_VERSION/$ogg_svn_dir/configure
`pwd`/ogg_configure.sh arm64 $XY_iPhone_SDK_VERSION `pwd`/libogg/$XY_OGG_VERSION/$ogg_svn_dir/configure

#speex

`pwd`/speex.sh


