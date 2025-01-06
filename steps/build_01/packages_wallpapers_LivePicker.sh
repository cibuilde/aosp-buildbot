
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for packages/wallpapers/LivePicker"

clone_depth_platform packages/wallpapers/LivePicker


echo "building android.software.live_wallpaper.xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja android.software.live_wallpaper.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/wallpapers/LivePicker/android.software.live_wallpaper.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/wallpapers/LivePicker/android.software.live_wallpaper.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/wallpapers/LivePicker/android.software.live_wallpaper.xml^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/wallpapers/LivePicker/android.software.live_wallpaper.xml^android_x86_64.output $GITHUB_WORKSPACE/artifacts/packages/wallpapers/LivePicker/android.software.live_wallpaper.xml^android_x86_64 $GITHUB_WORKSPACE/artifacts/packages/wallpapers/LivePicker/android.software.live_wallpaper.xml^android_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_wallpapers_LivePicker.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/wallpapers/LivePicker/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 packages_wallpapers_LivePicker.tar.zst --clobber

du -ah -d1 packages_wallpapers_LivePicker*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/packages_wallpapers_LivePicker.tar.zst" ]; then
  echo "Compressing packages/wallpapers/LivePicker -> packages_wallpapers_LivePicker.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_wallpapers_LivePicker.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/wallpapers/LivePicker/ .
fi


rm -rf aosp
