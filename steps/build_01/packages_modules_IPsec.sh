set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform packages/modules/IPsec

echo "building android.net.ipsec.ike.xml^android_common_com.android.ipsec"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja android.net.ipsec.ike.xml,android_common_com.android.ipsec
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec.output . $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ packages_modules_IPsec.tar.xz -C $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_IPsec.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_IPsec.tar.xz -C $GITHUB_WORKSPACE/aosp/packages/modules/IPsec/ .
fi
rm -rf aosp