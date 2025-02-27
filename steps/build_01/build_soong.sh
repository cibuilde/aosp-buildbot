
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

echo "Preparing for build/soong"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform prebuilts/go/linux-x86
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media


echo "building androidmk-parser^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja androidmk-parser,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/androidmk/androidmk-parser^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/androidmk-parser^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/androidmk/androidmk-parser^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/androidmk-parser^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/soong/androidmk/androidmk-parser^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/soong/androidmk/androidmk-parser^linux_glibc_x86_64/addition_copy_files.output

echo "building soong-cquery^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja soong-cquery,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/bazel/cquery/soong-cquery^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/soong-cquery^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/bazel/cquery/soong-cquery^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/soong-cquery^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/soong/bazel/cquery/soong-cquery^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/soong/bazel/cquery/soong-cquery^linux_glibc_x86_64/addition_copy_files.output

echo "building libbuildversion^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbuildversion,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/libbuildversion^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/libbuildversion^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_recovery_x86_64_static/addition_copy_files.output

echo "building libbuildversion^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbuildversion,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/libbuildversion^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/libbuildversion^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_64_static $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_64_static/addition_copy_files.output

echo "building libbuildversion^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbuildversion,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/libbuildversion^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/libbuildversion^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_64_static_apex10000/addition_copy_files.output

echo "building libbuildversion^android_x86_64_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbuildversion,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/libbuildversion^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_64_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/libbuildversion^android_x86_64_static_apex30.output $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_64_static_apex30 $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_64_static_apex30/addition_copy_files.output

echo "building libbuildversion^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbuildversion,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/libbuildversion^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/libbuildversion^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_x86_64_static/addition_copy_files.output

echo "building libbuildversion^android_x86_x86_64_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbuildversion,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/libbuildversion^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_x86_64_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/libbuildversion^android_x86_x86_64_static_apex30.output $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_x86_64_static_apex30 $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^android_x86_x86_64_static_apex30/addition_copy_files.output

echo "building libbuildversion^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbuildversion,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/libbuildversion^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/libbuildversion^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/build/soong/cc/libbuildversion/libbuildversion^linux_glibc_x86_64_static/addition_copy_files.output

echo "building dep_fixer^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja dep_fixer,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/dep_fixer^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/dep_fixer^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/addition_copy_files.output

echo "building fileslist^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja fileslist,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/fileslist/fileslist^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/fileslist^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/fileslist/fileslist^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/fileslist^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/soong/cmd/fileslist/fileslist^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/soong/cmd/fileslist/fileslist^linux_glibc_x86_64/addition_copy_files.output

echo "building soong_javac_wrapper^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja soong_javac_wrapper,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/soong_javac_wrapper^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/soong_javac_wrapper^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/addition_copy_files.output

echo "building run_with_timeout^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja run_with_timeout,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/run_with_timeout/run_with_timeout^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/run_with_timeout^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/run_with_timeout/run_with_timeout^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/run_with_timeout^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/soong/cmd/run_with_timeout/run_with_timeout^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/soong/cmd/run_with_timeout/run_with_timeout^linux_glibc_x86_64/addition_copy_files.output

echo "building soong-jar^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja soong-jar,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/jar/soong-jar^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/soong-jar^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/jar/soong-jar^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/soong-jar^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/soong/jar/soong-jar^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/soong/jar/soong-jar^linux_glibc_x86_64/addition_copy_files.output

echo "building soong-makedeps^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja soong-makedeps,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/makedeps/soong-makedeps^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/soong-makedeps^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/makedeps/soong-makedeps^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/soong-makedeps^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/soong/makedeps/soong-makedeps^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/soong/makedeps/soong-makedeps^linux_glibc_x86_64/addition_copy_files.output

echo "building soong-remoteexec^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja soong-remoteexec,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/remoteexec/soong-remoteexec^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/soong-remoteexec^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/remoteexec/soong-remoteexec^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/soong-remoteexec^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/soong/remoteexec/soong-remoteexec^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/soong/remoteexec/soong-remoteexec^linux_glibc_x86_64/addition_copy_files.output

echo "building soong-response^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja soong-response,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/response/soong-response^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/soong-response^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/response/soong-response^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/soong-response^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/soong/response/soong-response^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/soong/response/soong-response^linux_glibc_x86_64/addition_copy_files.output

echo "building soong-symbol_inject^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja soong-symbol_inject,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/symbol_inject/soong-symbol_inject^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/soong-symbol_inject^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/symbol_inject/soong-symbol_inject^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/soong-symbol_inject^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/soong/symbol_inject/soong-symbol_inject^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/soong/symbol_inject/soong-symbol_inject^linux_glibc_x86_64/addition_copy_files.output

echo "building symbol_inject^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja symbol_inject,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/symbol_inject^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/symbol_inject^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64/addition_copy_files.output

echo "building android-archive-zip^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja android-archive-zip,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/third_party/zip/android-archive-zip^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/soong/android-archive-zip^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/third_party/zip/android-archive-zip^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/soong/android-archive-zip^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/soong/third_party/zip/android-archive-zip^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/soong/third_party/zip/android-archive-zip^linux_glibc_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/build/soong/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 build_soong.tar.zst --clobber

du -ah -d1 build_soong*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/go/linux-x86 -> prebuilts_go_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
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
