
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


echo "building gpu_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gpu_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/gpu_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/gpu_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/gpu_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/gpu_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/gpu_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/gpu_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building gpu_render_server.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gpu_render_server.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/gpu_render_server.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/gpu_render_server.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/gpu_render_server.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/gpu_render_server.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/gpu_render_server.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/gpu_render_server.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building input_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja input_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/input_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/input_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/input_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/input_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/input_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/input_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building iommu_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja iommu_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/iommu_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/iommu_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/iommu_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/iommu_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/iommu_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/iommu_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building jail_warden.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja jail_warden.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/jail_warden.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/jail_warden.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/jail_warden.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/jail_warden.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/jail_warden.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/jail_warden.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building net_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja net_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/net_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/net_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/net_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/net_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/net_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/net_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building net_device_vhost_user.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja net_device_vhost_user.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/net_device_vhost_user.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/net_device_vhost_user.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/net_device_vhost_user.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/net_device_vhost_user.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/net_device_vhost_user.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/net_device_vhost_user.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building null_audio_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja null_audio_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/null_audio_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/null_audio_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/null_audio_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/null_audio_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/null_audio_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/null_audio_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building pmem_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja pmem_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/pmem_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/pmem_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/pmem_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/pmem_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/pmem_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/pmem_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building rng_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja rng_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/rng_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/rng_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/rng_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/rng_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/rng_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/rng_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building serial_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja serial_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/serial_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/serial_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building serial_device_vhost_user.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja serial_device_vhost_user.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial_device_vhost_user.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/serial_device_vhost_user.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial_device_vhost_user.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/serial_device_vhost_user.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial_device_vhost_user.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial_device_vhost_user.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building serial_device_vvu.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja serial_device_vvu.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial_device_vvu.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/serial_device_vvu.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial_device_vvu.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/serial_device_vvu.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial_device_vvu.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial_device_vvu.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building serial.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja serial.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/serial.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/serial.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building 9p_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja 9p_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/9p_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/9p_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/9p_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/9p_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/9p_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/9p_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building snd_cras_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja snd_cras_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/snd_cras_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/snd_cras_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/snd_cras_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/snd_cras_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/snd_cras_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/snd_cras_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building snd_null_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja snd_null_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/snd_null_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/snd_null_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/snd_null_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/snd_null_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/snd_null_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/snd_null_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building swap_monitor.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja swap_monitor.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/swap_monitor.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/swap_monitor.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/swap_monitor.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/swap_monitor.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/swap_monitor.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/swap_monitor.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building tpm_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja tpm_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/tpm_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/tpm_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/tpm_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/tpm_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/tpm_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/tpm_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building vfio_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vfio_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vfio_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vfio_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vfio_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vfio_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vfio_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vfio_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building vhost_net_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vhost_net_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_net_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vhost_net_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_net_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vhost_net_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_net_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_net_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building vhost_vsock_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vhost_vsock_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_vsock_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vhost_vsock_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_vsock_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vhost_vsock_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_vsock_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_vsock_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building vhost_vsock_device_vhost_user.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vhost_vsock_device_vhost_user.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_vsock_device_vhost_user.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vhost_vsock_device_vhost_user.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_vsock_device_vhost_user.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vhost_vsock_device_vhost_user.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_vsock_device_vhost_user.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_vsock_device_vhost_user.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building vhost_vsock_device_vvu.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vhost_vsock_device_vvu.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_vsock_device_vvu.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vhost_vsock_device_vvu.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_vsock_device_vvu.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vhost_vsock_device_vvu.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_vsock_device_vvu.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_vsock_device_vvu.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building video_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja video_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/video_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/video_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/video_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/video_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/video_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/video_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building balloon_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja balloon_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/balloon_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/balloon_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/balloon_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/balloon_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/balloon_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/balloon_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building vios_audio_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vios_audio_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vios_audio_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vios_audio_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vios_audio_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vios_audio_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vios_audio_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vios_audio_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building vtpm_proxy_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vtpm_proxy_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vtpm_proxy_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vtpm_proxy_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vtpm_proxy_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vtpm_proxy_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vtpm_proxy_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vtpm_proxy_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building vvu_proxy_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vvu_proxy_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vvu_proxy_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vvu_proxy_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vvu_proxy_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/vvu_proxy_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vvu_proxy_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/vvu_proxy_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building wl_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja wl_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/wl_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/wl_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/wl_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/wl_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/wl_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/wl_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building xhci_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja xhci_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/xhci_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/xhci_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/xhci_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/xhci_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/xhci_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/xhci_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building xhci.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja xhci.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/xhci.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/xhci.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/xhci.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/xhci.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/xhci.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/xhci.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building battery.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja battery.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/battery.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/battery.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/battery.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/battery.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/battery.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/battery.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building block_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja block_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/block_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/block_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/block_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/block_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/block_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/block_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building block_device_vhost_user.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja block_device_vhost_user.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/block_device_vhost_user.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/block_device_vhost_user.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/block_device_vhost_user.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/block_device_vhost_user.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/block_device_vhost_user.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/block_device_vhost_user.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building block_device_vvu.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja block_device_vvu.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/block_device_vvu.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/block_device_vvu.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/block_device_vvu.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/block_device_vvu.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/block_device_vvu.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/block_device_vvu.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building coiommu_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja coiommu_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/coiommu_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/coiommu_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/coiommu_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/coiommu_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/coiommu_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/coiommu_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building coiommu.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja coiommu.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/coiommu.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/coiommu.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/coiommu.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/coiommu.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/coiommu.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/coiommu.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building cras_audio_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja cras_audio_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/cras_audio_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/cras_audio_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/cras_audio_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/cras_audio_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/cras_audio_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/cras_audio_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building cras_snd_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja cras_snd_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/cras_snd_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/cras_snd_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/cras_snd_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/cras_snd_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/cras_snd_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/cras_snd_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building fs_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja fs_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/fs_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/fs_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/fs_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/fs_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/fs_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/fs_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output

echo "building fw_cfg_device.policy_at_x86_64^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja fw_cfg_device.policy_at_x86_64,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/fw_cfg_device.policy_at_x86_64^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/fw_cfg_device.policy_at_x86_64^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/fw_cfg_device.policy_at_x86_64^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_vmm/fw_cfg_device.policy_at_x86_64^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/fw_cfg_device.policy_at_x86_64^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/x86_64-linux-gnu/fw_cfg_device.policy_at_x86_64^linux_glibc_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf device_google_cuttlefish_vmm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_vmm/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 device_google_cuttlefish_vmm.tar.zst --clobber

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
