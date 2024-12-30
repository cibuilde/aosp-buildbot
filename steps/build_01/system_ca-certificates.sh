set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/ca-certificates


echo "building target-cacert-01419da9.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-01419da9.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-01419da9.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-01419da9.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-01419da9.0^android_x86_64

echo "building target-cacert-04f60c28.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-04f60c28.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-04f60c28.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-04f60c28.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-04f60c28.0^android_x86_64

echo "building target-cacert-0d69c7e1.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-0d69c7e1.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-0d69c7e1.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-0d69c7e1.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-0d69c7e1.0^android_x86_64

echo "building target-cacert-10531352.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-10531352.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-10531352.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-10531352.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-10531352.0^android_x86_64

echo "building target-cacert-111e6273.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-111e6273.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-111e6273.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-111e6273.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-111e6273.0^android_x86_64

echo "building target-cacert-12d55845.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-12d55845.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-12d55845.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-12d55845.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-12d55845.0^android_x86_64

echo "building target-cacert-1ae85e5e.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-1ae85e5e.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-1ae85e5e.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-1ae85e5e.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-1ae85e5e.0^android_x86_64

echo "building target-cacert-1df5a75f.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-1df5a75f.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-1df5a75f.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-1df5a75f.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-1df5a75f.0^android_x86_64

echo "building target-cacert-1e1eab7c.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-1e1eab7c.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-1e1eab7c.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-1e1eab7c.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-1e1eab7c.0^android_x86_64

echo "building target-cacert-1e8e7201.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-1e8e7201.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-1e8e7201.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-1e8e7201.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-1e8e7201.0^android_x86_64

echo "building target-cacert-1eb37bdf.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-1eb37bdf.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-1eb37bdf.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-1eb37bdf.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-1eb37bdf.0^android_x86_64

echo "building target-cacert-1f58a078.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-1f58a078.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-1f58a078.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-1f58a078.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-1f58a078.0^android_x86_64

echo "building target-cacert-219d9499.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-219d9499.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-219d9499.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-219d9499.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-219d9499.0^android_x86_64

echo "building target-cacert-23f4c490.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-23f4c490.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-23f4c490.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-23f4c490.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-23f4c490.0^android_x86_64

echo "building target-cacert-27af790d.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-27af790d.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-27af790d.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-27af790d.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-27af790d.0^android_x86_64

echo "building target-cacert-2add47b6.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-2add47b6.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-2add47b6.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-2add47b6.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-2add47b6.0^android_x86_64

echo "building target-cacert-2d9dafe4.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-2d9dafe4.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-2d9dafe4.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-2d9dafe4.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-2d9dafe4.0^android_x86_64

echo "building target-cacert-2fa87019.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-2fa87019.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-2fa87019.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-2fa87019.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-2fa87019.0^android_x86_64

echo "building target-cacert-302904dd.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-302904dd.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-302904dd.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-302904dd.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-302904dd.0^android_x86_64

echo "building target-cacert-304d27c3.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-304d27c3.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-304d27c3.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-304d27c3.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-304d27c3.0^android_x86_64

echo "building target-cacert-31188b5e.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-31188b5e.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-31188b5e.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-31188b5e.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-31188b5e.0^android_x86_64

echo "building target-cacert-33ee480d.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-33ee480d.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-33ee480d.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-33ee480d.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-33ee480d.0^android_x86_64

echo "building target-cacert-343eb6cb.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-343eb6cb.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-343eb6cb.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-343eb6cb.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-343eb6cb.0^android_x86_64

echo "building target-cacert-35105088.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-35105088.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-35105088.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-35105088.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-35105088.0^android_x86_64

echo "building target-cacert-399e7759.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-399e7759.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-399e7759.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-399e7759.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-399e7759.0^android_x86_64

echo "building target-cacert-3ad48a91.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-3ad48a91.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-3ad48a91.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-3ad48a91.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-3ad48a91.0^android_x86_64

echo "building target-cacert-3c6676aa.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-3c6676aa.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-3c6676aa.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-3c6676aa.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-3c6676aa.0^android_x86_64

echo "building target-cacert-3c860d51.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-3c860d51.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-3c860d51.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-3c860d51.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-3c860d51.0^android_x86_64

