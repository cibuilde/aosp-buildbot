set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/modules/IPsec

echo "building android.net.ipsec.ike.xml^android_common_com.android.ipsec"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja android.net.ipsec.ike.xml,android_common_com.android.ipsec
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec.output . $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ packages_modules_IPsec.tar.xz -C $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_IPsec.tar.xz" ]; then
  echo "Compressing packages/modules/IPsec -> packages_modules_IPsec.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_IPsec.tar.xz -C $GITHUB_WORKSPACE/aosp/packages/modules/IPsec/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
