set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform external/boringssl
clone_depth_platform external/libaom
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libevent
clone_depth_platform external/libopus
clone_depth_platform external/libsrtp2
clone_depth_platform external/libvpx
clone_depth_platform external/libyuv
clone_depth_platform external/pffft
clone_depth_platform external/rnnoise
clone_depth_platform external/usrsctp
clone_depth_platform external/webrtc
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .

echo "building webrtc_aec3__aec3^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_aec3__aec3,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec3__aec3^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_aec3__aec3^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec3__aec3^android_vendor.31_x86_64_static

echo "building webrtc_aec3__aec3^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_aec3__aec3,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec3__aec3^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_aec3__aec3^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec3__aec3^android_vendor.31_x86_x86_64_static

echo "building webrtc_aec_dump__null_aec_dump_factory^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_aec_dump__null_aec_dump_factory,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec_dump__null_aec_dump_factory^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_aec_dump__null_aec_dump_factory^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec_dump__null_aec_dump_factory^android_vendor.31_x86_64_static

echo "building webrtc_aec_dump__null_aec_dump_factory^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_aec_dump__null_aec_dump_factory,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec_dump__null_aec_dump_factory^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_aec_dump__null_aec_dump_factory^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec_dump__null_aec_dump_factory^android_vendor.31_x86_x86_64_static

echo "building webrtc_aecm__aecm_core^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_aecm__aecm_core,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aecm__aecm_core^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_aecm__aecm_core^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aecm__aecm_core^android_vendor.31_x86_64_static

echo "building webrtc_aecm__aecm_core^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_aecm__aecm_core,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aecm__aecm_core^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_aecm__aecm_core^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aecm__aecm_core^android_vendor.31_x86_x86_64_static

echo "building webrtc_agc2__adaptive_digital^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__adaptive_digital,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__adaptive_digital^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__adaptive_digital^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__adaptive_digital^android_vendor.31_x86_64_static

echo "building webrtc_agc2__adaptive_digital^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__adaptive_digital,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__adaptive_digital^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__adaptive_digital^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__adaptive_digital^android_vendor.31_x86_x86_64_static

echo "building webrtc_agc2__biquad_filter^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__biquad_filter,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__biquad_filter^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__biquad_filter^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__biquad_filter^android_vendor.31_x86_64_static

echo "building webrtc_agc2__biquad_filter^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__biquad_filter,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__biquad_filter^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__biquad_filter^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__biquad_filter^android_vendor.31_x86_x86_64_static

echo "building webrtc_agc2__common^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__common,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__common^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__common^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__common^android_vendor.31_x86_64_static

echo "building webrtc_agc2__common^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__common,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__common^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__common^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__common^android_vendor.31_x86_x86_64_static

echo "building webrtc_agc2__fixed_digital^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__fixed_digital,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__fixed_digital^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__fixed_digital^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__fixed_digital^android_vendor.31_x86_64_static

echo "building webrtc_agc2__fixed_digital^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__fixed_digital,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__fixed_digital^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__fixed_digital^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__fixed_digital^android_vendor.31_x86_x86_64_static

echo "building webrtc_agc2__gain_applier^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__gain_applier,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__gain_applier^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__gain_applier^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__gain_applier^android_vendor.31_x86_64_static

echo "building webrtc_agc2__gain_applier^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__gain_applier,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__gain_applier^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__gain_applier^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__gain_applier^android_vendor.31_x86_x86_64_static

echo "building webrtc_agc2__level_estimation_agc^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__level_estimation_agc,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__level_estimation_agc^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__level_estimation_agc^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__level_estimation_agc^android_vendor.31_x86_64_static

echo "building webrtc_agc2__level_estimation_agc^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__level_estimation_agc,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__level_estimation_agc^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__level_estimation_agc^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__level_estimation_agc^android_vendor.31_x86_x86_64_static

