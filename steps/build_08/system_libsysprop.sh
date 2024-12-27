set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse cts libs/json
clone_depth_platform system/libsysprop

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-cpp-full^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libsysprop/srcs/PlatformProperties_sysprop_library^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/tools/sysprop/sysprop_java^linux_glibc_x86_64/ .

echo "building PlatformProperties_java_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja PlatformProperties_java_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libsysprop/srcs/PlatformProperties_java_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libsysprop/PlatformProperties_java_gen^.output . $GITHUB_WORKSPACE/artifacts/system/libsysprop/srcs/PlatformProperties_java_gen^

echo "building PlatformProperties_java_gen_public^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja PlatformProperties_java_gen_public,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libsysprop/srcs/PlatformProperties_java_gen_public^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libsysprop/PlatformProperties_java_gen_public^.output . $GITHUB_WORKSPACE/artifacts/system/libsysprop/srcs/PlatformProperties_java_gen_public^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_libsysprop.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/libsysprop/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 system_libsysprop.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libsysprop.tar.zst" ]; then
  echo "Compressing system/libsysprop -> system_libsysprop.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libsysprop.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libsysprop/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
