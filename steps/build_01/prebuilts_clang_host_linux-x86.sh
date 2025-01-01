set -e

echo "entering prebuilts/clang/host/linux-x86"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform build/soong
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"


echo "building libclang_rt.asan-i686-android^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.asan-i686-android,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-i686-android^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.asan-i686-android^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-i686-android^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.asan-i686-android^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-i686-android^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-i686-android^android_x86_x86_64_shared/addition_copy_files.output

echo "building libclang_rt.asan-x86_64-android^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.asan-x86_64-android,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-x86_64-android^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.asan-x86_64-android^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-x86_64-android^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.asan-x86_64-android^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-x86_64-android^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-x86_64-android^android_x86_64_shared/addition_copy_files.output

echo "building libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.scudo-i686-android,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.scudo-x86_64-android,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.scudo_minimal-i686-android,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.scudo_minimal-x86_64-android,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.ubsan_standalone-i686-android,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.ubsan_standalone-x86_64-android,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.ubsan_standalone-x86_64-android,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 prebuilts_clang_host_linux-x86.tar.zst --clobber

du -ah -d1 prebuilts_clang_host_linux-x86*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
