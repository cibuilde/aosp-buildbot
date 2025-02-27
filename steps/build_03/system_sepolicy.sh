
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for system/sepolicy"

clone_depth_platform art
clone_depth_platform build/soong
clone_depth device/google/cuttlefish
clone_depth_platform external/pcre
clone_depth_platform external/selinux
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/sepolicy

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/libselinux/libselinux^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/libsepol/libsepol^linux_glibc_x86_64_static/ .

echo "building vendor_property_contexts^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja vendor_property_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_property_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/sepolicy/vendor_property_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_property_contexts^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/sepolicy/vendor_property_contexts^android_common.output $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_property_contexts^android_common $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_property_contexts^android_common/addition_copy_files.output

echo "building build_sepolicy^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja build_sepolicy,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/build/build_sepolicy^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/sepolicy/build_sepolicy^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/build/build_sepolicy^linux_glibc_x86_64_PY2
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/sepolicy/build_sepolicy^linux_glibc_x86_64_PY2.output $GITHUB_WORKSPACE/artifacts/system/sepolicy/build/build_sepolicy^linux_glibc_x86_64_PY2 $GITHUB_WORKSPACE/artifacts/system/sepolicy/build/build_sepolicy^linux_glibc_x86_64_PY2/addition_copy_files.output

echo "building check_prop_prefix^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja check_prop_prefix,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/tests/check_prop_prefix^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/sepolicy/check_prop_prefix^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/tests/check_prop_prefix^linux_glibc_x86_64_PY3
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/sepolicy/check_prop_prefix^linux_glibc_x86_64_PY3.output $GITHUB_WORKSPACE/artifacts/system/sepolicy/tests/check_prop_prefix^linux_glibc_x86_64_PY3 $GITHUB_WORKSPACE/artifacts/system/sepolicy/tests/check_prop_prefix^linux_glibc_x86_64_PY3/addition_copy_files.output

echo "building checkfc^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja checkfc,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/tools/checkfc^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/sepolicy/checkfc^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/tools/checkfc^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/sepolicy/checkfc^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/system/sepolicy/tools/checkfc^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/system/sepolicy/tools/checkfc^linux_glibc_x86_64/addition_copy_files.output

echo "building insertkeys.py^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja insertkeys.py,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/tools/insertkeys.py^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/sepolicy/insertkeys.py^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/tools/insertkeys.py^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/sepolicy/insertkeys.py^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/system/sepolicy/tools/insertkeys.py^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/system/sepolicy/tools/insertkeys.py^linux_glibc_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 system_sepolicy.tar.zst --clobber

du -ah -d1 system_sepolicy*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish -> device_google_cuttlefish.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_pcre.tar.zst" ]; then
  echo "Compressing external/pcre -> external_pcre.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_pcre.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/pcre/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_selinux.tar.zst" ]; then
  echo "Compressing external/selinux -> external_selinux.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_selinux.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/selinux/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst" ]; then
  echo "Compressing system/sepolicy -> system_sepolicy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/sepolicy/ .
fi


rm -rf aosp
