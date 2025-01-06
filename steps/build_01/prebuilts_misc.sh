
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for prebuilts/misc"

clone_project platform/prebuilts/misc prebuilts/misc android12-gsi "/common/asm/asm-6.0.jar" "/common/asm/asm-7.0.jar" "/common/asm/asm-analysis-6.0.jar" "/common/asm/asm-commons-6.0.jar" "/common/asm/asm-commons-7.0.jar" "/common/asm/asm-tree-6.0.jar" "/common/asm/asm-tree-7.0.jar" "/common/commons-cli/commons-cli-1.2.jar" "/common/guava/guava-21.0.jar" "/gdbserver/android-x86_64/gdbserver64" "/gdbserver/android-x86/gdbserver" "/linux-x86/yasm/yasm"


echo "building gdbserver^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gdbserver,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/misc/gdbserver^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/misc/gdbserver^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_64/addition_copy_files.output

echo "building gdbserver^android_x86_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gdbserver,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/misc/gdbserver^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/misc/gdbserver^android_x86_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/misc/gdbserver/gdbserver^android_x86_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_misc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/misc/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 prebuilts_misc.tar.zst --clobber

du -ah -d1 prebuilts_misc*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst" ]; then
  echo "Compressing prebuilts/misc -> prebuilts_misc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/misc/ .
fi


rm -rf aosp
