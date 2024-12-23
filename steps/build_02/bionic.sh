set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/gwp_asan
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common
clone_depth_platform prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9
clone_depth_platform prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_product.31_x86_64/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_recovery_x86_64/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_vendor.31_x86_64/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_vendor.31_x86_x86_64/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_vendor_ramdisk_x86_64/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_apex10000/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_apex29/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_apex30/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_apex31/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_x86_64/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_x86_64_apex10000/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_x86_64_apex29/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_x86_64_apex30/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_x86_64_apex31/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_recovery_x86_64_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_vendor_ramdisk_x86_64_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_64_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_64_static_apex10000/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_x86_64_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_x86_64_static_apex10000/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_arm-optimized-routines.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/libarm-optimized-routines-math^android_native_bridge_arm64_armv8-a_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_arm-optimized-routines.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/libarm-optimized-routines-math^android_native_bridge_arm_armv7-a-neon_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_arm-optimized-routines.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/libarm-optimized-routines-math^android_recovery_x86_64_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_arm-optimized-routines.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/libarm-optimized-routines-math^android_vendor_ramdisk_x86_64_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_arm-optimized-routines.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/libarm-optimized-routines-math^android_x86_64_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_arm-optimized-routines.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/libarm-optimized-routines-math^android_x86_64_static_apex10000/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_arm-optimized-routines.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/libarm-optimized-routines-math^android_x86_x86_64_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_arm-optimized-routines.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/libarm-optimized-routines-math^android_x86_x86_64_static_apex10000/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_native_bridge_arm64_armv8-a_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_native_bridge_arm_armv7-a-neon_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_recovery_x86_64_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_vendor_ramdisk_x86_64_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_64_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_64_static_apex10000/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_x86_64_static/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_x86_64_static_apex10000/ .

echo "building crtbegin_dynamic^android_product.31_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_dynamic,android_product.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_product.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_dynamic^android_product.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_product.31_x86_64

echo "building crtbegin_dynamic^android_recovery_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_dynamic,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_dynamic^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_recovery_x86_64

echo "building crtbegin_dynamic^android_vendor.31_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_dynamic,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_dynamic^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_vendor.31_x86_64

echo "building crtbegin_dynamic^android_vendor.31_x86_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_dynamic,android_vendor.31_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_vendor.31_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_dynamic^android_vendor.31_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_vendor.31_x86_x86_64

echo "building crtbegin_dynamic^android_vendor_ramdisk_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_dynamic,android_vendor_ramdisk_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_vendor_ramdisk_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_dynamic^android_vendor_ramdisk_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_vendor_ramdisk_x86_64

echo "building crtbegin_dynamic^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_dynamic,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_dynamic^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_64

echo "building crtbegin_dynamic^android_x86_64_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_dynamic,android_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_dynamic^android_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_64_apex10000

echo "building crtbegin_dynamic^android_x86_64_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_dynamic,android_x86_64_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_64_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_dynamic^android_x86_64_apex29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_64_apex29

echo "building crtbegin_dynamic^android_x86_64_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_dynamic,android_x86_64_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_64_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_dynamic^android_x86_64_apex30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_64_apex30

echo "building crtbegin_dynamic^android_x86_64_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_dynamic,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_dynamic^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_64_apex31

echo "building crtbegin_dynamic^android_x86_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_dynamic,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_dynamic^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_x86_64

echo "building crtbegin_dynamic^android_x86_x86_64_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_dynamic,android_x86_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_dynamic^android_x86_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_x86_64_apex10000

echo "building crtbegin_dynamic^android_x86_x86_64_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_dynamic,android_x86_x86_64_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_x86_64_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_dynamic^android_x86_x86_64_apex29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_x86_64_apex29

echo "building crtbegin_dynamic^android_x86_x86_64_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_dynamic,android_x86_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_dynamic^android_x86_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_dynamic^android_x86_x86_64_apex31

echo "building crtbegin_so^android_product.31_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_so,android_product.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_product.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_so^android_product.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_product.31_x86_64

echo "building crtbegin_so^android_recovery_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_so,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_so^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_recovery_x86_64

echo "building crtbegin_so^android_vendor.31_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_so,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_so^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_vendor.31_x86_64

echo "building crtbegin_so^android_vendor.31_x86_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_so,android_vendor.31_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_so^android_vendor.31_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64