echo "building webrtc_agc2__noise_level_estimator^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__noise_level_estimator,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__noise_level_estimator^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__noise_level_estimator^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__noise_level_estimator^android_vendor.31_x86_64_static

echo "building webrtc_agc2__noise_level_estimator^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__noise_level_estimator,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__noise_level_estimator^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__noise_level_estimator^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__noise_level_estimator^android_vendor.31_x86_x86_64_static

echo "building webrtc_agc2__rnn_vad_with_level^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__rnn_vad_with_level,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__rnn_vad_with_level^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__rnn_vad_with_level^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__rnn_vad_with_level^android_vendor.31_x86_64_static

echo "building webrtc_agc2__rnn_vad_with_level^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc2__rnn_vad_with_level,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__rnn_vad_with_level^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc2__rnn_vad_with_level^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__rnn_vad_with_level^android_vendor.31_x86_x86_64_static

echo "building webrtc_agc__agc^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc__agc,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__agc^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc__agc^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__agc^android_vendor.31_x86_64_static

echo "building webrtc_agc__agc^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc__agc,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__agc^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc__agc^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__agc^android_vendor.31_x86_x86_64_static

echo "building webrtc_agc__legacy_agc^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc__legacy_agc,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__legacy_agc^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc__legacy_agc^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__legacy_agc^android_vendor.31_x86_64_static

echo "building webrtc_agc__legacy_agc^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc__legacy_agc,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__legacy_agc^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc__legacy_agc^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__legacy_agc^android_vendor.31_x86_x86_64_static

echo "building webrtc_agc__level_estimation^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc__level_estimation,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__level_estimation^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc__level_estimation^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__level_estimation^android_vendor.31_x86_64_static

echo "building webrtc_agc__level_estimation^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_agc__level_estimation,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__level_estimation^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_agc__level_estimation^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__level_estimation^android_vendor.31_x86_x86_64_static

echo "building webrtc_api__rtc_error^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_api__rtc_error,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtc_error^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_api__rtc_error^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtc_error^android_vendor.31_x86_64_static

echo "building webrtc_api__rtc_error^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_api__rtc_error,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtc_error^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_api__rtc_error^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtc_error^android_vendor.31_x86_x86_64_static

echo "building webrtc_audio__aec3_config^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio__aec3_config,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__aec3_config^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio__aec3_config^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__aec3_config^android_vendor.31_x86_64_static

echo "building webrtc_audio__aec3_config^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio__aec3_config,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__aec3_config^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio__aec3_config^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__aec3_config^android_vendor.31_x86_x86_64_static

echo "building webrtc_audio__audio_frame_api^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio__audio_frame_api,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__audio_frame_api^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio__audio_frame_api^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__audio_frame_api^android_vendor.31_x86_64_static

echo "building webrtc_audio__audio_frame_api^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio__audio_frame_api,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__audio_frame_api^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio__audio_frame_api^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__audio_frame_api^android_vendor.31_x86_x86_64_static

echo "building webrtc_audio_coding__isac_vad^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_coding__isac_vad,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac_vad^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_coding__isac_vad^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac_vad^android_vendor.31_x86_64_static

echo "building webrtc_audio_coding__isac_vad^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_coding__isac_vad,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac_vad^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_coding__isac_vad^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac_vad^android_vendor.31_x86_x86_64_static

echo "building webrtc_audio_processing__api^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__api,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__api^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__api^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__api^android_vendor.31_x86_64_static

echo "building webrtc_audio_processing__api^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__api,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__api^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__api^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__api^android_vendor.31_x86_x86_64_static

echo "building webrtc_audio_processing__apm_logging^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__apm_logging,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__apm_logging^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__apm_logging^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__apm_logging^android_vendor.31_x86_64_static

echo "building webrtc_audio_processing__apm_logging^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__apm_logging,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__apm_logging^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__apm_logging^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__apm_logging^android_vendor.31_x86_x86_64_static

echo "building webrtc_audio_processing__audio_buffer^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__audio_buffer,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_buffer^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__audio_buffer^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_buffer^android_vendor.31_x86_64_static

