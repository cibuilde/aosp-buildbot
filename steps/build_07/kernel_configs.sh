set -e

echo "entering kernel/configs"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth kernel/configs
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pcre/libpcre2^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/libselinux/libselinux^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tinyxml2/libtinyxml2^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/kernel/configs/tools/kconfig_xml_fixup^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libvintf/assemble_vintf^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libvintf/libvintf^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_shared/ .

echo "building kernel_config_p_4.14^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja kernel_config_p_4.14,
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/configs/p/android-4.14/kernel_config_p_4.14^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/kernel/configs/kernel_config_p_4.14^.output . $GITHUB_WORKSPACE/artifacts/kernel/configs/p/android-4.14/kernel_config_p_4.14^

echo "building kernel_config_p_4.4^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja kernel_config_p_4.4,
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/configs/p/android-4.4/kernel_config_p_4.4^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/kernel/configs/kernel_config_p_4.4^.output . $GITHUB_WORKSPACE/artifacts/kernel/configs/p/android-4.4/kernel_config_p_4.4^

echo "building kernel_config_p_4.9^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja kernel_config_p_4.9,
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/configs/p/android-4.9/kernel_config_p_4.9^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/kernel/configs/kernel_config_p_4.9^.output . $GITHUB_WORKSPACE/artifacts/kernel/configs/p/android-4.9/kernel_config_p_4.9^

echo "building kernel_config_q_4.14^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja kernel_config_q_4.14,
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/configs/q/android-4.14/kernel_config_q_4.14^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/kernel/configs/kernel_config_q_4.14^.output . $GITHUB_WORKSPACE/artifacts/kernel/configs/q/android-4.14/kernel_config_q_4.14^

echo "building kernel_config_q_4.19^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja kernel_config_q_4.19,
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/configs/q/android-4.19/kernel_config_q_4.19^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/kernel/configs/kernel_config_q_4.19^.output . $GITHUB_WORKSPACE/artifacts/kernel/configs/q/android-4.19/kernel_config_q_4.19^

echo "building kernel_config_q_4.9^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja kernel_config_q_4.9,
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/configs/q/android-4.9/kernel_config_q_4.9^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/kernel/configs/kernel_config_q_4.9^.output . $GITHUB_WORKSPACE/artifacts/kernel/configs/q/android-4.9/kernel_config_q_4.9^

echo "building kernel_config_r_4.14^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja kernel_config_r_4.14,
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/configs/r/android-4.14/kernel_config_r_4.14^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/kernel/configs/kernel_config_r_4.14^.output . $GITHUB_WORKSPACE/artifacts/kernel/configs/r/android-4.14/kernel_config_r_4.14^

echo "building kernel_config_r_4.19^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja kernel_config_r_4.19,
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/configs/r/android-4.19/kernel_config_r_4.19^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/kernel/configs/kernel_config_r_4.19^.output . $GITHUB_WORKSPACE/artifacts/kernel/configs/r/android-4.19/kernel_config_r_4.19^

echo "building kernel_config_r_5.4^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja kernel_config_r_5.4,
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/configs/r/android-5.4/kernel_config_r_5.4^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/kernel/configs/kernel_config_r_5.4^.output . $GITHUB_WORKSPACE/artifacts/kernel/configs/r/android-5.4/kernel_config_r_5.4^

echo "building kernel_config_s_4.19^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja kernel_config_s_4.19,
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/configs/s/android-4.19/kernel_config_s_4.19^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/kernel/configs/kernel_config_s_4.19^.output . $GITHUB_WORKSPACE/artifacts/kernel/configs/s/android-4.19/kernel_config_s_4.19^

echo "building kernel_config_s_5.10^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja kernel_config_s_5.10,
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/configs/s/android-5.10/kernel_config_s_5.10^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/kernel/configs/kernel_config_s_5.10^.output . $GITHUB_WORKSPACE/artifacts/kernel/configs/s/android-5.10/kernel_config_s_5.10^

echo "building kernel_config_s_5.4^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja kernel_config_s_5.4,
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/configs/s/android-5.4/kernel_config_s_5.4^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/kernel/configs/kernel_config_s_5.4^.output . $GITHUB_WORKSPACE/artifacts/kernel/configs/s/android-5.4/kernel_config_s_5.4^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf kernel_configs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/kernel/configs/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 kernel_configs.tar.zst --clobber

du -ah -d1 kernel_configs*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/kernel_configs.tar.zst" ]; then
  echo "Compressing kernel/configs -> kernel_configs.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/kernel_configs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/kernel/configs/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp