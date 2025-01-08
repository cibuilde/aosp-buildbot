
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

echo "Preparing for external/tpm2-tss"

clone_depth_platform build/soong
clone_depth_platform external/boringssl
clone_depth_platform external/libcxx
clone_depth_platform external/tpm2-tss
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform system/libbase

rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tpm2-tss/tpm2-tss2-util^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tpm2-tss/tpm2-tss2-tcti^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tpm2-tss/tpm2-tss2-rc^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tpm2-tss/tpm2-tss2-esys^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tpm2-tss/tpm2-tss2-sys^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tpm2-tss/tpm2-tss2-mu^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .

echo "building tpm2-tss2-util^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja tpm2-tss2-util,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-util^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/tpm2-tss/tpm2-tss2-util^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-util^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/external/tpm2-tss/tpm2-tss2-util^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-util^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-util^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building tpm2-tss2-tcti^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja tpm2-tss2-tcti,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-tcti^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/tpm2-tss/tpm2-tss2-tcti^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-tcti^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/external/tpm2-tss/tpm2-tss2-tcti^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-tcti^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-tcti^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building tpm2-tss2-rc^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja tpm2-tss2-rc,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-rc^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/tpm2-tss/tpm2-tss2-rc^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-rc^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/external/tpm2-tss/tpm2-tss2-rc^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-rc^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-rc^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building tpm2-tss2-esys^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja tpm2-tss2-esys,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-esys^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/tpm2-tss/tpm2-tss2-esys^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-esys^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/external/tpm2-tss/tpm2-tss2-esys^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-esys^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-esys^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building tpm2-tss2-sys^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja tpm2-tss2-sys,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-sys^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/tpm2-tss/tpm2-tss2-sys^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-sys^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/external/tpm2-tss/tpm2-tss2-sys^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-sys^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-sys^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building tpm2-tss2-mu^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja tpm2-tss2-mu,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-mu^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/tpm2-tss/tpm2-tss2-mu^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-mu^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/external/tpm2-tss/tpm2-tss2-mu^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-mu^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/tpm2-tss2-mu^linux_glibc_x86_64_shared/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_tpm2-tss.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/tpm2-tss/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 external_tpm2-tss.tar.zst --clobber

du -ah -d1 external_tpm2-tss*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tpm2-tss.tar.zst" ]; then
  echo "Compressing external/tpm2-tss -> external_tpm2-tss.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tpm2-tss.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tpm2-tss/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi


rm -rf aosp