echo "building webrtc_audio_processing__audio_buffer^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__audio_buffer,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_buffer^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__audio_buffer^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_buffer^android_vendor.31_x86_x86_64_static

echo "building webrtc_audio_processing__audio_frame_proxies^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__audio_frame_proxies,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_frame_proxies^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__audio_frame_proxies^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_frame_proxies^android_vendor.31_x86_64_static

echo "building webrtc_audio_processing__audio_frame_proxies^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__audio_frame_proxies,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_frame_proxies^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__audio_frame_proxies^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_frame_proxies^android_vendor.31_x86_x86_64_static

echo "building webrtc_audio_processing__audio_processing^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__audio_processing,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__audio_processing^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing^android_vendor.31_x86_64_static

echo "building webrtc_audio_processing__audio_processing^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__audio_processing,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__audio_processing^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing^android_vendor.31_x86_x86_64_static

echo "building webrtc_audio_processing__audio_processing_statistics^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__audio_processing_statistics,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing_statistics^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__audio_processing_statistics^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing_statistics^android_vendor.31_x86_64_static

echo "building webrtc_audio_processing__audio_processing_statistics^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__audio_processing_statistics,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing_statistics^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__audio_processing_statistics^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing_statistics^android_vendor.31_x86_x86_64_static

echo "building webrtc_audio_processing__config^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__config,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__config^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__config^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__config^android_vendor.31_x86_64_static

echo "building webrtc_audio_processing__config^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__config,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__config^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__config^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__config^android_vendor.31_x86_x86_64_static

echo "building webrtc_audio_processing__high_pass_filter^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__high_pass_filter,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__high_pass_filter^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__high_pass_filter^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__high_pass_filter^android_vendor.31_x86_64_static

echo "building webrtc_audio_processing__high_pass_filter^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__high_pass_filter,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__high_pass_filter^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__high_pass_filter^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__high_pass_filter^android_vendor.31_x86_x86_64_static

echo "building webrtc_audio_processing__optionally_built_submodule_creators^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__optionally_built_submodule_creators,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators^android_vendor.31_x86_64_static

echo "building webrtc_audio_processing__optionally_built_submodule_creators^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__optionally_built_submodule_creators,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators^android_vendor.31_x86_x86_64_static

echo "building webrtc_audio_processing__voice_detection^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__voice_detection,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__voice_detection^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__voice_detection^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__voice_detection^android_vendor.31_x86_64_static

echo "building webrtc_audio_processing__voice_detection^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_audio_processing__voice_detection,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__voice_detection^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_audio_processing__voice_detection^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__voice_detection^android_vendor.31_x86_x86_64_static

echo "building webrtc_common_audio__common_audio^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_common_audio__common_audio,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_common_audio__common_audio^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio^android_vendor.31_x86_64_static

echo "building webrtc_common_audio__common_audio^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_common_audio__common_audio,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_common_audio__common_audio^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio^android_vendor.31_x86_x86_64_static

echo "building webrtc_common_audio__common_audio_c^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_common_audio__common_audio_c,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_c^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_common_audio__common_audio_c^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_c^android_vendor.31_x86_64_static

echo "building webrtc_common_audio__common_audio_c^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_common_audio__common_audio_c,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_c^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_common_audio__common_audio_c^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_c^android_vendor.31_x86_x86_64_static

echo "building webrtc_common_audio__common_audio_cc^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_common_audio__common_audio_cc,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_cc^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_common_audio__common_audio_cc^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_cc^android_vendor.31_x86_64_static

echo "building webrtc_common_audio__common_audio_cc^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_common_audio__common_audio_cc,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_cc^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_common_audio__common_audio_cc^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_cc^android_vendor.31_x86_x86_64_static

echo "building webrtc_common_audio__fir_filter_factory^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_common_audio__fir_filter_factory,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__fir_filter_factory^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_common_audio__fir_filter_factory^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__fir_filter_factory^android_vendor.31_x86_64_static

