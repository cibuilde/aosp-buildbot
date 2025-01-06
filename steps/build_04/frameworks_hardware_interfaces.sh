
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

echo "Preparing for frameworks/hardware/interfaces"

clone_depth_platform bionic
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/hardware/interfaces
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libhidl
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/tools/aidl

rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-api^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/hidl-gen^linux_glibc_x86_64/ .

echo "building android.frameworks.automotive.display@1.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.automotive.display@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/automotive/display/1.0/android.frameworks.automotive.display@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.automotive.display@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/automotive/display/1.0/android.frameworks.automotive.display@1.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.automotive.display@1.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/automotive/display/1.0/android.frameworks.automotive.display@1.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/automotive/display/1.0/android.frameworks.automotive.display@1.0-inheritance-hierarchy^/addition_copy_files.output

echo "building android.frameworks.bufferhub@1.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.bufferhub@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.bufferhub@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.bufferhub@1.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0-inheritance-hierarchy^/addition_copy_files.output

echo "building android.frameworks.bufferhub@1.0_genc++^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.bufferhub@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.bufferhub@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0_genc++^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.bufferhub@1.0_genc++^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0_genc++^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0_genc++^/addition_copy_files.output

echo "building android.frameworks.bufferhub@1.0_genc++_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.bufferhub@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.bufferhub@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0_genc++_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.bufferhub@1.0_genc++_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0_genc++_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0_genc++_headers^/addition_copy_files.output

echo "building android.frameworks.cameraservice.common@2.0_genc++^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.common@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.common@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0_genc++^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.common@2.0_genc++^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0_genc++^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0_genc++^/addition_copy_files.output

echo "building android.frameworks.cameraservice.common@2.0_genc++_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.common@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.common@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0_genc++_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.common@2.0_genc++_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0_genc++_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0_genc++_headers^/addition_copy_files.output

echo "building android.frameworks.cameraservice.device@2.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.device@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0-inheritance-hierarchy^/addition_copy_files.output

echo "building android.frameworks.cameraservice.device@2.0_genc++^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.device@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0_genc++^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.0_genc++^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0_genc++^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0_genc++^/addition_copy_files.output

echo "building android.frameworks.cameraservice.device@2.0_genc++_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.device@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0_genc++_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.0_genc++_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0_genc++_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0_genc++_headers^/addition_copy_files.output

echo "building android.frameworks.cameraservice.device@2.1-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.device@2.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.1-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1-inheritance-hierarchy^/addition_copy_files.output

echo "building android.frameworks.cameraservice.device@2.1_genc++^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.device@2.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1_genc++^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.1_genc++^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1_genc++^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1_genc++^/addition_copy_files.output

echo "building android.frameworks.cameraservice.device@2.1_genc++_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.device@2.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1_genc++_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.1_genc++_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1_genc++_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1_genc++_headers^/addition_copy_files.output

echo "building android.frameworks.cameraservice.service@2.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.service@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0-inheritance-hierarchy^/addition_copy_files.output

echo "building android.frameworks.cameraservice.service@2.0_genc++^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.service@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0_genc++^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.0_genc++^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0_genc++^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0_genc++^/addition_copy_files.output

echo "building android.frameworks.cameraservice.service@2.0_genc++_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.service@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0_genc++_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.0_genc++_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0_genc++_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0_genc++_headers^/addition_copy_files.output

echo "building android.frameworks.cameraservice.service@2.1-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.service@2.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.1-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1-inheritance-hierarchy^/addition_copy_files.output

echo "building android.frameworks.cameraservice.service@2.1_genc++^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.service@2.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1_genc++^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.1_genc++^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1_genc++^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1_genc++^/addition_copy_files.output

echo "building android.frameworks.cameraservice.service@2.1_genc++_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.service@2.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1_genc++_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.1_genc++_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1_genc++_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1_genc++_headers^/addition_copy_files.output

echo "building android.frameworks.cameraservice.service@2.2-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.service@2.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.2-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2-inheritance-hierarchy^/addition_copy_files.output

echo "building android.frameworks.cameraservice.service@2.2_genc++^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.service@2.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2_genc++^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.2_genc++^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2_genc++^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2_genc++^/addition_copy_files.output

