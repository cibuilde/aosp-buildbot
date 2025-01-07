
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

echo "Preparing for device/google/cuttlefish_vmm"

clone_depth device/google/cuttlefish
clone_project device/google/cuttlefish_vmm device/google/cuttlefish_vmm android12-gsi "/x86_64-linux-gnu/bin" "x86_64-linux-gnu/etc/seccomp"

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .

echo "building x86_64_linux_gnu_crosvm^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja x86_64_linux_gnu_crosvm,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_crosvm^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_crosvm^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_crosvm^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_crosvm^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_crosvm^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_crosvm^linux_glibc_x86_64/addition_copy_files.output

echo "building x86_64_linux_gnu_libdrm.so.2_for_crosvm^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja x86_64_linux_gnu_libdrm.so.2_for_crosvm,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libdrm.so.2_for_crosvm^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_libdrm.so.2_for_crosvm^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libdrm.so.2_for_crosvm^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_libdrm.so.2_for_crosvm^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libdrm.so.2_for_crosvm^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libdrm.so.2_for_crosvm^linux_glibc_x86_64/addition_copy_files.output

echo "building x86_64_linux_gnu_libepoxy.so.0_for_crosvm^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja x86_64_linux_gnu_libepoxy.so.0_for_crosvm,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libepoxy.so.0_for_crosvm^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_libepoxy.so.0_for_crosvm^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libepoxy.so.0_for_crosvm^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_libepoxy.so.0_for_crosvm^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libepoxy.so.0_for_crosvm^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libepoxy.so.0_for_crosvm^linux_glibc_x86_64/addition_copy_files.output

echo "building x86_64_linux_gnu_libffi.so.7_for_crosvm^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja x86_64_linux_gnu_libffi.so.7_for_crosvm,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libffi.so.7_for_crosvm^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_libffi.so.7_for_crosvm^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libffi.so.7_for_crosvm^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_libffi.so.7_for_crosvm^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libffi.so.7_for_crosvm^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libffi.so.7_for_crosvm^linux_glibc_x86_64/addition_copy_files.output

echo "building x86_64_linux_gnu_libgbm.so.1_for_crosvm^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja x86_64_linux_gnu_libgbm.so.1_for_crosvm,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libgbm.so.1_for_crosvm^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_libgbm.so.1_for_crosvm^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libgbm.so.1_for_crosvm^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_libgbm.so.1_for_crosvm^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libgbm.so.1_for_crosvm^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libgbm.so.1_for_crosvm^linux_glibc_x86_64/addition_copy_files.output

echo "building x86_64_linux_gnu_libgfxstream_backend.so_for_crosvm^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja x86_64_linux_gnu_libgfxstream_backend.so_for_crosvm,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libgfxstream_backend.so_for_crosvm^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_libgfxstream_backend.so_for_crosvm^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libgfxstream_backend.so_for_crosvm^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_libgfxstream_backend.so_for_crosvm^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libgfxstream_backend.so_for_crosvm^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libgfxstream_backend.so_for_crosvm^linux_glibc_x86_64/addition_copy_files.output

echo "building x86_64_linux_gnu_libminijail.so_for_crosvm^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja x86_64_linux_gnu_libminijail.so_for_crosvm,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libminijail.so_for_crosvm^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_libminijail.so_for_crosvm^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libminijail.so_for_crosvm^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_libminijail.so_for_crosvm^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libminijail.so_for_crosvm^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libminijail.so_for_crosvm^linux_glibc_x86_64/addition_copy_files.output

echo "building x86_64_linux_gnu_libvirglrenderer.so.1_for_crosvm^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja x86_64_linux_gnu_libvirglrenderer.so.1_for_crosvm,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libvirglrenderer.so.1_for_crosvm^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_libvirglrenderer.so.1_for_crosvm^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libvirglrenderer.so.1_for_crosvm^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/device/google/cuttlefish_vmm/x86_64_linux_gnu_libvirglrenderer.so.1_for_crosvm^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libvirglrenderer.so.1_for_crosvm^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64_linux_gnu_libvirglrenderer.so.1_for_crosvm^linux_glibc_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf device_google_cuttlefish_vmm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 device_google_cuttlefish_vmm.tar.zst --clobber

du -ah -d1 device_google_cuttlefish_vmm*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish -> device_google_cuttlefish.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish_vmm.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish_vmm -> device_google_cuttlefish_vmm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_google_cuttlefish_vmm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish_vmm/ .
fi


rm -rf aosp
