
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

echo "Preparing for system/libhidl"

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlmemory/libhidlmemory^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhwbinder/libhwbinder-impl-internal^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared_current/ .

echo "building libhidlbase^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libhidlbase,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/libhidlbase^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/libhidl/libhidlbase^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/libhidlbase^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/libhidl/libhidlbase^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/system/libhidl/libhidlbase^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/system/libhidl/libhidlbase^android_x86_64_shared_apex29/addition_copy_files.output

echo "building libhidlmemory^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libhidlmemory,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/libhidlmemory/libhidlmemory^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/libhidl/libhidlmemory^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/libhidlmemory/libhidlmemory^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/libhidl/libhidlmemory^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/system/libhidl/libhidlmemory/libhidlmemory^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/system/libhidl/libhidlmemory/libhidlmemory^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hidl.memory@1.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hidl.memory@1.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/libhidl/android.hidl.memory@1.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/libhidl/android.hidl.memory@1.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hidl.memory.token@1.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hidl.memory.token@1.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/libhidl/android.hidl.memory.token@1.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/libhidl/android.hidl.memory.token@1.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hidl.safe_union@1.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hidl.safe_union@1.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/libhidl/android.hidl.safe_union@1.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/libhidl/android.hidl.safe_union@1.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hidl.token@1.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hidl.token@1.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/libhidl/android.hidl.token@1.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/libhidl/android.hidl.token@1.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hidl.token@1.0-utils^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hidl.token@1.0-utils,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/libhidl/android.hidl.token@1.0-utils^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/libhidl/android.hidl.token@1.0-utils^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_shared_apex29/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/libhidl/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 system_libhidl.tar.zst --clobber

du -ah -d1 system_libhidl*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst" ]; then
  echo "Compressing system/libhwbinder -> system_libhwbinder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhwbinder/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi


rm -rf aosp
