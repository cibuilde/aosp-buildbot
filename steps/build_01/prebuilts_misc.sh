set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse_exclude prebuilts/misc "!/common/robolectric" "!/darwin-x86" "!/darwin-x86_64"

echo "building gdbserver^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja gdbserver,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/misc/gdbserver^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_64

echo "building gdbserver^android_x86_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja gdbserver,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/misc/gdbserver^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ prebuilts_misc.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/misc/ .

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst" ]; then
  echo "Compressing prebuilts/misc -> prebuilts_misc.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/misc/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
