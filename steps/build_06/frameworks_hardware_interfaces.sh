set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform frameworks/hardware/interfaces
clone_depth_platform hardware/interfaces
clone_depth_platform system/libhidl
clone_depth_platform system/tools/aidl

rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/bpmodify^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/hidl-gen^linux_glibc_x86_64/ .

echo "building android.frameworks.automotive.display@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.automotive.display@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/automotive/display/1.0/android.frameworks.automotive.display@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.automotive.display@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/automotive/display/1.0/android.frameworks.automotive.display@1.0-inheritance-hierarchy^

echo "building android.frameworks.bufferhub@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.bufferhub@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.bufferhub@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0-inheritance-hierarchy^

echo "building android.frameworks.bufferhub@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.bufferhub@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.bufferhub@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0_genc++^

echo "building android.frameworks.bufferhub@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.bufferhub@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.bufferhub@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0_genc++_headers^

echo "building android.frameworks.cameraservice.common@2.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.common@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.common@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0_genc++^

echo "building android.frameworks.cameraservice.common@2.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.common@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.common@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0_genc++_headers^

echo "building android.frameworks.cameraservice.device@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.device@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0-inheritance-hierarchy^

echo "building android.frameworks.cameraservice.device@2.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.device@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0_genc++^

echo "building android.frameworks.cameraservice.device@2.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.device@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0_genc++_headers^

echo "building android.frameworks.cameraservice.device@2.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.device@2.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1-inheritance-hierarchy^

echo "building android.frameworks.cameraservice.device@2.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.device@2.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1_genc++^

echo "building android.frameworks.cameraservice.device@2.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.device@2.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1_genc++_headers^

echo "building android.frameworks.cameraservice.service@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.service@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0-inheritance-hierarchy^

echo "building android.frameworks.cameraservice.service@2.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.service@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0_genc++^

echo "building android.frameworks.cameraservice.service@2.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.service@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0_genc++_headers^

echo "building android.frameworks.cameraservice.service@2.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.service@2.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1-inheritance-hierarchy^

echo "building android.frameworks.cameraservice.service@2.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.service@2.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1_genc++^

echo "building android.frameworks.cameraservice.service@2.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.service@2.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1_genc++_headers^

echo "building android.frameworks.cameraservice.service@2.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.service@2.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2-inheritance-hierarchy^

echo "building android.frameworks.cameraservice.service@2.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.service@2.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2_genc++^

echo "building android.frameworks.cameraservice.service@2.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.cameraservice.service@2.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2_genc++_headers^

echo "building android.frameworks.displayservice@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.displayservice@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.displayservice@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0-inheritance-hierarchy^

echo "building android.frameworks.displayservice@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.displayservice@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.displayservice@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++^

echo "building android.frameworks.displayservice@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.displayservice@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.displayservice@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++_headers^

echo "building android.frameworks.schedulerservice@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.schedulerservice@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.schedulerservice@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0-inheritance-hierarchy^

echo "building android.frameworks.schedulerservice@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.schedulerservice@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.schedulerservice@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++^

echo "building android.frameworks.schedulerservice@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.schedulerservice@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.schedulerservice@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++_headers^

echo "building android.frameworks.sensorservice@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.sensorservice@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.sensorservice@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0-inheritance-hierarchy^

echo "building android.frameworks.sensorservice@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.sensorservice@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.sensorservice@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++^

echo "building android.frameworks.sensorservice@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.sensorservice@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.sensorservice@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++_headers^

echo "building android.frameworks.stats-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.stats-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.stats-api^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-api^

echo "building android.frameworks.stats@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.stats@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.stats@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0-inheritance-hierarchy^

echo "building android.frameworks.stats@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.stats@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.stats@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++^

echo "building android.frameworks.stats@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.stats@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.stats@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++_headers^

echo "building android.frameworks.vr.composer@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.vr.composer@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/vr/composer/1.0/android.frameworks.vr.composer@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.vr.composer@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/vr/composer/1.0/android.frameworks.vr.composer@1.0-inheritance-hierarchy^

echo "building android.frameworks.vr.composer@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.frameworks.vr.composer@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/vr/composer/2.0/android.frameworks.vr.composer@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/hardware/interfaces/android.frameworks.vr.composer@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/vr/composer/2.0/android.frameworks.vr.composer@2.0-inheritance-hierarchy^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 frameworks_hardware_interfaces.tar.zst --clobber

du -ah -d1 frameworks_hardware_interfaces*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_hardware_interfaces.tar.zst" ]; then
  echo "Compressing frameworks/hardware/interfaces -> frameworks_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi

rm -rf aosp
