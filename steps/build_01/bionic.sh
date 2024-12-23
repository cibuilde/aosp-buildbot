set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/gwp_asan
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/clang-tools linux-x86/bin linux-x86/lib64/clang
clone_depth_platform prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9
clone_depth_platform prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding


echo "building common_libc^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja common_libc,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/common_libc^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/common_libc^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/common_libc^

echo "building crtbrand^android_product.31_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtbrand,android_product.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_product.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtbrand^android_product.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_product.31_x86_64

echo "building crtbrand^android_recovery_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtbrand,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtbrand^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_recovery_x86_64

echo "building crtbrand^android_vendor.31_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtbrand,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtbrand^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_vendor.31_x86_64

echo "building crtbrand^android_vendor.31_x86_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtbrand,android_vendor.31_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_vendor.31_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtbrand^android_vendor.31_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_vendor.31_x86_x86_64

echo "building crtbrand^android_vendor_ramdisk_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtbrand,android_vendor_ramdisk_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_vendor_ramdisk_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtbrand^android_vendor_ramdisk_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_vendor_ramdisk_x86_64

echo "building crtbrand^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtbrand,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtbrand^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64

echo "building crtbrand^android_x86_64_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtbrand,android_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtbrand^android_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_apex10000

echo "building crtbrand^android_x86_64_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtbrand,android_x86_64_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtbrand^android_x86_64_apex29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_apex29

echo "building crtbrand^android_x86_64_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtbrand,android_x86_64_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtbrand^android_x86_64_apex30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_apex30

echo "building crtbrand^android_x86_64_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtbrand,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtbrand^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_apex31

echo "building crtbrand^android_x86_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtbrand,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtbrand^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_x86_64

echo "building crtbrand^android_x86_x86_64_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtbrand,android_x86_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtbrand^android_x86_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_x86_64_apex10000

echo "building crtbrand^android_x86_x86_64_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtbrand,android_x86_x86_64_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_x86_64_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtbrand^android_x86_x86_64_apex29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_x86_64_apex29

echo "building crtbrand^android_x86_x86_64_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtbrand,android_x86_x86_64_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_x86_64_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtbrand^android_x86_x86_64_apex30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_x86_64_apex30

echo "building crtbrand^android_x86_x86_64_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtbrand,android_x86_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtbrand^android_x86_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_x86_64_apex31

echo "building crtend_android^android_product.31_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_android,android_product.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_product.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_android^android_product.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_product.31_x86_64

echo "building crtend_android^android_recovery_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_android,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_android^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_recovery_x86_64

echo "building crtend_android^android_vendor.31_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_android,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_android^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_vendor.31_x86_64

echo "building crtend_android^android_vendor.31_x86_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_android,android_vendor.31_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_vendor.31_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_android^android_vendor.31_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_vendor.31_x86_x86_64

echo "building crtend_android^android_vendor_ramdisk_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_android,android_vendor_ramdisk_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_vendor_ramdisk_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_android^android_vendor_ramdisk_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_vendor_ramdisk_x86_64

echo "building crtend_android^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_android,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_android^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_64

echo "building crtend_android^android_x86_64_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_android,android_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_android^android_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_64_apex10000

echo "building crtend_android^android_x86_64_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_android,android_x86_64_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_64_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_android^android_x86_64_apex29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_64_apex29

echo "building crtend_android^android_x86_64_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_android,android_x86_64_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_64_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_android^android_x86_64_apex30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_64_apex30

echo "building crtend_android^android_x86_64_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_android,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_android^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_64_apex31

echo "building crtend_android^android_x86_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_android,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_android^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_x86_64

echo "building crtend_android^android_x86_x86_64_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_android,android_x86_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_android^android_x86_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_x86_64_apex10000

echo "building crtend_android^android_x86_x86_64_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_android,android_x86_x86_64_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_x86_64_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_android^android_x86_x86_64_apex29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_x86_64_apex29

echo "building crtend_android^android_x86_x86_64_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_android,android_x86_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_android^android_x86_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_x86_64_apex31

echo "building crtend_so^android_product.31_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_so,android_product.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_product.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_so^android_product.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_product.31_x86_64

echo "building crtend_so^android_recovery_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_so,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_so^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_recovery_x86_64

