set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform external/boringssl
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform prebuilts/go/linux-x86
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media


echo "building bcm_object^android_recovery_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bcm_object,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bcm_object^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_recovery_x86_64

echo "building bcm_object^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bcm_object,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bcm_object^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_vendor.31_x86_64

echo "building bcm_object^android_vendor.31_x86_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bcm_object,android_vendor.31_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_vendor.31_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bcm_object^android_vendor.31_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_vendor.31_x86_x86_64

echo "building bcm_object^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bcm_object,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bcm_object^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_64

echo "building bcm_object^android_x86_64_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bcm_object,android_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bcm_object^android_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_64_apex10000

echo "building bcm_object^android_x86_64_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bcm_object,android_x86_64_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_64_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bcm_object^android_x86_64_apex29.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_64_apex29

echo "building bcm_object^android_x86_64_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bcm_object,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bcm_object^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_64_apex31

echo "building bcm_object^android_x86_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bcm_object,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bcm_object^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_x86_64

echo "building bcm_object^android_x86_x86_64_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bcm_object,android_x86_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bcm_object^android_x86_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_x86_64_apex10000

echo "building bcm_object^android_x86_x86_64_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bcm_object,android_x86_x86_64_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_x86_64_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bcm_object^android_x86_x86_64_apex29.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_x86_64_apex29

echo "building bcm_object^android_x86_x86_64_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bcm_object,android_x86_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bcm_object^android_x86_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^android_x86_x86_64_apex31

echo "building bcm_object^linux_glibc_x86"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bcm_object,linux_glibc_x86
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^linux_glibc_x86
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bcm_object^linux_glibc_x86.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^linux_glibc_x86

echo "building bcm_object^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bcm_object,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bcm_object^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^linux_glibc_x86_64

echo "building bssl_ar^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bssl_ar,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bssl_ar^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bssl_ar^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bssl_ar^linux_glibc_x86_64

echo "building bssl_fipscommon^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bssl_fipscommon,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bssl_fipscommon^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bssl_fipscommon^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bssl_fipscommon^linux_glibc_x86_64

echo "building bssl_inject_hash^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bssl_inject_hash,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bssl_inject_hash^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/bssl_inject_hash^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bssl_inject_hash^linux_glibc_x86_64

echo "building libcrypto^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcrypto,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/libcrypto^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^linux_glibc_x86_64_static

echo "building libcrypto^linux_glibc_x86_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcrypto,linux_glibc_x86_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^linux_glibc_x86_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/libcrypto^linux_glibc_x86_static.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^linux_glibc_x86_static

echo "building libcrypto_static^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcrypto_static,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto_static^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/libcrypto_static^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto_static^android_x86_64_static

echo "building libcrypto_static^android_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcrypto_static,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto_static^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/libcrypto_static^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto_static^android_x86_64_static_apex30

echo "building libcrypto_static^android_x86_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcrypto_static,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto_static^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/libcrypto_static^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto_static^android_x86_x86_64_static_apex30

echo "building libcrypto_static^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcrypto_static,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto_static^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/libcrypto_static^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto_static^linux_glibc_x86_64_static

echo "building libssl^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libssl,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/libssl^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_recovery_x86_64_static

echo "building libssl^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libssl,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/libssl^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_64_static

echo "building libssl^android_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libssl,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/libssl^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_64_static_apex10000

echo "building libssl^android_x86_64_static_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libssl,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/libssl^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_64_static_apex29

echo "building libssl^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libssl,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/libssl^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_x86_64_static

echo "building libssl^android_x86_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libssl,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/libssl^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_x86_64_static_apex10000

echo "building libssl^android_x86_x86_64_static_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libssl,android_x86_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/libssl^android_x86_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_x86_64_static_apex29

echo "building libssl^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libssl,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/boringssl/libssl^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^linux_glibc_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/boringssl/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 external_boringssl.tar.zst --clobber

du -ah -d1 external_boringssl*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/go/linux-x86 -> prebuilts_go_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi

rm -rf aosp