echo "building target-cacert-3c899c73.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-3c899c73.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-3c899c73.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-3c899c73.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-3c899c73.0^android_x86_64

echo "building target-cacert-3c9a4d3b.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-3c9a4d3b.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-3c9a4d3b.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-3c9a4d3b.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-3c9a4d3b.0^android_x86_64

echo "building target-cacert-3e7271e8.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-3e7271e8.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-3e7271e8.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-3e7271e8.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-3e7271e8.0^android_x86_64

echo "building target-cacert-40dc992e.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-40dc992e.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-40dc992e.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-40dc992e.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-40dc992e.0^android_x86_64

echo "building target-cacert-455f1b52.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-455f1b52.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-455f1b52.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-455f1b52.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-455f1b52.0^android_x86_64

echo "building target-cacert-48a195d8.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-48a195d8.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-48a195d8.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-48a195d8.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-48a195d8.0^android_x86_64

echo "building target-cacert-4be590e0.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-4be590e0.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-4be590e0.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-4be590e0.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-4be590e0.0^android_x86_64

echo "building target-cacert-5046c355.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-5046c355.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-5046c355.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-5046c355.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-5046c355.0^android_x86_64

echo "building target-cacert-524d9b43.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-524d9b43.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-524d9b43.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-524d9b43.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-524d9b43.0^android_x86_64

echo "building target-cacert-52b525c7.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-52b525c7.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-52b525c7.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-52b525c7.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-52b525c7.0^android_x86_64

echo "building target-cacert-583d0756.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-583d0756.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-583d0756.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-583d0756.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-583d0756.0^android_x86_64

echo "building target-cacert-5a250ea7.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-5a250ea7.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-5a250ea7.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-5a250ea7.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-5a250ea7.0^android_x86_64

echo "building target-cacert-5a3f0ff8.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-5a3f0ff8.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-5a3f0ff8.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-5a3f0ff8.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-5a3f0ff8.0^android_x86_64

echo "building target-cacert-5acf816d.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-5acf816d.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-5acf816d.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-5acf816d.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-5acf816d.0^android_x86_64

echo "building target-cacert-5cf9d536.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-5cf9d536.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-5cf9d536.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-5cf9d536.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-5cf9d536.0^android_x86_64

echo "building target-cacert-5f47b495.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-5f47b495.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-5f47b495.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-5f47b495.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-5f47b495.0^android_x86_64

echo "building target-cacert-60afe812.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-60afe812.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-60afe812.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-60afe812.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-60afe812.0^android_x86_64

echo "building target-cacert-6187b673.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-6187b673.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-6187b673.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-6187b673.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-6187b673.0^android_x86_64

echo "building target-cacert-63a2c897.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-63a2c897.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-63a2c897.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-63a2c897.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-63a2c897.0^android_x86_64

echo "building target-cacert-69105f4f.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-69105f4f.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-69105f4f.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-69105f4f.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-69105f4f.0^android_x86_64

echo "building target-cacert-6b03dec0.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-6b03dec0.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-6b03dec0.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-6b03dec0.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-6b03dec0.0^android_x86_64

echo "building target-cacert-75680d2e.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-75680d2e.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-75680d2e.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-75680d2e.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-75680d2e.0^android_x86_64

echo "building target-cacert-76579174.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-76579174.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-76579174.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-76579174.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-76579174.0^android_x86_64

echo "building target-cacert-7892ad52.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-7892ad52.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-7892ad52.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-7892ad52.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-7892ad52.0^android_x86_64

echo "building target-cacert-7a7c655d.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-7a7c655d.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-7a7c655d.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-7a7c655d.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-7a7c655d.0^android_x86_64

echo "building target-cacert-7a819ef2.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-7a819ef2.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-7a819ef2.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-7a819ef2.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-7a819ef2.0^android_x86_64

echo "building target-cacert-7c302982.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-7c302982.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-7c302982.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-7c302982.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-7c302982.0^android_x86_64

echo "building target-cacert-81b9768f.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-81b9768f.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-81b9768f.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-81b9768f.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-81b9768f.0^android_x86_64

echo "building target-cacert-82223c44.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-82223c44.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-82223c44.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-82223c44.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-82223c44.0^android_x86_64

