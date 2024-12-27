set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform build/soong
clone_sparse_exclude prebuilts/sdk "!/tools/windows" "!/tools/darwin" "!/*/test/" "!/**/android-non-updatable.jar"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .

echo "building android-arch-core-common-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android-arch-core-common-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-core-common-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android-arch-core-common-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-core-common-nodeps^android_common

echo "building android-arch-lifecycle-common-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android-arch-lifecycle-common-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-common-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android-arch-lifecycle-common-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-common-nodeps^android_common

echo "building android-non-updatable-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android-non-updatable-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android-non-updatable-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-incompatibilities.api.public.latest^

echo "building android-non-updatable-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android-non-updatable-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android-non-updatable-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-incompatibilities.api.system.latest^

echo "building android-non-updatable-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android-non-updatable-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android-non-updatable-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-removed.api.module-lib.latest^

echo "building android-non-updatable-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android-non-updatable-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android-non-updatable-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-removed.api.public.latest^

echo "building android-non-updatable-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android-non-updatable-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android-non-updatable-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-removed.api.system.latest^

echo "building android-non-updatable.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android-non-updatable.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android-non-updatable.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.module-lib.latest^

echo "building android-non-updatable.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android-non-updatable.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android-non-updatable.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.public.latest^

echo "building android-non-updatable.api.system-server.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android-non-updatable.api.system-server.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.system-server.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android-non-updatable.api.system-server.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.system-server.latest^

echo "building android-non-updatable.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android-non-updatable.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android-non-updatable.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.system.latest^

echo "building android-support-annotations-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android-support-annotations-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-annotations-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android-support-annotations-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-annotations-nodeps^android_common

echo "building android-support-collections-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android-support-collections-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-collections-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android-support-collections-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-collections-nodeps^android_common

echo "building android.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.api.module-lib.latest^

echo "building android.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.api.public.latest^

echo "building android.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.api.system.latest^

echo "building android.net.ipsec.ike-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.net.ipsec.ike-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.module-lib.latest^

echo "building android.net.ipsec.ike-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.net.ipsec.ike-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.public.latest^

echo "building android.net.ipsec.ike-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.net.ipsec.ike-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.system.latest^

echo "building android.net.ipsec.ike-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.net.ipsec.ike-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.net.ipsec.ike-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-removed.api.module-lib.latest^

echo "building android.net.ipsec.ike-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.net.ipsec.ike-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.net.ipsec.ike-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-removed.api.public.latest^

echo "building android.net.ipsec.ike-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.net.ipsec.ike-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.net.ipsec.ike-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-removed.api.system.latest^

echo "building android.net.ipsec.ike.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.net.ipsec.ike.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.net.ipsec.ike.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike.api.module-lib.latest^

echo "building android.net.ipsec.ike.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.net.ipsec.ike.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.net.ipsec.ike.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike.api.public.latest^

echo "building android.net.ipsec.ike.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.net.ipsec.ike.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.net.ipsec.ike.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike.api.system.latest^

echo "building android.test.base-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.test.base-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.base-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.test.base-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.base-incompatibilities.api.system.latest^

echo "building android.test.base-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.test.base-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.base-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.test.base-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.base-removed.api.system.latest^

echo "building android.test.base.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.test.base.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.base.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.test.base.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.base.api.system.latest^

echo "building android.test.mock-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.test.mock-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.mock-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.test.mock-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.mock-incompatibilities.api.system.latest^

echo "building android.test.mock-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.test.mock-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.mock-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.test.mock-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.mock-removed.api.system.latest^

echo "building android.test.mock.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.test.mock.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.mock.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.test.mock.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.mock.api.system.latest^

echo "building android.test.runner-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.test.runner-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.runner-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.test.runner-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.runner-incompatibilities.api.system.latest^

echo "building android.test.runner-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.test.runner-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.runner-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.test.runner-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.runner-removed.api.system.latest^

echo "building android.test.runner.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.test.runner.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.runner.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/android.test.runner.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.runner.api.system.latest^

