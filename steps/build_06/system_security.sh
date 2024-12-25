set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform hardware/interfaces
clone_depth_platform system/hardware/interfaces
clone_depth_platform system/security

rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building android.security.apc-java-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.apc-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.apc-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-java-source^

echo "building android.security.apc-ndk_platform-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.apc-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.apc-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-ndk_platform-source^

echo "building android.security.apc-rust-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.apc-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.apc-rust-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.apc-rust-source^

echo "building android.security.authorization-java-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.authorization-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.authorization-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.authorization-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.authorization-java-source^

echo "building android.security.authorization-ndk_platform-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.authorization-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.authorization-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.authorization-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.authorization-ndk_platform-source^

echo "building android.security.authorization-rust-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.authorization-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.authorization-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.authorization-rust-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.authorization-rust-source^

echo "building android.security.compat-ndk_platform-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.compat-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.compat-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.compat-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.compat-ndk_platform-source^

echo "building android.security.compat-rust-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.compat-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.compat-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.compat-rust-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.compat-rust-source^

echo "building android.security.legacykeystore-java-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.legacykeystore-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.legacykeystore-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-java-source^

echo "building android.security.legacykeystore-ndk_platform-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.legacykeystore-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.legacykeystore-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-ndk_platform-source^

echo "building android.security.legacykeystore-rust-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.legacykeystore-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.legacykeystore-rust-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.legacykeystore-rust-source^

echo "building android.security.maintenance-java-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.maintenance-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.maintenance-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.maintenance-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.maintenance-java-source^

echo "building android.security.maintenance-ndk_platform-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.maintenance-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.maintenance-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.maintenance-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.maintenance-ndk_platform-source^

echo "building android.security.maintenance-rust-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.maintenance-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.maintenance-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.maintenance-rust-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.maintenance-rust-source^

echo "building android.security.metrics-java-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.metrics-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.metrics-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.metrics-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.metrics-java-source^

echo "building android.security.metrics-rust-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.metrics-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.metrics-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.metrics-rust-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.metrics-rust-source^

echo "building android.security.remoteprovisioning-java-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.remoteprovisioning-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.remoteprovisioning-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.remoteprovisioning-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.remoteprovisioning-java-source^

echo "building android.security.remoteprovisioning-rust-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android.security.remoteprovisioning-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.remoteprovisioning-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/security/android.security.remoteprovisioning-rust-source^.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/aidl/android.security.remoteprovisioning-rust-source^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_security.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/security/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 system_security.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst" ]; then
  echo "Compressing system/hardware/interfaces -> system_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_security.tar.zst" ]; then
  echo "Compressing system/security -> system_security.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_security.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/security/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
