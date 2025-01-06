
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

echo "Preparing for frameworks/libs/modules-utils"

clone_depth_platform frameworks/libs/modules-utils


echo "building libmodules-utils-build^android_x86_64_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libmodules-utils-build,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/build/libmodules-utils-build^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/libs/modules-utils/libmodules-utils-build^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/build/libmodules-utils-build^android_x86_64_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/libs/modules-utils/libmodules-utils-build^android_x86_64_static_apex30.output $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/build/libmodules-utils-build^android_x86_64_static_apex30 $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/build/libmodules-utils-build^android_x86_64_static_apex30/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_libs_modules-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 frameworks_libs_modules-utils.tar.zst --clobber

du -ah -d1 frameworks_libs_modules-utils*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst" ]; then
  echo "Compressing frameworks/libs/modules-utils -> frameworks_libs_modules-utils.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/modules-utils/ .
fi


rm -rf aosp