echo "building androidx-constraintlayout_constraintlayout-solver-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx-constraintlayout_constraintlayout-solver-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx-constraintlayout_constraintlayout-solver-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver-nodeps^android_common

echo "building androidx-constraintlayout_constraintlayout-solver-nodeps^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx-constraintlayout_constraintlayout-solver-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx-constraintlayout_constraintlayout-solver-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver-nodeps^android_common_apex30

echo "building androidx.annotation_annotation-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.annotation_annotation-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.annotation_annotation-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common

echo "building androidx.annotation_annotation-nodeps^android_common_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.annotation_annotation-nodeps,android_common_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.annotation_annotation-nodeps^android_common_apex29.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common_apex29

echo "building androidx.annotation_annotation-nodeps^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.annotation_annotation-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.annotation_annotation-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common_apex30

echo "building androidx.annotation_annotation-nodeps^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.annotation_annotation-nodeps,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.annotation_annotation-nodeps^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^linux_glibc_common

echo "building androidx.arch.core_core-common-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.arch.core_core-common-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.arch.core_core-common-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common-nodeps^android_common

echo "building androidx.arch.core_core-common-nodeps^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.arch.core_core-common-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.arch.core_core-common-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common-nodeps^android_common_apex30

echo "building androidx.collection_collection-ktx-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.collection_collection-ktx-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-ktx-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.collection_collection-ktx-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-ktx-nodeps^android_common

echo "building androidx.collection_collection-ktx-nodeps^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.collection_collection-ktx-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-ktx-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.collection_collection-ktx-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-ktx-nodeps^android_common_apex30

echo "building androidx.collection_collection-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.collection_collection-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.collection_collection-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-nodeps^android_common

echo "building androidx.collection_collection-nodeps^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.collection_collection-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.collection_collection-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-nodeps^android_common_apex30

echo "building androidx.concurrent_concurrent-futures-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.concurrent_concurrent-futures-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.concurrent_concurrent-futures-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.concurrent_concurrent-futures-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.concurrent_concurrent-futures-nodeps^android_common

echo "building androidx.lifecycle_lifecycle-common-java8-nodeps^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.lifecycle_lifecycle-common-java8-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-java8-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.lifecycle_lifecycle-common-java8-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-java8-nodeps^android_common_apex30

echo "building androidx.lifecycle_lifecycle-common-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.lifecycle_lifecycle-common-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.lifecycle_lifecycle-common-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-nodeps^android_common

echo "building androidx.lifecycle_lifecycle-common-nodeps^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.lifecycle_lifecycle-common-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.lifecycle_lifecycle-common-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-nodeps^android_common_apex30

echo "building androidx.room_room-common-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.room_room-common-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.room_room-common-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common-nodeps^android_common

echo "building androidx.room_room-common-nodeps^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.room_room-common-nodeps,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common-nodeps^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.room_room-common-nodeps^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common-nodeps^linux_glibc_common

echo "building androidx.room_room-compiler-nodeps^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.room_room-compiler-nodeps,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-compiler-nodeps^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.room_room-compiler-nodeps^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-compiler-nodeps^linux_glibc_common

echo "building androidx.room_room-compiler-processing-nodeps^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.room_room-compiler-processing-nodeps,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-compiler-processing-nodeps^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.room_room-compiler-processing-nodeps^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-compiler-processing-nodeps^linux_glibc_common

echo "building androidx.room_room-migration-nodeps^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja androidx.room_room-migration-nodeps,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-migration-nodeps^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/androidx.room_room-migration-nodeps^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-migration-nodeps^linux_glibc_common

echo "building art-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja art-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/art-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-incompatibilities.api.module-lib.latest^

echo "building art-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja art-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/art-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-incompatibilities.api.public.latest^

echo "building art-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja art-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/art-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-incompatibilities.api.system.latest^

echo "building art-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja art-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/art-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-removed.api.module-lib.latest^

