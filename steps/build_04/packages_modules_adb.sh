set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform packages/modules/adb
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/protobuf/aprotoc^linux_glibc_x86_64/ .

echo "building libadb_protos^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_protos,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_recovery_x86_64_static

echo "building libadb_protos^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_protos,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_64_static

echo "building libadb_protos^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_protos,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_64_static_apex10000

echo "building libadb_protos^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_protos,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_x86_64_static

echo "building libadb_protos^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_protos,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_x86_64_static_apex10000

echo "building libapp_processes_protos_lite^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libapp_processes_protos_lite,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libapp_processes_protos_lite^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_recovery_x86_64_static

echo "building libapp_processes_protos_lite^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libapp_processes_protos_lite,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libapp_processes_protos_lite^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_x86_64_static

echo "building libapp_processes_protos_lite^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libapp_processes_protos_lite,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libapp_processes_protos_lite^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_x86_64_static_apex10000

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ packages_modules_adb.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/adb/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 packages_modules_adb.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.zst -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_adb.tar.zst" ]; then
  echo "Compressing packages/modules/adb -> packages_modules_adb.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_adb.tar.zst -C $GITHUB_WORKSPACE/aosp/packages/modules/adb/ .
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
