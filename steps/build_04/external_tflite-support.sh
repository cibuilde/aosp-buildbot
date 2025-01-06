
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

echo "Preparing for external/tflite-support"

clone_depth_platform external/flatbuffers
clone_depth_platform external/libcxx
clone_depth_platform external/tflite-support

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/flatbuffers/flatc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .

echo "building tflite_support_spm_config^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja tflite_support_spm_config,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tflite-support/tflite_support_spm_config^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/tflite-support/tflite_support_spm_config^.output . $GITHUB_WORKSPACE/artifacts/external/tflite-support/tflite_support_spm_config^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/tflite-support/tflite_support_spm_config^.output $GITHUB_WORKSPACE/artifacts/external/tflite-support/tflite_support_spm_config^ $GITHUB_WORKSPACE/artifacts/external/tflite-support/tflite_support_spm_config^/addition_copy_files.output

echo "building tflite_support_spm_encoder_config^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja tflite_support_spm_encoder_config,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tflite-support/tflite_support_spm_encoder_config^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/tflite-support/tflite_support_spm_encoder_config^.output . $GITHUB_WORKSPACE/artifacts/external/tflite-support/tflite_support_spm_encoder_config^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/tflite-support/tflite_support_spm_encoder_config^.output $GITHUB_WORKSPACE/artifacts/external/tflite-support/tflite_support_spm_encoder_config^ $GITHUB_WORKSPACE/artifacts/external/tflite-support/tflite_support_spm_encoder_config^/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_tflite-support.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/tflite-support/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_tflite-support.tar.zst --clobber

du -ah -d1 external_tflite-support*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst" ]; then
  echo "Compressing external/flatbuffers -> external_flatbuffers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/flatbuffers/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tflite-support.tar.zst" ]; then
  echo "Compressing external/tflite-support -> external_tflite-support.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tflite-support.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tflite-support/ .
fi


rm -rf aosp
