set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/flatbuffers
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/rust/crates/proc-macro2
clone_depth_platform external/rust/crates/quote
clone_depth_platform external/rust/crates/syn
clone_depth_platform external/rust/crates/unicode-xid
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/python/linux-x86/2.7.5
clone_sparse prebuilts/rust bootstrap linux-x86/1.51.0
clone_depth_platform system/bt

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/flatbuffers/flatc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro2/libproc_macro2^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/quote/libquote^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/syn/libsyn^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-xid/libunicode_xid^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/bt/gd/packet/parser/bluetooth_packetgen^linux_glibc_x86_64/ .

echo "building BluetoothGeneratedBundlerSchema_h_bfbs^"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja BluetoothGeneratedBundlerSchema_h_bfbs,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/bundler/BluetoothGeneratedBundlerSchema_h_bfbs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/bt/BluetoothGeneratedBundlerSchema_h_bfbs^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/dumpsys/bundler/BluetoothGeneratedBundlerSchema_h_bfbs^

echo "building BluetoothGeneratedDumpsysBinarySchema_bfbs^"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja BluetoothGeneratedDumpsysBinarySchema_bfbs,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedDumpsysBinarySchema_bfbs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/bt/BluetoothGeneratedDumpsysBinarySchema_bfbs^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedDumpsysBinarySchema_bfbs^

echo "building BluetoothGeneratedDumpsysDataSchema_h^"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja BluetoothGeneratedDumpsysDataSchema_h,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedDumpsysDataSchema_h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/bt/BluetoothGeneratedDumpsysDataSchema_h^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedDumpsysDataSchema_h^

echo "building BluetoothGeneratedPackets_h^"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja BluetoothGeneratedPackets_h,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedPackets_h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/bt/BluetoothGeneratedPackets_h^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedPackets_h^

echo "building BluetoothGeneratedPackets_rust^"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja BluetoothGeneratedPackets_rust,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedPackets_rust^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/bt/BluetoothGeneratedPackets_rust^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/BluetoothGeneratedPackets_rust^

echo "building RootCanalGeneratedPackets_h^"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja RootCanalGeneratedPackets_h,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/RootCanalGeneratedPackets_h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/bt/RootCanalGeneratedPackets_h^.output . $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/RootCanalGeneratedPackets_h^

echo "building libgddi_macros^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja libgddi_macros,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/gddi/libgddi_macros^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/bt/libgddi_macros^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/gddi/libgddi_macros^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/bt/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 system_bt.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst" ]; then
  echo "Compressing external/flatbuffers -> external_flatbuffers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/flatbuffers/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro2.tar.zst" ]; then
  echo "Compressing external/rust/crates/proc-macro2 -> external_rust_crates_proc-macro2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/proc-macro2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_quote.tar.zst" ]; then
  echo "Compressing external/rust/crates/quote -> external_rust_crates_quote.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_quote.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/quote/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_syn.tar.zst" ]; then
  echo "Compressing external/rust/crates/syn -> external_rust_crates_syn.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_syn.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/syn/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_unicode-xid.tar.zst" ]; then
  echo "Compressing external/rust/crates/unicode-xid -> external_rust_crates_unicode-xid.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_unicode-xid.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/unicode-xid/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst" ]; then
  echo "Compressing prebuilts/python/linux-x86/2.7.5 -> prebuilts_python_linux-x86_2.7.5.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/python/linux-x86/2.7.5/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bt/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
