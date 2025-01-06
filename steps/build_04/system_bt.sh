
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

echo "Preparing for system/bt"

clone_depth_platform bionic
clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform external/flatbuffers
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/libchrome
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/flatbuffers/libflatbuffers-cpp^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/flatbuffers/flatc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libmojo_jni_registration_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libchrome-include^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .

echo "building BluetoothGeneratedDumpsysBinarySchema_bfbs^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja BluetoothGeneratedDumpsysBinarySchema_bfbs,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedDumpsysBinarySchema_bfbs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/BluetoothGeneratedDumpsysBinarySchema_bfbs^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedDumpsysBinarySchema_bfbs^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/BluetoothGeneratedDumpsysBinarySchema_bfbs^.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedDumpsysBinarySchema_bfbs^ $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedDumpsysBinarySchema_bfbs^/addition_copy_files.output

echo "building BluetoothGeneratedDumpsysDataSchema_h^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja BluetoothGeneratedDumpsysDataSchema_h,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedDumpsysDataSchema_h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/BluetoothGeneratedDumpsysDataSchema_h^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedDumpsysDataSchema_h^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/BluetoothGeneratedDumpsysDataSchema_h^.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedDumpsysDataSchema_h^ $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedDumpsysDataSchema_h^/addition_copy_files.output

echo "building BluetoothGeneratedDumpsysBundledSchema_h^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja BluetoothGeneratedDumpsysBundledSchema_h,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/BluetoothGeneratedDumpsysBundledSchema_h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/BluetoothGeneratedDumpsysBundledSchema_h^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/BluetoothGeneratedDumpsysBundledSchema_h^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/BluetoothGeneratedDumpsysBundledSchema_h^.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/BluetoothGeneratedDumpsysBundledSchema_h^ $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/BluetoothGeneratedDumpsysBundledSchema_h^/addition_copy_files.output

echo "building BluetoothGeneratedBundlerSchema_h_bfbs^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja BluetoothGeneratedBundlerSchema_h_bfbs,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/bundler/BluetoothGeneratedBundlerSchema_h_bfbs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/BluetoothGeneratedBundlerSchema_h_bfbs^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/bundler/BluetoothGeneratedBundlerSchema_h_bfbs^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/BluetoothGeneratedBundlerSchema_h_bfbs^.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/bundler/BluetoothGeneratedBundlerSchema_h_bfbs^ $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/bundler/BluetoothGeneratedBundlerSchema_h_bfbs^/addition_copy_files.output

echo "building bluetooth_flatbuffer_bundler^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja bluetooth_flatbuffer_bundler,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/bundler/bluetooth_flatbuffer_bundler^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/bluetooth_flatbuffer_bundler^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/bundler/bluetooth_flatbuffer_bundler^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/bluetooth_flatbuffer_bundler^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/bundler/bluetooth_flatbuffer_bundler^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/bundler/bluetooth_flatbuffer_bundler^linux_glibc_x86_64/addition_copy_files.output

echo "building libbt-protos-lite^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libbt-protos-lite,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbt-protos-lite^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/libbt-protos-lite^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbt-protos-lite^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/libbt-protos-lite^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbt-protos-lite^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbt-protos-lite^android_x86_64_static/addition_copy_files.output

echo "building libbt-protos-lite^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libbt-protos-lite,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbt-protos-lite^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/libbt-protos-lite^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbt-protos-lite^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/libbt-protos-lite^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbt-protos-lite^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbt-protos-lite^android_x86_x86_64_static/addition_copy_files.output

echo "building libbluetooth-protos^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libbluetooth-protos,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbluetooth-protos^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/libbluetooth-protos^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbluetooth-protos^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/libbluetooth-protos^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbluetooth-protos^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbluetooth-protos^android_x86_64_static/addition_copy_files.output

echo "building libbluetooth-protos^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libbluetooth-protos,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbluetooth-protos^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/libbluetooth-protos^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbluetooth-protos^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/libbluetooth-protos^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbluetooth-protos^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/gd/proto/libbluetooth-protos^android_x86_x86_64_static/addition_copy_files.output

echo "building lib-bt-packets-avrcp^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja lib-bt-packets-avrcp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/packet/avrcp/lib-bt-packets-avrcp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/lib-bt-packets-avrcp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/packet/avrcp/lib-bt-packets-avrcp^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/lib-bt-packets-avrcp^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/packet/avrcp/lib-bt-packets-avrcp^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/packet/avrcp/lib-bt-packets-avrcp^android_x86_64_static/addition_copy_files.output

echo "building lib-bt-packets-avrcp^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja lib-bt-packets-avrcp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/packet/avrcp/lib-bt-packets-avrcp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/lib-bt-packets-avrcp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/packet/avrcp/lib-bt-packets-avrcp^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/lib-bt-packets-avrcp^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/packet/avrcp/lib-bt-packets-avrcp^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/packet/avrcp/lib-bt-packets-avrcp^android_x86_x86_64_static/addition_copy_files.output

echo "building lib-bt-packets-base^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja lib-bt-packets-base,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/packet/base/lib-bt-packets-base^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/lib-bt-packets-base^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/packet/base/lib-bt-packets-base^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/lib-bt-packets-base^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/packet/base/lib-bt-packets-base^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/packet/base/lib-bt-packets-base^android_x86_64_static/addition_copy_files.output

echo "building lib-bt-packets-base^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja lib-bt-packets-base,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/packet/base/lib-bt-packets-base^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/lib-bt-packets-base^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/packet/base/lib-bt-packets-base^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/lib-bt-packets-base^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/packet/base/lib-bt-packets-base^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/packet/base/lib-bt-packets-base^android_x86_x86_64_static/addition_copy_files.output

echo "building libbluetooth-types^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libbluetooth-types,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/types/libbluetooth-types^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/libbluetooth-types^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/types/libbluetooth-types^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/libbluetooth-types^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/types/libbluetooth-types^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/types/libbluetooth-types^android_x86_64_static/addition_copy_files.output

echo "building libbluetooth-types^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libbluetooth-types,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/types/libbluetooth-types^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/libbluetooth-types^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/types/libbluetooth-types^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/libbluetooth-types^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/types/libbluetooth-types^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/types/libbluetooth-types^android_x86_x86_64_static/addition_copy_files.output

echo "building async_fd_watcher^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja async_fd_watcher,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/linux/interface/async_fd_watcher^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/async_fd_watcher^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/linux/interface/async_fd_watcher^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/async_fd_watcher^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/linux/interface/async_fd_watcher^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/linux/interface/async_fd_watcher^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libscriptedbeaconpayload-protos-lite^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libscriptedbeaconpayload-protos-lite,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/libscriptedbeaconpayload-protos-lite^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/bt/libscriptedbeaconpayload-protos-lite^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/libscriptedbeaconpayload-protos-lite^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/bt/libscriptedbeaconpayload-protos-lite^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/libscriptedbeaconpayload-protos-lite^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/libscriptedbeaconpayload-protos-lite^android_vendor.31_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/bt/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 system_bt.tar.zst --clobber

du -ah -d1 system_bt*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst" ]; then
  echo "Compressing external/flatbuffers -> external_flatbuffers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/flatbuffers/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
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


rm -rf aosp
