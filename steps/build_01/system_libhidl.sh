
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

echo "Preparing for system/libhidl"

clone_depth_platform art
clone_depth_platform system/libhidl


echo "building android.hidl.base-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja android.hidl.base-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/libhidl/android.hidl.base-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/libhidl/android.hidl.base-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/libhidl/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 system_libhidl.tar.zst --clobber

du -ah -d1 system_libhidl*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi


rm -rf aosp
