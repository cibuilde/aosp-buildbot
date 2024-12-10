set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform external/perfetto

echo "building mm_events^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja mm_events,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/mm_events^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/perfetto/mm_events^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/mm_events^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_perfetto.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/perfetto/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_perfetto.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_perfetto.tar.xz -C $GITHUB_WORKSPACE/aosp/external/perfetto/ .
fi
rm -rf aosp