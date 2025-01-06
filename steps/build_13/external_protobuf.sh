
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

echo "Preparing for external/protobuf"

clone_depth_platform external/protobuf
clone_depth_platform libcore
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core.current.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-current-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs^android_common/ .

echo "building libprotobuf-java-lite^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja libprotobuf-java-lite,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-java-lite^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/external/protobuf/libprotobuf-java-lite^android_common.output . $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-java-lite^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_13/external/protobuf/libprotobuf-java-lite^android_common.output $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-java-lite^android_common $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-java-lite^android_common/addition_copy_files.output

echo "building libprotobuf-java-lite^android_common_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja libprotobuf-java-lite,android_common_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-java-lite^android_common_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/external/protobuf/libprotobuf-java-lite^android_common_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-java-lite^android_common_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_13/external/protobuf/libprotobuf-java-lite^android_common_apex10000.output $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-java-lite^android_common_apex10000 $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-java-lite^android_common_apex10000/addition_copy_files.output

echo "building libprotobuf-java-lite^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja libprotobuf-java-lite,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-java-lite^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/external/protobuf/libprotobuf-java-lite^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-java-lite^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_13/external/protobuf/libprotobuf-java-lite^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-java-lite^android_common_apex30 $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-java-lite^android_common_apex30/addition_copy_files.output

echo "building libcore_private.stubs^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja libcore_private.stubs,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/protobuf/libcore_private.stubs^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/external/protobuf/libcore_private.stubs^android_common.output . $GITHUB_WORKSPACE/artifacts/external/protobuf/libcore_private.stubs^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_13/external/protobuf/libcore_private.stubs^android_common.output $GITHUB_WORKSPACE/artifacts/external/protobuf/libcore_private.stubs^android_common $GITHUB_WORKSPACE/artifacts/external/protobuf/libcore_private.stubs^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/protobuf/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_13 external_protobuf.tar.zst --clobber

du -ah -d1 external_protobuf*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi


rm -rf aosp
