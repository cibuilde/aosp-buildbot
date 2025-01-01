set -e

echo "entering prebuilts/manifest-merger"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/manifest-merger
clone_depth_platform tools/build

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building manifest-merger-jars^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja manifest-merger-jars,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger-jars^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/manifest-merger/manifest-merger-jars^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger-jars^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/manifest-merger/manifest-merger-jars^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger-jars^linux_glibc_common $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger-jars^linux_glibc_common/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_manifest-merger.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 prebuilts_manifest-merger.tar.zst --clobber

du -ah -d1 prebuilts_manifest-merger*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_manifest-merger.tar.zst" ]; then
  echo "Compressing prebuilts/manifest-merger -> prebuilts_manifest-merger.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_manifest-merger.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/manifest-merger/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_build.tar.zst" ]; then
  echo "Compressing tools/build -> tools_build.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_build.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/build/ .
fi

rm -rf aosp
