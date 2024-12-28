set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/modules/common

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .

echo "building classpaths_proto_python^linux_glibc_x86_64_PY3"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja classpaths_proto_python,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/classpaths_proto_python^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/packages/modules/common/classpaths_proto_python^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/classpaths_proto_python^linux_glibc_x86_64_PY3

echo "building sdk_proto_python^linux_glibc_x86_64_PY3"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja sdk_proto_python,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/sdk_proto_python^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/packages/modules/common/sdk_proto_python^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/sdk_proto_python^linux_glibc_x86_64_PY3

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_common.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/common/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 packages_modules_common.tar.zst --clobber

du -ah -d1 packages_modules_common*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_common.tar.zst" ]; then
  echo "Compressing packages/modules/common -> packages_modules_common.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_common.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/common/ .
fi

rm -rf aosp
