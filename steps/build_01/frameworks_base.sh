
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

echo "Preparing for frameworks/base"

clone_depth_platform art
clone_depth_platform bionic
clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/expat
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libpng
clone_depth_platform external/tinyxml2
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/incremental_delivery
clone_depth_platform system/libbase
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding
clone_sparse_exclude tools/dexter !/testdata


echo "building framework-minus-apex^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja framework-minus-apex,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-minus-apex^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/framework-minus-apex^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-minus-apex^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/framework-minus-apex^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-minus-apex^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-minus-apex^android_common/addition_copy_files.output

echo "building ext^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja ext,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/ext^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/ext^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/ext^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/ext^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/ext^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/ext^android_common/addition_copy_files.output

echo "building platform-bootclasspath^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja platform-bootclasspath,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/boot/platform-bootclasspath^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/platform-bootclasspath^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/boot/platform-bootclasspath^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/platform-bootclasspath^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/boot/platform-bootclasspath^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/boot/platform-bootclasspath^android_common/addition_copy_files.output

echo "building abx2xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja abx2xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/abx/abx2xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/abx2xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/abx/abx2xml^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/abx2xml^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/abx/abx2xml^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/abx/abx2xml^android_x86_64/addition_copy_files.output

echo "building xml2abx^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja xml2abx,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/abx/xml2abx^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/xml2abx^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/abx/xml2abx^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/xml2abx^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/abx/xml2abx^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/abx/xml2abx^android_x86_64/addition_copy_files.output

echo "building appops^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja appops,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/appops/appops^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/appops^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/appops/appops^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/appops^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/appops/appops^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/appops/appops^android_x86_64/addition_copy_files.output

echo "building device_config^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja device_config,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/device_config/device_config^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/device_config^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/device_config/device_config^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/device_config^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/device_config/device_config^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/device_config/device_config^android_x86_64/addition_copy_files.output

echo "building dpm^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja dpm,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/dpm/dpm^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/dpm^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/dpm/dpm^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/dpm^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/dpm/dpm^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/dpm/dpm^android_x86_64/addition_copy_files.output

echo "building libidmap2_policies^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libidmap2_policies,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/idmap2/libidmap2_policies^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libidmap2_policies^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/idmap2/libidmap2_policies^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libidmap2_policies^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/idmap2/libidmap2_policies^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/idmap2/libidmap2_policies^linux_glibc_x86_64_static/addition_copy_files.output

echo "building ime^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja ime,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/ime/ime^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/ime^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/ime/ime^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/ime^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/ime/ime^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/ime/ime^android_x86_64/addition_copy_files.output

echo "building input^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja input,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/input/input^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/input^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/input/input^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/input^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/input/input^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/input/input^android_x86_64/addition_copy_files.output

echo "building pm^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja pm,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/pm/pm^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/pm^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/pm/pm^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/pm^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/pm/pm^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/pm/pm^android_x86_64/addition_copy_files.output

echo "building settings^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja settings,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/settings/settings^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/settings^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/settings/settings^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/settings^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/settings/settings^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/settings/settings^android_x86_64/addition_copy_files.output

echo "building wm^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja wm,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/wm/wm^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/wm^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/wm/wm^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/wm^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/wm/wm^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/wm/wm^android_x86_64/addition_copy_files.output

echo "building privapp_whitelist_com.android.documentsui^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.documentsui,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.documentsui^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.documentsui^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.documentsui^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.documentsui^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.documentsui^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.documentsui^android_x86_64/addition_copy_files.output

echo "building privapp_whitelist_com.android.imsserviceentitlement^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.imsserviceentitlement,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.imsserviceentitlement^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.imsserviceentitlement^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.imsserviceentitlement^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.imsserviceentitlement^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.imsserviceentitlement^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.imsserviceentitlement^android_x86_64/addition_copy_files.output

echo "building privapp_whitelist_com.android.launcher3^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.launcher3,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.launcher3^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.launcher3^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.launcher3^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.launcher3^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.launcher3^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.launcher3^android_x86_64/addition_copy_files.output

