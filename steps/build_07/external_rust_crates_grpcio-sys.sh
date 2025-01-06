
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

echo "Preparing for external/rust/crates/grpcio-sys"

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/grpc-grpc
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/rust/crates/grpcio
clone_depth_platform external/rust/crates/grpcio-sys
clone_depth_platform external/rust/crates/libc
clone_depth_platform external/rust/crates/libz-sys
clone_depth_platform external/zlib
clone_depth_platform libcore
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/grpc-grpc/libgrpc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/grpc-grpc/libgrpc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpc_bindgen^android_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpc_bindgen^android_x86_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys/liblibz_sys^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys/liblibz_sys^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_x86_64_rlib/ .

echo "building libgrpcio_sys^android_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libgrpcio_sys,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_64_rlib_rlib-std/addition_copy_files.output

echo "building libgrpcio_sys^android_x86_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libgrpcio_sys,android_x86_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_x86_64_rlib_rlib-std/addition_copy_files.output

echo "building libgrpc_wrap^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libgrpc_wrap,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_64_shared/addition_copy_files.output

echo "building libgrpc_wrap^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libgrpc_wrap,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_x86_64_shared/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_grpcio-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 external_rust_crates_grpcio-sys.tar.zst --clobber

du -ah -d1 external_rust_crates_grpcio-sys*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_grpc-grpc.tar.zst" ]; then
  echo "Compressing external/grpc-grpc -> external_grpc-grpc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_grpc-grpc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/grpc-grpc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_grpcio.tar.zst" ]; then
  echo "Compressing external/rust/crates/grpcio -> external_rust_crates_grpcio.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_grpcio.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/grpcio/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_grpcio-sys.tar.zst" ]; then
  echo "Compressing external/rust/crates/grpcio-sys -> external_rust_crates_grpcio-sys.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_grpcio-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/grpcio-sys/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libz-sys.tar.zst" ]; then
  echo "Compressing external/rust/crates/libz-sys -> external_rust_crates_libz-sys.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libz-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libz-sys/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi


rm -rf aosp
