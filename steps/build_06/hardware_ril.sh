
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for hardware/ril"

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/nanopb-c
clone_depth_platform hardware/ril
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/nanopb-c/libprotobuf-c-nano-enable_malloc-32bit^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/nanopb-c/libprotobuf-c-nano-enable_malloc-32bit^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/nanopb-c/generator/protoc-gen-nanopb^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/ril/librilutils/librilutils^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/ril/librilutils/librilutils^android_vendor.31_x86_x86_64_static/ .

echo "building librilutils^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja librilutils,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/hardware/ril/librilutils^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/hardware/ril/librilutils^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building librilutils^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja librilutils,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/hardware/ril/librilutils^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/hardware/ril/librilutils^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building librilutils^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja librilutils,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/hardware/ril/librilutils^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/hardware/ril/librilutils^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building librilutils^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja librilutils,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/hardware/ril/librilutils^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/hardware/ril/librilutils^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/hardware/ril/librilutils/librilutils^android_vendor.31_x86_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf hardware_ril.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/hardware/ril/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 hardware_ril.tar.zst --clobber

du -ah -d1 hardware_ril*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_nanopb-c.tar.zst" ]; then
  echo "Compressing external/nanopb-c -> external_nanopb-c.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_nanopb-c.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/nanopb-c/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi


rm -rf aosp