echo "building privapp_whitelist_com.android.networkstack^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.networkstack,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.networkstack^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.networkstack^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack^android_x86_64/addition_copy_files.output

echo "building privapp_whitelist_com.android.networkstack.tethering^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.networkstack.tethering,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack.tethering^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.networkstack.tethering^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack.tethering^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.networkstack.tethering^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack.tethering^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack.tethering^android_x86_64/addition_copy_files.output

echo "building privapp_whitelist_com.android.provision^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.provision,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.provision^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.provision^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.provision^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.provision^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.provision^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.provision^android_x86_64/addition_copy_files.output

echo "building privapp_whitelist_com.android.settings^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.settings,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.settings^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.settings^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.settings^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.settings^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.settings^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.settings^android_x86_64/addition_copy_files.output

echo "building privapp_whitelist_com.android.settings.intelligence^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.settings.intelligence,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.settings.intelligence^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.settings.intelligence^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.settings.intelligence^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.settings.intelligence^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.settings.intelligence^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.settings.intelligence^android_x86_64/addition_copy_files.output

echo "building privapp_whitelist_com.android.storagemanager^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.storagemanager,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.storagemanager^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.storagemanager^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.storagemanager^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.storagemanager^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.storagemanager^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.storagemanager^android_x86_64/addition_copy_files.output

echo "building privapp_whitelist_com.android.systemui^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.systemui,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.systemui^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.systemui^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.systemui^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.systemui^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.systemui^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.systemui^android_x86_64/addition_copy_files.output

echo "building framework-sysconfig.xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja framework-sysconfig.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/framework-sysconfig.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/framework-sysconfig.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/framework-sysconfig.xml^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/framework-sysconfig.xml^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/framework-sysconfig.xml^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/framework-sysconfig.xml^android_x86_64/addition_copy_files.output

echo "building preinstalled-packages-platform.xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-platform.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/preinstalled-packages-platform.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/preinstalled-packages-platform.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/preinstalled-packages-platform.xml^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/preinstalled-packages-platform.xml^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/preinstalled-packages-platform.xml^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/preinstalled-packages-platform.xml^android_x86_64/addition_copy_files.output

echo "building preinstalled-packages-platform-overlays.xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-platform-overlays.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/preinstalled-packages-platform-overlays.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/preinstalled-packages-platform-overlays.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/preinstalled-packages-platform-overlays.xml^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/preinstalled-packages-platform-overlays.xml^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/preinstalled-packages-platform-overlays.xml^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/preinstalled-packages-platform-overlays.xml^android_x86_64/addition_copy_files.output

echo "building hiddenapi-package-whitelist.xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja hiddenapi-package-whitelist.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/hiddenapi-package-whitelist.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/hiddenapi-package-whitelist.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/hiddenapi-package-whitelist.xml^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/hiddenapi-package-whitelist.xml^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/hiddenapi-package-whitelist.xml^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/hiddenapi-package-whitelist.xml^android_x86_64/addition_copy_files.output

echo "building platform.xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja platform.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/platform.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/platform.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/platform.xml^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/platform.xml^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/platform.xml^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/platform.xml^android_x86_64/addition_copy_files.output

echo "building privapp-permissions-platform.xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp-permissions-platform.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp-permissions-platform.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp-permissions-platform.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp-permissions-platform.xml^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp-permissions-platform.xml^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp-permissions-platform.xml^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp-permissions-platform.xml^android_x86_64/addition_copy_files.output

echo "building privapp_whitelist_com.android.carrierconfig^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.carrierconfig,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.carrierconfig^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.carrierconfig^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.carrierconfig^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.carrierconfig^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.carrierconfig^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.carrierconfig^android_x86_64/addition_copy_files.output

echo "building privapp_whitelist_com.android.contacts^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.contacts,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.contacts^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.contacts^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.contacts^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.contacts^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.contacts^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.contacts^android_x86_64/addition_copy_files.output

