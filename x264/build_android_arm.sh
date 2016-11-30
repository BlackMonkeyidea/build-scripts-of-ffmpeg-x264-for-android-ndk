#!/bin/bash
echo "ANDROID_NDK_HOME is $ANDROID_NDK_HOME"
PLATFORM=$ANDROID_NDK_HOME/platforms/android-14/arch-arm/
TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
PREFIX=./android/arm

function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --enable-pic \
  --host=arm-linux \
  --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
  --sysroot=$PLATFORM

  make clean
  make
  make install
}

build_one

echo Android ARM builds finished
