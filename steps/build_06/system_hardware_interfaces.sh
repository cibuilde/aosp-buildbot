set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform hardware/interfaces
clone_depth_platform system/hardware/interfaces
clone_depth_platform system/libhidl
clone_depth_platform system/tools/aidl

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/blueprint/bpmodify^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/tools/aidl/aidl^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl-gen^linux_glibc_x86_64/ .

echo "building android.system.keystore2-api^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.keystore2-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/hardware/interfaces/android.system.keystore2-api^.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-api^

echo "building android.system.net.netd@1.0-inheritance-hierarchy^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.net.netd@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/hardware/interfaces/android.system.net.netd@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0-inheritance-hierarchy^

echo "building android.system.net.netd@1.0_genc++^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.net.netd@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/hardware/interfaces/android.system.net.netd@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0_genc++^

echo "building android.system.net.netd@1.0_genc++_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.net.netd@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/hardware/interfaces/android.system.net.netd@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0_genc++_headers^

echo "building android.system.net.netd@1.1-inheritance-hierarchy^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.net.netd@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/hardware/interfaces/android.system.net.netd@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1-inheritance-hierarchy^

echo "building android.system.net.netd@1.1_genc++^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.net.netd@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/hardware/interfaces/android.system.net.netd@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1_genc++^

echo "building android.system.net.netd@1.1_genc++_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.net.netd@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/hardware/interfaces/android.system.net.netd@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1_genc++_headers^

echo "building android.system.suspend.control-api^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.suspend.control-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/suspend/aidl/android.system.suspend.control-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/hardware/interfaces/android.system.suspend.control-api^.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/suspend/aidl/android.system.suspend.control-api^

echo "building android.system.suspend.control.internal-cpp-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.suspend.control.internal-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/suspend/aidl/android.system.suspend.control.internal-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/hardware/interfaces/android.system.suspend.control.internal-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/suspend/aidl/android.system.suspend.control.internal-cpp-source^

echo "building android.system.suspend@1.0-inheritance-hierarchy^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.suspend@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/hardware/interfaces/android.system.suspend@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0-inheritance-hierarchy^

echo "building android.system.suspend@1.0_genc++^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.suspend@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/hardware/interfaces/android.system.suspend@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0_genc++^

echo "building android.system.suspend@1.0_genc++_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.suspend@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/hardware/interfaces/android.system.suspend@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0_genc++_headers^

echo "building android.system.wifi.keystore@1.0-inheritance-hierarchy^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.wifi.keystore@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/hardware/interfaces/android.system.wifi.keystore@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0-inheritance-hierarchy^

echo "building android.system.wifi.keystore@1.0_genc++^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.wifi.keystore@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/hardware/interfaces/android.system.wifi.keystore@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0_genc++^

echo "building android.system.wifi.keystore@1.0_genc++_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.wifi.keystore@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/hardware/interfaces/android.system.wifi.keystore@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0_genc++_headers^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 system_hardware_interfaces.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst" ]; then
  echo "Compressing system/hardware/interfaces -> system_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
