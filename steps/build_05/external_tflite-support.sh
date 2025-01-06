
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

echo "Preparing for external/tflite-support"

clone_depth_platform external/flatbuffers
clone_depth_platform external/libtextclassifier
clone_depth_platform external/ruy
clone_depth_platform external/tensorflow
clone_depth_platform external/tflite-support
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform prebuilts/ndk

rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/ndk^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tflite-support/tflite_support_spm_config^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tflite-support/tflite_support_spm_encoder_config^/ .

echo "building tflite_support^android_x86_64_sdk_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja tflite_support,android_x86_64_sdk_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tflite-support/tflite_support^android_x86_64_sdk_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/tflite-support/tflite_support^android_x86_64_sdk_static_apex30.output . $GITHUB_WORKSPACE/artifacts/external/tflite-support/tflite_support^android_x86_64_sdk_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/external/tflite-support/tflite_support^android_x86_64_sdk_static_apex30.output $GITHUB_WORKSPACE/artifacts/external/tflite-support/tflite_support^android_x86_64_sdk_static_apex30 $GITHUB_WORKSPACE/artifacts/external/tflite-support/tflite_support^android_x86_64_sdk_static_apex30/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_tflite-support.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/tflite-support/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 external_tflite-support.tar.zst --clobber

du -ah -d1 external_tflite-support*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst" ]; then
  echo "Compressing external/flatbuffers -> external_flatbuffers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/flatbuffers/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tflite-support.tar.zst" ]; then
  echo "Compressing external/tflite-support -> external_tflite-support.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tflite-support.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tflite-support/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_ndk.tar.zst" ]; then
  echo "Compressing prebuilts/ndk -> prebuilts_ndk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_ndk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/ndk/ .
fi


rm -rf aosp
