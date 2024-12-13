set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/perfetto

echo "building mm_events^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja mm_events,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/mm_events^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/perfetto/mm_events^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/mm_events^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_perfetto.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/perfetto/ .

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_perfetto.tar.zst" ]; then
  echo "Compressing external/perfetto -> external_perfetto.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_perfetto.tar.zst -C $GITHUB_WORKSPACE/aosp/external/perfetto/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