echo "building webrtc_common_audio__fir_filter_factory^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_common_audio__fir_filter_factory,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__fir_filter_factory^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_common_audio__fir_filter_factory^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__fir_filter_factory^android_vendor.31_x86_x86_64_static

echo "building webrtc_experiments__field_trial_parser^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_experiments__field_trial_parser,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__field_trial_parser^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_experiments__field_trial_parser^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__field_trial_parser^android_vendor.31_x86_64_static

echo "building webrtc_experiments__field_trial_parser^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_experiments__field_trial_parser,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__field_trial_parser^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_experiments__field_trial_parser^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__field_trial_parser^android_vendor.31_x86_x86_64_static

echo "building webrtc_fft__fft^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_fft__fft,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_fft__fft^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_fft__fft^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_fft__fft^android_vendor.31_x86_64_static

echo "building webrtc_fft__fft^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_fft__fft,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_fft__fft^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_fft__fft^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_fft__fft^android_vendor.31_x86_x86_64_static

echo "building webrtc_memory__aligned_malloc^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_memory__aligned_malloc,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_memory__aligned_malloc^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_memory__aligned_malloc^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_memory__aligned_malloc^android_vendor.31_x86_64_static

echo "building webrtc_memory__aligned_malloc^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_memory__aligned_malloc,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_memory__aligned_malloc^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_memory__aligned_malloc^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_memory__aligned_malloc^android_vendor.31_x86_x86_64_static

echo "building webrtc_ns__ns^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_ns__ns,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ns__ns^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_ns__ns^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ns__ns^android_vendor.31_x86_64_static

echo "building webrtc_ns__ns^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_ns__ns,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ns__ns^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_ns__ns^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ns__ns^android_vendor.31_x86_x86_64_static

echo "building webrtc_ooura__fft_size_128^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_ooura__fft_size_128,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_128^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_ooura__fft_size_128^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_128^android_vendor.31_x86_64_static

echo "building webrtc_ooura__fft_size_128^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_ooura__fft_size_128,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_128^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_ooura__fft_size_128^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_128^android_vendor.31_x86_x86_64_static

echo "building webrtc_ooura__fft_size_256^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_ooura__fft_size_256,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_256^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_ooura__fft_size_256^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_256^android_vendor.31_x86_64_static

echo "building webrtc_ooura__fft_size_256^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_ooura__fft_size_256,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_256^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_ooura__fft_size_256^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_256^android_vendor.31_x86_x86_64_static

echo "building webrtc_rnn_vad__rnn_vad^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rnn_vad__rnn_vad,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rnn_vad__rnn_vad^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rnn_vad__rnn_vad^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rnn_vad__rnn_vad^android_vendor.31_x86_64_static

echo "building webrtc_rnn_vad__rnn_vad^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rnn_vad__rnn_vad,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rnn_vad__rnn_vad^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rnn_vad__rnn_vad^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rnn_vad__rnn_vad^android_vendor.31_x86_x86_64_static

echo "building webrtc_rtc_base__checks^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__checks,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__checks^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__checks^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__checks^android_vendor.31_x86_64_static

echo "building webrtc_rtc_base__checks^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__checks,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__checks^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__checks^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__checks^android_vendor.31_x86_x86_64_static

echo "building webrtc_rtc_base__criticalsection^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__criticalsection,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__criticalsection^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__criticalsection^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__criticalsection^android_vendor.31_x86_64_static

echo "building webrtc_rtc_base__criticalsection^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__criticalsection,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__criticalsection^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__criticalsection^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__criticalsection^android_vendor.31_x86_x86_64_static

echo "building webrtc_rtc_base__logging^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__logging,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__logging^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__logging^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__logging^android_vendor.31_x86_64_static

echo "building webrtc_rtc_base__logging^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__logging,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__logging^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__logging^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__logging^android_vendor.31_x86_x86_64_static

