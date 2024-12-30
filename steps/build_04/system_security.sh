set -e

echo "entering system/security"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/hardware/interfaces
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/security
clone_depth_platform system/tools/aidl

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building android.security.apc-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.apc-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.apc-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-java-source^

echo "building android.security.apc-ndk_platform-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.apc-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.apc-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-ndk_platform-source^

echo "building android.security.apc-ndk_platform^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.apc-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.apc-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-ndk_platform^android_x86_64_static

echo "building android.security.apc-rust-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.apc-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.apc-rust-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-rust-source^

echo "building android.security.apc-rust^android_x86_64_source"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.apc-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.apc-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-rust^android_x86_64_source

echo "building android.security.authorization-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.authorization-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.authorization-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.authorization-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.authorization-java-source^

echo "building android.security.authorization-ndk_platform-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.authorization-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.authorization-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.authorization-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.authorization-ndk_platform-source^

echo "building android.security.authorization-rust-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.authorization-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.authorization-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.authorization-rust-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.authorization-rust-source^

echo "building android.security.authorization-rust^android_x86_64_source"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.authorization-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.authorization-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.authorization-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.authorization-rust^android_x86_64_source

echo "building android.security.compat-ndk_platform-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.compat-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.compat-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.compat-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.compat-ndk_platform-source^

echo "building android.security.compat-rust-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.compat-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.compat-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.compat-rust-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.compat-rust-source^

echo "building android.security.compat-rust^android_x86_64_source"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.compat-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.compat-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.compat-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.compat-rust^android_x86_64_source

echo "building android.security.legacykeystore-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.legacykeystore-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.legacykeystore-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-java-source^

echo "building android.security.legacykeystore-ndk_platform-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.legacykeystore-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.legacykeystore-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-ndk_platform-source^

echo "building android.security.legacykeystore-ndk_platform^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.legacykeystore-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.legacykeystore-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-ndk_platform^android_x86_64_static

echo "building android.security.legacykeystore-rust-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.legacykeystore-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.legacykeystore-rust-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-rust-source^

echo "building android.security.legacykeystore-rust^android_x86_64_source"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.legacykeystore-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.legacykeystore-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-rust^android_x86_64_source

echo "building android.security.maintenance-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.maintenance-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.maintenance-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.maintenance-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.maintenance-java-source^

echo "building android.security.maintenance-ndk_platform-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.maintenance-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.maintenance-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.maintenance-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.maintenance-ndk_platform-source^

echo "building android.security.maintenance-rust-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.maintenance-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.maintenance-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.maintenance-rust-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.maintenance-rust-source^

echo "building android.security.maintenance-rust^android_x86_64_source"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.maintenance-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.maintenance-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.maintenance-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.maintenance-rust^android_x86_64_source

echo "building android.security.metrics-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.metrics-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.metrics-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.metrics-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.metrics-java-source^

echo "building android.security.metrics-rust-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.metrics-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.metrics-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.metrics-rust-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.metrics-rust-source^

echo "building android.security.metrics-rust^android_x86_64_source"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.metrics-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.metrics-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.metrics-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.metrics-rust^android_x86_64_source

echo "building android.security.remoteprovisioning-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.remoteprovisioning-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.remoteprovisioning-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.remoteprovisioning-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.remoteprovisioning-java-source^

echo "building android.security.remoteprovisioning-rust-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.remoteprovisioning-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.remoteprovisioning-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.remoteprovisioning-rust-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.remoteprovisioning-rust-source^

echo "building android.security.remoteprovisioning-rust^android_x86_64_source"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.security.remoteprovisioning-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.remoteprovisioning-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/android.security.remoteprovisioning-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.remoteprovisioning-rust^android_x86_64_source

echo "building lib_odsign_proto^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja lib_odsign_proto,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/ondevice-signing/proto/lib_odsign_proto^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/security/lib_odsign_proto^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/security/ondevice-signing/proto/lib_odsign_proto^android_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_security.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/security/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 system_security.tar.zst --clobber

du -ah -d1 system_security*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst" ]; then
  echo "Compressing system/hardware/interfaces -> system_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_security.tar.zst" ]; then
  echo "Compressing system/security -> system_security.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_security.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/security/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi

rm -rf aosp