echo "building crtend_so^android_vendor.31_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_so,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_so^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_vendor.31_x86_64

echo "building crtend_so^android_vendor.31_x86_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_so,android_vendor.31_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_vendor.31_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_so^android_vendor.31_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_vendor.31_x86_x86_64

echo "building crtend_so^android_vendor_ramdisk_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_so,android_vendor_ramdisk_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_vendor_ramdisk_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_so^android_vendor_ramdisk_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_vendor_ramdisk_x86_64

echo "building crtend_so^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_so,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_so^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64

echo "building crtend_so^android_x86_64_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_so,android_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_so^android_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_apex10000

echo "building crtend_so^android_x86_64_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_so,android_x86_64_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_so^android_x86_64_apex29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_apex29

echo "building crtend_so^android_x86_64_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_so,android_x86_64_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_so^android_x86_64_apex30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_apex30

echo "building crtend_so^android_x86_64_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_so,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_so^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_apex31

echo "building crtend_so^android_x86_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_so,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_so^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64

echo "building crtend_so^android_x86_x86_64_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_so,android_x86_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_so^android_x86_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64_apex10000

echo "building crtend_so^android_x86_x86_64_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_so,android_x86_x86_64_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_so^android_x86_x86_64_apex29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64_apex29

echo "building crtend_so^android_x86_x86_64_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_so,android_x86_x86_64_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_so^android_x86_x86_64_apex30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64_apex30

echo "building crtend_so^android_x86_x86_64_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja crtend_so,android_x86_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/crtend_so^android_x86_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64_apex31

echo "building ld-android^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja ld-android,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/ld-android^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_recovery_x86_64_static

echo "building ld-android^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja ld-android,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/ld-android^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_vendor_ramdisk_x86_64_static

echo "building ld-android^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja ld-android,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/ld-android^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_64_static

echo "building ld-android^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja ld-android,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/ld-android^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_64_static_apex10000

echo "building ld-android^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja ld-android,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/ld-android^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_x86_64_static

echo "building ld-android^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja ld-android,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/ld-android^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_x86_64_static_apex10000

echo "building ldd^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja ldd,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/ldd^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/ldd^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/ldd^android_x86_64

echo "building libasync_safe^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libasync_safe,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libasync_safe^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_native_bridge_arm64_armv8-a_static

echo "building libasync_safe^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libasync_safe,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libasync_safe^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_native_bridge_arm_armv7-a-neon_static

echo "building libasync_safe^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libasync_safe,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libasync_safe^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_recovery_x86_64_static

echo "building libasync_safe^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libasync_safe,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libasync_safe^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_vendor.31_x86_64_static

echo "building libasync_safe^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libasync_safe,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libasync_safe^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_vendor.31_x86_x86_64_static

echo "building libasync_safe^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libasync_safe,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libasync_safe^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_vendor_ramdisk_x86_64_static

echo "building libasync_safe^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libasync_safe,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libasync_safe^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_64_static

echo "building libasync_safe^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libasync_safe,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libasync_safe^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_64_static_apex10000

echo "building libasync_safe^android_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libasync_safe,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libasync_safe^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_64_static_apex31

echo "building libasync_safe^android_x86_64_static_lto-thin"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libasync_safe,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libasync_safe^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_64_static_lto-thin

echo "building libasync_safe^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libasync_safe,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libasync_safe^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static

echo "building libasync_safe^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libasync_safe,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libasync_safe^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static_apex10000

echo "building libasync_safe^android_x86_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libasync_safe,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libasync_safe^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static_apex31

echo "building libasync_safe^android_x86_x86_64_static_lto-thin"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libasync_safe,android_x86_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libasync_safe^android_x86_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static_lto-thin

echo "building libc_aeabi^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_aeabi,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_aeabi^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_aeabi^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_aeabi^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_asm_arm64^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_asm_arm64,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_asm_arm64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_asm_arm64^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_asm_arm64^

echo "building libc_asm_arm^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_asm_arm,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_asm_arm^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_asm_arm^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_asm_arm^

echo "building libc_asm_x86^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_asm_x86,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_asm_x86^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_asm_x86^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_asm_x86^

echo "building libc_asm_x86_64^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_asm_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_asm_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_asm_x86_64^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_asm_x86_64^

echo "building libc_bionic^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_native_bridge_arm64_armv8-a_static

