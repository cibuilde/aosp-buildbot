set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform system/core

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building generate_app_zygote_blocklist^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja generate_app_zygote_blocklist,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/generate_app_zygote_blocklist^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/bionic/generate_app_zygote_blocklist^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/generate_app_zygote_blocklist^

echo "building generated_android_ids^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja generated_android_ids,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/generated_android_ids^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/bionic/generated_android_ids^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/generated_android_ids^

echo "building libc.x86.map^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libc.x86.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.x86.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/bionic/libc.x86.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.x86.map^

echo "building libc.x86_64.map^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libc.x86_64.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.x86_64.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/bionic/libc.x86_64.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.x86_64.map^

echo "building libdl.x86.map^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libdl.x86.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.x86.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/bionic/libdl.x86.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.x86.map^

echo "building libdl.x86_64.map^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libdl.x86_64.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.x86_64.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/bionic/libdl.x86_64.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.x86_64.map^

echo "building libm.x86.map^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libm.x86.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.x86.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/bionic/libm.x86.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.x86.map^

echo "building libm.x86_64.map^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libm.x86_64.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.x86_64.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/bionic/libm.x86_64.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.x86_64.map^

echo "building libstdc++.x86.map^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libstdc++.x86.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.x86.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/bionic/libstdc++.x86.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.x86.map^

echo "building libstdc++.x86_64.map^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libstdc++.x86_64.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.x86_64.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/bionic/libstdc++.x86_64.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.x86_64.map^

echo "building syscalls-arm.S^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja syscalls-arm.S,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-arm.S^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/bionic/syscalls-arm.S^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-arm.S^

echo "building syscalls-arm64.S^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja syscalls-arm64.S,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-arm64.S^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/bionic/syscalls-arm64.S^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-arm64.S^

echo "building syscalls-x86.S^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja syscalls-x86.S,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-x86.S^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/bionic/syscalls-x86.S^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-x86.S^

echo "building syscalls-x86_64.S^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja syscalls-x86_64.S,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-x86_64.S^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/bionic/syscalls-x86_64.S^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-x86_64.S^

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 bionic.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.zst -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.zst -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
