
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

echo "Preparing for external/boringssl"

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/boringssl
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/bcm_object^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/bcm_object^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/bcm_object^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/bcm_object^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/bcm_object^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/bcm_object^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/bcm_object^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/bcm_object^android_x86_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/bcm_object^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/bssl_inject_hash^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libssl^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libssl^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libssl^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libssl^android_x86_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex31/ .

echo "building libcrypto^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libcrypto,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_recovery_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_recovery_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_recovery_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_recovery_x86_64_shared/addition_copy_files.output

echo "building libcrypto^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libcrypto,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared/addition_copy_files.output

echo "building libcrypto^android_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libcrypto,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared_apex10000/addition_copy_files.output

echo "building libcrypto^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libcrypto,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared_apex29/addition_copy_files.output

echo "building libcrypto^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libcrypto,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libcrypto^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libcrypto,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared/addition_copy_files.output

echo "building libcrypto^android_x86_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libcrypto,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared_apex10000/addition_copy_files.output

echo "building libcrypto^android_x86_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libcrypto,android_x86_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared_apex29/addition_copy_files.output

echo "building libcrypto^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libcrypto,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libcrypto^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^android_x86_x86_64_shared_apex31/addition_copy_files.output

echo "building libssl^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libssl,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libssl^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libssl^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libssl^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libssl,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libssl^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libssl^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_vendor.31_x86_x86_64_static/addition_copy_files.output

echo "building libssl^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libssl,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libssl^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libssl^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_64_shared/addition_copy_files.output

echo "building libssl^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libssl,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libssl^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libssl^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_64_shared_apex29/addition_copy_files.output

echo "building libssl^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libssl,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libssl^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libssl^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_x86_64_shared/addition_copy_files.output

echo "building libssl^android_x86_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libssl,android_x86_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libssl^android_x86_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/boringssl/libssl^android_x86_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/external/boringssl/libssl^android_x86_x86_64_shared_apex29/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/boringssl/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_boringssl.tar.zst --clobber

du -ah -d1 external_boringssl*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
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