echo "building art-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja art-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/art-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-removed.api.public.latest^

echo "building art-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja art-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/art-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-removed.api.system.latest^

echo "building art.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja art.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/art.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art.api.module-lib.latest^

echo "building art.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja art.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/art.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art.api.public.latest^

echo "building art.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja art.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/art.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art.api.system.latest^

echo "building conscrypt-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja conscrypt-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/conscrypt-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/conscrypt-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/conscrypt-incompatibilities.api.public.latest^

echo "building conscrypt-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja conscrypt-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/conscrypt-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/conscrypt-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/conscrypt-removed.api.public.latest^

echo "building conscrypt.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja conscrypt.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/conscrypt.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/conscrypt.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/conscrypt.api.public.latest^

echo "building framework-connectivity-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-connectivity-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-connectivity-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-incompatibilities.api.module-lib.latest^

echo "building framework-connectivity-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-connectivity-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-connectivity-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-incompatibilities.api.public.latest^

echo "building framework-connectivity-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-connectivity-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-connectivity-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-incompatibilities.api.system.latest^

echo "building framework-connectivity-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-connectivity-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-connectivity-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-removed.api.module-lib.latest^

echo "building framework-connectivity-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-connectivity-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-connectivity-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-removed.api.public.latest^

echo "building framework-connectivity-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-connectivity-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-connectivity-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-removed.api.system.latest^

echo "building framework-connectivity.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-connectivity.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-connectivity.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity.api.module-lib.latest^

echo "building framework-connectivity.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-connectivity.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-connectivity.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity.api.public.latest^

echo "building framework-connectivity.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-connectivity.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-connectivity.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity.api.system.latest^

echo "building framework-media-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-media-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-media-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-incompatibilities.api.module-lib.latest^

echo "building framework-media-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-media-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-media-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-incompatibilities.api.public.latest^

echo "building framework-media-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-media-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-media-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-incompatibilities.api.system.latest^

echo "building framework-media-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-media-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-media-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-removed.api.module-lib.latest^

echo "building framework-media-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-media-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-media-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-removed.api.public.latest^

echo "building framework-media-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-media-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-media-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-removed.api.system.latest^

echo "building framework-media.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-media.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-media.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media.api.module-lib.latest^

echo "building framework-media.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-media.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-media.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media.api.public.latest^

echo "building framework-media.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-media.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-media.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media.api.system.latest^

echo "building framework-mediaprovider-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-mediaprovider-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.module-lib.latest^

echo "building framework-mediaprovider-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-mediaprovider-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.public.latest^

echo "building framework-mediaprovider-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-mediaprovider-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.system.latest^

echo "building framework-mediaprovider-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-mediaprovider-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-mediaprovider-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-removed.api.module-lib.latest^

echo "building framework-mediaprovider-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-mediaprovider-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-mediaprovider-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-removed.api.public.latest^

echo "building framework-mediaprovider-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-mediaprovider-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-mediaprovider-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-removed.api.system.latest^

echo "building framework-mediaprovider.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-mediaprovider.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-mediaprovider.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider.api.module-lib.latest^

echo "building framework-mediaprovider.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-mediaprovider.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-mediaprovider.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider.api.public.latest^

echo "building framework-mediaprovider.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-mediaprovider.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-mediaprovider.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider.api.system.latest^

echo "building framework-permission-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-incompatibilities.api.module-lib.latest^

echo "building framework-permission-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-incompatibilities.api.public.latest^

echo "building framework-permission-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-incompatibilities.api.system.latest^

echo "building framework-permission-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-removed.api.module-lib.latest^

echo "building framework-permission-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-removed.api.public.latest^

echo "building framework-permission-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-removed.api.system.latest^

echo "building framework-permission-s-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-s-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission-s-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-incompatibilities.api.module-lib.latest^

echo "building framework-permission-s-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-s-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission-s-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-incompatibilities.api.public.latest^

