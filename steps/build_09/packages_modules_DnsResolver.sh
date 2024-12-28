set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/modules/DnsResolver

rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/dnsresolver_aidl_interface-V9-ndk_platform^android_x86_64_static_cfi_com.android.resolv/ .

echo "building dnsresolver_aidl_interface-lateststable-ndk_platform^android_x86_64_static_cfi_com.android.resolv"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja dnsresolver_aidl_interface-lateststable-ndk_platform,android_x86_64_static_cfi_com.android.resolv
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/DnsResolver/dnsresolver_aidl_interface-lateststable-ndk_platform^android_x86_64_static_cfi_com.android.resolv
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/packages/modules/DnsResolver/dnsresolver_aidl_interface-lateststable-ndk_platform^android_x86_64_static_cfi_com.android.resolv.output . $GITHUB_WORKSPACE/artifacts/packages/modules/DnsResolver/dnsresolver_aidl_interface-lateststable-ndk_platform^android_x86_64_static_cfi_com.android.resolv

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_DnsResolver.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/DnsResolver/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 packages_modules_DnsResolver.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_DnsResolver.tar.zst" ]; then
  echo "Compressing packages/modules/DnsResolver -> packages_modules_DnsResolver.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_DnsResolver.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/DnsResolver/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
