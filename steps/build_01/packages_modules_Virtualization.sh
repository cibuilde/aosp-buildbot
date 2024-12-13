set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/modules/Virtualization

echo "building com.android.virt.init.rc^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.virt.init.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/apex/com.android.virt.init.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/com.android.virt.init.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/apex/com.android.virt.init.rc^android_x86_64

echo "building microdroid_build_prop^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_build_prop,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_build_prop^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_build_prop^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_build_prop^android_x86_64

echo "building microdroid_cdisk.json^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_cdisk.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_cdisk.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk.json^android_x86_64

echo "building microdroid_cdisk_env.json^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_cdisk_env.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk_env.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_cdisk_env.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk_env.json^android_x86_64

echo "building microdroid_cdisk_userdata.json^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_cdisk_userdata.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk_userdata.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_cdisk_userdata.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk_userdata.json^android_x86_64

echo "building microdroid_fstab^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_fstab,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_fstab^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_fstab^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_fstab^android_x86_64

echo "building microdroid_init_rc^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_init_rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_init_rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_init_rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_init_rc^android_x86_64

echo "building microdroid_payload.json^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_payload.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_payload.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_payload.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_payload.json^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ packages_modules_Virtualization.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/ .

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst" ]; then
  echo "Compressing packages/modules/Virtualization -> packages_modules_Virtualization.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst -C $GITHUB_WORKSPACE/aosp/packages/modules/Virtualization/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
