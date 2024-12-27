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
clone_depth_platform build/soong
clone_depth_platform external/libchrome

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .

echo "building jni_generator^linux_glibc_x86_64_PY2"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja jni_generator,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libchrome/jni_generator^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libchrome/jni_generator^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/external/libchrome/jni_generator^linux_glibc_x86_64_PY2

echo "building jni_registration_generator^linux_glibc_x86_64_PY2"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja jni_registration_generator,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libchrome/jni_registration_generator^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libchrome/jni_registration_generator^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/external/libchrome/jni_registration_generator^linux_glibc_x86_64_PY2

echo "building libchrome-include^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libchrome-include,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libchrome/libchrome-include^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libchrome/libchrome-include^.output . $GITHUB_WORKSPACE/artifacts/external/libchrome/libchrome-include^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_libchrome.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/libchrome/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 external_libchrome.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libchrome.tar.zst" ]; then
  echo "Compressing external/libchrome -> external_libchrome.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libchrome.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libchrome/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
