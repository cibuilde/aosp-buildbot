set -e

echo "entering packages/wallpapers/LivePicker"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/wallpapers/LivePicker
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"


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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
