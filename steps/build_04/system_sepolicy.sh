set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/sepolicy

rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .

echo "building insertkeys.py^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja insertkeys.py,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/tools/insertkeys.py^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/insertkeys.py^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/tools/insertkeys.py^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ system_sepolicy.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 system_sepolicy.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst" ]; then
  echo "Compressing system/sepolicy -> system_sepolicy.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst -C $GITHUB_WORKSPACE/aosp/system/sepolicy/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
