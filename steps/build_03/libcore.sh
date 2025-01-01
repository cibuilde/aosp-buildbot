set -e

echo "entering libcore"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform libcore
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .

echo "building core-oj^android_common_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja core-oj,android_common_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/core-oj^android_common_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/libcore/core-oj^android_common_apex31.output . $GITHUB_WORKSPACE/artifacts/libcore/core-oj^android_common_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/libcore/core-oj^android_common_apex31.output $GITHUB_WORKSPACE/artifacts/libcore/core-oj^android_common_apex31 $GITHUB_WORKSPACE/artifacts/libcore/core-oj^android_common_apex31/addition_copy_files.output

echo "building notices-for-stubs-jar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja notices-for-stubs-jar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/notices-for-stubs-jar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/libcore/notices-for-stubs-jar^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/notices-for-stubs-jar^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/libcore/notices-for-stubs-jar^android_common.output $GITHUB_WORKSPACE/artifacts/libcore/notices-for-stubs-jar^android_common $GITHUB_WORKSPACE/artifacts/libcore/notices-for-stubs-jar^android_common/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/libcore/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 libcore.tar.zst --clobber

du -ah -d1 libcore*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
