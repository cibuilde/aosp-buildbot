set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/timezone

echo "building apex_icu_tzdata.dat^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja apex_icu_tzdata.dat,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_icu_tzdata.dat^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/timezone/apex_icu_tzdata.dat^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_icu_tzdata.dat^android_x86_64

echo "building apex_telephonylookup.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja apex_telephonylookup.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_telephonylookup.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/timezone/apex_telephonylookup.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_telephonylookup.xml^android_x86_64

echo "building apex_tz_version^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja apex_tz_version,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tz_version^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/timezone/apex_tz_version^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tz_version^android_x86_64

echo "building apex_tzdata^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja apex_tzdata,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tzdata^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/timezone/apex_tzdata^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tzdata^android_x86_64

echo "building apex_tzlookup.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja apex_tzlookup.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tzlookup.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/timezone/apex_tzlookup.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tzlookup.xml^android_x86_64

echo "building tz_version^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja tz_version,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/version/tz_version^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/timezone/tz_version^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/version/tz_version^android_x86_64

echo "building tzdata^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja tzdata,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/iana/tzdata^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/timezone/tzdata^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/iana/tzdata^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ system_timezone.tar.xz -C $GITHUB_WORKSPACE/artifacts/system/timezone/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/system_timezone.tar.xz" ]; then
  echo "Compressing system/timezone -> system_timezone.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_timezone.tar.xz -C $GITHUB_WORKSPACE/aosp/system/timezone/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
