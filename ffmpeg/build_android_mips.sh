#!/bin/bash
echo "ANDROID_NDK_HOME is $ANDROID_NDK_HOME"
PLATFORM=$ANDROID_NDK_HOME/platforms/android-14/arch-mips/
PREBUILT=$ANDROID_NDK_HOME/toolchains/mipsel-linux-android-4.9/prebuilt/linux-x86_64


GENERAL="\
--enable-small \
--enable-cross-compile \
--extra-libs="-lgcc" \
--cc=$PREBUILT/bin/mipsel-linux-android-gcc \
--cross-prefix=$PREBUILT/bin/mipsel-linux-android- \
--nm=$PREBUILT/bin/mipsel-linux-android-nm \
--extra-cflags="-I../x264/android/mips/include" \
--extra-ldflags="-L../x264/android/mips/lib""

MODULES="\
--enable-gpl \
--enable-libx264"


function build_mips
{
  ./configure \
  --logfile=conflog.txt \
  --target-os=linux \
  --prefix=./android/mips \
  --arch=mips \
  ${GENERAL} \
  --sysroot=$PLATFORM \
  --enable-shared \
  --disable-static \
  --disable-mipsdspr1 --disable-mipsdspr2 --disable-mipsfpu \
  --extra-ldflags="-lx264 -Wl,-rpath-link=$PLATFORM/usr/lib -L$PLATFORM/usr/lib -nostdlib -lc -lm -ldl -llog" \
  --enable-zlib \
  --disable-doc \
  ${MODULES}

  make clean
  find ./compat -name 'strtod.[d|o]' -exec rm {} \;
  make
  make install
}

build_mips


echo Android MIPS builds finished
