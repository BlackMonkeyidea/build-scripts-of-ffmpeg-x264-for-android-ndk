# build-scripts-of-ffmpeg-x264-with-android-ndk

[TOC]

ffmpeg build scripts with android ndk (including x264) in **Ubuntu 16.04LTS 64bit / Linux 4.4.0-47-generic**

## 1. Download x264 and ffmpeg
**x264**
```shell
git clone http://git.videolan.org/git/x264.git
```
**ffmpeg**
```shell
git clone git://source.ffmpeg.org/ffmpeg.git
```
## 2. Setup envirnment
```shell
export ANDROID_NDK_HOME=XXXXXXX # Your android ndk path
```
## 3. Download build scripts
```shell
git clone https://github.com/x13945/build-scripts-of-ffmpeg-x264-for-android-ndk.git
```
## 4. Compile x264
### 1. Copy build scripts into x264 folder
```shell
cp build-scripts-of-ffmpeg-x264-for-android-ndk-master/x264/* x264/
```
### 2. Compile
Those scripts target for different arch, so you can use them as you need. For example build all arch is:
```shell
./build_android_all.sh
```
### 3. Result
Result like this:
```shell
$ tree -f android 
android
├── android/arm
│   ├── android/arm/bin
│   │   └── android/arm/bin/x264
│   ├── android/arm/include
│   │   ├── android/arm/include/x264_config.h
│   │   └── android/arm/include/x264.h
│   └── android/arm/lib
│       ├── android/arm/lib/libx264.a
│       └── android/arm/lib/pkgconfig
│           └── android/arm/lib/pkgconfig/x264.pc
├── android/arm64
│   ├── android/arm64/bin
│   │   └── android/arm64/bin/x264
│   ├── android/arm64/include
│   │   ├── android/arm64/include/x264_config.h
│   │   └── android/arm64/include/x264.h
│   └── android/arm64/lib
│       ├── android/arm64/lib/libx264.a
│       └── android/arm64/lib/pkgconfig
│           └── android/arm64/lib/pkgconfig/x264.pc
├── android/mips
│   ├── android/mips/bin
│   │   └── android/mips/bin/x264
│   ├── android/mips/include
│   │   ├── android/mips/include/x264_config.h
│   │   └── android/mips/include/x264.h
│   └── android/mips/lib
│       ├── android/mips/lib/libx264.a
│       └── android/mips/lib/pkgconfig
│           └── android/mips/lib/pkgconfig/x264.pc
├── android/x86
│   ├── android/x86/bin
│   │   └── android/x86/bin/x264
│   ├── android/x86/include
│   │   ├── android/x86/include/x264_config.h
│   │   └── android/x86/include/x264.h
│   └── android/x86/lib
│       ├── android/x86/lib/libx264.a
│       └── android/x86/lib/pkgconfig
│           └── android/x86/lib/pkgconfig/x264.pc
└── android/x86_64
    ├── android/x86_64/bin
    │   └── android/x86_64/bin/x264
    ├── android/x86_64/include
    │   ├── android/x86_64/include/x264_config.h
    │   └── android/x86_64/include/x264.h
    └── android/x86_64/lib
        ├── android/x86_64/lib/libx264.a
        └── android/x86_64/lib/pkgconfig
            └── android/x86_64/lib/pkgconfig/x264.pc

25 directories, 25 files
```
## 4. Compile ffmpeg
### 1. Copy build scripts into ffmpeg folder
```shell
cp build-scripts-of-ffmpeg-x264-for-android-ndk-master/ffmpeg/* ffmpeg/
```
### 2. Compile
Those scripts target for different arch, so you can use them as you need. For example build all arch is:
```shell
./build_android_all.sh
```
### 3. Result
Result like this:
```shell
$ tree -f -L 2 android
android
├── android/arm64-v8a
│   ├── android/arm64-v8a/bin
│   ├── android/arm64-v8a/include
│   ├── android/arm64-v8a/lib
│   └── android/arm64-v8a/share
├── android/armeabi
│   ├── android/armeabi/bin
│   ├── android/armeabi/include
│   ├── android/armeabi/lib
│   └── android/armeabi/share
├── android/armeabi-v7a
│   ├── android/armeabi-v7a/bin
│   ├── android/armeabi-v7a/include
│   ├── android/armeabi-v7a/lib
│   └── android/armeabi-v7a/share
└── android/x86
    ├── android/x86/bin
    ├── android/x86/include
    ├── android/x86/lib
    └── android/x86/share

20 directories, 0 files
```
> NOTE: In these .sh files to build ffmpeg, I delete the **strtod.[d|o]** manual after 'make clean'. If not, we may got a error to compile 32bit arch ffmpeg after build a 64bit ffmpeg.