echo "building target-cacert-83e9984f.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-83e9984f.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-83e9984f.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-83e9984f.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-83e9984f.0^android_x86_64

echo "building target-cacert-85cde254.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-85cde254.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-85cde254.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-85cde254.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-85cde254.0^android_x86_64

echo "building target-cacert-86212b19.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-86212b19.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-86212b19.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-86212b19.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-86212b19.0^android_x86_64

echo "building target-cacert-869fbf79.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-869fbf79.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-869fbf79.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-869fbf79.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-869fbf79.0^android_x86_64

echo "building target-cacert-882de061.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-882de061.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-882de061.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-882de061.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-882de061.0^android_x86_64

echo "building target-cacert-88950faa.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-88950faa.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-88950faa.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-88950faa.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-88950faa.0^android_x86_64

echo "building target-cacert-89c02a45.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-89c02a45.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-89c02a45.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-89c02a45.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-89c02a45.0^android_x86_64

echo "building target-cacert-8d6437c3.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-8d6437c3.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-8d6437c3.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-8d6437c3.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-8d6437c3.0^android_x86_64

echo "building target-cacert-9282e51c.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-9282e51c.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9282e51c.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-9282e51c.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9282e51c.0^android_x86_64

echo "building target-cacert-9339512a.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-9339512a.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9339512a.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-9339512a.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9339512a.0^android_x86_64

echo "building target-cacert-9479c8c3.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-9479c8c3.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9479c8c3.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-9479c8c3.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9479c8c3.0^android_x86_64

echo "building target-cacert-9576d26b.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-9576d26b.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9576d26b.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-9576d26b.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9576d26b.0^android_x86_64

echo "building target-cacert-9591a472.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-9591a472.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9591a472.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-9591a472.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9591a472.0^android_x86_64

echo "building target-cacert-95aff9e3.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-95aff9e3.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-95aff9e3.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-95aff9e3.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-95aff9e3.0^android_x86_64

echo "building target-cacert-9685a493.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-9685a493.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9685a493.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-9685a493.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9685a493.0^android_x86_64

echo "building target-cacert-985c1f52.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-985c1f52.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-985c1f52.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-985c1f52.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-985c1f52.0^android_x86_64

echo "building target-cacert-9aef356c.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-9aef356c.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9aef356c.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-9aef356c.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9aef356c.0^android_x86_64

echo "building target-cacert-9d6523ce.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-9d6523ce.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9d6523ce.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-9d6523ce.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9d6523ce.0^android_x86_64

echo "building target-cacert-9f533518.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-9f533518.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9f533518.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-9f533518.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-9f533518.0^android_x86_64

echo "building target-cacert-a2c66da8.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-a2c66da8.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-a2c66da8.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-a2c66da8.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-a2c66da8.0^android_x86_64

echo "building target-cacert-a3896b44.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-a3896b44.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-a3896b44.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-a3896b44.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-a3896b44.0^android_x86_64

echo "building target-cacert-a7605362.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-a7605362.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-a7605362.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-a7605362.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-a7605362.0^android_x86_64

echo "building target-cacert-a81e292b.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-a81e292b.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-a81e292b.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-a81e292b.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-a81e292b.0^android_x86_64

echo "building target-cacert-a9d40e02.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-a9d40e02.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-a9d40e02.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-a9d40e02.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-a9d40e02.0^android_x86_64

echo "building target-cacert-ab5346f4.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-ab5346f4.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-ab5346f4.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-ab5346f4.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-ab5346f4.0^android_x86_64

echo "building target-cacert-ab59055e.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-ab59055e.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-ab59055e.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-ab59055e.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-ab59055e.0^android_x86_64

echo "building target-cacert-aeb67534.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-aeb67534.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-aeb67534.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-aeb67534.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-aeb67534.0^android_x86_64

echo "building target-cacert-b0ed035a.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-b0ed035a.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-b0ed035a.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-b0ed035a.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-b0ed035a.0^android_x86_64

echo "building target-cacert-b0f3e76e.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-b0f3e76e.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-b0f3e76e.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-b0f3e76e.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-b0f3e76e.0^android_x86_64

