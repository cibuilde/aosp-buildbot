
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

echo "Preparing for tools/platform-compat"

clone_depth_platform build/soong
clone_depth tools/platform-compat

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .

echo "building process-compat-config^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja process-compat-config,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/platform-compat/build/process-compat-config^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/tools/platform-compat/process-compat-config^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/tools/platform-compat/build/process-compat-config^linux_glibc_x86_64_PY2
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/tools/platform-compat/process-compat-config^linux_glibc_x86_64_PY2.output $GITHUB_WORKSPACE/artifacts/tools/platform-compat/build/process-compat-config^linux_glibc_x86_64_PY2 $GITHUB_WORKSPACE/artifacts/tools/platform-compat/build/process-compat-config^linux_glibc_x86_64_PY2/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf tools_platform-compat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/tools/platform-compat/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 tools_platform-compat.tar.zst --clobber

du -ah -d1 tools_platform-compat*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst" ]; then
  echo "Compressing tools/platform-compat -> tools_platform-compat.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/platform-compat/ .
fi


rm -rf aosp
