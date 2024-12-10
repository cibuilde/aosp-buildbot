set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

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

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ packages_modules_Virtualization.tar.xz -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.xz -C $GITHUB_WORKSPACE/aosp/packages/modules/Virtualization/ .
fi
rm -rf aosp