set -e

echo "entering kernel/configs"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform build/soong
clone_depth kernel/configs
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .

echo "building kconfig_xml_fixup^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja kconfig_xml_fixup,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/configs/tools/kconfig_xml_fixup^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/kernel/configs/kconfig_xml_fixup^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/kernel/configs/tools/kconfig_xml_fixup^linux_glibc_x86_64_PY2
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/kernel/configs/kconfig_xml_fixup^linux_glibc_x86_64_PY2.output $GITHUB_WORKSPACE/artifacts/kernel/configs/tools/kconfig_xml_fixup^linux_glibc_x86_64_PY2 $GITHUB_WORKSPACE/artifacts/kernel/configs/tools/kconfig_xml_fixup^linux_glibc_x86_64_PY2/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf kernel_configs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/kernel/configs/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 kernel_configs.tar.zst --clobber

du -ah -d1 kernel_configs*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/kernel_configs.tar.zst" ]; then
  echo "Compressing kernel/configs -> kernel_configs.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/kernel_configs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/kernel/configs/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