echo "building libc_bionic^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_bionic^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_recovery_x86_64_static

echo "building libc_bionic^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_vendor_ramdisk_x86_64_static

echo "building libc_bionic^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_x86_64_static

echo "building libc_bionic^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_x86_64_static_apex10000

echo "building libc_bionic^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_x86_x86_64_static

echo "building libc_bionic^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_x86_x86_64_static_apex10000

echo "building libc_bionic_systrace^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic_systrace,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic_systrace^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_native_bridge_arm64_armv8-a_static

echo "building libc_bionic_systrace^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic_systrace,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic_systrace^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_bionic_systrace^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic_systrace,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic_systrace^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_recovery_x86_64_static

echo "building libc_bionic_systrace^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic_systrace,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic_systrace^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_vendor_ramdisk_x86_64_static

echo "building libc_bionic_systrace^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic_systrace,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic_systrace^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_x86_64_static

echo "building libc_bionic_systrace^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic_systrace,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic_systrace^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_x86_64_static_apex10000

echo "building libc_bionic_systrace^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic_systrace,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic_systrace^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_x86_x86_64_static

echo "building libc_bionic_systrace^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bionic_systrace,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bionic_systrace^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_x86_x86_64_static_apex10000

echo "building libc_bootstrap^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bootstrap,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bootstrap^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_native_bridge_arm64_armv8-a_static

echo "building libc_bootstrap^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bootstrap,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bootstrap^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_bootstrap^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bootstrap,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bootstrap^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_recovery_x86_64_static

echo "building libc_bootstrap^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bootstrap,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bootstrap^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_vendor_ramdisk_x86_64_static

echo "building libc_bootstrap^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bootstrap,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bootstrap^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_x86_64_static

echo "building libc_bootstrap^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bootstrap,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bootstrap^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_x86_64_static_apex10000

echo "building libc_bootstrap^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bootstrap,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bootstrap^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_x86_x86_64_static

echo "building libc_bootstrap^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_bootstrap,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_bootstrap^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_x86_x86_64_static_apex10000

echo "building libc_dns^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_dns,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_dns^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_native_bridge_arm64_armv8-a_static

echo "building libc_dns^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_dns,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_dns^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_dns^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_dns,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_dns^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_recovery_x86_64_static

echo "building libc_dns^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_dns,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_dns^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_vendor_ramdisk_x86_64_static

echo "building libc_dns^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_dns,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_dns^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_x86_64_static

echo "building libc_dns^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_dns,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_dns^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_x86_64_static_apex10000

echo "building libc_dns^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_dns,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_dns^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_x86_x86_64_static

echo "building libc_dns^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_dns,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_dns^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_x86_x86_64_static_apex10000

echo "building libc_dynamic_dispatch^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_dynamic_dispatch,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_dynamic_dispatch^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_recovery_x86_64_static

echo "building libc_dynamic_dispatch^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_dynamic_dispatch,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_dynamic_dispatch^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_vendor_ramdisk_x86_64_static

echo "building libc_dynamic_dispatch^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_dynamic_dispatch,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_dynamic_dispatch^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_x86_64_static

echo "building libc_dynamic_dispatch^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_dynamic_dispatch,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_dynamic_dispatch^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_x86_64_static_apex10000

echo "building libc_dynamic_dispatch^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_dynamic_dispatch,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_dynamic_dispatch^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_x86_x86_64_static

echo "building libc_dynamic_dispatch^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_dynamic_dispatch,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_dynamic_dispatch^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_x86_x86_64_static_apex10000

echo "building libc_fortify^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_fortify,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_fortify^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_native_bridge_arm64_armv8-a_static

echo "building libc_fortify^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_fortify,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_fortify^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_fortify^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_fortify,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_fortify^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_recovery_x86_64_static

echo "building libc_fortify^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_fortify,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_fortify^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_vendor_ramdisk_x86_64_static

echo "building libc_fortify^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_fortify,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_fortify^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_x86_64_static

echo "building libc_fortify^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_fortify,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_fortify^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_x86_64_static_apex10000

echo "building libc_fortify^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_fortify,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_fortify^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_x86_x86_64_static

echo "building libc_fortify^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_fortify,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_fortify^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_x86_x86_64_static_apex10000

