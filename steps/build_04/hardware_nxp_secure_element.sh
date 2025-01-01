set -e

echo "entering hardware/nxp/secure_element"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform hardware/nxp/secure_element
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform system/libhidl

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/hidl-gen^linux_glibc_x86_64/ .

echo "building vendor.nxp.nxpese@1.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja vendor.nxp.nxpese@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/nxp/secure_element/intf/nxpese/1.0/vendor.nxp.nxpese@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/nxp/secure_element/vendor.nxp.nxpese@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/nxp/secure_element/intf/nxpese/1.0/vendor.nxp.nxpese@1.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/hardware/nxp/secure_element/vendor.nxp.nxpese@1.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/hardware/nxp/secure_element/intf/nxpese/1.0/vendor.nxp.nxpese@1.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/hardware/nxp/secure_element/intf/nxpese/1.0/vendor.nxp.nxpese@1.0-inheritance-hierarchy^/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf hardware_nxp_secure_element.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/hardware/nxp/secure_element/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 hardware_nxp_secure_element.tar.zst --clobber

du -ah -d1 hardware_nxp_secure_element*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_nxp_secure_element.tar.zst" ]; then
  echo "Compressing hardware/nxp/secure_element -> hardware_nxp_secure_element.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_nxp_secure_element.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/nxp/secure_element/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi

rm -rf aosp
