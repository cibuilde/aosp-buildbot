
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

echo "Preparing for external/rust/crates/clang-sys"

clone_depth_platform external/rust/crates/cfg-if
clone_depth_platform external/rust/crates/clang-sys
clone_depth_platform external/rust/crates/glob
clone_depth_platform external/rust/crates/libc
clone_depth_platform external/rust/crates/libloading
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/libglob^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/liblibloading^linux_glibc_x86_64_rlib_rlib-std/ .

echo "building copy_clang-sys_build_out^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja copy_clang-sys_build_out,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/clang-sys/copy_clang-sys_build_out^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/rust/crates/clang-sys/copy_clang-sys_build_out^.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/clang-sys/copy_clang-sys_build_out^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/rust/crates/clang-sys/copy_clang-sys_build_out^.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/clang-sys/copy_clang-sys_build_out^ $GITHUB_WORKSPACE/artifacts/external/rust/crates/clang-sys/copy_clang-sys_build_out^/addition_copy_files.output

echo "building libclang_sys^linux_glibc_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libclang_sys,linux_glibc_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/clang-sys/libclang_sys^linux_glibc_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/rust/crates/clang-sys/libclang_sys^linux_glibc_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/clang-sys/libclang_sys^linux_glibc_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/rust/crates/clang-sys/libclang_sys^linux_glibc_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/clang-sys/libclang_sys^linux_glibc_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/external/rust/crates/clang-sys/libclang_sys^linux_glibc_x86_64_rlib_rlib-std/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_clang-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/clang-sys/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_rust_crates_clang-sys.tar.zst --clobber

du -ah -d1 external_rust_crates_clang-sys*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst" ]; then
  echo "Compressing external/rust/crates/cfg-if -> external_rust_crates_cfg-if.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/cfg-if/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_clang-sys.tar.zst" ]; then
  echo "Compressing external/rust/crates/clang-sys -> external_rust_crates_clang-sys.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_clang-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/clang-sys/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_glob.tar.zst" ]; then
  echo "Compressing external/rust/crates/glob -> external_rust_crates_glob.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_glob.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/glob/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libloading.tar.zst" ]; then
  echo "Compressing external/rust/crates/libloading -> external_rust_crates_libloading.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libloading.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libloading/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi


rm -rf aosp