echo "building webrtc_rtc_base__platform_thread^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__platform_thread,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__platform_thread^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread^android_vendor.31_x86_64_static

echo "building webrtc_rtc_base__platform_thread^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__platform_thread,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__platform_thread^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread^android_vendor.31_x86_x86_64_static

echo "building webrtc_rtc_base__platform_thread_types^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__platform_thread_types,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread_types^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__platform_thread_types^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread_types^android_vendor.31_x86_64_static

echo "building webrtc_rtc_base__platform_thread_types^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__platform_thread_types,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread_types^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__platform_thread_types^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread_types^android_vendor.31_x86_x86_64_static

echo "building webrtc_rtc_base__rtc_base_approved^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__rtc_base_approved,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_base_approved^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__rtc_base_approved^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_base_approved^android_vendor.31_x86_64_static

echo "building webrtc_rtc_base__rtc_base_approved^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__rtc_base_approved,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_base_approved^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__rtc_base_approved^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_base_approved^android_vendor.31_x86_x86_64_static

echo "building webrtc_rtc_base__rtc_event^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__rtc_event,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_event^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__rtc_event^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_event^android_vendor.31_x86_64_static

echo "building webrtc_rtc_base__rtc_event^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__rtc_event,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_event^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__rtc_event^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_event^android_vendor.31_x86_x86_64_static

echo "building webrtc_rtc_base__rtc_numerics^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__rtc_numerics,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_numerics^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__rtc_numerics^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_numerics^android_vendor.31_x86_64_static

echo "building webrtc_rtc_base__rtc_numerics^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__rtc_numerics,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_numerics^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__rtc_numerics^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_numerics^android_vendor.31_x86_x86_64_static

echo "building webrtc_rtc_base__stringutils^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__stringutils,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__stringutils^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__stringutils^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__stringutils^android_vendor.31_x86_64_static

echo "building webrtc_rtc_base__stringutils^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__stringutils,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__stringutils^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__stringutils^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__stringutils^android_vendor.31_x86_x86_64_static

echo "building webrtc_rtc_base__timeutils^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__timeutils,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__timeutils^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__timeutils^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__timeutils^android_vendor.31_x86_64_static

echo "building webrtc_rtc_base__timeutils^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_rtc_base__timeutils,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__timeutils^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_rtc_base__timeutils^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__timeutils^android_vendor.31_x86_x86_64_static

echo "building webrtc_spl_sqrt_floor__spl_sqrt_floor^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_spl_sqrt_floor__spl_sqrt_floor,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor^android_vendor.31_x86_64_static

echo "building webrtc_spl_sqrt_floor__spl_sqrt_floor^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_spl_sqrt_floor__spl_sqrt_floor,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor^android_vendor.31_x86_x86_64_static

echo "building webrtc_synchronization__mutex^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_synchronization__mutex,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__mutex^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_synchronization__mutex^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__mutex^android_vendor.31_x86_64_static

echo "building webrtc_synchronization__mutex^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_synchronization__mutex,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__mutex^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_synchronization__mutex^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__mutex^android_vendor.31_x86_x86_64_static

echo "building webrtc_synchronization__rw_lock_wrapper^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_synchronization__rw_lock_wrapper,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__rw_lock_wrapper^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_synchronization__rw_lock_wrapper^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__rw_lock_wrapper^android_vendor.31_x86_64_static

echo "building webrtc_synchronization__rw_lock_wrapper^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_synchronization__rw_lock_wrapper,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__rw_lock_wrapper^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_synchronization__rw_lock_wrapper^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__rw_lock_wrapper^android_vendor.31_x86_x86_64_static

echo "building webrtc_synchronization__yield^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_synchronization__yield,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_synchronization__yield^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield^android_vendor.31_x86_64_static

echo "building webrtc_synchronization__yield^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_synchronization__yield,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_synchronization__yield^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield^android_vendor.31_x86_x86_64_static

