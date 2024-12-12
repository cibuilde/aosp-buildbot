set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/wallpapers/LivePicker

echo "building android.software.live_wallpaper.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja android.software.live_wallpaper.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/wallpapers/LivePicker/android.software.live_wallpaper.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/wallpapers/LivePicker/android.software.live_wallpaper.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/wallpapers/LivePicker/android.software.live_wallpaper.xml^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ packages_wallpapers_LivePicker.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/wallpapers/LivePicker/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_wallpapers_LivePicker.tar.zst" ]; then
  echo "Compressing packages/wallpapers/LivePicker -> packages_wallpapers_LivePicker.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/packages_wallpapers_LivePicker.tar.zst -C $GITHUB_WORKSPACE/aosp/packages/wallpapers/LivePicker/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
