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

rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/generate_operator_out^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building art-odrefresh-operator-srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja art-odrefresh-operator-srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/odrefresh/art-odrefresh-operator-srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/art/art-odrefresh-operator-srcs^.output . $GITHUB_WORKSPACE/artifacts/art/odrefresh/art-odrefresh-operator-srcs^

echo "building art_compiler_operator_srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja art_compiler_operator_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/compiler/art_compiler_operator_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/art/art_compiler_operator_srcs^.output . $GITHUB_WORKSPACE/artifacts/art/compiler/art_compiler_operator_srcs^

echo "building art_dex2oat_operator_srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja art_dex2oat_operator_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dex2oat/art_dex2oat_operator_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/art/art_dex2oat_operator_srcs^.output . $GITHUB_WORKSPACE/artifacts/art/dex2oat/art_dex2oat_operator_srcs^

echo "building art_libartbase_operator_srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja art_libartbase_operator_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartbase/art_libartbase_operator_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/art/art_libartbase_operator_srcs^.output . $GITHUB_WORKSPACE/artifacts/art/libartbase/art_libartbase_operator_srcs^

echo "building art_operator_srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja art_operator_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/art_operator_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/art/art_operator_srcs^.output . $GITHUB_WORKSPACE/artifacts/art/runtime/art_operator_srcs^

echo "building art_perfetto_hprof_operator_srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja art_perfetto_hprof_operator_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/art_perfetto_hprof_operator_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/art/art_perfetto_hprof_operator_srcs^.output . $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/art_perfetto_hprof_operator_srcs^

echo "building dexfile_operator_srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja dexfile_operator_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/dexfile_operator_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/art/dexfile_operator_srcs^.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/dexfile_operator_srcs^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/art/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 art.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