echo "building target-cacert-b3fb433b.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-b3fb433b.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-b3fb433b.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-b3fb433b.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-b3fb433b.0^android_x86_64

echo "building target-cacert-b74d2bd5.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-b74d2bd5.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-b74d2bd5.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-b74d2bd5.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-b74d2bd5.0^android_x86_64

echo "building target-cacert-b7db1890.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-b7db1890.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-b7db1890.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-b7db1890.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-b7db1890.0^android_x86_64

echo "building target-cacert-b872f2b4.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-b872f2b4.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-b872f2b4.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-b872f2b4.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-b872f2b4.0^android_x86_64

echo "building target-cacert-b936d1c6.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-b936d1c6.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-b936d1c6.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-b936d1c6.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-b936d1c6.0^android_x86_64

echo "building target-cacert-bc3f2570.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-bc3f2570.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-bc3f2570.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-bc3f2570.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-bc3f2570.0^android_x86_64

echo "building target-cacert-bd43e1dd.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-bd43e1dd.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-bd43e1dd.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-bd43e1dd.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-bd43e1dd.0^android_x86_64

echo "building target-cacert-bdacca6f.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-bdacca6f.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-bdacca6f.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-bdacca6f.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-bdacca6f.0^android_x86_64

echo "building target-cacert-bf64f35b.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-bf64f35b.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-bf64f35b.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-bf64f35b.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-bf64f35b.0^android_x86_64

echo "building target-cacert-c2c1704e.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-c2c1704e.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-c2c1704e.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-c2c1704e.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-c2c1704e.0^android_x86_64

echo "building target-cacert-c491639e.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-c491639e.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-c491639e.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-c491639e.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-c491639e.0^android_x86_64

echo "building target-cacert-c51c224c.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-c51c224c.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-c51c224c.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-c51c224c.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-c51c224c.0^android_x86_64

echo "building target-cacert-c559d742.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-c559d742.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-c559d742.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-c559d742.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-c559d742.0^android_x86_64

echo "building target-cacert-c90bc37d.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-c90bc37d.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-c90bc37d.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-c90bc37d.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-c90bc37d.0^android_x86_64

echo "building target-cacert-cb156124.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-cb156124.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-cb156124.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-cb156124.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-cb156124.0^android_x86_64

echo "building target-cacert-cb1c3204.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-cb1c3204.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-cb1c3204.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-cb1c3204.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-cb1c3204.0^android_x86_64

echo "building target-cacert-ccc52f49.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-ccc52f49.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-ccc52f49.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-ccc52f49.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-ccc52f49.0^android_x86_64

echo "building target-cacert-cf701eeb.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-cf701eeb.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-cf701eeb.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-cf701eeb.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-cf701eeb.0^android_x86_64

echo "building target-cacert-d06393bb.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-d06393bb.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d06393bb.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-d06393bb.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d06393bb.0^android_x86_64

echo "building target-cacert-d0cddf45.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-d0cddf45.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d0cddf45.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-d0cddf45.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d0cddf45.0^android_x86_64

echo "building target-cacert-d16a5865.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-d16a5865.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d16a5865.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-d16a5865.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d16a5865.0^android_x86_64

echo "building target-cacert-d18e9066.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-d18e9066.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d18e9066.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-d18e9066.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d18e9066.0^android_x86_64

echo "building target-cacert-d39b0a2c.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-d39b0a2c.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d39b0a2c.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-d39b0a2c.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d39b0a2c.0^android_x86_64

echo "building target-cacert-d41b5e2a.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-d41b5e2a.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d41b5e2a.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-d41b5e2a.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d41b5e2a.0^android_x86_64

echo "building target-cacert-d4c339cb.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-d4c339cb.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d4c339cb.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-d4c339cb.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d4c339cb.0^android_x86_64

echo "building target-cacert-d59297b8.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-d59297b8.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d59297b8.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-d59297b8.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d59297b8.0^android_x86_64

echo "building target-cacert-d7746a63.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-d7746a63.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d7746a63.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-d7746a63.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-d7746a63.0^android_x86_64

echo "building target-cacert-da7377f6.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-da7377f6.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-da7377f6.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-da7377f6.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-da7377f6.0^android_x86_64

