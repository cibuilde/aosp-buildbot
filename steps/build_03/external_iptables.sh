set -e

echo "entering external/iptables"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform bionic
clone_depth_platform external/iptables
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .

echo "building libext4^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libext4,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext4^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext4^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4^android_x86_64_static/addition_copy_files.output

echo "building libext4_init^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libext4_init,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4_init^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext4_init^.output . $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4_init^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext4_init^.output $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4_init^ $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4_init^/addition_copy_files.output

echo "building libext4_srcs^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libext4_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext4_srcs^.output . $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4_srcs^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext4_srcs^.output $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4_srcs^ $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4_srcs^/addition_copy_files.output

echo "building libext6^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libext6,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext6^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext6^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6^android_x86_64_static/addition_copy_files.output

echo "building libext6_init^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libext6_init,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6_init^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext6_init^.output . $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6_init^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext6_init^.output $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6_init^ $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6_init^/addition_copy_files.output

echo "building libext6_srcs^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libext6_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext6_srcs^.output . $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6_srcs^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext6_srcs^.output $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6_srcs^ $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6_srcs^/addition_copy_files.output

echo "building libext^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libext,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext^android_x86_64_static/addition_copy_files.output

echo "building libext_init^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libext_init,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext_init^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext_init^.output . $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext_init^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext_init^.output $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext_init^ $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext_init^/addition_copy_files.output

echo "building libext_srcs^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libext_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext_srcs^.output . $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext_srcs^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/iptables/libext_srcs^.output $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext_srcs^ $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext_srcs^/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_iptables.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/iptables/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_iptables.tar.zst --clobber

du -ah -d1 external_iptables*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_iptables.tar.zst" ]; then
  echo "Compressing external/iptables -> external_iptables.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_iptables.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/iptables/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
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
