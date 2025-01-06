
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for hardware/interfaces"

clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform hardware/interfaces
clone_depth_platform libcore
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/framework^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/ext^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/stable-core-platform-api-stubs-system-modules^android_common/ .

echo "building android.hardware.biometrics.common-V1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja android.hardware.biometrics.common-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.biometrics.common-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.biometrics.common-V1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-java^android_common/addition_copy_files.output

echo "building android.hardware.biometrics.face-V1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja android.hardware.biometrics.face-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.biometrics.face-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.biometrics.face-V1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-java^android_common/addition_copy_files.output

echo "building android.hardware.biometrics.fingerprint-V1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja android.hardware.biometrics.fingerprint-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.biometrics.fingerprint-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.biometrics.fingerprint-V1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-java^android_common/addition_copy_files.output

echo "building android.hardware.gnss-V1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja android.hardware.gnss-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.gnss-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.gnss-V1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-java^android_common/addition_copy_files.output

echo "building android.hardware.keymaster-V3-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja android.hardware.keymaster-V3-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.keymaster-V3-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.keymaster-V3-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-java^android_common/addition_copy_files.output

echo "building android.hardware.power-V1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja android.hardware.power-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.power-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.power-V1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V1-java^android_common/addition_copy_files.output

echo "building android.hardware.power.stats-V1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja android.hardware.power.stats-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.power.stats-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.power.stats-V1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-java^android_common/addition_copy_files.output

echo "building android.hardware.rebootescrow-V1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja android.hardware.rebootescrow-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.rebootescrow-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.rebootescrow-V1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-java^android_common/addition_copy_files.output

echo "building android.hardware.security.keymint-V1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja android.hardware.security.keymint-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.security.keymint-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.security.keymint-V1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-java^android_common/addition_copy_files.output

echo "building android.hardware.security.secureclock-V1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja android.hardware.security.secureclock-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.security.secureclock-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/hardware/interfaces/android.hardware.security.secureclock-V1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-java^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_25 hardware_interfaces.tar.zst --clobber

du -ah -d1 hardware_interfaces*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi


rm -rf aosp