echo "building webrtc_synchronization__yield_policy^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_synchronization__yield_policy,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield_policy^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_synchronization__yield_policy^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield_policy^android_vendor.31_x86_64_static

echo "building webrtc_synchronization__yield_policy^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_synchronization__yield_policy,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield_policy^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_synchronization__yield_policy^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield_policy^android_vendor.31_x86_x86_64_static

echo "building webrtc_system__file_wrapper^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_system__file_wrapper,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system__file_wrapper^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_system__file_wrapper^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system__file_wrapper^android_vendor.31_x86_64_static

echo "building webrtc_system__file_wrapper^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_system__file_wrapper,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system__file_wrapper^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_system__file_wrapper^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system__file_wrapper^android_vendor.31_x86_x86_64_static

echo "building webrtc_system_wrappers__cpu_features_linux^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_system_wrappers__cpu_features_linux,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__cpu_features_linux^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_system_wrappers__cpu_features_linux^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__cpu_features_linux^android_vendor.31_x86_64_static

echo "building webrtc_system_wrappers__cpu_features_linux^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_system_wrappers__cpu_features_linux,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__cpu_features_linux^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_system_wrappers__cpu_features_linux^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__cpu_features_linux^android_vendor.31_x86_x86_64_static

echo "building webrtc_system_wrappers__field_trial^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_system_wrappers__field_trial,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__field_trial^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_system_wrappers__field_trial^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__field_trial^android_vendor.31_x86_64_static

echo "building webrtc_system_wrappers__field_trial^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_system_wrappers__field_trial,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__field_trial^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_system_wrappers__field_trial^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__field_trial^android_vendor.31_x86_x86_64_static

echo "building webrtc_system_wrappers__metrics^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_system_wrappers__metrics,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__metrics^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_system_wrappers__metrics^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__metrics^android_vendor.31_x86_64_static

echo "building webrtc_system_wrappers__metrics^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_system_wrappers__metrics,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__metrics^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_system_wrappers__metrics^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__metrics^android_vendor.31_x86_x86_64_static

echo "building webrtc_system_wrappers__system_wrappers^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_system_wrappers__system_wrappers,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__system_wrappers^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_system_wrappers__system_wrappers^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__system_wrappers^android_vendor.31_x86_64_static

echo "building webrtc_system_wrappers__system_wrappers^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_system_wrappers__system_wrappers,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__system_wrappers^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_system_wrappers__system_wrappers^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__system_wrappers^android_vendor.31_x86_x86_64_static

echo "building webrtc_transient__transient_suppressor_impl^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_transient__transient_suppressor_impl,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transient__transient_suppressor_impl^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_transient__transient_suppressor_impl^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transient__transient_suppressor_impl^android_vendor.31_x86_64_static

echo "building webrtc_transient__transient_suppressor_impl^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_transient__transient_suppressor_impl,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transient__transient_suppressor_impl^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_transient__transient_suppressor_impl^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transient__transient_suppressor_impl^android_vendor.31_x86_x86_64_static

echo "building webrtc_units__data_rate^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_units__data_rate,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_rate^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_units__data_rate^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_rate^android_vendor.31_x86_64_static

echo "building webrtc_units__data_rate^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_units__data_rate,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_rate^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_units__data_rate^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_rate^android_vendor.31_x86_x86_64_static

echo "building webrtc_units__data_size^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_units__data_size,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_size^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_units__data_size^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_size^android_vendor.31_x86_64_static

echo "building webrtc_units__data_size^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_units__data_size,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_size^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_units__data_size^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_size^android_vendor.31_x86_x86_64_static

echo "building webrtc_units__time_delta^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_units__time_delta,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__time_delta^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_units__time_delta^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__time_delta^android_vendor.31_x86_64_static

echo "building webrtc_units__time_delta^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_units__time_delta,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__time_delta^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_units__time_delta^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__time_delta^android_vendor.31_x86_x86_64_static