echo "building framework-permission-s-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-s-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission-s-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-incompatibilities.api.system.latest^

echo "building framework-permission-s-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-s-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission-s-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-removed.api.module-lib.latest^

echo "building framework-permission-s-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-s-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission-s-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-removed.api.public.latest^

echo "building framework-permission-s-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-s-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission-s-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-removed.api.system.latest^

echo "building framework-permission-s.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-s.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission-s.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s.api.module-lib.latest^

echo "building framework-permission-s.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-s.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission-s.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s.api.public.latest^

echo "building framework-permission-s.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-s.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission-s.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s.api.system.latest^

echo "building framework-permission.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission.api.module-lib.latest^

echo "building framework-permission.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission.api.public.latest^

echo "building framework-permission.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-permission.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission.api.system.latest^

echo "building framework-scheduling-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-scheduling-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-scheduling-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-incompatibilities.api.module-lib.latest^

echo "building framework-scheduling-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-scheduling-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-scheduling-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-incompatibilities.api.public.latest^

echo "building framework-scheduling-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-scheduling-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-scheduling-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-incompatibilities.api.system.latest^

echo "building framework-scheduling-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-scheduling-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-scheduling-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-removed.api.module-lib.latest^

echo "building framework-scheduling-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-scheduling-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-scheduling-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-removed.api.public.latest^

echo "building framework-scheduling-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-scheduling-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-scheduling-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-removed.api.system.latest^

echo "building framework-scheduling.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-scheduling.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-scheduling.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling.api.module-lib.latest^

echo "building framework-scheduling.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-scheduling.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-scheduling.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling.api.public.latest^

echo "building framework-scheduling.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-scheduling.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-scheduling.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling.api.system.latest^

echo "building framework-sdkextensions-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-sdkextensions-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.module-lib.latest^

echo "building framework-sdkextensions-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-sdkextensions-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.public.latest^

echo "building framework-sdkextensions-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-sdkextensions-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.system.latest^

echo "building framework-sdkextensions-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-sdkextensions-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-sdkextensions-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-removed.api.module-lib.latest^

echo "building framework-sdkextensions-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-sdkextensions-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-sdkextensions-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-removed.api.public.latest^

echo "building framework-sdkextensions-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-sdkextensions-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-sdkextensions-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-removed.api.system.latest^

echo "building framework-sdkextensions.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-sdkextensions.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-sdkextensions.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions.api.module-lib.latest^

echo "building framework-sdkextensions.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-sdkextensions.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-sdkextensions.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions.api.public.latest^

echo "building framework-sdkextensions.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-sdkextensions.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-sdkextensions.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions.api.system.latest^

echo "building framework-statsd-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-statsd-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-statsd-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-incompatibilities.api.module-lib.latest^

echo "building framework-statsd-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-statsd-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-statsd-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-incompatibilities.api.public.latest^

echo "building framework-statsd-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-statsd-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-statsd-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-incompatibilities.api.system.latest^

echo "building framework-statsd-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-statsd-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-statsd-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-removed.api.module-lib.latest^

echo "building framework-statsd-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-statsd-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-statsd-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-removed.api.public.latest^

echo "building framework-statsd-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-statsd-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-statsd-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-removed.api.system.latest^

echo "building framework-statsd.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-statsd.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-statsd.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd.api.module-lib.latest^

echo "building framework-statsd.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-statsd.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-statsd.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd.api.public.latest^

echo "building framework-statsd.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-statsd.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-statsd.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd.api.system.latest^

echo "building framework-tethering-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-tethering-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-tethering-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-incompatibilities.api.module-lib.latest^

echo "building framework-tethering-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-tethering-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-tethering-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-incompatibilities.api.public.latest^

echo "building framework-tethering-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-tethering-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-tethering-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-incompatibilities.api.system.latest^

echo "building framework-tethering-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-tethering-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-tethering-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-removed.api.module-lib.latest^

