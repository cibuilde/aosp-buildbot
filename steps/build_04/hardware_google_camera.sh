set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform hardware/google/camera

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building hidl_camera_build_version^android_vendor.31_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja hidl_camera_build_version,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/google/camera/common/hal/hidl_service/hidl_camera_build_version^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/google/camera/hidl_camera_build_version^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/google/camera/common/hal/hidl_service/hidl_camera_build_version^android_vendor.31_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ hardware_google_camera.tar.zst -C $GITHUB_WORKSPACE/artifacts/hardware/google/camera/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 hardware_google_camera.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_google_camera.tar.zst" ]; then
  echo "Compressing hardware/google/camera -> hardware_google_camera.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_google_camera.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/google/camera/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
