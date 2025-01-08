
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

echo "Preparing for external/webrtc"

clone_depth_platform art
clone_project platform/cts cts android12-gsi "/libs/json"
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
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media


echo "building webrtc_audio__aec3_config^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio__aec3_config,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__aec3_config^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio__aec3_config^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__aec3_config^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio__aec3_config^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__aec3_config^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__aec3_config^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__webrtc_opus_wrapper^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__webrtc_opus_wrapper,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_opus_wrapper^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__webrtc_opus_wrapper^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_opus_wrapper^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__webrtc_opus_wrapper^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_opus_wrapper^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_opus_wrapper^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_agc2__common^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_agc2__common,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__common^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__common^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__common^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__common^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__common^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__common^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_experiments__alr_experiment^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_experiments__alr_experiment,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__alr_experiment^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__alr_experiment^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__alr_experiment^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__alr_experiment^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__alr_experiment^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__alr_experiment^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_experiments__quality_scaler_settings^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_experiments__quality_scaler_settings,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__quality_scaler_settings^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__quality_scaler_settings^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__quality_scaler_settings^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__quality_scaler_settings^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__quality_scaler_settings^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__quality_scaler_settings^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_experiments__normalize_simulcast_size_experiment^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_experiments__normalize_simulcast_size_experiment,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__normalize_simulcast_size_experiment^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__normalize_simulcast_size_experiment^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__normalize_simulcast_size_experiment^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__normalize_simulcast_size_experiment^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__normalize_simulcast_size_experiment^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__normalize_simulcast_size_experiment^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_codecs__audio_codecs_api^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_codecs__audio_codecs_api,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_codecs__audio_codecs_api^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_codecs__audio_codecs_api^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_codecs__audio_codecs_api^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_codecs__audio_codecs_api^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_codecs__audio_codecs_api^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_codecs__audio_codecs_api^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_spl_sqrt_floor__spl_sqrt_floor^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_spl_sqrt_floor__spl_sqrt_floor,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_experiments__quality_rampup_experiment^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_experiments__quality_rampup_experiment,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__quality_rampup_experiment^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__quality_rampup_experiment^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__quality_rampup_experiment^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__quality_rampup_experiment^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__quality_rampup_experiment^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__quality_rampup_experiment^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_stats__rtc_stats^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_stats__rtc_stats,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_stats__rtc_stats^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_stats__rtc_stats^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_stats__rtc_stats^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_stats__rtc_stats^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_stats__rtc_stats^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_stats__rtc_stats^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_system_wrappers__metrics^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_system_wrappers__metrics,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__metrics^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_system_wrappers__metrics^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__metrics^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_system_wrappers__metrics^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__metrics^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__metrics^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_experiments__rtt_mult_experiment^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_experiments__rtt_mult_experiment,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__rtt_mult_experiment^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__rtt_mult_experiment^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__rtt_mult_experiment^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__rtt_mult_experiment^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__rtt_mult_experiment^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__rtt_mult_experiment^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rnn_vad__rnn_vad^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rnn_vad__rnn_vad,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rnn_vad__rnn_vad^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rnn_vad__rnn_vad^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rnn_vad__rnn_vad^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rnn_vad__rnn_vad^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rnn_vad__rnn_vad^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rnn_vad__rnn_vad^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__rtc_base^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__rtc_base,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_base^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__rtc_base^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_base^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__rtc_base^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_base^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_base^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_fft__fft^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_fft__fft,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_fft__fft^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_fft__fft^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_fft__fft^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_fft__fft^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_fft__fft^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_fft__fft^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_common_audio__common_audio_cc^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_common_audio__common_audio_cc,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_cc^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_common_audio__common_audio_cc^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_cc^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_common_audio__common_audio_cc^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_cc^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_cc^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_pacing__interval_budget^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_pacing__interval_budget,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pacing__interval_budget^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_pacing__interval_budget^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pacing__interval_budget^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_pacing__interval_budget^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pacing__interval_budget^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pacing__interval_budget^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_common_audio__common_audio_c^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_common_audio__common_audio_c,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_c^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_common_audio__common_audio_c^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_c^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_common_audio__common_audio_c^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_c^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio_c^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_ooura__fft_size_256^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_ooura__fft_size_256,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_256^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_ooura__fft_size_256^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_256^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_ooura__fft_size_256^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_256^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_256^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_aecm__aecm_core^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_aecm__aecm_core,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aecm__aecm_core^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_aecm__aecm_core^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aecm__aecm_core^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_aecm__aecm_core^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aecm__aecm_core^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aecm__aecm_core^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__audio_network_adaptor_config^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__audio_network_adaptor_config,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_network_adaptor_config^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__audio_network_adaptor_config^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_network_adaptor_config^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__audio_network_adaptor_config^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_network_adaptor_config^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_network_adaptor_config^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_agc2__gain_applier^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_agc2__gain_applier,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__gain_applier^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__gain_applier^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__gain_applier^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__gain_applier^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__gain_applier^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__gain_applier^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_task_utils__repeating_task^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_task_utils__repeating_task,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_utils__repeating_task^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_task_utils__repeating_task^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_utils__repeating_task^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_task_utils__repeating_task^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_utils__repeating_task^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_utils__repeating_task^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__audio_format_to_string^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__audio_format_to_string,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__audio_format_to_string^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__audio_format_to_string^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__audio_format_to_string^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__audio_format_to_string^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__audio_format_to_string^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__audio_format_to_string^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_memory__fifo_buffer^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_memory__fifo_buffer,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_memory__fifo_buffer^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_memory__fifo_buffer^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_memory__fifo_buffer^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_memory__fifo_buffer^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_memory__fifo_buffer^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_memory__fifo_buffer^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_api__rtp_headers^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_api__rtp_headers,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtp_headers^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__rtp_headers^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtp_headers^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__rtp_headers^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtp_headers^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtp_headers^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__rate_limiter^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__rate_limiter,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rate_limiter^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__rate_limiter^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rate_limiter^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__rate_limiter^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rate_limiter^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rate_limiter^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__pcm16b_c^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__pcm16b_c,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__pcm16b_c^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__pcm16b_c^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__pcm16b_c^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__pcm16b_c^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__pcm16b_c^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__pcm16b_c^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__audio_coding_opus_common^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__audio_coding_opus_common,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_coding_opus_common^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__audio_coding_opus_common^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_coding_opus_common^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__audio_coding_opus_common^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_coding_opus_common^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_coding_opus_common^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_logging__rtc_stream_config^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_logging__rtc_stream_config,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_stream_config^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_logging__rtc_stream_config^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_stream_config^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_logging__rtc_stream_config^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_stream_config^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_stream_config^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__legacy_encoded_audio_frame^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__legacy_encoded_audio_frame,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__legacy_encoded_audio_frame^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__legacy_encoded_audio_frame^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__legacy_encoded_audio_frame^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__legacy_encoded_audio_frame^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__legacy_encoded_audio_frame^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__legacy_encoded_audio_frame^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__webrtc_multiopus^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__webrtc_multiopus,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_multiopus^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__webrtc_multiopus^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_multiopus^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__webrtc_multiopus^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_multiopus^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_multiopus^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_sigslot__sigslot^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_sigslot__sigslot,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_sigslot__sigslot^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_sigslot__sigslot^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_sigslot__sigslot^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_sigslot__sigslot^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_sigslot__sigslot^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_sigslot__sigslot^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_api__rtp_packet_info^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_api__rtp_packet_info,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtp_packet_info^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__rtp_packet_info^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtp_packet_info^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__rtp_packet_info^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtp_packet_info^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtp_packet_info^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_crypto__options^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_crypto__options,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_crypto__options^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_crypto__options^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_crypto__options^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_crypto__options^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_crypto__options^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_crypto__options^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_media__rtc_h264_profile_id^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_media__rtc_h264_profile_id,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_h264_profile_id^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_h264_profile_id^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_h264_profile_id^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_h264_profile_id^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_h264_profile_id^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_h264_profile_id^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__webrtc_cng^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__webrtc_cng,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_cng^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__webrtc_cng^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_cng^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__webrtc_cng^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_cng^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_cng^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_logging__rtc_event_video^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_logging__rtc_event_video,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_video^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_logging__rtc_event_video^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_video^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_logging__rtc_event_video^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_video^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_video^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_common_audio__common_audio^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_common_audio__common_audio,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_common_audio__common_audio^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_common_audio__common_audio^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__common_audio^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_network__sent_packet^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_network__sent_packet,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_network__sent_packet^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_network__sent_packet^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_network__sent_packet^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_network__sent_packet^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_network__sent_packet^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_network__sent_packet^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_call__simulated_network^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_call__simulated_network,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__simulated_network^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__simulated_network^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__simulated_network^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__simulated_network^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__simulated_network^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__simulated_network^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_call__bitrate_allocator^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_call__bitrate_allocator,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__bitrate_allocator^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__bitrate_allocator^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__bitrate_allocator^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__bitrate_allocator^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__bitrate_allocator^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__bitrate_allocator^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_agc2__rnn_vad_with_level^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_agc2__rnn_vad_with_level,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__rnn_vad_with_level^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__rnn_vad_with_level^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__rnn_vad_with_level^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__rnn_vad_with_level^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__rnn_vad_with_level^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__rnn_vad_with_level^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__g722^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__g722,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g722^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__g722^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g722^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__g722^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g722^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g722^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_pc__media_protocol_names^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_pc__media_protocol_names,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pc__media_protocol_names^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_pc__media_protocol_names^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pc__media_protocol_names^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_pc__media_protocol_names^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pc__media_protocol_names^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pc__media_protocol_names^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_device__audio_device_buffer^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_device__audio_device_buffer,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_device__audio_device_buffer^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_device__audio_device_buffer^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_device__audio_device_buffer^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_device__audio_device_buffer^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_device__audio_device_buffer^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_device__audio_device_buffer^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio__audio_frame_api^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio__audio_frame_api,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__audio_frame_api^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio__audio_frame_api^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__audio_frame_api^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio__audio_frame_api^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__audio_frame_api^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__audio_frame_api^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_goog_cc__alr_detector^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_goog_cc__alr_detector,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__alr_detector^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__alr_detector^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__alr_detector^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__alr_detector^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__alr_detector^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__alr_detector^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_g722__g722_3p^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_g722__g722_3p,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g722__g722_3p^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_g722__g722_3p^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g722__g722_3p^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_g722__g722_3p^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g722__g722_3p^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g722__g722_3p^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video__video_frame^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video__video_frame,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_frame^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_frame^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_frame^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_frame^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_frame^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_frame^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_processing__apm_logging^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_processing__apm_logging,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__apm_logging^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__apm_logging^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__apm_logging^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__apm_logging^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__apm_logging^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__apm_logging^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__ilbc_c^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__ilbc_c,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__ilbc_c^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__ilbc_c^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__ilbc_c^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__ilbc_c^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__ilbc_c^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__ilbc_c^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_media__rtc_constants^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_media__rtc_constants,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_constants^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_constants^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_constants^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_constants^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_constants^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_constants^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_opus__audio_encoder_multiopus^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_opus__audio_encoder_multiopus,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_encoder_multiopus^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_opus__audio_encoder_multiopus^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_encoder_multiopus^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_opus__audio_encoder_multiopus^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_encoder_multiopus^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_encoder_multiopus^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_utility__utility^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_utility__utility,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__utility^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_utility__utility^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__utility^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_utility__utility^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__utility^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__utility^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_coding__nack_module^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_coding__nack_module,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__nack_module^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__nack_module^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__nack_module^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__nack_module^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__nack_module^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__nack_module^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_api__transport_api^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_api__transport_api,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__transport_api^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__transport_api^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__transport_api^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__transport_api^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__transport_api^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__transport_api^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_g722__audio_encoder_g722^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_g722__audio_encoder_g722,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g722__audio_encoder_g722^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_g722__audio_encoder_g722^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g722__audio_encoder_g722^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_g722__audio_encoder_g722^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g722__audio_encoder_g722^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g722__audio_encoder_g722^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__isac_c^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__isac_c,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac_c^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__isac_c^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac_c^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__isac_c^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac_c^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac_c^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__g711^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__g711,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g711^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__g711^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g711^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__g711^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g711^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g711^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_synchronization__yield^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_synchronization__yield,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_synchronization__yield^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_synchronization__yield^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_opus__audio_decoder_multiopus^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_opus__audio_decoder_multiopus,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_decoder_multiopus^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_opus__audio_decoder_multiopus^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_decoder_multiopus^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_opus__audio_decoder_multiopus^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_decoder_multiopus^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_decoder_multiopus^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_common_audio__fir_filter_factory^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_common_audio__fir_filter_factory,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__fir_filter_factory^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_common_audio__fir_filter_factory^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__fir_filter_factory^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_common_audio__fir_filter_factory^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__fir_filter_factory^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_audio__fir_filter_factory^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__ilbc^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__ilbc,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__ilbc^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__ilbc^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__ilbc^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__ilbc^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__ilbc^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__ilbc^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_g711__g711_3p^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_g711__g711_3p,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g711__g711_3p^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_g711__g711_3p^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g711__g711_3p^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_g711__g711_3p^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g711__g711_3p^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g711__g711_3p^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__audio_encoder_cng^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__audio_encoder_cng,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_encoder_cng^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__audio_encoder_cng^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_encoder_cng^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__audio_encoder_cng^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_encoder_cng^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_encoder_cng^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_agc2__fixed_digital^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_agc2__fixed_digital,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__fixed_digital^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__fixed_digital^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__fixed_digital^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__fixed_digital^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__fixed_digital^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__fixed_digital^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_logging__rtc_event_audio^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_logging__rtc_event_audio,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_audio^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_logging__rtc_event_audio^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_audio^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_logging__rtc_event_audio^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_audio^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_audio^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_experiments__min_video_bitrate_experiment^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_experiments__min_video_bitrate_experiment,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__min_video_bitrate_experiment^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__min_video_bitrate_experiment^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__min_video_bitrate_experiment^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__min_video_bitrate_experiment^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__min_video_bitrate_experiment^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__min_video_bitrate_experiment^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_processing__audio_processing_statistics^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_processing__audio_processing_statistics,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing_statistics^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__audio_processing_statistics^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing_statistics^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__audio_processing_statistics^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing_statistics^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing_statistics^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video__encoded_image^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video__encoded_image,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__encoded_image^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__encoded_image^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__encoded_image^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__encoded_image^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__encoded_image^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__encoded_image^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_agc__legacy_agc^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_agc__legacy_agc,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__legacy_agc^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc__legacy_agc^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__legacy_agc^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc__legacy_agc^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__legacy_agc^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__legacy_agc^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_g722__audio_decoder_g722^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_g722__audio_decoder_g722,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g722__audio_decoder_g722^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_g722__audio_decoder_g722^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g722__audio_decoder_g722^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_g722__audio_decoder_g722^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g722__audio_decoder_g722^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g722__audio_decoder_g722^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__pcm16b^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__pcm16b,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__pcm16b^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__pcm16b^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__pcm16b^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__pcm16b^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__pcm16b^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__pcm16b^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__red^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__red,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__red^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__red^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__red^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__red^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__red^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__red^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_transport__bitrate_settings^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_transport__bitrate_settings,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__bitrate_settings^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_transport__bitrate_settings^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__bitrate_settings^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_transport__bitrate_settings^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__bitrate_settings^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__bitrate_settings^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_utility__audio_frame_operations^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_utility__audio_frame_operations,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__audio_frame_operations^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_utility__audio_frame_operations^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__audio_frame_operations^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_utility__audio_frame_operations^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__audio_frame_operations^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__audio_frame_operations^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__isac^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__isac,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__isac^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__isac^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_deprecated__nack_module^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_deprecated__nack_module,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_deprecated__nack_module^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_deprecated__nack_module^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_deprecated__nack_module^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_deprecated__nack_module^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_deprecated__nack_module^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_deprecated__nack_module^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video__video_frame_i420^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video__video_frame_i420,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_frame_i420^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_frame_i420^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_frame_i420^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_frame_i420^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_frame_i420^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_frame_i420^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_base64__base64^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_base64__base64,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_base64__base64^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_base64__base64^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_base64__base64^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_base64__base64^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_base64__base64^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_base64__base64^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_isac__audio_encoder_isac_float^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_isac__audio_encoder_isac_float,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_isac__audio_encoder_isac_float^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_isac__audio_encoder_isac_float^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_isac__audio_encoder_isac_float^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_isac__audio_encoder_isac_float^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_isac__audio_encoder_isac_float^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_isac__audio_encoder_isac_float^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_processing__api^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_processing__api,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__api^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__api^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__api^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__api^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__api^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__api^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_transient__transient_suppressor_impl^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_transient__transient_suppressor_impl,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transient__transient_suppressor_impl^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_transient__transient_suppressor_impl^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transient__transient_suppressor_impl^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_transient__transient_suppressor_impl^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transient__transient_suppressor_impl^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transient__transient_suppressor_impl^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_ilbc__audio_encoder_ilbc^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_ilbc__audio_encoder_ilbc,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ilbc__audio_encoder_ilbc^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_ilbc__audio_encoder_ilbc^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ilbc__audio_encoder_ilbc^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_ilbc__audio_encoder_ilbc^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ilbc__audio_encoder_ilbc^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ilbc__audio_encoder_ilbc^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtp_rtcp__rtp_video_header^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtp_rtcp__rtp_video_header,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp_rtcp__rtp_video_header^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtp_rtcp__rtp_video_header^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp_rtcp__rtp_video_header^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtp_rtcp__rtp_video_header^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp_rtcp__rtp_video_header^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp_rtcp__rtp_video_header^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__g711_c^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__g711_c,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g711_c^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__g711_c^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g711_c^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__g711_c^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g711_c^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g711_c^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_agc2__noise_level_estimator^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_agc2__noise_level_estimator,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__noise_level_estimator^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__noise_level_estimator^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__noise_level_estimator^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__noise_level_estimator^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__noise_level_estimator^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__noise_level_estimator^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_processing__audio_buffer^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_processing__audio_buffer,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_buffer^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__audio_buffer^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_buffer^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__audio_buffer^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_buffer^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_buffer^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_isac__audio_decoder_isac_float^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_isac__audio_decoder_isac_float,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_isac__audio_decoder_isac_float^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_isac__audio_decoder_isac_float^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_isac__audio_decoder_isac_float^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_isac__audio_decoder_isac_float^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_isac__audio_decoder_isac_float^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_isac__audio_decoder_isac_float^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_vad__vad^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_vad__vad,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_vad__vad^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_vad__vad^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_vad__vad^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_vad__vad^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_vad__vad^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_vad__vad^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_ooura__fft_size_128^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_ooura__fft_size_128,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_128^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_ooura__fft_size_128^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_128^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_ooura__fft_size_128^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_128^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ooura__fft_size_128^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_device__audio_device_generic^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_device__audio_device_generic,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_device__audio_device_generic^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_device__audio_device_generic^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_device__audio_device_generic^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_device__audio_device_generic^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_device__audio_device_generic^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_device__audio_device_generic^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_processing__high_pass_filter^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_processing__high_pass_filter,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__high_pass_filter^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__high_pass_filter^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__high_pass_filter^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__high_pass_filter^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__high_pass_filter^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__high_pass_filter^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_ns__ns^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_ns__ns,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ns__ns^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_ns__ns^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ns__ns^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_ns__ns^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ns__ns^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ns__ns^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_common_video__common_video^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_common_video__common_video,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_video__common_video^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_common_video__common_video^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_video__common_video^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_common_video__common_video^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_video__common_video^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_common_video__common_video^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_g711__audio_encoder_g711^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_g711__audio_encoder_g711,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g711__audio_encoder_g711^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_g711__audio_encoder_g711^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g711__audio_encoder_g711^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_g711__audio_encoder_g711^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g711__audio_encoder_g711^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g711__audio_encoder_g711^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_agc2__adaptive_digital^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_agc2__adaptive_digital,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__adaptive_digital^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__adaptive_digital^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__adaptive_digital^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__adaptive_digital^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__adaptive_digital^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__adaptive_digital^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_L16__audio_encoder_L16^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_L16__audio_encoder_L16,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_L16__audio_encoder_L16^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_L16__audio_encoder_L16^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_L16__audio_encoder_L16^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_L16__audio_encoder_L16^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_L16__audio_encoder_L16^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_L16__audio_encoder_L16^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_processing__audio_frame_proxies^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_processing__audio_frame_proxies,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_frame_proxies^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__audio_frame_proxies^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_frame_proxies^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__audio_frame_proxies^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_frame_proxies^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_frame_proxies^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_ilbc__audio_decoder_ilbc^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_ilbc__audio_decoder_ilbc,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ilbc__audio_decoder_ilbc^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_ilbc__audio_decoder_ilbc^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ilbc__audio_decoder_ilbc^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_ilbc__audio_decoder_ilbc^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ilbc__audio_decoder_ilbc^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_ilbc__audio_decoder_ilbc^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_g711__audio_decoder_g711^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_g711__audio_decoder_g711,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g711__audio_decoder_g711^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_g711__audio_decoder_g711^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g711__audio_decoder_g711^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_g711__audio_decoder_g711^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g711__audio_decoder_g711^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_g711__audio_decoder_g711^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_processing__optionally_built_submodule_creators^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_processing__optionally_built_submodule_creators,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video__video_frame_i010^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video__video_frame_i010,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_frame_i010^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_frame_i010^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_frame_i010^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_frame_i010^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_frame_i010^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_frame_i010^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_L16__audio_decoder_L16^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_L16__audio_decoder_L16,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_L16__audio_decoder_L16^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_L16__audio_decoder_L16^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_L16__audio_decoder_L16^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_L16__audio_decoder_L16^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_L16__audio_decoder_L16^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_L16__audio_decoder_L16^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_codecs__video_codecs_api^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_codecs__video_codecs_api,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__video_codecs_api^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_codecs__video_codecs_api^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__video_codecs_api^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_codecs__video_codecs_api^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__video_codecs_api^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__video_codecs_api^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__audio_network_adaptor^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__audio_network_adaptor,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_network_adaptor^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__audio_network_adaptor^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_network_adaptor^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__audio_network_adaptor^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_network_adaptor^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_network_adaptor^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_agc__level_estimation^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_agc__level_estimation,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__level_estimation^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc__level_estimation^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__level_estimation^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc__level_estimation^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__level_estimation^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__level_estimation^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_api__media_stream_interface^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_api__media_stream_interface,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__media_stream_interface^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__media_stream_interface^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__media_stream_interface^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__media_stream_interface^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__media_stream_interface^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__media_stream_interface^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_mixer__audio_frame_manipulator^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_mixer__audio_frame_manipulator,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_mixer__audio_frame_manipulator^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_mixer__audio_frame_manipulator^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_mixer__audio_frame_manipulator^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_mixer__audio_frame_manipulator^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_mixer__audio_frame_manipulator^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_mixer__audio_frame_manipulator^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_experiments__quality_scaling_experiment^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_experiments__quality_scaling_experiment,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__quality_scaling_experiment^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__quality_scaling_experiment^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__quality_scaling_experiment^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__quality_scaling_experiment^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__quality_scaling_experiment^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__quality_scaling_experiment^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__checks^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__checks,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__checks^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__checks^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__checks^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__checks^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__checks^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__checks^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__webrtc_opus^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__webrtc_opus,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_opus^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__webrtc_opus^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_opus^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__webrtc_opus^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_opus^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__webrtc_opus^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_processing__voice_detection^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_processing__voice_detection,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__voice_detection^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__voice_detection^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__voice_detection^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__voice_detection^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__voice_detection^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__voice_detection^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_media__rtc_vp9_profile^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_media__rtc_vp9_profile,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_vp9_profile^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_vp9_profile^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_vp9_profile^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_vp9_profile^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_vp9_profile^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_vp9_profile^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_aec3__aec3^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_aec3__aec3,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec3__aec3^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_aec3__aec3^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec3__aec3^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_aec3__aec3^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec3__aec3^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec3__aec3^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__isac_vad^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__isac_vad,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac_vad^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__isac_vad^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac_vad^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__isac_vad^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac_vad^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__isac_vad^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_opus__audio_decoder_opus^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_opus__audio_decoder_opus,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_decoder_opus^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_opus__audio_decoder_opus^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_decoder_opus^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_opus__audio_decoder_opus^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_decoder_opus^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_decoder_opus^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_experiments__rate_control_settings^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_experiments__rate_control_settings,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__rate_control_settings^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__rate_control_settings^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__rate_control_settings^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__rate_control_settings^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__rate_control_settings^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__rate_control_settings^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_coding__video_codec_interface^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_coding__video_codec_interface,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__video_codec_interface^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__video_codec_interface^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__video_codec_interface^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__video_codec_interface^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__video_codec_interface^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__video_codec_interface^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_av1__libaom_av1_encoder^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_av1__libaom_av1_encoder,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_av1__libaom_av1_encoder^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_av1__libaom_av1_encoder^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_av1__libaom_av1_encoder^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_av1__libaom_av1_encoder^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_av1__libaom_av1_encoder^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_av1__libaom_av1_encoder^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_memory__aligned_malloc^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_memory__aligned_malloc,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_memory__aligned_malloc^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_memory__aligned_malloc^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_memory__aligned_malloc^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_memory__aligned_malloc^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_memory__aligned_malloc^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_memory__aligned_malloc^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_device__audio_device_impl^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_device__audio_device_impl,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_device__audio_device_impl^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_device__audio_device_impl^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_device__audio_device_impl^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_device__audio_device_impl^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_device__audio_device_impl^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_device__audio_device_impl^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_av1__libaom_av1_decoder^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_av1__libaom_av1_decoder,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_av1__libaom_av1_decoder^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_av1__libaom_av1_decoder^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_av1__libaom_av1_decoder^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_av1__libaom_av1_decoder^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_av1__libaom_av1_decoder^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_av1__libaom_av1_decoder^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__neteq^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__neteq,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__neteq^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__neteq^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__neteq^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__neteq^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__neteq^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__neteq^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_goog_cc__pushback_controller^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_goog_cc__pushback_controller,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__pushback_controller^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__pushback_controller^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__pushback_controller^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__pushback_controller^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__pushback_controller^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__pushback_controller^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__g722_c^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__g722_c,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g722_c^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__g722_c^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g722_c^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__g722_c^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g722_c^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__g722_c^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_processing__video_processing^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_processing__video_processing,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_processing__video_processing^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_processing__video_processing^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_processing__video_processing^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_processing__video_processing^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_processing__video_processing^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_processing__video_processing^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtp_rtcp__rtp_rtcp_format^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtp_rtcp__rtp_rtcp_format,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp_rtcp__rtp_rtcp_format^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtp_rtcp__rtp_rtcp_format^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp_rtcp__rtp_rtcp_format^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtp_rtcp__rtp_rtcp_format^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp_rtcp__rtp_rtcp_format^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp_rtcp__rtp_rtcp_format^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_system_wrappers__cpu_features_linux^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_system_wrappers__cpu_features_linux,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__cpu_features_linux^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_system_wrappers__cpu_features_linux^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__cpu_features_linux^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_system_wrappers__cpu_features_linux^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__cpu_features_linux^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__cpu_features_linux^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_experiments__balanced_degradation_settings^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_experiments__balanced_degradation_settings,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__balanced_degradation_settings^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__balanced_degradation_settings^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__balanced_degradation_settings^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__balanced_degradation_settings^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__balanced_degradation_settings^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__balanced_degradation_settings^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_coding__encoded_frame^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_coding__encoded_frame,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__encoded_frame^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__encoded_frame^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__encoded_frame^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__encoded_frame^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__encoded_frame^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__encoded_frame^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_experiments__stable_target_rate_experiment^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_experiments__stable_target_rate_experiment,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__stable_target_rate_experiment^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__stable_target_rate_experiment^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__stable_target_rate_experiment^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__stable_target_rate_experiment^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__stable_target_rate_experiment^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__stable_target_rate_experiment^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_generic_frame_descriptor__generic_frame_descriptor^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_generic_frame_descriptor__generic_frame_descriptor,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_generic_frame_descriptor__generic_frame_descriptor^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_generic_frame_descriptor__generic_frame_descriptor^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_generic_frame_descriptor__generic_frame_descriptor^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_generic_frame_descriptor__generic_frame_descriptor^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_generic_frame_descriptor__generic_frame_descriptor^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_generic_frame_descriptor__generic_frame_descriptor^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_mixer__audio_mixer_impl^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_mixer__audio_mixer_impl,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_mixer__audio_mixer_impl^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_mixer__audio_mixer_impl^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_mixer__audio_mixer_impl^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_mixer__audio_mixer_impl^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_mixer__audio_mixer_impl^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_mixer__audio_mixer_impl^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_agc2__level_estimation_agc^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_agc2__level_estimation_agc,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__level_estimation_agc^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__level_estimation_agc^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__level_estimation_agc^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__level_estimation_agc^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__level_estimation_agc^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__level_estimation_agc^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_remote_bitrate_estimator__remote_bitrate_estimator^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_remote_bitrate_estimator__remote_bitrate_estimator,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_remote_bitrate_estimator__remote_bitrate_estimator^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_remote_bitrate_estimator__remote_bitrate_estimator^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_remote_bitrate_estimator__remote_bitrate_estimator^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_remote_bitrate_estimator__remote_bitrate_estimator^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_remote_bitrate_estimator__remote_bitrate_estimator^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_remote_bitrate_estimator__remote_bitrate_estimator^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_agc__agc^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_agc__agc,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__agc^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc__agc^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__agc^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc__agc^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__agc^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc__agc^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__platform_thread_types^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__platform_thread_types,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread_types^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__platform_thread_types^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread_types^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__platform_thread_types^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread_types^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread_types^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_opus__audio_encoder_opus^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_opus__audio_encoder_opus,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_encoder_opus^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_opus__audio_encoder_opus^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_encoder_opus^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_opus__audio_encoder_opus^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_encoder_opus^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_encoder_opus^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtp__transport_feedback^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtp__transport_feedback,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp__transport_feedback^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtp__transport_feedback^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp__transport_feedback^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtp__transport_feedback^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp__transport_feedback^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp__transport_feedback^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_codecs__builtin_audio_decoder_factory^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_codecs__builtin_audio_decoder_factory,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_codecs__builtin_audio_decoder_factory^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_codecs__builtin_audio_decoder_factory^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_codecs__builtin_audio_decoder_factory^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_codecs__builtin_audio_decoder_factory^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_codecs__builtin_audio_decoder_factory^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_codecs__builtin_audio_decoder_factory^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_coding__audio_coding^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_coding__audio_coding,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_coding^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__audio_coding^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_coding^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_coding__audio_coding^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_coding^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_coding__audio_coding^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_modules__module_api^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_modules__module_api,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_modules__module_api^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_modules__module_api^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_modules__module_api^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_modules__module_api^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_modules__module_api^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_modules__module_api^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio__aec3_factory^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio__aec3_factory,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__aec3_factory^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio__aec3_factory^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__aec3_factory^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio__aec3_factory^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__aec3_factory^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__aec3_factory^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_logging__rtc_event_rtp_rtcp^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_logging__rtc_event_rtp_rtcp,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_rtp_rtcp^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_logging__rtc_event_rtp_rtcp^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_rtp_rtcp^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_logging__rtc_event_rtp_rtcp^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_rtp_rtcp^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_rtp_rtcp^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_coding__webrtc_vp9_helpers^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_coding__webrtc_vp9_helpers,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp9_helpers^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__webrtc_vp9_helpers^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp9_helpers^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__webrtc_vp9_helpers^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp9_helpers^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp9_helpers^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_task_queue__task_queue^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_task_queue__task_queue,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_queue__task_queue^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_task_queue__task_queue^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_queue__task_queue^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_task_queue__task_queue^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_queue__task_queue^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_queue__task_queue^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_aec_dump__null_aec_dump_factory^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_aec_dump__null_aec_dump_factory,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec_dump__null_aec_dump_factory^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_aec_dump__null_aec_dump_factory^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec_dump__null_aec_dump_factory^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_aec_dump__null_aec_dump_factory^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec_dump__null_aec_dump_factory^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_aec_dump__null_aec_dump_factory^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video__encoded_frame^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video__encoded_frame,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__encoded_frame^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__encoded_frame^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__encoded_frame^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__encoded_frame^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__encoded_frame^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__encoded_frame^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_logging__rtc_event_bwe^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_logging__rtc_event_bwe,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_bwe^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_logging__rtc_event_bwe^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_bwe^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_logging__rtc_event_bwe^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_bwe^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_bwe^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_codecs__builtin_audio_encoder_factory^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_codecs__builtin_audio_encoder_factory,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_codecs__builtin_audio_encoder_factory^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_codecs__builtin_audio_encoder_factory^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_codecs__builtin_audio_encoder_factory^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_codecs__builtin_audio_encoder_factory^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_codecs__builtin_audio_encoder_factory^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_codecs__builtin_audio_encoder_factory^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_processing__audio_processing^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_processing__audio_processing,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__audio_processing^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__audio_processing^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__audio_processing^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_utility__pffft_wrapper^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_utility__pffft_wrapper,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__pffft_wrapper^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_utility__pffft_wrapper^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__pffft_wrapper^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_utility__pffft_wrapper^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__pffft_wrapper^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__pffft_wrapper^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_goog_cc__probe_controller^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_goog_cc__probe_controller,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__probe_controller^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__probe_controller^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__probe_controller^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__probe_controller^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__probe_controller^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__probe_controller^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_goog_cc__loss_based_controller^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_goog_cc__loss_based_controller,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__loss_based_controller^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__loss_based_controller^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__loss_based_controller^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__loss_based_controller^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__loss_based_controller^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__loss_based_controller^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_goog_cc__estimators^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_goog_cc__estimators,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__estimators^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__estimators^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__estimators^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__estimators^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__estimators^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__estimators^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_call__rtp_interfaces^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_call__rtp_interfaces,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__rtp_interfaces^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__rtp_interfaces^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__rtp_interfaces^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__rtp_interfaces^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__rtp_interfaces^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__rtp_interfaces^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_utility__cascaded_biquad_filter^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_utility__cascaded_biquad_filter,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__cascaded_biquad_filter^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_utility__cascaded_biquad_filter^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__cascaded_biquad_filter^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_utility__cascaded_biquad_filter^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__cascaded_biquad_filter^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__cascaded_biquad_filter^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_call__video_stream_api^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_call__video_stream_api,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__video_stream_api^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__video_stream_api^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__video_stream_api^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__video_stream_api^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__video_stream_api^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__video_stream_api^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_call__call_interfaces^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_call__call_interfaces,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__call_interfaces^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__call_interfaces^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__call_interfaces^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__call_interfaces^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__call_interfaces^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__call_interfaces^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_media__rtc_media_base^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_media__rtc_media_base,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_media_base^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_media_base^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_media_base^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_media_base^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_media_base^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_media_base^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_synchronization__yield_policy^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_synchronization__yield_policy,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield_policy^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_synchronization__yield_policy^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield_policy^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_synchronization__yield_policy^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield_policy^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__yield_policy^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_capture__video_capture_module^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_capture__video_capture_module,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_capture__video_capture_module^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_capture__video_capture_module^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_capture__video_capture_module^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_capture__video_capture_module^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_capture__video_capture_module^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_capture__video_capture_module^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_call__fake_network^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_call__fake_network,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__fake_network^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__fake_network^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__fake_network^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__fake_network^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__fake_network^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__fake_network^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__stringutils^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__stringutils,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__stringutils^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__stringutils^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__stringutils^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__stringutils^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__stringutils^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__stringutils^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_api__libjingle_peerconnection_api^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_api__libjingle_peerconnection_api,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__libjingle_peerconnection_api^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__libjingle_peerconnection_api^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__libjingle_peerconnection_api^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__libjingle_peerconnection_api^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__libjingle_peerconnection_api^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__libjingle_peerconnection_api^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_logging__ice_log^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_logging__ice_log,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__ice_log^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_logging__ice_log^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__ice_log^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_logging__ice_log^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__ice_log^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__ice_log^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_call__bitrate_configurator^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_call__bitrate_configurator,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__bitrate_configurator^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__bitrate_configurator^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__bitrate_configurator^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__bitrate_configurator^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__bitrate_configurator^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__bitrate_configurator^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtp_rtcp__rtp_rtcp^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtp_rtcp__rtp_rtcp,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp_rtcp__rtp_rtcp^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtp_rtcp__rtp_rtcp^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp_rtcp__rtp_rtcp^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtp_rtcp__rtp_rtcp^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp_rtcp__rtp_rtcp^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp_rtcp__rtp_rtcp^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__criticalsection^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__criticalsection,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__criticalsection^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__criticalsection^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__criticalsection^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__criticalsection^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__criticalsection^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__criticalsection^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_call__rtp_receiver^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_call__rtp_receiver,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__rtp_receiver^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__rtp_receiver^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__rtp_receiver^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__rtp_receiver^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__rtp_receiver^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__rtp_receiver^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_p2p__rtc_p2p^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_p2p__rtc_p2p,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_p2p__rtc_p2p^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_p2p__rtc_p2p^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_p2p__rtc_p2p^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_p2p__rtc_p2p^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_p2p__rtc_p2p^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_p2p__rtc_p2p^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_system__file_wrapper^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_system__file_wrapper,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system__file_wrapper^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_system__file_wrapper^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system__file_wrapper^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_system__file_wrapper^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system__file_wrapper^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system__file_wrapper^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_pacing__pacing^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_pacing__pacing,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pacing__pacing^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_pacing__pacing^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pacing__pacing^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_pacing__pacing^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pacing__pacing^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pacing__pacing^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_media__rtc_data^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_media__rtc_data,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_data^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_data^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_data^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_data^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_data^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_data^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_goog_cc__delay_based_bwe^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_goog_cc__delay_based_bwe,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__delay_based_bwe^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__delay_based_bwe^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__delay_based_bwe^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__delay_based_bwe^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__delay_based_bwe^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__delay_based_bwe^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_coding__video_coding_utility^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_coding__video_coding_utility,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__video_coding_utility^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__video_coding_utility^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__video_coding_utility^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__video_coding_utility^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__video_coding_utility^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__video_coding_utility^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_synchronization__mutex^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_synchronization__mutex,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__mutex^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_synchronization__mutex^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__mutex^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_synchronization__mutex^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__mutex^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__mutex^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio__audio^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio__audio,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__audio^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio__audio^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__audio^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio__audio^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__audio^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio__audio^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_api__ice_transport_factory^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_api__ice_transport_factory,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__ice_transport_factory^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__ice_transport_factory^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__ice_transport_factory^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__ice_transport_factory^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__ice_transport_factory^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__ice_transport_factory^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_adaptation__resource_adaptation^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_adaptation__resource_adaptation,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_adaptation__resource_adaptation^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_adaptation__resource_adaptation^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_adaptation__resource_adaptation^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_adaptation__resource_adaptation^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_adaptation__resource_adaptation^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_adaptation__resource_adaptation^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_synchronization__rw_lock_wrapper^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_synchronization__rw_lock_wrapper,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__rw_lock_wrapper^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_synchronization__rw_lock_wrapper^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__rw_lock_wrapper^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_synchronization__rw_lock_wrapper^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__rw_lock_wrapper^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__rw_lock_wrapper^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtp__control_handler^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtp__control_handler,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp__control_handler^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtp__control_handler^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp__control_handler^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtp__control_handler^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp__control_handler^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtp__control_handler^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_coding__webrtc_vp8_temporal_layers^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_coding__webrtc_vp8_temporal_layers,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp8_temporal_layers^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__webrtc_vp8_temporal_layers^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp8_temporal_layers^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__webrtc_vp8_temporal_layers^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp8_temporal_layers^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp8_temporal_layers^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_congestion_controller__congestion_controller^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_congestion_controller__congestion_controller,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_congestion_controller__congestion_controller^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_congestion_controller__congestion_controller^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_congestion_controller__congestion_controller^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_congestion_controller__congestion_controller^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_congestion_controller__congestion_controller^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_congestion_controller__congestion_controller^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_coding__webrtc_multiplex^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_coding__webrtc_multiplex,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_multiplex^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__webrtc_multiplex^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_multiplex^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__webrtc_multiplex^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_multiplex^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_multiplex^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video__builtin_video_bitrate_allocator_factory^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video__builtin_video_bitrate_allocator_factory,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__builtin_video_bitrate_allocator_factory^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__builtin_video_bitrate_allocator_factory^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__builtin_video_bitrate_allocator_factory^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__builtin_video_bitrate_allocator_factory^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__builtin_video_bitrate_allocator_factory^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__builtin_video_bitrate_allocator_factory^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_time__timestamp_extrapolator^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_time__timestamp_extrapolator,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_time__timestamp_extrapolator^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_time__timestamp_extrapolator^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_time__timestamp_extrapolator^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_time__timestamp_extrapolator^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_time__timestamp_extrapolator^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_time__timestamp_extrapolator^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_codecs__rtc_software_fallback_wrappers^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_codecs__rtc_software_fallback_wrappers,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__rtc_software_fallback_wrappers^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_codecs__rtc_software_fallback_wrappers^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__rtc_software_fallback_wrappers^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_codecs__rtc_software_fallback_wrappers^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__rtc_software_fallback_wrappers^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__rtc_software_fallback_wrappers^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_goog_cc__goog_cc^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_goog_cc__goog_cc,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__goog_cc^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__goog_cc^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__goog_cc^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__goog_cc^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__goog_cc^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__goog_cc^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_coding__webrtc_vp9^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_coding__webrtc_vp9,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp9^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__webrtc_vp9^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp9^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__webrtc_vp9^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp9^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp9^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_utility__legacy_delay_estimator^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_utility__legacy_delay_estimator,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__legacy_delay_estimator^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_utility__legacy_delay_estimator^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__legacy_delay_estimator^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_utility__legacy_delay_estimator^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__legacy_delay_estimator^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_utility__legacy_delay_estimator^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_coding__webrtc_h264^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_coding__webrtc_h264,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_h264^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__webrtc_h264^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_h264^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__webrtc_h264^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_h264^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_h264^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_media__rtc_simulcast_encoder_adapter^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_media__rtc_simulcast_encoder_adapter,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_simulcast_encoder_adapter^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_simulcast_encoder_adapter^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_simulcast_encoder_adapter^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_simulcast_encoder_adapter^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_simulcast_encoder_adapter^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_simulcast_encoder_adapter^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_adaptation__video_adaptation^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_adaptation__video_adaptation,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_adaptation__video_adaptation^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_adaptation__video_adaptation^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_adaptation__video_adaptation^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_adaptation__video_adaptation^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_adaptation__video_adaptation^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_adaptation__video_adaptation^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_transport__goog_cc^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_transport__goog_cc,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__goog_cc^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_transport__goog_cc^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__goog_cc^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_transport__goog_cc^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__goog_cc^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__goog_cc^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_synchronization__sequence_checker^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_synchronization__sequence_checker,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__sequence_checker^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_synchronization__sequence_checker^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__sequence_checker^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_synchronization__sequence_checker^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__sequence_checker^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_synchronization__sequence_checker^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_codecs__vp8_temporal_layers_factory^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_codecs__vp8_temporal_layers_factory,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__vp8_temporal_layers_factory^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_codecs__vp8_temporal_layers_factory^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__vp8_temporal_layers_factory^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_codecs__vp8_temporal_layers_factory^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__vp8_temporal_layers_factory^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__vp8_temporal_layers_factory^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_test__fake_video_codecs^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_test__fake_video_codecs,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_test__fake_video_codecs^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_test__fake_video_codecs^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_test__fake_video_codecs^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_test__fake_video_codecs^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_test__fake_video_codecs^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_test__fake_video_codecs^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_media__rtc_encoder_simulcast_proxy^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_media__rtc_encoder_simulcast_proxy,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_encoder_simulcast_proxy^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_encoder_simulcast_proxy^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_encoder_simulcast_proxy^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_encoder_simulcast_proxy^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_encoder_simulcast_proxy^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_encoder_simulcast_proxy^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_pc__rtc_pc_base^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_pc__rtc_pc_base,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pc__rtc_pc_base^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_pc__rtc_pc_base^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pc__rtc_pc_base^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_pc__rtc_pc_base^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pc__rtc_pc_base^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pc__rtc_pc_base^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_call__rtp_sender^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_call__rtp_sender,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__rtp_sender^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__rtp_sender^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__rtp_sender^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__rtp_sender^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__rtp_sender^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__rtp_sender^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video__video_bitrate_allocation^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video__video_bitrate_allocation,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_bitrate_allocation^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_bitrate_allocation^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_bitrate_allocation^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_bitrate_allocation^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_bitrate_allocation^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_bitrate_allocation^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_coding__video_coding^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_coding__video_coding,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__video_coding^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__video_coding^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__video_coding^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__video_coding^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__video_coding^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__video_coding^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_coding__webrtc_vp8^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_coding__webrtc_vp8,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp8^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__webrtc_vp8^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp8^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__webrtc_vp8^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp8^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__webrtc_vp8^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_api__rtp_parameters^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_api__rtp_parameters,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtp_parameters^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__rtp_parameters^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtp_parameters^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__rtp_parameters^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtp_parameters^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtp_parameters^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_media__rtc_internal_video_codecs^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_media__rtc_internal_video_codecs,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_internal_video_codecs^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_internal_video_codecs^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_internal_video_codecs^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_internal_video_codecs^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_internal_video_codecs^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_internal_video_codecs^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_codecs__builtin_video_encoder_factory^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_codecs__builtin_video_encoder_factory,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__builtin_video_encoder_factory^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_codecs__builtin_video_encoder_factory^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__builtin_video_encoder_factory^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_codecs__builtin_video_encoder_factory^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__builtin_video_encoder_factory^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__builtin_video_encoder_factory^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video__frame_dumping_decoder^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video__frame_dumping_decoder,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__frame_dumping_decoder^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__frame_dumping_decoder^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__frame_dumping_decoder^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__frame_dumping_decoder^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__frame_dumping_decoder^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__frame_dumping_decoder^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_pc__peerconnection^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_pc__peerconnection,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pc__peerconnection^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_pc__peerconnection^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pc__peerconnection^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_pc__peerconnection^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pc__peerconnection^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_pc__peerconnection^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video__video_adaptation^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video__video_adaptation,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_adaptation^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_adaptation^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_adaptation^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_adaptation^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_adaptation^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_adaptation^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video__video_stream_encoder_impl^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video__video_stream_encoder_impl,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_stream_encoder_impl^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_stream_encoder_impl^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_stream_encoder_impl^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_stream_encoder_impl^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_stream_encoder_impl^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_stream_encoder_impl^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video__video_stream_encoder_create^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video__video_stream_encoder_create,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_stream_encoder_create^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_stream_encoder_create^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_stream_encoder_create^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_stream_encoder_create^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_stream_encoder_create^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_stream_encoder_create^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_codecs__builtin_video_decoder_factory^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_codecs__builtin_video_decoder_factory,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__builtin_video_decoder_factory^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_codecs__builtin_video_decoder_factory^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__builtin_video_decoder_factory^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_codecs__builtin_video_decoder_factory^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__builtin_video_decoder_factory^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_codecs__builtin_video_decoder_factory^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_audio_processing__config^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_audio_processing__config,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__config^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__config^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__config^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_audio_processing__config^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__config^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_audio_processing__config^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video__video^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video__video,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_api__audio_options_api^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_api__audio_options_api,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__audio_options_api^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__audio_options_api^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__audio_options_api^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__audio_options_api^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__audio_options_api^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__audio_options_api^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_call__call^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_call__call,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__call^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__call^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__call^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_call__call^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__call^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_call__call^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_units__data_size^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_units__data_size,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_size^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_units__data_size^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_size^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_units__data_size^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_size^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_size^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_media__rtc_audio_video^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_media__rtc_audio_video,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_audio_video^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_audio_video^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_audio_video^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_media__rtc_audio_video^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_audio_video^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_media__rtc_audio_video^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_api__create_peerconnection_factory^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_api__create_peerconnection_factory,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__create_peerconnection_factory^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__create_peerconnection_factory^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__create_peerconnection_factory^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__create_peerconnection_factory^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__create_peerconnection_factory^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__create_peerconnection_factory^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__timeutils^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__timeutils,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__timeutils^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__timeutils^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__timeutils^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__timeutils^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__timeutils^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__timeutils^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_units__time_delta^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_units__time_delta,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__time_delta^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_units__time_delta^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__time_delta^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_units__time_delta^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__time_delta^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__time_delta^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__rtc_event^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__rtc_event,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_event^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__rtc_event^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_event^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__rtc_event^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_event^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_event^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_units__timestamp^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_units__timestamp,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__timestamp^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_units__timestamp^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__timestamp^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_units__timestamp^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__timestamp^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__timestamp^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_units__frequency^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_units__frequency,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__frequency^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_units__frequency^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__frequency^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_units__frequency^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__frequency^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__frequency^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__weak_ptr^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__weak_ptr,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__weak_ptr^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__weak_ptr^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__weak_ptr^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__weak_ptr^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__weak_ptr^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__weak_ptr^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__platform_thread^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__platform_thread,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__platform_thread^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__platform_thread^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__platform_thread^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_task_utils__pending_task_safety_flag^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_task_utils__pending_task_safety_flag,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_utils__pending_task_safety_flag^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_task_utils__pending_task_safety_flag^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_utils__pending_task_safety_flag^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_task_utils__pending_task_safety_flag^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_utils__pending_task_safety_flag^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_utils__pending_task_safety_flag^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_event_log__rtc_event_log^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_event_log__rtc_event_log,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_event_log__rtc_event_log^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_event_log__rtc_event_log^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_event_log__rtc_event_log^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_event_log__rtc_event_log^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_event_log__rtc_event_log^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_event_log__rtc_event_log^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__logging^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__logging,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__logging^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__logging^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__logging^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__logging^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__logging^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__logging^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_units__data_rate^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_units__data_rate,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_rate^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_units__data_rate^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_rate^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_units__data_rate^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_rate^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_units__data_rate^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_system_wrappers__field_trial^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_system_wrappers__field_trial,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__field_trial^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_system_wrappers__field_trial^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__field_trial^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_system_wrappers__field_trial^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__field_trial^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__field_trial^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_coding__chain_diff_calculator^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_coding__chain_diff_calculator,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__chain_diff_calculator^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__chain_diff_calculator^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__chain_diff_calculator^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__chain_diff_calculator^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__chain_diff_calculator^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__chain_diff_calculator^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_transport__network_control^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_transport__network_control,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__network_control^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_transport__network_control^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__network_control^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_transport__network_control^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__network_control^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__network_control^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_experiments__field_trial_parser^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_experiments__field_trial_parser,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__field_trial_parser^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__field_trial_parser^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__field_trial_parser^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__field_trial_parser^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__field_trial_parser^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__field_trial_parser^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_logging__rtc_event_pacing^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_logging__rtc_event_pacing,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_pacing^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_logging__rtc_event_pacing^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_pacing^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_logging__rtc_event_pacing^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_pacing^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_logging__rtc_event_pacing^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_transport__field_trial_based_config^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_transport__field_trial_based_config,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__field_trial_based_config^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_transport__field_trial_based_config^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__field_trial_based_config^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_transport__field_trial_based_config^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__field_trial_based_config^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_transport__field_trial_based_config^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video_coding__frame_dependencies_calculator^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video_coding__frame_dependencies_calculator,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__frame_dependencies_calculator^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__frame_dependencies_calculator^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__frame_dependencies_calculator^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video_coding__frame_dependencies_calculator^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__frame_dependencies_calculator^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video_coding__frame_dependencies_calculator^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__rtc_task_queue_libevent^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__rtc_task_queue_libevent,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_task_queue_libevent^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__rtc_task_queue_libevent^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_task_queue_libevent^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__rtc_task_queue_libevent^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_task_queue_libevent^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_task_queue_libevent^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_api__rtc_error^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_api__rtc_error,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtc_error^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__rtc_error^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtc_error^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__rtc_error^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtc_error^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtc_error^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_event_log__rtc_event_log_factory^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_event_log__rtc_event_log_factory,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_event_log__rtc_event_log_factory^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_event_log__rtc_event_log_factory^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_event_log__rtc_event_log_factory^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_event_log__rtc_event_log_factory^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_event_log__rtc_event_log_factory^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_event_log__rtc_event_log_factory^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_goog_cc__link_capacity_estimator^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_goog_cc__link_capacity_estimator,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__link_capacity_estimator^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__link_capacity_estimator^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__link_capacity_estimator^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_goog_cc__link_capacity_estimator^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__link_capacity_estimator^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_goog_cc__link_capacity_estimator^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video__video_bitrate_allocator^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video__video_bitrate_allocator,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_bitrate_allocator^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_bitrate_allocator^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_bitrate_allocator^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_bitrate_allocator^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_bitrate_allocator^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_bitrate_allocator^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_experiments__keyframe_interval_settings_experiment^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_experiments__keyframe_interval_settings_experiment,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__keyframe_interval_settings_experiment^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__keyframe_interval_settings_experiment^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__keyframe_interval_settings_experiment^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__keyframe_interval_settings_experiment^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__keyframe_interval_settings_experiment^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__keyframe_interval_settings_experiment^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__rtc_task_queue^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__rtc_task_queue,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_task_queue^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__rtc_task_queue^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_task_queue^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__rtc_task_queue^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_task_queue^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_task_queue^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_task_queue__default_task_queue_factory^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_task_queue__default_task_queue_factory,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_queue__default_task_queue_factory^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_task_queue__default_task_queue_factory^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_queue__default_task_queue_factory^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_task_queue__default_task_queue_factory^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_queue__default_task_queue_factory^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_task_queue__default_task_queue_factory^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__rtc_base_approved^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__rtc_base_approved,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_base_approved^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__rtc_base_approved^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_base_approved^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__rtc_base_approved^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_base_approved^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_base_approved^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_api__rtc_event_log_output_file^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_api__rtc_event_log_output_file,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtc_event_log_output_file^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__rtc_event_log_output_file^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtc_event_log_output_file^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_api__rtc_event_log_output_file^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtc_event_log_output_file^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_api__rtc_event_log_output_file^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_experiments__jitter_upper_bound_experiment^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_experiments__jitter_upper_bound_experiment,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__jitter_upper_bound_experiment^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__jitter_upper_bound_experiment^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__jitter_upper_bound_experiment^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__jitter_upper_bound_experiment^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__jitter_upper_bound_experiment^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__jitter_upper_bound_experiment^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_agc2__biquad_filter^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_agc2__biquad_filter,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__biquad_filter^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__biquad_filter^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__biquad_filter^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_agc2__biquad_filter^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__biquad_filter^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_agc2__biquad_filter^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_rtc_base__rtc_numerics^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rtc_base__rtc_numerics,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_numerics^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__rtc_numerics^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_numerics^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_rtc_base__rtc_numerics^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_numerics^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_rtc_base__rtc_numerics^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_experiments__cpu_speed_experiment^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_experiments__cpu_speed_experiment,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__cpu_speed_experiment^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__cpu_speed_experiment^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__cpu_speed_experiment^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_experiments__cpu_speed_experiment^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__cpu_speed_experiment^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_experiments__cpu_speed_experiment^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_system_wrappers__system_wrappers^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_system_wrappers__system_wrappers,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__system_wrappers^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_system_wrappers__system_wrappers^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__system_wrappers^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_system_wrappers__system_wrappers^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__system_wrappers^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_system_wrappers__system_wrappers^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_video__video_rtp_headers^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_video__video_rtp_headers,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_rtp_headers^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_rtp_headers^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_rtp_headers^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_video__video_rtp_headers^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_rtp_headers^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_video__video_rtp_headers^linux_glibc_x86_64_static/addition_copy_files.output