echo "building webrtc_units__timestamp^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_units__timestamp,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__timestamp^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_units__timestamp^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__timestamp^android_vendor.31_x86_64_static

echo "building webrtc_units__timestamp^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_units__timestamp,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__timestamp^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_units__timestamp^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__timestamp^android_vendor.31_x86_x86_64_static

echo "building webrtc_utility__audio_frame_operations^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_utility__audio_frame_operations,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__audio_frame_operations^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_utility__audio_frame_operations^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__audio_frame_operations^android_vendor.31_x86_64_static

echo "building webrtc_utility__audio_frame_operations^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_utility__audio_frame_operations,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__audio_frame_operations^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_utility__audio_frame_operations^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__audio_frame_operations^android_vendor.31_x86_x86_64_static

echo "building webrtc_utility__cascaded_biquad_filter^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_utility__cascaded_biquad_filter,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__cascaded_biquad_filter^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_utility__cascaded_biquad_filter^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__cascaded_biquad_filter^android_vendor.31_x86_64_static

echo "building webrtc_utility__cascaded_biquad_filter^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_utility__cascaded_biquad_filter,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__cascaded_biquad_filter^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_utility__cascaded_biquad_filter^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__cascaded_biquad_filter^android_vendor.31_x86_x86_64_static

echo "building webrtc_utility__legacy_delay_estimator^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_utility__legacy_delay_estimator,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__legacy_delay_estimator^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_utility__legacy_delay_estimator^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__legacy_delay_estimator^android_vendor.31_x86_64_static

echo "building webrtc_utility__legacy_delay_estimator^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_utility__legacy_delay_estimator,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__legacy_delay_estimator^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_utility__legacy_delay_estimator^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__legacy_delay_estimator^android_vendor.31_x86_x86_64_static

echo "building webrtc_utility__pffft_wrapper^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_utility__pffft_wrapper,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__pffft_wrapper^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_utility__pffft_wrapper^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__pffft_wrapper^android_vendor.31_x86_64_static

echo "building webrtc_utility__pffft_wrapper^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_utility__pffft_wrapper,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__pffft_wrapper^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_utility__pffft_wrapper^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__pffft_wrapper^android_vendor.31_x86_x86_64_static

echo "building webrtc_vad__vad^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_vad__vad,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_vad__vad^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_vad__vad^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_vad__vad^android_vendor.31_x86_64_static

echo "building webrtc_vad__vad^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja webrtc_vad__vad,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_vad__vad^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/webrtc/webrtc_vad__vad^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_vad__vad^android_vendor.31_x86_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_webrtc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/webrtc/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 external_webrtc.tar.zst --clobber

du -ah -d1 external_webrtc*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libaom.tar.zst" ]; then
  echo "Compressing external/libaom -> external_libaom.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libaom.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libaom/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libevent.tar.zst" ]; then
  echo "Compressing external/libevent -> external_libevent.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libevent.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libevent/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libopus.tar.zst" ]; then
  echo "Compressing external/libopus -> external_libopus.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libopus.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libopus/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libsrtp2.tar.zst" ]; then
  echo "Compressing external/libsrtp2 -> external_libsrtp2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libsrtp2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libsrtp2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libvpx.tar.zst" ]; then
  echo "Compressing external/libvpx -> external_libvpx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libvpx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libvpx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libyuv.tar.zst" ]; then
  echo "Compressing external/libyuv -> external_libyuv.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libyuv.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libyuv/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_pffft.tar.zst" ]; then
  echo "Compressing external/pffft -> external_pffft.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_pffft.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/pffft/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rnnoise.tar.zst" ]; then
  echo "Compressing external/rnnoise -> external_rnnoise.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rnnoise.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rnnoise/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_usrsctp.tar.zst" ]; then
  echo "Compressing external/usrsctp -> external_usrsctp.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_usrsctp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/usrsctp/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_webrtc.tar.zst" ]; then
  echo "Compressing external/webrtc -> external_webrtc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_webrtc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/webrtc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi

rm -rf aosp
