set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform hardware/nxp/nfc
clone_depth_platform system/libhidl

rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl-gen^linux_glibc_x86_64/ .

echo "building vendor.nxp.nxpnfc@1.0-inheritance-hierarchy^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja vendor.nxp.nxpnfc@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/nxp/nfc/intf/nxpnfc/1.0/vendor.nxp.nxpnfc@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/hardware/nxp/nfc/vendor.nxp.nxpnfc@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/nxp/nfc/intf/nxpnfc/1.0/vendor.nxp.nxpnfc@1.0-inheritance-hierarchy^

echo "building vendor.nxp.nxpnfc@2.0-inheritance-hierarchy^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja vendor.nxp.nxpnfc@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/nxp/nfc/intf/nxpnfc/2.0/vendor.nxp.nxpnfc@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/hardware/nxp/nfc/vendor.nxp.nxpnfc@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/nxp/nfc/intf/nxpnfc/2.0/vendor.nxp.nxpnfc@2.0-inheritance-hierarchy^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf hardware_nxp_nfc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/hardware/nxp/nfc/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 hardware_nxp_nfc.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_nxp_nfc.tar.zst" ]; then
  echo "Compressing hardware/nxp/nfc -> hardware_nxp_nfc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_nxp_nfc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/nxp/nfc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp