set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/modules/IPsec
clone_depth_platform platform/packages/modules/IPsec


echo "building android.net.ipsec.ike.xml^android_common_com.android.ipsec"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja android.net.ipsec.ike.xml,android_common_com.android.ipsec
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec.output . $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_packages_modules_IPsec.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/packages/modules/IPsec/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 platform_packages_modules_IPsec.tar.zst --clobber

du -ah -d1 platform_packages_modules_IPsec*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_IPsec.tar.zst" ]; then
  echo "Compressing packages/modules/IPsec -> packages_modules_IPsec.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_IPsec.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/IPsec/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_packages_modules_IPsec.tar.zst" ]; then
  echo "Compressing platform/packages/modules/IPsec -> platform_packages_modules_IPsec.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_packages_modules_IPsec.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/packages/modules/IPsec/ .
fi

rm -rf aosp
