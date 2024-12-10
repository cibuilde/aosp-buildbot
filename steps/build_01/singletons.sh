set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform packages/modules/vndk
clone_depth_platform singletons

echo "building api_levels^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja api_levels,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/api_levels^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/api_levels^.output . $GITHUB_WORKSPACE/artifacts/singletons/api_levels^

echo "building dex_bootjars^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja dex_bootjars,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/dex_bootjars^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/dex_bootjars^.output . $GITHUB_WORKSPACE/artifacts/singletons/dex_bootjars^

echo "building dexpreopt-soong-config^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja dexpreopt-soong-config,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/dexpreopt-soong-config^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/dexpreopt-soong-config^.output . $GITHUB_WORKSPACE/artifacts/singletons/dexpreopt-soong-config^

echo "building llndk_libraries_txt^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja llndk_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/llndk_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/llndk_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/llndk_libraries_txt^

echo "building vndkcore_libraries_txt^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkcore_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/vndkcore_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkcore_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/vndkcore_libraries_txt^

echo "building vndkcorevariant_libraries_txt^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkcorevariant_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/vndkcorevariant_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkcorevariant_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/vndkcorevariant_libraries_txt^

echo "building vndkprivate_libraries_txt^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkprivate_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/vndkprivate_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkprivate_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/vndkprivate_libraries_txt^

echo "building vndkproduct_libraries_txt^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkproduct_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/vndkproduct_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkproduct_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/vndkproduct_libraries_txt^

echo "building vndksp_libraries_txt^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndksp_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/vndksp_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/vndksp_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/vndksp_libraries_txt^

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ singletons.tar.xz -C $GITHUB_WORKSPACE/artifacts/singletons/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_vndk.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_vndk.tar.xz -C $GITHUB_WORKSPACE/aosp/packages/modules/vndk/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/singletons.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/singletons.tar.xz -C $GITHUB_WORKSPACE/aosp/singletons/ .
fi
rm -rf aosp