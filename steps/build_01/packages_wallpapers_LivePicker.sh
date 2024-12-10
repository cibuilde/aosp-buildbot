set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform packages/wallpapers/LivePicker

echo "building android.software.live_wallpaper.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja android.software.live_wallpaper.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/wallpapers/LivePicker/android.software.live_wallpaper.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/wallpapers/LivePicker/android.software.live_wallpaper.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/wallpapers/LivePicker/android.software.live_wallpaper.xml^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ packages_wallpapers_LivePicker.tar.xz -C $GITHUB_WORKSPACE/artifacts/packages/wallpapers/LivePicker/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_wallpapers_LivePicker.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/packages_wallpapers_LivePicker.tar.xz -C $GITHUB_WORKSPACE/aosp/packages/wallpapers/LivePicker/ .
fi
rm -rf aosp