echo "building target-cacert-dbc54cab.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-dbc54cab.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-dbc54cab.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-dbc54cab.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-dbc54cab.0^android_x86_64

echo "building target-cacert-dbff3a01.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-dbff3a01.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-dbff3a01.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-dbff3a01.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-dbff3a01.0^android_x86_64

echo "building target-cacert-dc99f41e.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-dc99f41e.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-dc99f41e.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-dc99f41e.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-dc99f41e.0^android_x86_64

echo "building target-cacert-dfc0fe80.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-dfc0fe80.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-dfc0fe80.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-dfc0fe80.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-dfc0fe80.0^android_x86_64

echo "building target-cacert-e442e424.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-e442e424.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-e442e424.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-e442e424.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-e442e424.0^android_x86_64

echo "building target-cacert-e48193cf.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-e48193cf.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-e48193cf.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-e48193cf.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-e48193cf.0^android_x86_64

echo "building target-cacert-e8651083.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-e8651083.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-e8651083.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-e8651083.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-e8651083.0^android_x86_64

echo "building target-cacert-ed39abd0.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-ed39abd0.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-ed39abd0.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-ed39abd0.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-ed39abd0.0^android_x86_64

echo "building target-cacert-edcbddb5.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-edcbddb5.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-edcbddb5.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-edcbddb5.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-edcbddb5.0^android_x86_64

echo "building target-cacert-f013ecaf.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-f013ecaf.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-f013ecaf.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-f013ecaf.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-f013ecaf.0^android_x86_64

echo "building target-cacert-f0cd152c.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-f0cd152c.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-f0cd152c.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-f0cd152c.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-f0cd152c.0^android_x86_64

echo "building target-cacert-f459871d.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-f459871d.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-f459871d.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-f459871d.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-f459871d.0^android_x86_64

echo "building target-cacert-fb5fa911.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-fb5fa911.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-fb5fa911.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-fb5fa911.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-fb5fa911.0^android_x86_64

echo "building target-cacert-fd08c599.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-fd08c599.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-fd08c599.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-fd08c599.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-fd08c599.0^android_x86_64

echo "building target-cacert-fde84897.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-fde84897.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-fde84897.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-fde84897.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/target-cacert-fde84897.0^android_x86_64

echo "building target-cacert-google-00673b5b.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-00673b5b.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-00673b5b.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-00673b5b.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-00673b5b.0^android_x86_64

echo "building target-cacert-google-02b73561.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-02b73561.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-02b73561.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-02b73561.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-02b73561.0^android_x86_64

echo "building target-cacert-google-04f60c28.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-04f60c28.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-04f60c28.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-04f60c28.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-04f60c28.0^android_x86_64

echo "building target-cacert-google-052e396b.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-052e396b.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-052e396b.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-052e396b.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-052e396b.0^android_x86_64

echo "building target-cacert-google-0d69c7e1.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-0d69c7e1.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-0d69c7e1.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-0d69c7e1.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-0d69c7e1.0^android_x86_64

echo "building target-cacert-google-111e6273.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-111e6273.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-111e6273.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-111e6273.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-111e6273.0^android_x86_64

echo "building target-cacert-google-124bbd54.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-124bbd54.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-124bbd54.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-124bbd54.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-124bbd54.0^android_x86_64

echo "building target-cacert-google-1e8e7201.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-1e8e7201.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-1e8e7201.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-1e8e7201.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-1e8e7201.0^android_x86_64

echo "building target-cacert-google-219d9499.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-219d9499.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-219d9499.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-219d9499.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-219d9499.0^android_x86_64

echo "building target-cacert-google-23f4c490.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-23f4c490.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-23f4c490.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-23f4c490.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-23f4c490.0^android_x86_64

echo "building target-cacert-google-27af790d.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-27af790d.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-27af790d.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-27af790d.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-27af790d.0^android_x86_64

echo "building target-cacert-google-2add47b6.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-2add47b6.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-2add47b6.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-2add47b6.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-2add47b6.0^android_x86_64

echo "building target-cacert-google-2afc57aa.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-2afc57aa.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-2afc57aa.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-2afc57aa.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-2afc57aa.0^android_x86_64

