set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform packages/modules/vndk


echo "building api_levels^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja api_levels,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/api_levels^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/api_levels^.output . $GITHUB_WORKSPACE/artifacts/singletons/api_levels^

echo "building dex_bootjars^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja dex_bootjars,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/dex_bootjars^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/dex_bootjars^.output . $GITHUB_WORKSPACE/artifacts/singletons/dex_bootjars^

echo "building dexpreopt-soong-config^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja dexpreopt-soong-config,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/dexpreopt-soong-config^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/dexpreopt-soong-config^.output . $GITHUB_WORKSPACE/artifacts/singletons/dexpreopt-soong-config^

echo "building llndk_libraries_txt^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja llndk_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/llndk_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/llndk_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/llndk_libraries_txt^

echo "building vndkcore_libraries_txt^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkcore_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/vndkcore_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkcore_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/vndkcore_libraries_txt^

echo "building vndkcorevariant_libraries_txt^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkcorevariant_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/vndkcorevariant_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkcorevariant_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/vndkcorevariant_libraries_txt^

echo "building vndkprivate_libraries_txt^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkprivate_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/vndkprivate_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkprivate_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/vndkprivate_libraries_txt^

echo "building vndkproduct_libraries_txt^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkproduct_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/vndkproduct_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkproduct_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/vndkproduct_libraries_txt^

echo "building vndksp_libraries_txt^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndksp_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/vndksp_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/vndksp_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/vndksp_libraries_txt^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf singletons.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/singletons/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 singletons.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_vndk.tar.zst" ]; then
  echo "Compressing packages/modules/vndk -> packages_modules_vndk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_vndk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/vndk/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
