#!/bin/bash
arch=$1 #输入的第一个参数是ARCH，例如i386 或者x86_64，armv6,armv7,armv7s,arm64
sdk_version=$2 #xcode iphone sdk
ogg_config_path=$3 #ogg configure文件地址

case $arch in  #检查XY_ARCH
	i386 | x86_64 ) #模拟器
		platform=iPhoneSimulator  #这个变量用来找/Applications/Xcode.app/Contents/Developerd的Platforms
		host=$arch-apple-darwin10
		sdk_platform=iphonesimulator
		ios_min_version=ios-simulator-version-min=7.0
		;;
	armv6 | armv7 | armv7s | arm64 )
		platform=iPhoneOS
		host=arm-apple-darwin10
		sdk_platform=iphoneos
		ios_min_version=iphoneos-version-min=7.0
		;;
	* )
	echo "ARCH 只能是 i386，x86_64，armv6,armv7,armv7s,arm64"
	exit 1
	;;
esac

echo "=====$platform"
echo "=====$host"
echo "=====$sdk_platform"
echo "=====$ios_min_version"


xcode_root_path=`xcode-select -print-path` #获取xcode目录 /Applications/Xcode.app/Contents/Developer
platform_path=$xcode_root_path/Platforms/$platform.platform/Developer
platform_sdk_path=$platform_path/SDKs/$platform$sdk_version.sdk  #找到/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS10.2.sdk
sysroot="-isysroot $platform_sdk_path -arch $arch -m$ios_min_version -fembed-bitcode" #启用bitcode

CC=`xcrun -sdk $sdk_platform$sdk_version -find clang`
CXX=`xcrun -sdk $sdk_platform$sdk_version -find clang++`

CFLAGS=$sysroot
CXXFLAGS=$sysroot
LDFLAGS=$sysroot
export CC CXX CFLAGS CXXFLAGS LDFLAGS

install_prefix=`pwd`/speex-install-$platform-$arch

configure_flag="--host=$host \
				--prefix=$install_prefix \
				--disable-shared \
					$IDZ_EXTRA_CONFIGURE_FLAGS \
				--enable-static \
				--disable-oggtest \
				--enable-fixed-point \
				--disable-float-api 
				--with-ogg=`pwd`/ogg-install-$platform-$arch/lib \
				"

build_prefix=`pwd`/speex-build-$platform-$arch
mkdir -p $build_prefix
cd $build_prefix

$ogg_config_path $configure_flag | tee configure_$arch.log 2>&1
make clean | tee make_clean_$arch.log 2>&1
make | tee make_$arch.log 2>&1
make install | tee make_install_$arch.log 2>&1
cd ..
resultSpeexPah=`pwd`/speex  #最后生成的speex

if [ !  -d "$resultSpeexPah" ]; then
 mkdir "$resultSpeexPah"
 cp -f $install_prefix/lib/libspeex.a $resultSpeexPah/libspeex.a
else
	echo "合并"
	lipo=`xcrun -find lipo`
	lipo -create $install_prefix/lib/libspeex.a  $resultSpeexPah/libspeex.a -output $resultSpeexPah/libspeex.a  
fi



echo $sysroot
echo `pwd` #当前目录，如果前边使用pushd，就表示已经cd到的目录