echo "building target-cacert-google-343eb6cb.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-343eb6cb.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-343eb6cb.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-343eb6cb.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-343eb6cb.0^android_x86_64

echo "building target-cacert-google-35105088.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-35105088.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-35105088.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-35105088.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-35105088.0^android_x86_64

echo "building target-cacert-google-399e7759.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-399e7759.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-399e7759.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-399e7759.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-399e7759.0^android_x86_64

echo "building target-cacert-google-3ad48a91.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-3ad48a91.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-3ad48a91.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-3ad48a91.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-3ad48a91.0^android_x86_64

echo "building target-cacert-google-3c58f906.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-3c58f906.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-3c58f906.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-3c58f906.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-3c58f906.0^android_x86_64

echo "building target-cacert-google-3e7271e8.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-3e7271e8.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-3e7271e8.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-3e7271e8.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-3e7271e8.0^android_x86_64

echo "building target-cacert-google-455f1b52.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-455f1b52.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-455f1b52.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-455f1b52.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-455f1b52.0^android_x86_64

echo "building target-cacert-google-4fbd6bfa.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-4fbd6bfa.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-4fbd6bfa.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-4fbd6bfa.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-4fbd6bfa.0^android_x86_64

echo "building target-cacert-google-5021a0a2.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-5021a0a2.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-5021a0a2.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-5021a0a2.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-5021a0a2.0^android_x86_64

echo "building target-cacert-google-524d9b43.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-524d9b43.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-524d9b43.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-524d9b43.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-524d9b43.0^android_x86_64

echo "building target-cacert-google-57692373.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-57692373.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-57692373.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-57692373.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-57692373.0^android_x86_64

echo "building target-cacert-google-594f1775.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-594f1775.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-594f1775.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-594f1775.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-594f1775.0^android_x86_64

echo "building target-cacert-google-5a3f0ff8.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-5a3f0ff8.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-5a3f0ff8.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-5a3f0ff8.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-5a3f0ff8.0^android_x86_64

echo "building target-cacert-google-5e4e69e7.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-5e4e69e7.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-5e4e69e7.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-5e4e69e7.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-5e4e69e7.0^android_x86_64

echo "building target-cacert-google-67495436.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-67495436.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-67495436.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-67495436.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-67495436.0^android_x86_64

echo "building target-cacert-google-69105f4f.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-69105f4f.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-69105f4f.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-69105f4f.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-69105f4f.0^android_x86_64

echo "building target-cacert-google-75680d2e.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-75680d2e.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-75680d2e.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-75680d2e.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-75680d2e.0^android_x86_64

echo "building target-cacert-google-7999be0d.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-7999be0d.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-7999be0d.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-7999be0d.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-7999be0d.0^android_x86_64

echo "building target-cacert-google-7d453d8f.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-7d453d8f.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-7d453d8f.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-7d453d8f.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-7d453d8f.0^android_x86_64

echo "building target-cacert-google-81b9768f.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-81b9768f.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-81b9768f.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-81b9768f.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-81b9768f.0^android_x86_64

echo "building target-cacert-google-85cde254.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-85cde254.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-85cde254.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-85cde254.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-85cde254.0^android_x86_64

echo "building target-cacert-google-86212b19.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-86212b19.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-86212b19.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-86212b19.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-86212b19.0^android_x86_64

echo "building target-cacert-google-87753b0d.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-87753b0d.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-87753b0d.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-87753b0d.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-87753b0d.0^android_x86_64

echo "building target-cacert-google-89c02a45.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-89c02a45.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-89c02a45.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-89c02a45.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-89c02a45.0^android_x86_64

echo "building target-cacert-google-8d6437c3.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-8d6437c3.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-8d6437c3.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-8d6437c3.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-8d6437c3.0^android_x86_64

echo "building target-cacert-google-9772ca32.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-9772ca32.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-9772ca32.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-9772ca32.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-9772ca32.0^android_x86_64

echo "building target-cacert-google-a2c66da8.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-a2c66da8.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-a2c66da8.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-a2c66da8.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-a2c66da8.0^android_x86_64

echo "building target-cacert-google-a2df7ad7.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-a2df7ad7.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-a2df7ad7.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-a2df7ad7.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-a2df7ad7.0^android_x86_64