echo "building webrtc_opus__audio_encoder_opus_config^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_opus__audio_encoder_opus_config,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_encoder_opus_config^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_opus__audio_encoder_opus_config^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_encoder_opus_config^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/webrtc_opus__audio_encoder_opus_config^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_encoder_opus_config^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/webrtc_opus__audio_encoder_opus_config^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libwebrtc_absl_flags^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libwebrtc_absl_flags,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_flags^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_flags^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_flags^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_flags^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_flags^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_flags^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libwebrtc_absl_hash^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libwebrtc_absl_hash,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_hash^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_hash^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_hash^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_hash^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_hash^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_hash^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libwebrtc_absl_numeric^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libwebrtc_absl_numeric,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_numeric^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_numeric^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_numeric^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_numeric^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_numeric^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_numeric^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libwebrtc_absl_status^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libwebrtc_absl_status,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_status^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_status^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_status^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_status^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_status^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_status^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libwebrtc_absl_strings^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libwebrtc_absl_strings,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_strings^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_strings^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_strings^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_strings^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_strings^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_strings^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libwebrtc_absl_synchronization^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libwebrtc_absl_synchronization,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_synchronization^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_synchronization^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_synchronization^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_synchronization^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_synchronization^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_synchronization^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libwebrtc_absl_time^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libwebrtc_absl_time,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_time^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_time^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_time^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_time^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_time^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_time^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libwebrtc_absl_types^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libwebrtc_absl_types,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_types^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_types^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_types^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_types^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_types^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_types^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libwebrtc_absl_base^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libwebrtc_absl_base,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_base^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_base^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_base^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_base^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_base^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_base^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libwebrtc_absl_container^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libwebrtc_absl_container,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_container^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_container^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_container^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_container^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_container^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_container^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libwebrtc_absl_debugging^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libwebrtc_absl_debugging,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_debugging^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_debugging^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_debugging^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/webrtc/libwebrtc_absl_debugging^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_debugging^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/webrtc/third_party/abseil-cpp/libwebrtc_absl_debugging^linux_glibc_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_webrtc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/webrtc/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 external_webrtc.tar.zst --clobber

du -ah -d1 external_webrtc*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi


rm -rf aosp