echo "building libc_freebsd^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_native_bridge_arm64_armv8-a_static

echo "building libc_freebsd^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_freebsd^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_recovery_x86_64_static

echo "building libc_freebsd^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_vendor_ramdisk_x86_64_static

echo "building libc_freebsd^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_x86_64_static

echo "building libc_freebsd^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_x86_64_static_apex10000

echo "building libc_freebsd^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_x86_x86_64_static

echo "building libc_freebsd^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_x86_x86_64_static_apex10000

echo "building libc_freebsd_large_stack^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd_large_stack,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd_large_stack^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_native_bridge_arm64_armv8-a_static

echo "building libc_freebsd_large_stack^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd_large_stack,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd_large_stack^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_freebsd_large_stack^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd_large_stack,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd_large_stack^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_recovery_x86_64_static

echo "building libc_freebsd_large_stack^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd_large_stack,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd_large_stack^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_vendor_ramdisk_x86_64_static

echo "building libc_freebsd_large_stack^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd_large_stack,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd_large_stack^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_x86_64_static

echo "building libc_freebsd_large_stack^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd_large_stack,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd_large_stack^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_x86_64_static_apex10000

echo "building libc_freebsd_large_stack^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd_large_stack,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd_large_stack^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_x86_x86_64_static

echo "building libc_freebsd_large_stack^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_freebsd_large_stack,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_freebsd_large_stack^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_x86_x86_64_static_apex10000

echo "building libc_gdtoa^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_gdtoa,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_gdtoa^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_native_bridge_arm64_armv8-a_static

echo "building libc_gdtoa^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_gdtoa,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_gdtoa^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_gdtoa^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_gdtoa,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_gdtoa^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_recovery_x86_64_static

echo "building libc_gdtoa^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_gdtoa,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_gdtoa^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_vendor_ramdisk_x86_64_static

echo "building libc_gdtoa^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_gdtoa,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_gdtoa^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_x86_64_static

echo "building libc_gdtoa^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_gdtoa,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_gdtoa^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_x86_64_static_apex10000

echo "building libc_gdtoa^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_gdtoa,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_gdtoa^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_x86_x86_64_static

echo "building libc_gdtoa^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_gdtoa,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_gdtoa^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_x86_x86_64_static_apex10000

echo "building libc_init_dynamic^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_init_dynamic,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_dynamic^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_init_dynamic^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_dynamic^android_recovery_x86_64_static

echo "building libc_init_dynamic^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_init_dynamic,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_dynamic^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_init_dynamic^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_dynamic^android_vendor_ramdisk_x86_64_static

echo "building libc_init_dynamic^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_init_dynamic,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_dynamic^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_init_dynamic^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_dynamic^android_x86_64_static

echo "building libc_init_dynamic^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_init_dynamic,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_dynamic^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_init_dynamic^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_dynamic^android_x86_64_static_apex10000

echo "building libc_init_dynamic^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_init_dynamic,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_dynamic^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_init_dynamic^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_dynamic^android_x86_x86_64_static

echo "building libc_init_dynamic^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_init_dynamic,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_dynamic^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_init_dynamic^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_dynamic^android_x86_x86_64_static_apex10000

echo "building libc_init_static^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_init_static,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_init_static^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_native_bridge_arm64_armv8-a_static

echo "building libc_init_static^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_init_static,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_init_static^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_init_static^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_init_static,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_init_static^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_recovery_x86_64_static

echo "building libc_init_static^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_init_static,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_init_static^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_vendor_ramdisk_x86_64_static

echo "building libc_init_static^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_init_static,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_init_static^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_x86_64_static

echo "building libc_init_static^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_init_static,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_init_static^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_x86_64_static_apex10000

echo "building libc_init_static^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_init_static,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_init_static^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_x86_x86_64_static

echo "building libc_init_static^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_init_static,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_init_static^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_x86_x86_64_static_apex10000

echo "building libc_kernel_android_scsi^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_kernel_android_scsi,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_kernel_android_scsi^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_kernel_android_scsi^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_kernel_android_scsi^

echo "building libc_kernel_android_uapi_linux^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_kernel_android_uapi_linux,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_kernel_android_uapi_linux^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_kernel_android_uapi_linux^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_kernel_android_uapi_linux^

