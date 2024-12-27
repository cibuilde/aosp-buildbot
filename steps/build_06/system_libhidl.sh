set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/libhidl

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/hidl-gen^linux_glibc_x86_64/ .

echo "building android.hidl.allocator@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.allocator@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.allocator@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0-inheritance-hierarchy^

echo "building android.hidl.allocator@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.allocator@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.allocator@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++^

echo "building android.hidl.allocator@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.allocator@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.allocator@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++_headers^

echo "building android.hidl.base-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.base-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.base-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java_gen_java^

echo "building android.hidl.base@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.base@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.base@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base@1.0-inheritance-hierarchy^

echo "building android.hidl.base@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.base@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.base@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++^

echo "building android.hidl.base@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.base@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.base@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^

echo "building android.hidl.manager-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.manager-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.0/android.hidl.manager-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.manager-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.0/android.hidl.manager-V1.0-java_gen_java^

echo "building android.hidl.manager-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.manager-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.1/android.hidl.manager-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.manager-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.1/android.hidl.manager-V1.1-java_gen_java^

echo "building android.hidl.manager-V1.2-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.manager-V1.2-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.2/android.hidl.manager-V1.2-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.manager-V1.2-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.2/android.hidl.manager-V1.2-java_gen_java^

echo "building android.hidl.manager@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.manager@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.manager@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0-inheritance-hierarchy^

echo "building android.hidl.manager@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.manager@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.manager@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++^

echo "building android.hidl.manager@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.manager@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.manager@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^

echo "building android.hidl.manager@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.manager@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.manager@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1-inheritance-hierarchy^

echo "building android.hidl.manager@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.manager@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.manager@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++^

echo "building android.hidl.manager@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.manager@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.manager@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^

echo "building android.hidl.manager@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.manager@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.manager@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2-inheritance-hierarchy^

echo "building android.hidl.manager@1.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.manager@1.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.manager@1.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++^

echo "building android.hidl.manager@1.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.manager@1.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.manager@1.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^

echo "building android.hidl.memory.token@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.memory.token@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.memory.token@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0-inheritance-hierarchy^

echo "building android.hidl.memory.token@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.memory.token@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.memory.token@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++^

echo "building android.hidl.memory.token@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.memory.token@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.memory.token@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++_headers^

echo "building android.hidl.memory@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.memory@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.memory@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0-inheritance-hierarchy^

echo "building android.hidl.memory@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.memory@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.memory@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++^

echo "building android.hidl.memory@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.memory@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.memory@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers^

echo "building android.hidl.safe_union-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.safe_union-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.safe_union-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union-V1.0-java_gen_java^

echo "building android.hidl.safe_union@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.safe_union@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.safe_union@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0_genc++^

echo "building android.hidl.safe_union@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.safe_union@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.safe_union@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0_genc++_headers^

echo "building android.hidl.token@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.token@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.token@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0-inheritance-hierarchy^

echo "building android.hidl.token@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.token@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.token@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0_genc++^

echo "building android.hidl.token@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.hidl.token@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/libhidl/android.hidl.token@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0_genc++_headers^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/libhidl/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 system_libhidl.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
