#!/bin/bash
echo "ANDROID_NDK_HOME is $ANDROID_NDK_HOME"
PLATFORM=$ANDROID_NDK_HOME/platforms/android-14/arch-mips/
TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/mipsel-linux-android-4.9/prebuilt/linux-x86_64
PREFIX=./android/mips

function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --enable-pic \
  --host=mipsel-linux \
  --cross-prefix=$TOOLCHAIN/bin/mipsel-linux-android- \
  --sysroot=$PLATFORM \
  --disable-asm

  make clean
  make
  make install
}

build_one

echo Android MIPS builds finished
