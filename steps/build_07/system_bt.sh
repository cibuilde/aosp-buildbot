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
clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/libchrome
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/rust/cxx
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libchrome-include^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libmojo_jni_registration_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/cxx/gen/cmd/cxxbridge^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/BluetoothGeneratedDumpsysBinarySchema_bfbs^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/dumpsys/bundler/bluetooth_flatbuffer_bundler^linux_glibc_x86_64/ .

echo "building BluetoothGeneratedDumpsysBundledSchema_h^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja BluetoothGeneratedDumpsysBundledSchema_h,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/BluetoothGeneratedDumpsysBundledSchema_h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/BluetoothGeneratedDumpsysBundledSchema_h^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/BluetoothGeneratedDumpsysBundledSchema_h^

echo "building lib-bt-packets-avrcp^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja lib-bt-packets-avrcp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/packet/avrcp/lib-bt-packets-avrcp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/lib-bt-packets-avrcp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/packet/avrcp/lib-bt-packets-avrcp^android_x86_64_static

echo "building lib-bt-packets-avrcp^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja lib-bt-packets-avrcp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/packet/avrcp/lib-bt-packets-avrcp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/lib-bt-packets-avrcp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/packet/avrcp/lib-bt-packets-avrcp^android_x86_x86_64_static

echo "building lib-bt-packets-base^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja lib-bt-packets-base,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/packet/base/lib-bt-packets-base^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/lib-bt-packets-base^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/packet/base/lib-bt-packets-base^android_x86_64_static

echo "building lib-bt-packets-base^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja lib-bt-packets-base,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/packet/base/lib-bt-packets-base^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/lib-bt-packets-base^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/packet/base/lib-bt-packets-base^android_x86_x86_64_static

echo "building libbluetooth-types^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libbluetooth-types,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/types/libbluetooth-types^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/libbluetooth-types^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/types/libbluetooth-types^android_x86_64_static

echo "building libbluetooth-types^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libbluetooth-types,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/types/libbluetooth-types^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/libbluetooth-types^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/types/libbluetooth-types^android_x86_x86_64_static

echo "building libbt_common_sys_prop_bridge_code^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libbt_common_sys_prop_bridge_code,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/common/libbt_common_sys_prop_bridge_code^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/libbt_common_sys_prop_bridge_code^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/common/libbt_common_sys_prop_bridge_code^

echo "building libbt_hidl_hal_bridge_code^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libbt_hidl_hal_bridge_code,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_bridge_code^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/libbt_hidl_hal_bridge_code^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_bridge_code^

echo "building libbt_hidl_hal_bridge_header^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libbt_hidl_hal_bridge_header,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_bridge_header^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/libbt_hidl_hal_bridge_header^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_bridge_header^

echo "building libbt_init_flags_bridge_code^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libbt_init_flags_bridge_code,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_init_flags_bridge_code^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/libbt_init_flags_bridge_code^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_init_flags_bridge_code^

echo "building libbt_init_flags_bridge_header^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libbt_init_flags_bridge_header,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_init_flags_bridge_header^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/libbt_init_flags_bridge_header^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_init_flags_bridge_header^

echo "building libbt_message_loop_thread_bridge_code^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libbt_message_loop_thread_bridge_code,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_message_loop_thread_bridge_code^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/libbt_message_loop_thread_bridge_code^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_message_loop_thread_bridge_code^

echo "building libbt_message_loop_thread_bridge_header^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libbt_message_loop_thread_bridge_header,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_message_loop_thread_bridge_header^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/libbt_message_loop_thread_bridge_header^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_message_loop_thread_bridge_header^

echo "building libbt_shim_bridge_code^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libbt_shim_bridge_code,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_shim_bridge_code^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/libbt_shim_bridge_code^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_shim_bridge_code^

echo "building libbt_shim_bridge_header^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libbt_shim_bridge_header,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_shim_bridge_header^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/bt/libbt_shim_bridge_header^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_shim_bridge_header^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/bt/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 system_bt.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_googletest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_cxx.tar.zst" ]; then
  echo "Compressing external/rust/cxx -> external_rust_cxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_cxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/cxx/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bt/ .
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