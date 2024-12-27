set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/crosvm

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building 9p_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja 9p_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/9p_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/9p_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/9p_device.policy_inline_x86_64^

echo "building balloon_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja balloon_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/balloon_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/balloon_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/balloon_device.policy_inline_x86_64^

echo "building battery.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja battery.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/battery.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/battery.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/battery.policy_inline_x86_64^

echo "building block_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja block_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/block_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/block_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/block_device.policy_inline_x86_64^

echo "building cras_audio_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja cras_audio_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/cras_audio_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/cras_audio_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/cras_audio_device.policy_inline_x86_64^

echo "building fs_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja fs_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/fs_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/fs_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/fs_device.policy_inline_x86_64^

echo "building gpu_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja gpu_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/gpu_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/gpu_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/gpu_device.policy_inline_x86_64^

echo "building input_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja input_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/input_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/input_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/input_device.policy_inline_x86_64^

echo "building net_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja net_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/net_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/net_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/net_device.policy_inline_x86_64^

echo "building null_audio_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja null_audio_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/null_audio_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/null_audio_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/null_audio_device.policy_inline_x86_64^

echo "building pmem_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja pmem_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/pmem_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/pmem_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/pmem_device.policy_inline_x86_64^

echo "building rng_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja rng_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/rng_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/rng_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/rng_device.policy_inline_x86_64^

echo "building serial.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja serial.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/serial.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/serial.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/serial.policy_inline_x86_64^

echo "building tpm_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja tpm_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/tpm_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/tpm_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/tpm_device.policy_inline_x86_64^

echo "building vfio_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja vfio_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vfio_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/vfio_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vfio_device.policy_inline_x86_64^

echo "building vhost_net_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja vhost_net_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_net_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/vhost_net_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_net_device.policy_inline_x86_64^

echo "building vhost_vsock_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja vhost_vsock_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_vsock_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/vhost_vsock_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_vsock_device.policy_inline_x86_64^

echo "building video_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja video_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/video_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/video_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/video_device.policy_inline_x86_64^

echo "building vios_audio_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja vios_audio_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vios_audio_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/vios_audio_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vios_audio_device.policy_inline_x86_64^

echo "building wl_device.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja wl_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/wl_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/wl_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/wl_device.policy_inline_x86_64^

echo "building xhci.policy_inline_x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja xhci.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/xhci.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/crosvm/xhci.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/xhci.policy_inline_x86_64^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_crosvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/crosvm/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_crosvm.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_crosvm.tar.zst" ]; then
  echo "Compressing external/crosvm -> external_crosvm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_crosvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/crosvm/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