echo "building libc_malloc_debug^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_malloc_debug,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_malloc_debug^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug^android_x86_64_static_apex10000

echo "building libc_malloc_debug^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_malloc_debug,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_malloc_debug^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug^android_x86_x86_64_static_apex10000

echo "building libc_malloc_hooks^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_malloc_hooks,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_hooks/libc_malloc_hooks^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_malloc_hooks^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_hooks/libc_malloc_hooks^android_x86_64_static_apex10000

echo "building libc_malloc_hooks^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_malloc_hooks,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_hooks/libc_malloc_hooks^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_malloc_hooks^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_hooks/libc_malloc_hooks^android_x86_x86_64_static_apex10000

echo "building libc_netbsd^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_netbsd,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_netbsd^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_native_bridge_arm64_armv8-a_static

echo "building libc_netbsd^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_netbsd,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_netbsd^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_netbsd^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_netbsd,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_netbsd^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_recovery_x86_64_static

echo "building libc_netbsd^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_netbsd,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_netbsd^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_vendor_ramdisk_x86_64_static

echo "building libc_netbsd^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_netbsd,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_netbsd^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_x86_64_static

echo "building libc_netbsd^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_netbsd,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_netbsd^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_x86_64_static_apex10000

echo "building libc_netbsd^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_netbsd,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_netbsd^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_x86_x86_64_static

echo "building libc_netbsd^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_netbsd,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_netbsd^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_x86_x86_64_static_apex10000

echo "building libc_openbsd^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_native_bridge_arm64_armv8-a_static

echo "building libc_openbsd^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_openbsd^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_recovery_x86_64_static

echo "building libc_openbsd^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_vendor_ramdisk_x86_64_static

echo "building libc_openbsd^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_x86_64_static

echo "building libc_openbsd^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_x86_64_static_apex10000

echo "building libc_openbsd^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_x86_x86_64_static

echo "building libc_openbsd^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_x86_x86_64_static_apex10000

echo "building libc_openbsd_large_stack^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_large_stack,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_large_stack^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_native_bridge_arm64_armv8-a_static

echo "building libc_openbsd_large_stack^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_large_stack,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_large_stack^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_openbsd_large_stack^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_large_stack,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_large_stack^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_recovery_x86_64_static

echo "building libc_openbsd_large_stack^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_large_stack,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_large_stack^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_vendor_ramdisk_x86_64_static

echo "building libc_openbsd_large_stack^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_large_stack,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_large_stack^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_x86_64_static

echo "building libc_openbsd_large_stack^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_large_stack,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_large_stack^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_x86_64_static_apex10000

echo "building libc_openbsd_large_stack^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_large_stack,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_large_stack^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_x86_x86_64_static

echo "building libc_openbsd_large_stack^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_large_stack,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_large_stack^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_x86_x86_64_static_apex10000

echo "building libc_openbsd_ndk^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_ndk,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_ndk^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_native_bridge_arm64_armv8-a_static

echo "building libc_openbsd_ndk^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_ndk,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_ndk^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_openbsd_ndk^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_ndk,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_ndk^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_recovery_x86_64_static

echo "building libc_openbsd_ndk^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_ndk,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_ndk^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_vendor_ramdisk_x86_64_static

echo "building libc_openbsd_ndk^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_ndk,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_ndk^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_x86_64_static

echo "building libc_openbsd_ndk^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_ndk,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_ndk^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_x86_64_static_apex10000

echo "building libc_openbsd_ndk^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_ndk,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_ndk^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_x86_x86_64_static

echo "building libc_openbsd_ndk^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_openbsd_ndk,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_openbsd_ndk^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_x86_x86_64_static_apex10000

echo "building libc_pthread^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_pthread,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_pthread^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_native_bridge_arm64_armv8-a_static

echo "building libc_pthread^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_pthread,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_pthread^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_pthread^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_pthread,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_pthread^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_recovery_x86_64_static

echo "building libc_pthread^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_pthread,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_pthread^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_vendor_ramdisk_x86_64_static

echo "building libc_pthread^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_pthread,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_pthread^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_x86_64_static

echo "building libc_pthread^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_pthread,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_pthread^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_x86_64_static_apex10000

echo "building libc_pthread^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_pthread,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_pthread^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_x86_x86_64_static

