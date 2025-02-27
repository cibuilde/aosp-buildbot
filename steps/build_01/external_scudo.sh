
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

echo "Preparing for external/scudo"

clone_depth_platform bionic
clone_depth_platform external/scudo
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media


echo "building libscudo^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libscudo,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/scudo/libscudo^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/scudo/libscudo^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_recovery_x86_64_static/addition_copy_files.output

echo "building libscudo^android_vendor_ramdisk_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libscudo,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/scudo/libscudo^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_vendor_ramdisk_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/scudo/libscudo^android_vendor_ramdisk_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_vendor_ramdisk_x86_64_static $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_vendor_ramdisk_x86_64_static/addition_copy_files.output

echo "building libscudo^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libscudo,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/scudo/libscudo^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/scudo/libscudo^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_64_static/addition_copy_files.output

echo "building libscudo^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libscudo,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/scudo/libscudo^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/scudo/libscudo^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_64_static_apex10000/addition_copy_files.output

echo "building libscudo^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libscudo,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/scudo/libscudo^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/scudo/libscudo^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_x86_64_static/addition_copy_files.output

echo "building libscudo^android_x86_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libscudo,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/scudo/libscudo^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/scudo/libscudo^android_x86_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_x86_64_static_apex10000/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_scudo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/scudo/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 external_scudo.tar.zst --clobber

du -ah -d1 external_scudo*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_scudo.tar.zst" ]; then
  echo "Compressing external/scudo -> external_scudo.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_scudo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/scudo/ .
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