echo "building target-cacert-google-a7d2cf64.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-a7d2cf64.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-a7d2cf64.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-a7d2cf64.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-a7d2cf64.0^android_x86_64

echo "building target-cacert-google-b0f3e76e.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-b0f3e76e.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-b0f3e76e.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-b0f3e76e.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-b0f3e76e.0^android_x86_64

echo "building target-cacert-google-b3fb433b.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-b3fb433b.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-b3fb433b.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-b3fb433b.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-b3fb433b.0^android_x86_64

echo "building target-cacert-google-bc3f2570.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-bc3f2570.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-bc3f2570.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-bc3f2570.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-bc3f2570.0^android_x86_64

echo "building target-cacert-google-bf64f35b.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-bf64f35b.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-bf64f35b.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-bf64f35b.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-bf64f35b.0^android_x86_64

echo "building target-cacert-google-c491639e.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-c491639e.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-c491639e.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-c491639e.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-c491639e.0^android_x86_64

echo "building target-cacert-google-c527e4ab.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-c527e4ab.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-c527e4ab.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-c527e4ab.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-c527e4ab.0^android_x86_64

echo "building target-cacert-google-c7e2a638.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-c7e2a638.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-c7e2a638.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-c7e2a638.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-c7e2a638.0^android_x86_64

echo "building target-cacert-google-c90bc37d.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-c90bc37d.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-c90bc37d.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-c90bc37d.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-c90bc37d.0^android_x86_64

echo "building target-cacert-google-ccc52f49.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-ccc52f49.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-ccc52f49.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-ccc52f49.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-ccc52f49.0^android_x86_64

echo "building target-cacert-google-d4c339cb.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-d4c339cb.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-d4c339cb.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-d4c339cb.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-d4c339cb.0^android_x86_64

echo "building target-cacert-google-dbc54cab.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-dbc54cab.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-dbc54cab.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-dbc54cab.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-dbc54cab.0^android_x86_64

echo "building target-cacert-google-e268a4c5.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-e268a4c5.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-e268a4c5.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-e268a4c5.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-e268a4c5.0^android_x86_64

echo "building target-cacert-google-e48193cf.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-e48193cf.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-e48193cf.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-e48193cf.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-e48193cf.0^android_x86_64

echo "building target-cacert-google-e775ed2d.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-e775ed2d.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-e775ed2d.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-e775ed2d.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-e775ed2d.0^android_x86_64

echo "building target-cacert-google-ed39abd0.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-ed39abd0.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-ed39abd0.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-ed39abd0.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-ed39abd0.0^android_x86_64

echo "building target-cacert-google-facacbc6.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-facacbc6.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-facacbc6.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-facacbc6.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-facacbc6.0^android_x86_64

echo "building target-cacert-google-ff783690.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-google-ff783690.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-ff783690.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-google-ff783690.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/google/target-cacert-google-ff783690.0^android_x86_64

echo "building target-cacert-wifi-21125ccd.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-wifi-21125ccd.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/wfa_certs/target-cacert-wifi-21125ccd.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-wifi-21125ccd.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/wfa_certs/target-cacert-wifi-21125ccd.0^android_x86_64

echo "building target-cacert-wifi-674b5f5b.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-wifi-674b5f5b.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/wfa_certs/target-cacert-wifi-674b5f5b.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-wifi-674b5f5b.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/wfa_certs/target-cacert-wifi-674b5f5b.0^android_x86_64

echo "building target-cacert-wifi-ea93cb5b.0^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target-cacert-wifi-ea93cb5b.0,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/ca-certificates/wfa_certs/target-cacert-wifi-ea93cb5b.0^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/ca-certificates/target-cacert-wifi-ea93cb5b.0^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/ca-certificates/wfa_certs/target-cacert-wifi-ea93cb5b.0^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_ca-certificates.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/ca-certificates/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 system_ca-certificates.tar.zst --clobber

du -ah -d1 system_ca-certificates*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/system_ca-certificates.tar.zst" ]; then
  echo "Compressing system/ca-certificates -> system_ca-certificates.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_ca-certificates.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/ca-certificates/ .
fi

rm -rf aosp