echo "building android.frameworks.cameraservice.service@2.2_genc++_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.cameraservice.service@2.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2_genc++_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.2_genc++_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2_genc++_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2_genc++_headers^/addition_copy_files.output

echo "building android.frameworks.displayservice@1.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.displayservice@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.displayservice@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.displayservice@1.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0-inheritance-hierarchy^/addition_copy_files.output

echo "building android.frameworks.displayservice@1.0_genc++^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.displayservice@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.displayservice@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.displayservice@1.0_genc++^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++^/addition_copy_files.output

echo "building android.frameworks.displayservice@1.0_genc++_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.displayservice@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.displayservice@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.displayservice@1.0_genc++_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++_headers^/addition_copy_files.output

echo "building android.frameworks.schedulerservice@1.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.schedulerservice@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.schedulerservice@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.schedulerservice@1.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0-inheritance-hierarchy^/addition_copy_files.output

echo "building android.frameworks.schedulerservice@1.0_genc++^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.schedulerservice@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.schedulerservice@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.schedulerservice@1.0_genc++^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++^/addition_copy_files.output

echo "building android.frameworks.schedulerservice@1.0_genc++_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.schedulerservice@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.schedulerservice@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.schedulerservice@1.0_genc++_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++_headers^/addition_copy_files.output

echo "building android.frameworks.sensorservice@1.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.sensorservice@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.sensorservice@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.sensorservice@1.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0-inheritance-hierarchy^/addition_copy_files.output

echo "building android.frameworks.sensorservice@1.0_genc++^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.sensorservice@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.sensorservice@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.sensorservice@1.0_genc++^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++^/addition_copy_files.output

echo "building android.frameworks.sensorservice@1.0_genc++_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.sensorservice@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.sensorservice@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.sensorservice@1.0_genc++_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++_headers^/addition_copy_files.output

echo "building android.frameworks.stats@1.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.stats@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.stats@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.stats@1.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0-inheritance-hierarchy^/addition_copy_files.output

echo "building android.frameworks.stats@1.0_genc++^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.stats@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.stats@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.stats@1.0_genc++^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++^/addition_copy_files.output

echo "building android.frameworks.stats@1.0_genc++_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.stats@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.stats@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.stats@1.0_genc++_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++_headers^/addition_copy_files.output

echo "building android.frameworks.stats-V1-ndk_platform-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.stats-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.stats-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform-source^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.stats-V1-ndk_platform-source^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform-source^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform-source^/addition_copy_files.output

echo "building android.frameworks.stats-V1-ndk_platform^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.stats-V1-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.stats-V1-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.stats-V1-ndk_platform^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_64_static/addition_copy_files.output

echo "building android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.stats-V1-ndk_platform,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_static/addition_copy_files.output

echo "building android.frameworks.stats-api^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.stats-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.stats-api^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-api^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.stats-api^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-api^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-api^/addition_copy_files.output

echo "building android.frameworks.vr.composer@1.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.vr.composer@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/vr/composer/1.0/android.frameworks.vr.composer@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.vr.composer@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/vr/composer/1.0/android.frameworks.vr.composer@1.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.vr.composer@1.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/vr/composer/1.0/android.frameworks.vr.composer@1.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/vr/composer/1.0/android.frameworks.vr.composer@1.0-inheritance-hierarchy^/addition_copy_files.output

echo "building android.frameworks.vr.composer@2.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.frameworks.vr.composer@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/vr/composer/2.0/android.frameworks.vr.composer@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.vr.composer@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/vr/composer/2.0/android.frameworks.vr.composer@2.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/hardware/interfaces/android.frameworks.vr.composer@2.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/vr/composer/2.0/android.frameworks.vr.composer@2.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/vr/composer/2.0/android.frameworks.vr.composer@2.0-inheritance-hierarchy^/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 frameworks_hardware_interfaces.tar.zst --clobber

du -ah -d1 frameworks_hardware_interfaces*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_hardware_interfaces.tar.zst" ]; then
  echo "Compressing frameworks/hardware/interfaces -> frameworks_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi


rm -rf aosp
