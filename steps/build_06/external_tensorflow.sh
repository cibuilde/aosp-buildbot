
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

echo "Preparing for external/tensorflow"

clone_depth_platform art
clone_depth_platform external/eigen
clone_depth_platform external/flatbuffers
clone_depth_platform external/gemmlowp
clone_depth_platform external/libtextclassifier
clone_depth_platform external/ruy
clone_depth_platform external/tensorflow
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform prebuilts/ndk
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/ndk^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libtextclassifier/native/libtextclassifier_hash_static^android_x86_64_sdk_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/ruy/libruy_static^android_x86_64_sdk_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tensorflow/libtflite_mutable_schema^/ .

echo "building libtflite_static^android_x86_64_sdk_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libtflite_static,android_x86_64_sdk_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tensorflow/tensorflow/lite/libtflite_static^android_x86_64_sdk_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/tensorflow/libtflite_static^android_x86_64_sdk_static_apex30.output . $GITHUB_WORKSPACE/artifacts/external/tensorflow/tensorflow/lite/libtflite_static^android_x86_64_sdk_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/tensorflow/libtflite_static^android_x86_64_sdk_static_apex30.output $GITHUB_WORKSPACE/artifacts/external/tensorflow/tensorflow/lite/libtflite_static^android_x86_64_sdk_static_apex30 $GITHUB_WORKSPACE/artifacts/external/tensorflow/tensorflow/lite/libtflite_static^android_x86_64_sdk_static_apex30/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_tensorflow.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/tensorflow/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 external_tensorflow.tar.zst --clobber

du -ah -d1 external_tensorflow*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_eigen.tar.zst" ]; then
  echo "Compressing external/eigen -> external_eigen.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_eigen.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/eigen/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst" ]; then
  echo "Compressing external/flatbuffers -> external_flatbuffers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/flatbuffers/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_gemmlowp.tar.zst" ]; then
  echo "Compressing external/gemmlowp -> external_gemmlowp.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_gemmlowp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/gemmlowp/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libtextclassifier.tar.zst" ]; then
  echo "Compressing external/libtextclassifier -> external_libtextclassifier.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libtextclassifier.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libtextclassifier/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_ruy.tar.zst" ]; then
  echo "Compressing external/ruy -> external_ruy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_ruy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/ruy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tensorflow.tar.zst" ]; then
  echo "Compressing external/tensorflow -> external_tensorflow.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tensorflow.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tensorflow/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_ndk.tar.zst" ]; then
  echo "Compressing prebuilts/ndk -> prebuilts_ndk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_ndk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/ndk/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi


rm -rf aosp