echo "building privapp_whitelist_com.android.dialer^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.dialer,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.dialer^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.dialer^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.dialer^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.dialer^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.dialer^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.dialer^android_x86_64/addition_copy_files.output

echo "building privapp_whitelist_com.android.emergency^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.emergency,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.emergency^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.emergency^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.emergency^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.emergency^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.emergency^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.emergency^android_x86_64/addition_copy_files.output

echo "building DroidSansMono.ttf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja DroidSansMono.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/DroidSansMono.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/DroidSansMono.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/DroidSansMono.ttf^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/DroidSansMono.ttf^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/DroidSansMono.ttf^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/DroidSansMono.ttf^android_x86_64/addition_copy_files.output

echo "building AndroidClock.ttf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja AndroidClock.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/AndroidClock.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/AndroidClock.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/AndroidClock.ttf^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/AndroidClock.ttf^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/AndroidClock.ttf^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/AndroidClock.ttf^android_x86_64/addition_copy_files.output

echo "building fonts.xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja fonts.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/fonts.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/fonts.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/fonts.xml^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/fonts.xml^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/fonts.xml^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/fonts.xml^android_x86_64/addition_copy_files.output

echo "building framework-graphics^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja framework-graphics,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/framework-graphics^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/framework-graphics^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics^android_common/addition_copy_files.output

echo "building libprotoutil^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprotoutil,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libprotoutil^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libprotoutil^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static/addition_copy_files.output

echo "building libprotoutil^android_x86_64_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprotoutil,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libprotoutil^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libprotoutil^android_x86_64_static_apex30.output $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static_apex30 $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static_apex30/addition_copy_files.output

echo "building libprotoutil^android_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprotoutil,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libprotoutil^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libprotoutil^android_x86_64_static_lto-thin.output $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static_lto-thin $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static_lto-thin/addition_copy_files.output

echo "building libprotoutil^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprotoutil,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libprotoutil^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libprotoutil^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_x86_64_static/addition_copy_files.output

echo "building libprotoutil^android_x86_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprotoutil,android_x86_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libprotoutil^android_x86_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_x86_64_static_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libprotoutil^android_x86_x86_64_static_lto-thin.output $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_x86_64_static_lto-thin $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_x86_64_static_lto-thin/addition_copy_files.output

echo "building com.android.future.usb.accessory.xml^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.future.usb.accessory.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/usb/com.android.future.usb.accessory.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/com.android.future.usb.accessory.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/usb/com.android.future.usb.accessory.xml^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/com.android.future.usb.accessory.xml^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/usb/com.android.future.usb.accessory.xml^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/usb/com.android.future.usb.accessory.xml^android_common/addition_copy_files.output

echo "building com.android.location.provider.xml^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.location.provider.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/location/lib/com.android.location.provider.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/com.android.location.provider.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/location/lib/com.android.location.provider.xml^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/com.android.location.provider.xml^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/location/lib/com.android.location.provider.xml^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/location/lib/com.android.location.provider.xml^android_common/addition_copy_files.output

echo "building com.android.media.remotedisplay.xml^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.media.remotedisplay.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/lib/remotedisplay/com.android.media.remotedisplay.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/com.android.media.remotedisplay.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/lib/remotedisplay/com.android.media.remotedisplay.xml^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/com.android.media.remotedisplay.xml^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/media/lib/remotedisplay/com.android.media.remotedisplay.xml^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/media/lib/remotedisplay/com.android.media.remotedisplay.xml^android_common/addition_copy_files.output

echo "building com.android.mediadrm.signer.xml^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.mediadrm.signer.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/lib/signer/com.android.mediadrm.signer.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/com.android.mediadrm.signer.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/lib/signer/com.android.mediadrm.signer.xml^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/com.android.mediadrm.signer.xml^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/media/lib/signer/com.android.mediadrm.signer.xml^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/media/lib/signer/com.android.mediadrm.signer.xml^android_common/addition_copy_files.output

