
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

echo "Preparing for external/oj-libjdwp"

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/oj-libjdwp
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/oj-libjdwp/libnpt^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/oj-libjdwp/libnpt^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/oj-libjdwp/libjdwp^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/oj-libjdwp/libjdwp^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/oj-libjdwp/libdt_socket^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/oj-libjdwp/libdt_socket^android_x86_x86_64_static_apex31/ .

echo "building libnpt^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libnpt,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libnpt^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/oj-libjdwp/libnpt^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libnpt^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/external/oj-libjdwp/libnpt^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libnpt^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libnpt^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libnpt^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libnpt,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libnpt^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/oj-libjdwp/libnpt^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libnpt^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/external/oj-libjdwp/libnpt^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libnpt^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libnpt^android_x86_x86_64_shared_apex31/addition_copy_files.output

echo "building libjdwp^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libjdwp,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libjdwp^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/oj-libjdwp/libjdwp^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libjdwp^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/external/oj-libjdwp/libjdwp^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libjdwp^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libjdwp^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libjdwp^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libjdwp,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libjdwp^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/oj-libjdwp/libjdwp^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libjdwp^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/external/oj-libjdwp/libjdwp^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libjdwp^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libjdwp^android_x86_x86_64_shared_apex31/addition_copy_files.output

echo "building libdt_socket^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libdt_socket,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libdt_socket^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/oj-libjdwp/libdt_socket^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libdt_socket^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/external/oj-libjdwp/libdt_socket^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libdt_socket^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libdt_socket^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libdt_socket^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libdt_socket,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libdt_socket^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/oj-libjdwp/libdt_socket^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libdt_socket^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/external/oj-libjdwp/libdt_socket^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libdt_socket^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/libdt_socket^android_x86_x86_64_shared_apex31/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_oj-libjdwp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 external_oj-libjdwp.tar.zst --clobber

du -ah -d1 external_oj-libjdwp*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_oj-libjdwp.tar.zst" ]; then
  echo "Compressing external/oj-libjdwp -> external_oj-libjdwp.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_oj-libjdwp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/oj-libjdwp/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi


rm -rf aosp
