set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_sparse_exclude prebuilts/misc "!/common/robolectric" "!/darwin-x86" "!/darwin-x86_64" "!/gdbserver"

echo "building gdbserver^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja gdbserver,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/misc/gdbserver^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_64

echo "building gdbserver^android_x86_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja gdbserver,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/misc/gdbserver^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ prebuilts_misc.tar.xz -C $GITHUB_WORKSPACE/artifacts/prebuilts/misc/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_misc.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_misc.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/misc/ .
fi
rm -rf aosp