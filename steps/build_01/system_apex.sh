
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

echo "Preparing for system/apex"

clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform system/apex


echo "building com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.apex.cts.shim.v1_prebuilt,android_common_com.android.apex.cts.shim.v1_prebuilt
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/shim/com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/apex/com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt.output . $GITHUB_WORKSPACE/artifacts/system/apex/shim/com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/apex/com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt.output $GITHUB_WORKSPACE/artifacts/system/apex/shim/com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt $GITHUB_WORKSPACE/artifacts/system/apex/shim/com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/apex/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 system_apex.tar.zst --clobber

du -ah -d1 system_apex*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_apex.tar.zst" ]; then
  echo "Compressing system/apex -> system_apex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/apex/ .
fi


rm -rf aosp