echo "building framework-tethering-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-tethering-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-tethering-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-removed.api.public.latest^

echo "building framework-tethering-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-tethering-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-tethering-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-removed.api.system.latest^

echo "building framework-tethering.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-tethering.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-tethering.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering.api.module-lib.latest^

echo "building framework-tethering.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-tethering.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-tethering.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering.api.public.latest^

echo "building framework-tethering.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-tethering.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-tethering.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering.api.system.latest^

echo "building framework-wifi-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-wifi-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-wifi-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-incompatibilities.api.module-lib.latest^

echo "building framework-wifi-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-wifi-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-wifi-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-incompatibilities.api.public.latest^

echo "building framework-wifi-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-wifi-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-wifi-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-incompatibilities.api.system.latest^

echo "building framework-wifi-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-wifi-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-wifi-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-removed.api.module-lib.latest^

echo "building framework-wifi-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-wifi-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-wifi-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-removed.api.public.latest^

echo "building framework-wifi-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-wifi-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-wifi-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-removed.api.system.latest^

echo "building framework-wifi.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-wifi.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-wifi.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi.api.module-lib.latest^

echo "building framework-wifi.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-wifi.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-wifi.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi.api.public.latest^

echo "building framework-wifi.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-wifi.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/framework-wifi.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi.api.system.latest^

echo "building org.apache.http.legacy-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja org.apache.http.legacy-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/org.apache.http.legacy-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-incompatibilities.api.public.latest^

echo "building org.apache.http.legacy-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja org.apache.http.legacy-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/org.apache.http.legacy-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-incompatibilities.api.system.latest^

echo "building org.apache.http.legacy-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja org.apache.http.legacy-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/org.apache.http.legacy-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-removed.api.public.latest^

echo "building org.apache.http.legacy-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja org.apache.http.legacy-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/org.apache.http.legacy-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-removed.api.system.latest^

echo "building org.apache.http.legacy.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja org.apache.http.legacy.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/org.apache.http.legacy.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy.api.public.latest^

echo "building org.apache.http.legacy.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja org.apache.http.legacy.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/org.apache.http.legacy.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy.api.system.latest^

echo "building prebuilt_libLLVM_android^linux_glibc_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja prebuilt_libLLVM_android,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/tools/prebuilt_libLLVM_android^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/prebuilt_libLLVM_android^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/tools/prebuilt_libLLVM_android^linux_glibc_x86_64_shared

echo "building prebuilt_libclang_android^linux_glibc_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja prebuilt_libclang_android,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/tools/prebuilt_libclang_android^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/prebuilt_libclang_android^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/tools/prebuilt_libclang_android^linux_glibc_x86_64_shared

echo "building runtime-i18n-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja runtime-i18n-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/runtime-i18n-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/runtime-i18n-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/runtime-i18n-incompatibilities.api.public.latest^

echo "building runtime-i18n-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja runtime-i18n-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/runtime-i18n-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/runtime-i18n-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/runtime-i18n-removed.api.public.latest^

echo "building runtime-i18n.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja runtime-i18n.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/runtime-i18n.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/runtime-i18n.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/runtime-i18n.api.public.latest^

echo "building service-permission-incompatibilities.api.system-server.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja service-permission-incompatibilities.api.system-server.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/service-permission-incompatibilities.api.system-server.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/service-permission-incompatibilities.api.system-server.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/service-permission-incompatibilities.api.system-server.latest^

echo "building service-permission-removed.api.system-server.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja service-permission-removed.api.system-server.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/service-permission-removed.api.system-server.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/service-permission-removed.api.system-server.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/service-permission-removed.api.system-server.latest^

echo "building service-permission.api.system-server.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja service-permission.api.system-server.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/service-permission.api.system-server.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/sdk/service-permission.api.system-server.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/service-permission.api.system-server.latest^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 prebuilts_sdk.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst" ]; then
  echo "Compressing prebuilts/sdk -> prebuilts_sdk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/sdk/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
