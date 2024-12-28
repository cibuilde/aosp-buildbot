set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/guice

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building guice_munge_manifest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja guice_munge_manifest,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guice/guice_munge_manifest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/guice/guice_munge_manifest^.output . $GITHUB_WORKSPACE/artifacts/external/guice/guice_munge_manifest^

echo "building guice_munge_srcjar^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja guice_munge_srcjar,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guice/guice_munge_srcjar^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/guice/guice_munge_srcjar^.output . $GITHUB_WORKSPACE/artifacts/external/guice/guice_munge_srcjar^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_guice.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/guice/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_guice.tar.zst --clobber

du -ah -d1 external_guice*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_guice.tar.zst" ]; then
  echo "Compressing external/guice -> external_guice.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_guice.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/guice/ .
fi

rm -rf aosp