echo "building crtbegin_so^android_vendor_ramdisk_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_so,android_vendor_ramdisk_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_vendor_ramdisk_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_so^android_vendor_ramdisk_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_vendor_ramdisk_x86_64

echo "building crtbegin_so^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_so,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_so^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64

echo "building crtbegin_so^android_x86_64_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_so,android_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_so^android_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_apex10000

echo "building crtbegin_so^android_x86_64_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_so,android_x86_64_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_so^android_x86_64_apex29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_apex29

echo "building crtbegin_so^android_x86_64_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_so,android_x86_64_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_so^android_x86_64_apex30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_apex30

echo "building crtbegin_so^android_x86_64_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_so,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_so^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_apex31

echo "building crtbegin_so^android_x86_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_so,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_so^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64

echo "building crtbegin_so^android_x86_x86_64_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_so,android_x86_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_so^android_x86_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64_apex10000

echo "building crtbegin_so^android_x86_x86_64_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_so,android_x86_x86_64_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_so^android_x86_x86_64_apex29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64_apex29

echo "building crtbegin_so^android_x86_x86_64_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_so,android_x86_x86_64_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_so^android_x86_x86_64_apex30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64_apex30

echo "building crtbegin_so^android_x86_x86_64_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_so,android_x86_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_so^android_x86_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64_apex31

echo "building crtbegin_static^android_recovery_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_static,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_static^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_static^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_static^android_recovery_x86_64

echo "building crtbegin_static^android_vendor_ramdisk_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_static,android_vendor_ramdisk_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_static^android_vendor_ramdisk_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_static^android_vendor_ramdisk_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_static^android_vendor_ramdisk_x86_64

echo "building crtbegin_static^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_static,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_static^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_static^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_static^android_x86_64

echo "building crtbegin_static^android_x86_64_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja crtbegin_static,android_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_static^android_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/crtbegin_static^android_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_static^android_x86_64_apex10000

echo "building ld-android^android_recovery_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja ld-android,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/ld-android^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_recovery_x86_64_shared

echo "building ld-android^android_vendor_ramdisk_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja ld-android,android_vendor_ramdisk_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_vendor_ramdisk_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/ld-android^android_vendor_ramdisk_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_vendor_ramdisk_x86_64_shared

echo "building ld-android^android_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja ld-android,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/ld-android^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_64_shared

echo "building ld-android^android_x86_64_shared_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja ld-android,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/ld-android^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_64_shared_apex10000

echo "building ld-android^android_x86_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja ld-android,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/ld-android^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_x86_64_shared

echo "building ld-android^android_x86_x86_64_shared_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja ld-android,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/ld-android^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/ld-android^android_x86_x86_64_shared_apex10000

echo "building libm^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libm,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libm^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_native_bridge_arm64_armv8-a_static

echo "building libm^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libm,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libm^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_native_bridge_arm_armv7-a-neon_static

echo "building libm^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libm,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libm^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_recovery_x86_64_static

echo "building libm^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libm,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libm^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor_ramdisk_x86_64_static

echo "building libm^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libm,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libm^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_static

echo "building libm^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libm,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libm^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_static_apex10000

echo "building libm^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libm,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libm^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_static

echo "building libm^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libm,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libm^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_static_apex10000

echo "building libsystemproperties^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libsystemproperties,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libsystemproperties^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_native_bridge_arm64_armv8-a_static

echo "building libsystemproperties^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libsystemproperties,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libsystemproperties^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_native_bridge_arm_armv7-a-neon_static

echo "building libsystemproperties^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libsystemproperties,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libsystemproperties^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_recovery_x86_64_static

echo "building libsystemproperties^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libsystemproperties,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libsystemproperties^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_vendor_ramdisk_x86_64_static

echo "building libsystemproperties^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libsystemproperties,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libsystemproperties^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_x86_64_static

echo "building libsystemproperties^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libsystemproperties,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libsystemproperties^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_x86_64_static_apex10000

echo "building libsystemproperties^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libsystemproperties,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libsystemproperties^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_x86_x86_64_static

echo "building libsystemproperties^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libsystemproperties,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/bionic/libsystemproperties^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_x86_x86_64_static_apex10000

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 bionic.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.zst -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/build_soong.tar.zst -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_gwp_asan.tar.zst" ]; then
  echo "Compressing external/gwp_asan -> external_gwp_asan.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_gwp_asan.tar.zst -C $GITHUB_WORKSPACE/aosp/external/gwp_asan/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.zst -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.zst -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
