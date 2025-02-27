
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

echo "Preparing for external/kotlinc"

clone_depth_platform external/kotlinc

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building kotlin-annotations^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja kotlin-annotations,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-annotations^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-annotations^android_common.output . $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-annotations^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-annotations^android_common.output $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-annotations^android_common $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-annotations^android_common/addition_copy_files.output

echo "building kotlin-reflect^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja kotlin-reflect,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-reflect^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-reflect^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-reflect^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-reflect^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-reflect^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-reflect^linux_glibc_common/addition_copy_files.output

echo "building kotlin-stdlib^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja kotlin-stdlib,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-stdlib^android_common.output . $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-stdlib^android_common.output $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^android_common $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^android_common/addition_copy_files.output

echo "building kotlin-stdlib^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja kotlin-stdlib,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-stdlib^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-stdlib^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^android_common_apex30 $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^android_common_apex30/addition_copy_files.output

echo "building kotlin-stdlib^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja kotlin-stdlib,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-stdlib^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-stdlib^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^linux_glibc_common/addition_copy_files.output

echo "building kotlin-stdlib-jdk7^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja kotlin-stdlib-jdk7,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk7^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-stdlib-jdk7^android_common.output . $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk7^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-stdlib-jdk7^android_common.output $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk7^android_common $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk7^android_common/addition_copy_files.output

echo "building kotlin-stdlib-jdk7^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja kotlin-stdlib-jdk7,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk7^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-stdlib-jdk7^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk7^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-stdlib-jdk7^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk7^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk7^linux_glibc_common/addition_copy_files.output

echo "building kotlin-stdlib-jdk8^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja kotlin-stdlib-jdk8,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk8^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-stdlib-jdk8^android_common.output . $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk8^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-stdlib-jdk8^android_common.output $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk8^android_common $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk8^android_common/addition_copy_files.output

echo "building kotlin-stdlib-jdk8^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja kotlin-stdlib-jdk8,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk8^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-stdlib-jdk8^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk8^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/kotlinc/kotlin-stdlib-jdk8^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk8^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib-jdk8^linux_glibc_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_kotlinc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/kotlinc/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_kotlinc.tar.zst --clobber

du -ah -d1 external_kotlinc*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst" ]; then
  echo "Compressing external/kotlinc -> external_kotlinc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/kotlinc/ .
fi


rm -rf aosp
