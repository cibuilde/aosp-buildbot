
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for packages/modules/IPsec"

clone_depth_platform packages/modules/IPsec


echo "building android.net.ipsec.ike.xml^android_common_com.android.ipsec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja android.net.ipsec.ike.xml,android_common_com.android.ipsec
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec.output . $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec.output $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_IPsec.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 packages_modules_IPsec.tar.zst --clobber

du -ah -d1 packages_modules_IPsec*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_IPsec.tar.zst" ]; then
  echo "Compressing packages/modules/IPsec -> packages_modules_IPsec.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_IPsec.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/IPsec/ .
fi


rm -rf aosp
