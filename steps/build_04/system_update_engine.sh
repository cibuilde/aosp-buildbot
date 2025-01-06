
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

echo "Preparing for system/update_engine"

clone_depth_platform bionic
clone_depth_platform external/brotli
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/libbrillo
clone_depth_platform external/libchrome
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/tools/aidl
clone_depth_platform system/update_engine

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libmojo_jni_registration_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libchrome-include^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building libpayload_extent_utils^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libpayload_extent_utils,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_utils^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libpayload_extent_utils^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_utils^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libpayload_extent_utils^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_utils^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_utils^android_recovery_x86_64_static/addition_copy_files.output

echo "building libpayload_extent_utils^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libpayload_extent_utils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_utils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libpayload_extent_utils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_utils^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libpayload_extent_utils^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_utils^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_utils^android_x86_64_static/addition_copy_files.output

echo "building libcow_operation_convert^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libcow_operation_convert,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/update_engine/libcow_operation_convert^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libcow_operation_convert^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/update_engine/libcow_operation_convert^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libcow_operation_convert^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/update_engine/libcow_operation_convert^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/update_engine/libcow_operation_convert^android_recovery_x86_64_static/addition_copy_files.output

echo "building libcow_operation_convert^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libcow_operation_convert,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/update_engine/libcow_operation_convert^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libcow_operation_convert^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/update_engine/libcow_operation_convert^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libcow_operation_convert^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/update_engine/libcow_operation_convert^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/update_engine/libcow_operation_convert^android_x86_64_static/addition_copy_files.output

echo "building update_metadata-protos^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja update_metadata-protos,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/update_engine/update_metadata-protos^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/update_metadata-protos^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/update_engine/update_metadata-protos^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/update_metadata-protos^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/update_engine/update_metadata-protos^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/update_engine/update_metadata-protos^android_recovery_x86_64_static/addition_copy_files.output

echo "building update_metadata-protos^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja update_metadata-protos,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/update_engine/update_metadata-protos^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/update_metadata-protos^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/update_engine/update_metadata-protos^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/update_metadata-protos^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/update_engine/update_metadata-protos^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/update_engine/update_metadata-protos^android_x86_64_static/addition_copy_files.output

echo "building libpayload_extent_ranges^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libpayload_extent_ranges,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_ranges^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libpayload_extent_ranges^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_ranges^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libpayload_extent_ranges^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_ranges^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_ranges^android_recovery_x86_64_static/addition_copy_files.output

echo "building libpayload_extent_ranges^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libpayload_extent_ranges,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_ranges^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libpayload_extent_ranges^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_ranges^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libpayload_extent_ranges^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_ranges^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/update_engine/libpayload_extent_ranges^android_x86_64_static/addition_copy_files.output

echo "building libupdate_engine_stable-V1-cpp-source^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libupdate_engine_stable-V1-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/update_engine/stable/libupdate_engine_stable-V1-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libupdate_engine_stable-V1-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/system/update_engine/stable/libupdate_engine_stable-V1-cpp-source^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libupdate_engine_stable-V1-cpp-source^.output $GITHUB_WORKSPACE/artifacts/system/update_engine/stable/libupdate_engine_stable-V1-cpp-source^ $GITHUB_WORKSPACE/artifacts/system/update_engine/stable/libupdate_engine_stable-V1-cpp-source^/addition_copy_files.output

echo "building libupdate_engine_stable-api^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libupdate_engine_stable-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/update_engine/stable/libupdate_engine_stable-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libupdate_engine_stable-api^.output . $GITHUB_WORKSPACE/artifacts/system/update_engine/stable/libupdate_engine_stable-api^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/update_engine/libupdate_engine_stable-api^.output $GITHUB_WORKSPACE/artifacts/system/update_engine/stable/libupdate_engine_stable-api^ $GITHUB_WORKSPACE/artifacts/system/update_engine/stable/libupdate_engine_stable-api^/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_update_engine.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/update_engine/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 system_update_engine.tar.zst --clobber

du -ah -d1 system_update_engine*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_brotli.tar.zst" ]; then
  echo "Compressing external/brotli -> external_brotli.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_brotli.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/brotli/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_googletest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libbrillo.tar.zst" ]; then
  echo "Compressing external/libbrillo -> external_libbrillo.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libbrillo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libbrillo/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libchrome.tar.zst" ]; then
  echo "Compressing external/libchrome -> external_libchrome.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libchrome.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libchrome/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_update_engine.tar.zst" ]; then
  echo "Compressing system/update_engine -> system_update_engine.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_update_engine.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/update_engine/ .
fi


rm -rf aosp