echo "building libc_pthread^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_pthread,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_pthread^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_x86_x86_64_static_apex10000

echo "building libc_static_dispatch^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_static_dispatch,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_static_dispatch^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_static_dispatch^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_static_dispatch^android_native_bridge_arm64_armv8-a_static

echo "building libc_static_dispatch^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_static_dispatch,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_static_dispatch^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_static_dispatch^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_static_dispatch^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_static_dispatch^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_static_dispatch,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_static_dispatch^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_static_dispatch^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_static_dispatch^android_x86_x86_64_static

echo "building libc_tzcode^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_tzcode,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_tzcode^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_native_bridge_arm64_armv8-a_static

echo "building libc_tzcode^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_tzcode,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_tzcode^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_tzcode^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_tzcode,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_tzcode^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_recovery_x86_64_static

echo "building libc_tzcode^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_tzcode,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_tzcode^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_vendor_ramdisk_x86_64_static

echo "building libc_tzcode^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_tzcode,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_tzcode^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_x86_64_static

echo "building libc_tzcode^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_tzcode,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_tzcode^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_x86_64_static_apex10000

echo "building libc_tzcode^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_tzcode,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_tzcode^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_x86_x86_64_static

echo "building libc_tzcode^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_tzcode,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_tzcode^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_x86_x86_64_static_apex10000

echo "building libc_uapi^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_uapi,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_uapi^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_uapi^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_uapi^

echo "building libc_unwind_static^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_unwind_static,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_unwind_static^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_native_bridge_arm64_armv8-a_static

echo "building libc_unwind_static^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_unwind_static,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_unwind_static^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_unwind_static^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_unwind_static,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_unwind_static^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_recovery_x86_64_static

echo "building libc_unwind_static^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_unwind_static,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_unwind_static^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_vendor_ramdisk_x86_64_static

echo "building libc_unwind_static^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_unwind_static,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_unwind_static^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_x86_64_static

echo "building libc_unwind_static^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_unwind_static,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_unwind_static^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_x86_64_static_apex10000

echo "building libc_unwind_static^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_unwind_static,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_unwind_static^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_x86_x86_64_static

echo "building libc_unwind_static^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libc_unwind_static,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libc_unwind_static^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_x86_x86_64_static_apex10000

echo "building libdl^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_native_bridge_arm64_armv8-a_static

echo "building libdl^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_native_bridge_arm_armv7-a-neon_static

echo "building libdl^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_static

echo "building libdl^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_static

echo "building libdl_android^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl_android,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl_android^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_recovery_x86_64_static

echo "building libdl_android^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl_android,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl_android^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_vendor_ramdisk_x86_64_static

echo "building libdl_android^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl_android,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl_android^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_64_static

echo "building libdl_android^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl_android,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl_android^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_64_static_apex10000

echo "building libdl_android^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl_android,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl_android^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_x86_64_static

echo "building libdl_android^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl_android,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl_android^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_x86_64_static_apex10000

echo "building libdl_static^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl_static,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_static^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl_static^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_static^android_recovery_x86_64_static

echo "building libdl_static^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl_static,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_static^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl_static^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_static^android_vendor_ramdisk_x86_64_static

echo "building libdl_static^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl_static,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_static^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl_static^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_static^android_x86_64_static

echo "building libdl_static^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl_static,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_static^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl_static^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_static^android_x86_64_static_apex10000

echo "building libdl_static^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl_static,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_static^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl_static^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_static^android_x86_x86_64_static

echo "building libdl_static^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdl_static,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_static^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libdl_static^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_static^android_x86_x86_64_static_apex10000

echo "building liblinker_main^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblinker_main,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_main^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/liblinker_main^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_main^android_recovery_x86_64_static

echo "building liblinker_main^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblinker_main,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_main^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/liblinker_main^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_main^android_vendor_ramdisk_x86_64_static

echo "building liblinker_main^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblinker_main,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_main^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/liblinker_main^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_main^android_x86_64_static

echo "building liblinker_main^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblinker_main,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_main^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/liblinker_main^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_main^android_x86_64_static_apex10000

echo "building liblinker_main^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblinker_main,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_main^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/liblinker_main^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_main^android_x86_x86_64_static

echo "building liblinker_main^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblinker_main,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_main^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/liblinker_main^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_main^android_x86_x86_64_static_apex10000

