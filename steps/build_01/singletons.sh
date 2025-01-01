set -e

echo "entering singletons"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform packages/modules/vndk
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"


echo "building api_levels^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja api_levels,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/api_levels^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/api_levels^.output . $GITHUB_WORKSPACE/artifacts/singletons/api_levels^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/singletons/api_levels^.output $GITHUB_WORKSPACE/artifacts/singletons/api_levels^ $GITHUB_WORKSPACE/artifacts/singletons/api_levels^/addition_copy_files.output

echo "building dex_bootjars^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja dex_bootjars,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/dex_bootjars^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/dex_bootjars^.output . $GITHUB_WORKSPACE/artifacts/singletons/dex_bootjars^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/singletons/dex_bootjars^.output $GITHUB_WORKSPACE/artifacts/singletons/dex_bootjars^ $GITHUB_WORKSPACE/artifacts/singletons/dex_bootjars^/addition_copy_files.output

echo "building dexpreopt-soong-config^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja dexpreopt-soong-config,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/dexpreopt-soong-config^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/dexpreopt-soong-config^.output . $GITHUB_WORKSPACE/artifacts/singletons/dexpreopt-soong-config^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/singletons/dexpreopt-soong-config^.output $GITHUB_WORKSPACE/artifacts/singletons/dexpreopt-soong-config^ $GITHUB_WORKSPACE/artifacts/singletons/dexpreopt-soong-config^/addition_copy_files.output

echo "building llndk_libraries_txt^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja llndk_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/llndk_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/llndk_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/llndk_libraries_txt^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/singletons/llndk_libraries_txt^.output $GITHUB_WORKSPACE/artifacts/singletons/llndk_libraries_txt^ $GITHUB_WORKSPACE/artifacts/singletons/llndk_libraries_txt^/addition_copy_files.output

echo "building sdk^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja sdk,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/sdk^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/sdk^.output . $GITHUB_WORKSPACE/artifacts/singletons/sdk^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/singletons/sdk^.output $GITHUB_WORKSPACE/artifacts/singletons/sdk^ $GITHUB_WORKSPACE/artifacts/singletons/sdk^/addition_copy_files.output

echo "building vndkcore_libraries_txt^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkcore_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/vndkcore_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkcore_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/vndkcore_libraries_txt^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkcore_libraries_txt^.output $GITHUB_WORKSPACE/artifacts/singletons/vndkcore_libraries_txt^ $GITHUB_WORKSPACE/artifacts/singletons/vndkcore_libraries_txt^/addition_copy_files.output

echo "building vndkcorevariant_libraries_txt^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkcorevariant_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/vndkcorevariant_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkcorevariant_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/vndkcorevariant_libraries_txt^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkcorevariant_libraries_txt^.output $GITHUB_WORKSPACE/artifacts/singletons/vndkcorevariant_libraries_txt^ $GITHUB_WORKSPACE/artifacts/singletons/vndkcorevariant_libraries_txt^/addition_copy_files.output

echo "building vndkprivate_libraries_txt^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkprivate_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/vndkprivate_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkprivate_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/vndkprivate_libraries_txt^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkprivate_libraries_txt^.output $GITHUB_WORKSPACE/artifacts/singletons/vndkprivate_libraries_txt^ $GITHUB_WORKSPACE/artifacts/singletons/vndkprivate_libraries_txt^/addition_copy_files.output

echo "building vndkproduct_libraries_txt^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkproduct_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/vndkproduct_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkproduct_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/vndkproduct_libraries_txt^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/singletons/vndkproduct_libraries_txt^.output $GITHUB_WORKSPACE/artifacts/singletons/vndkproduct_libraries_txt^ $GITHUB_WORKSPACE/artifacts/singletons/vndkproduct_libraries_txt^/addition_copy_files.output

echo "building vndksp_libraries_txt^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndksp_libraries_txt,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/vndksp_libraries_txt^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/singletons/vndksp_libraries_txt^.output . $GITHUB_WORKSPACE/artifacts/singletons/vndksp_libraries_txt^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/singletons/vndksp_libraries_txt^.output $GITHUB_WORKSPACE/artifacts/singletons/vndksp_libraries_txt^ $GITHUB_WORKSPACE/artifacts/singletons/vndksp_libraries_txt^/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf singletons.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/singletons/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 singletons.tar.zst --clobber

du -ah -d1 singletons*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_vndk.tar.zst" ]; then
  echo "Compressing packages/modules/vndk -> packages_modules_vndk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_vndk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/vndk/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
