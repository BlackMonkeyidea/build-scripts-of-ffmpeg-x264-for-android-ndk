#!/bin/bash
echo "ANDROID_NDK_HOME is $ANDROID_NDK_HOME"
PLATFORM=$ANDROID_NDK_HOME/platforms/android-14/arch-x86/
TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/x86-4.9/prebuilt/linux-x86_64
PREFIX=./android/x86

function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --enable-pic \
  --host=i686-linux \
  --cross-prefix=$TOOLCHAIN/bin/i686-linux-android- \
  --sysroot=$PLATFORM

  make clean
  make
  make install
}

build_one

echo Android x86 builds finished
