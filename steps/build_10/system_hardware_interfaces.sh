
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

echo "Preparing for system/hardware/interfaces"

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/rust/crates/lazy_static
clone_depth_platform external/rust/crates/libc
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform libcore
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"
clone_depth_platform system/core
clone_depth_platform system/hardware/interfaces

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/liblazy_static^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/rust/libbinder_rs^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-cpp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-rust^android_x86_64_source/ .

echo "building android.system.keystore2-V1-cpp^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja android.system.keystore2-V1-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/system/hardware/interfaces/android.system.keystore2-V1-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-cpp^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/system/hardware/interfaces/android.system.keystore2-V1-cpp^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-cpp^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-cpp^android_x86_64_shared/addition_copy_files.output

echo "building android.system.keystore2-V1-ndk_platform^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja android.system.keystore2-V1-ndk_platform,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/system/hardware/interfaces/android.system.keystore2-V1-ndk_platform^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/system/hardware/interfaces/android.system.keystore2-V1-ndk_platform^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform^android_x86_64_shared/addition_copy_files.output

echo "building android.system.keystore2-V1-rust^android_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja android.system.keystore2-V1-rust,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-rust^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/system/hardware/interfaces/android.system.keystore2-V1-rust^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-rust^android_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/system/hardware/interfaces/android.system.keystore2-V1-rust^android_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-rust^android_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-rust^android_x86_64_rlib_rlib-std/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_10 system_hardware_interfaces.tar.zst --clobber

du -ah -d1 system_hardware_interfaces*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_lazy_static.tar.zst" ]; then
  echo "Compressing external/rust/crates/lazy_static -> external_rust_crates_lazy_static.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_lazy_static.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/lazy_static/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst" ]; then
  echo "Compressing system/hardware/interfaces -> system_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/hardware/interfaces/ .
fi


rm -rf aosp