echo "building liblinker_malloc^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblinker_malloc,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_malloc^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/liblinker_malloc^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_malloc^android_recovery_x86_64_static

echo "building liblinker_malloc^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblinker_malloc,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_malloc^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/liblinker_malloc^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_malloc^android_vendor_ramdisk_x86_64_static

echo "building liblinker_malloc^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblinker_malloc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_malloc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/liblinker_malloc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_malloc^android_x86_64_static

echo "building liblinker_malloc^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblinker_malloc,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_malloc^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/liblinker_malloc^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_malloc^android_x86_64_static_apex10000

echo "building liblinker_malloc^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblinker_malloc,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_malloc^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/liblinker_malloc^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_malloc^android_x86_x86_64_static

echo "building liblinker_malloc^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblinker_malloc,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_malloc^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/liblinker_malloc^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/liblinker_malloc^android_x86_x86_64_static_apex10000

echo "building libseccomp_gen_syscall_nrs_arm64^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libseccomp_gen_syscall_nrs_arm64,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_arm64^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libseccomp_gen_syscall_nrs_arm64^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_arm64^android_x86_64

echo "building libseccomp_gen_syscall_nrs_arm64^android_x86_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libseccomp_gen_syscall_nrs_arm64,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_arm64^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libseccomp_gen_syscall_nrs_arm64^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_arm64^android_x86_x86_64

echo "building libseccomp_gen_syscall_nrs_arm^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libseccomp_gen_syscall_nrs_arm,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_arm^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libseccomp_gen_syscall_nrs_arm^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_arm^android_x86_64

echo "building libseccomp_gen_syscall_nrs_arm^android_x86_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libseccomp_gen_syscall_nrs_arm,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_arm^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libseccomp_gen_syscall_nrs_arm^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_arm^android_x86_x86_64

echo "building libseccomp_gen_syscall_nrs_x86^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libseccomp_gen_syscall_nrs_x86,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_x86^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libseccomp_gen_syscall_nrs_x86^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_x86^android_x86_64

echo "building libseccomp_gen_syscall_nrs_x86^android_x86_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libseccomp_gen_syscall_nrs_x86,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_x86^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libseccomp_gen_syscall_nrs_x86^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_x86^android_x86_x86_64

echo "building libseccomp_gen_syscall_nrs_x86_64^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libseccomp_gen_syscall_nrs_x86_64,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_x86_64^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libseccomp_gen_syscall_nrs_x86_64^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_x86_64^android_x86_64

echo "building libseccomp_gen_syscall_nrs_x86_64^android_x86_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libseccomp_gen_syscall_nrs_x86_64,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_x86_64^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libseccomp_gen_syscall_nrs_x86_64^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_gen_syscall_nrs_x86_64^android_x86_x86_64

echo "building libstdc++^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstdc++,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libstdc++^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_native_bridge_arm64_armv8-a_static

echo "building libstdc++^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstdc++,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libstdc++^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_native_bridge_arm_armv7-a-neon_static

echo "building libstdc++^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstdc++,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libstdc++^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_recovery_x86_64_static

echo "building libstdc++^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstdc++,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libstdc++^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_vendor_ramdisk_x86_64_static

echo "building libstdc++^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstdc++,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libstdc++^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_64_static

echo "building libstdc++^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstdc++,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libstdc++^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_64_static_apex10000

echo "building libstdc++^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstdc++,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libstdc++^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_x86_64_static

echo "building libstdc++^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstdc++,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bionic/libstdc++^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_x86_64_static_apex10000

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 bionic.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/art.tar.zst -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.zst -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_googletest.tar.zst -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_gwp_asan.tar.zst" ]; then
  echo "Compressing external/gwp_asan -> external_gwp_asan.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_gwp_asan.tar.zst -C $GITHUB_WORKSPACE/aosp/external/gwp_asan/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_zlib.tar.zst -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang-tools.tar.zst" ]; then
  echo "Compressing prebuilts/clang-tools -> prebuilts_clang-tools.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang-tools.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/clang-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 -> prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 -> prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.zst -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_libbase.tar.zst -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst" ]; then
  echo "Compressing system/libziparchive -> system_libziparchive.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst -C $GITHUB_WORKSPACE/aosp/system/libziparchive/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.zst -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.zst -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
