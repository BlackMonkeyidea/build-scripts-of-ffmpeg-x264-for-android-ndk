#!/bin/bash
echo "ANDROID_NDK_HOME is $ANDROID_NDK_HOME"
PLATFORM=$ANDROID_NDK_HOME/platforms/android-21/arch-arm64/
TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64
PREFIX=./android/arm64

function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --enable-pic \
  --host=aarch64-linux \
  --cross-prefix=$TOOLCHAIN/bin/aarch64-linux-android- \
  --sysroot=$PLATFORM

  make clean
  make
  make install
}

build_one

echo Android ARM64 builds finished
