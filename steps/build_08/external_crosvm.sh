set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/crosvm

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/bytes/libbytes^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf/copy_protobuf_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf/libprotobuf^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf-codegen/libprotobuf_codegen^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf-codegen/protoc-gen-rust^linux_glibc_x86_64/ .

echo "building libcdisk_spec_proto^android_x86_64_source_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcdisk_spec_proto,android_x86_64_source_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/protos/libcdisk_spec_proto^android_x86_64_source_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/crosvm/libcdisk_spec_proto^android_x86_64_source_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/protos/libcdisk_spec_proto^android_x86_64_source_apex10000

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_crosvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/crosvm/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 external_crosvm.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_crosvm.tar.zst" ]; then
  echo "Compressing external/crosvm -> external_crosvm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_crosvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/crosvm/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
