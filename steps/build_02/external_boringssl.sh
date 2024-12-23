set -e

df -h

cd $GITHUB_WORKSPACE/
gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_boringssl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_boringssl.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/boringssl/
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^linux_glibc_x86/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_boringssl.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/boringssl/
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^linux_glibc_x86_64/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_boringssl.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/boringssl/
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/boringssl/bssl_ar^linux_glibc_x86_64/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_boringssl.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/boringssl/
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/boringssl/bssl_fipscommon^linux_glibc_x86_64/ .

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/boringssl
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/go/linux-x86
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

echo "building bssl_inject_hash^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja bssl_inject_hash,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/bssl_inject_hash^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/external/boringssl/bssl_inject_hash^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/bssl_inject_hash^linux_glibc_x86_64

echo "building libcrypto^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libcrypto,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/external/boringssl/libcrypto^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^linux_glibc_x86_64_static

echo "building libcrypto^linux_glibc_x86_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libcrypto,linux_glibc_x86_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^linux_glibc_x86_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/external/boringssl/libcrypto^linux_glibc_x86_static.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^linux_glibc_x86_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_boringssl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/boringssl/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 external_boringssl.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/go/linux-x86 -> prebuilts_go_linux-x86.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
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
