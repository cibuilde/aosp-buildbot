set -e

echo "entering external/guice"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform external/guice
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building guice_munge_manifest^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja guice_munge_manifest,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guice/guice_munge_manifest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/guice/guice_munge_manifest^.output . $GITHUB_WORKSPACE/artifacts/external/guice/guice_munge_manifest^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/guice/guice_munge_manifest^.output $GITHUB_WORKSPACE/artifacts/external/guice/guice_munge_manifest^ $GITHUB_WORKSPACE/artifacts/external/guice/guice_munge_manifest^/addition_copy_files.output

echo "building guice_munge_srcjar^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja guice_munge_srcjar,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guice/guice_munge_srcjar^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/guice/guice_munge_srcjar^.output . $GITHUB_WORKSPACE/artifacts/external/guice/guice_munge_srcjar^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/guice/guice_munge_srcjar^.output $GITHUB_WORKSPACE/artifacts/external/guice/guice_munge_srcjar^ $GITHUB_WORKSPACE/artifacts/external/guice/guice_munge_srcjar^/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_guice.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/guice/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_guice.tar.zst --clobber

du -ah -d1 external_guice*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_guice.tar.zst" ]; then
  echo "Compressing external/guice -> external_guice.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_guice.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/guice/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
