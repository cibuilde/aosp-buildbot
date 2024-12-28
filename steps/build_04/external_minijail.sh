set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/minijail

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minijail/libminijail_gen_constants_obj^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minijail/libminijail_gen_constants_obj^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minijail/libminijail_gen_constants_obj^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minijail/libminijail_gen_constants_obj^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minijail/libminijail_gen_constants_obj^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minijail/libminijail_gen_constants_obj^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minijail/libminijail_gen_syscall_obj^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minijail/libminijail_gen_syscall_obj^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minijail/libminijail_gen_syscall_obj^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minijail/libminijail_gen_syscall_obj^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minijail/libminijail_gen_syscall_obj^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minijail/libminijail_gen_syscall_obj^android_x86_64_apex29/ .

echo "building libminijail_gen_constants^android_recovery_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libminijail_gen_constants,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_constants^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/minijail/libminijail_gen_constants^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_constants^android_recovery_x86_64

echo "building libminijail_gen_constants^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libminijail_gen_constants,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_constants^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/minijail/libminijail_gen_constants^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_constants^android_vendor.31_x86_64

echo "building libminijail_gen_constants^android_vendor.31_x86_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libminijail_gen_constants,android_vendor.31_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_constants^android_vendor.31_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/minijail/libminijail_gen_constants^android_vendor.31_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_constants^android_vendor.31_x86_x86_64

echo "building libminijail_gen_constants^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libminijail_gen_constants,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_constants^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/minijail/libminijail_gen_constants^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_constants^android_x86_64

echo "building libminijail_gen_constants^android_x86_64_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libminijail_gen_constants,android_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_constants^android_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/minijail/libminijail_gen_constants^android_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_constants^android_x86_64_apex10000

echo "building libminijail_gen_constants^android_x86_64_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libminijail_gen_constants,android_x86_64_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_constants^android_x86_64_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/minijail/libminijail_gen_constants^android_x86_64_apex29.output . $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_constants^android_x86_64_apex29

echo "building libminijail_gen_syscall^android_recovery_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libminijail_gen_syscall,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_syscall^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/minijail/libminijail_gen_syscall^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_syscall^android_recovery_x86_64

echo "building libminijail_gen_syscall^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libminijail_gen_syscall,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_syscall^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/minijail/libminijail_gen_syscall^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_syscall^android_vendor.31_x86_64

echo "building libminijail_gen_syscall^android_vendor.31_x86_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libminijail_gen_syscall,android_vendor.31_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_syscall^android_vendor.31_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/minijail/libminijail_gen_syscall^android_vendor.31_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_syscall^android_vendor.31_x86_x86_64

echo "building libminijail_gen_syscall^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libminijail_gen_syscall,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_syscall^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/minijail/libminijail_gen_syscall^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_syscall^android_x86_64

echo "building libminijail_gen_syscall^android_x86_64_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libminijail_gen_syscall,android_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_syscall^android_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/minijail/libminijail_gen_syscall^android_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_syscall^android_x86_64_apex10000

echo "building libminijail_gen_syscall^android_x86_64_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libminijail_gen_syscall,android_x86_64_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_syscall^android_x86_64_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/minijail/libminijail_gen_syscall^android_x86_64_apex29.output . $GITHUB_WORKSPACE/artifacts/external/minijail/libminijail_gen_syscall^android_x86_64_apex29

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_minijail.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/minijail/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_minijail.tar.zst --clobber

du -ah -d1 external_minijail*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_minijail.tar.zst" ]; then
  echo "Compressing external/minijail -> external_minijail.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_minijail.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/minijail/ .
fi

rm -rf aosp
