set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/iptables

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building libext4_init^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libext4_init,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4_init^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/iptables/libext4_init^.output . $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4_init^

echo "building libext4_srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libext4_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/iptables/libext4_srcs^.output . $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext4_srcs^

echo "building libext6_init^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libext6_init,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6_init^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/iptables/libext6_init^.output . $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6_init^

echo "building libext6_srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libext6_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/iptables/libext6_srcs^.output . $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext6_srcs^

echo "building libext_init^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libext_init,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext_init^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/iptables/libext_init^.output . $GITHUB_WORKSPACE/artifacts/external/iptables/extensions/libext_init^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_iptables.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/iptables/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_iptables.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_iptables.tar.zst" ]; then
  echo "Compressing external/iptables -> external_iptables.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_iptables.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/iptables/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
