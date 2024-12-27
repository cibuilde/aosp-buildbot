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
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsparse/libsparse^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_static/ .

echo "building generated_stub_builtin_function_map^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja generated_stub_builtin_function_map,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/init/generated_stub_builtin_function_map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/core/generated_stub_builtin_function_map^.output . $GITHUB_WORKSPACE/artifacts/system/core/init/generated_stub_builtin_function_map^

echo "building img2simg^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja img2simg,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsparse/img2simg^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/core/img2simg^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/libsparse/img2simg^linux_glibc_x86_64

echo "building libtombstone_proto^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtombstone_proto,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/proto/libtombstone_proto^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/core/libtombstone_proto^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/proto/libtombstone_proto^android_recovery_x86_64_static

echo "building libtombstone_proto^android_vendor_ramdisk_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtombstone_proto,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/proto/libtombstone_proto^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/core/libtombstone_proto^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/proto/libtombstone_proto^android_vendor_ramdisk_x86_64_static

echo "building libtombstone_proto^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtombstone_proto,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/proto/libtombstone_proto^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/core/libtombstone_proto^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/proto/libtombstone_proto^android_x86_64_static

echo "building libtombstone_proto^android_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtombstone_proto,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/proto/libtombstone_proto^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/core/libtombstone_proto^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/proto/libtombstone_proto^android_x86_64_static_apex10000

echo "building libtombstone_proto^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtombstone_proto,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/proto/libtombstone_proto^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/core/libtombstone_proto^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/proto/libtombstone_proto^android_x86_x86_64_static

echo "building libtombstone_proto^android_x86_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtombstone_proto,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/proto/libtombstone_proto^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/core/libtombstone_proto^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/proto/libtombstone_proto^android_x86_x86_64_static_apex10000

echo "building mkbootfs^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja mkbootfs,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/mkbootfs/mkbootfs^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/core/mkbootfs^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/mkbootfs/mkbootfs^linux_glibc_x86_64

echo "building toolbox_input_labels^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja toolbox_input_labels,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/toolbox/toolbox_input_labels^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/core/toolbox_input_labels^.output . $GITHUB_WORKSPACE/artifacts/system/core/toolbox/toolbox_input_labels^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/core/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 system_core.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
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
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
