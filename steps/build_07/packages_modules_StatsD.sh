set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform frameworks/proto_logging
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/StatsD
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/api_levels^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-full^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/libstats_proto_host^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/stats-log-api-gen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/aidl/statsd-aidl-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .

echo "building libstatspull^android_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libstatspull,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/lib/libstatspull/libstatspull^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/StatsD/libstatspull^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/lib/libstatspull/libstatspull^android_x86_64_shared_current

echo "building libstatspull^android_x86_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libstatspull,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/lib/libstatspull/libstatspull^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/StatsD/libstatspull^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/lib/libstatspull/libstatspull^android_x86_x86_64_shared_current

echo "building libstatssocket^android_x86_64_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libstatssocket,android_x86_64_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_64_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/StatsD/libstatssocket^android_x86_64_shared_30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_64_shared_30

echo "building libstatssocket^android_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libstatssocket,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/StatsD/libstatssocket^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_64_shared_current

echo "building libstatssocket^android_x86_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libstatssocket,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/StatsD/libstatssocket^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_x86_64_shared_current

echo "building statsd-aidl-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja statsd-aidl-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/aidl/statsd-aidl-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/StatsD/statsd-aidl-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/aidl/statsd-aidl-ndk_platform^android_x86_64_static

echo "building statsd-aidl-ndk_platform^android_x86_64_static_com.android.os.statsd"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja statsd-aidl-ndk_platform,android_x86_64_static_com.android.os.statsd
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/aidl/statsd-aidl-ndk_platform^android_x86_64_static_com.android.os.statsd
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/StatsD/statsd-aidl-ndk_platform^android_x86_64_static_com.android.os.statsd.output . $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/aidl/statsd-aidl-ndk_platform^android_x86_64_static_com.android.os.statsd

echo "building statsd-aidl-ndk_platform^android_x86_x86_64_static_com.android.os.statsd"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja statsd-aidl-ndk_platform,android_x86_x86_64_static_com.android.os.statsd
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/aidl/statsd-aidl-ndk_platform^android_x86_x86_64_static_com.android.os.statsd
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/StatsD/statsd-aidl-ndk_platform^android_x86_x86_64_static_com.android.os.statsd.output . $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/aidl/statsd-aidl-ndk_platform^android_x86_x86_64_static_com.android.os.statsd

echo "building statslog-statsd-java-gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja statslog-statsd-java-gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/framework/statslog-statsd-java-gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/StatsD/statslog-statsd-java-gen^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/framework/statslog-statsd-java-gen^

echo "building statslog_statsd.cpp^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja statslog_statsd.cpp,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/statsd/statslog_statsd.cpp^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/StatsD/statslog_statsd.cpp^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/statsd/statslog_statsd.cpp^

echo "building statslog_statsd.h^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja statslog_statsd.h,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/statsd/statslog_statsd.h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/StatsD/statslog_statsd.h^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/statsd/statslog_statsd.h^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_StatsD.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 packages_modules_StatsD.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst" ]; then
  echo "Compressing frameworks/proto_logging -> frameworks_proto_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/proto_logging/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst" ]; then
  echo "Compressing packages/modules/StatsD -> packages_modules_StatsD.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/StatsD/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp