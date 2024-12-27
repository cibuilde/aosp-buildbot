set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform hardware/nxp/secure_element
clone_depth_platform system/libhidl

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/hidl-gen^linux_glibc_x86_64/ .

echo "building vendor.nxp.nxpese@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja vendor.nxp.nxpese@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/nxp/secure_element/intf/nxpese/1.0/vendor.nxp.nxpese@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/hardware/nxp/secure_element/vendor.nxp.nxpese@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/nxp/secure_element/intf/nxpese/1.0/vendor.nxp.nxpese@1.0-inheritance-hierarchy^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf hardware_nxp_secure_element.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/hardware/nxp/secure_element/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 hardware_nxp_secure_element.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_nxp_secure_element.tar.zst" ]; then
  echo "Compressing hardware/nxp/secure_element -> hardware_nxp_secure_element.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_nxp_secure_element.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/nxp/secure_element/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