echo "building amidi^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja amidi,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/amidi^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/amidi^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/amidi^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/amidi^.output $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/amidi^ $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/amidi^/addition_copy_files.output

echo "building com.android.nfc_extras.xml^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.nfc_extras.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/nfc-extras/com.android.nfc_extras.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/com.android.nfc_extras.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/nfc-extras/com.android.nfc_extras.xml^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/com.android.nfc_extras.xml^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/nfc-extras/com.android.nfc_extras.xml^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/nfc-extras/com.android.nfc_extras.xml^android_common/addition_copy_files.output

echo "building javax.obex.xml^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja javax.obex.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/obex/javax.obex.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/javax.obex.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/obex/javax.obex.xml^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/javax.obex.xml^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/obex/javax.obex.xml^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/obex/javax.obex.xml^android_common/addition_copy_files.output

echo "building gps_debug.conf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gps_debug.conf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/gps_debug.conf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/gps_debug.conf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/gps_debug.conf^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/gps_debug.conf^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/gps_debug.conf^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/gps_debug.conf^android_x86_64/addition_copy_files.output

echo "building libviewcompiler^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libviewcompiler,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/startop/view_compiler/libviewcompiler^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libviewcompiler^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/startop/view_compiler/libviewcompiler^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libviewcompiler^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/base/startop/view_compiler/libviewcompiler^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/base/startop/view_compiler/libviewcompiler^android_x86_64_static/addition_copy_files.output

echo "building android.test.base.xml^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja android.test.base.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/test-base/android.test.base.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/android.test.base.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/test-base/android.test.base.xml^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/android.test.base.xml^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/test-base/android.test.base.xml^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/test-base/android.test.base.xml^android_common/addition_copy_files.output

echo "building android.test.mock.xml^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja android.test.mock.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/test-mock/android.test.mock.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/android.test.mock.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/test-mock/android.test.mock.xml^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/android.test.mock.xml^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/test-mock/android.test.mock.xml^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/test-mock/android.test.mock.xml^android_common/addition_copy_files.output

echo "building android.test.runner.xml^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja android.test.runner.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/test-runner/android.test.runner.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/android.test.runner.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/test-runner/android.test.runner.xml^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/android.test.runner.xml^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/test-runner/android.test.runner.xml^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/test-runner/android.test.runner.xml^android_common/addition_copy_files.output

echo "building libaapt^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libaapt,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/aapt/libaapt^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libaapt^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/aapt/libaapt^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libaapt^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/aapt/libaapt^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/aapt/libaapt^linux_glibc_x86_64_static/addition_copy_files.output

echo "building liblockagent^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblockagent,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/liblockagent^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/liblockagent^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/liblockagent^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/liblockagent^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/liblockagent^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/liblockagent^android_x86_64_static/addition_copy_files.output

echo "building start_with_lockagent^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja start_with_lockagent,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/start_with_lockagent^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/start_with_lockagent^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/start_with_lockagent^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/start_with_lockagent^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/start_with_lockagent^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/start_with_lockagent^android_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/base/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 frameworks_base.tar.zst --clobber

du -ah -d1 frameworks_base*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_expat.tar.zst" ]; then
  echo "Compressing external/expat -> external_expat.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_expat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/expat/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_googletest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libpng.tar.zst" ]; then
  echo "Compressing external/libpng -> external_libpng.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libpng.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libpng/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tinyxml2.tar.zst" ]; then
  echo "Compressing external/tinyxml2 -> external_tinyxml2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tinyxml2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tinyxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_incremental_delivery.tar.zst" ]; then
  echo "Compressing system/incremental_delivery -> system_incremental_delivery.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_incremental_delivery.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/incremental_delivery/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst" ]; then
  echo "Compressing system/libziparchive -> system_libziparchive.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libziparchive/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_dexter.tar.zst" ]; then
  echo "Compressing tools/dexter -> tools_dexter.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_dexter.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/dexter/ .
fi


rm -rf aosp
