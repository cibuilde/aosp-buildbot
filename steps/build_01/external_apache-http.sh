set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform external/apache-http

echo "building org.apache.http.legacy.xml^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja org.apache.http.legacy.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/apache-http/org.apache.http.legacy.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/apache-http/org.apache.http.legacy.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/external/apache-http/org.apache.http.legacy.xml^android_common

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_apache-http.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/apache-http/ .

du -ah -d1

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_apache-http.tar.xz" ]; then
  echo "Compressing external/apache-http -> external_apache-http.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_apache-http.tar.xz -C $GITHUB_WORKSPACE/aosp/external/apache-http/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
