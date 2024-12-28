set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/auto
clone_depth_platform external/error_prone
clone_depth_platform external/guava
clone_depth_platform external/protobuf
clone_depth_platform external/turbine
clone_sparse prebuilts/jdk/jdk11 linux-x86

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/value/auto_value_annotations^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/value/auto_value_memoized_extension_annotations^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/value/auto_value_plugin^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/error_prone/error_prone_annotations^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/guava/guava-jre^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-java-full^linux_glibc_common/ .

echo "building turbine^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja turbine,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/turbine/turbine^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/external/turbine/turbine^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/turbine/turbine^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_turbine.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/turbine/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_11 external_turbine.tar.zst --clobber

du -ah -d1 external_turbine*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_auto.tar.zst" ]; then
  echo "Compressing external/auto -> external_auto.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_auto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/auto/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_error_prone.tar.zst" ]; then
  echo "Compressing external/error_prone -> external_error_prone.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_error_prone.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/error_prone/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_guava.tar.zst" ]; then
  echo "Compressing external/guava -> external_guava.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_guava.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/guava/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_turbine.tar.zst" ]; then
  echo "Compressing external/turbine -> external_turbine.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_turbine.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/turbine/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi

rm -rf aosp
