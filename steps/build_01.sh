
set -e

sudo rm -rf /usr/local/.ghcup
sudo rm -rf /usr/local/lib/android/sdk
sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf /usr/local/share/powershell
sudo rm -rf /usr/local/share/chromium
sudo rm -rf /usr/local/share/swift
sudo rm -rf /opt/hostedtoolcache
df -h

source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja-ndk.tar.zst
tar xf $GITHUB_WORKSPACE/ninja.tar.zst
mkdir -p $GITHUB_WORKSPACE/cache

clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86 android12-gsi "/clang-r416183b1" "/clang-r416183b" "/soong"

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_01/art.sh
time source steps/build_01/bionic.sh
time source steps/build_01/bootable_recovery.sh
time source steps/build_01/build_blueprint.sh
time source steps/build_01/build_make.sh
time source steps/build_01/build_soong.sh
time source steps/build_01/device_generic_vulkan-cereal.sh
time source steps/build_01/device_google_cuttlefish.sh
time source steps/build_01/device_google_cuttlefish_prebuilts.sh
time source steps/build_01/device_google_cuttlefish_vmm.sh
time source steps/build_01/external_OpenCSD.sh
time source steps/build_01/external_aac.sh
time source steps/build_01/external_angle.sh
time source steps/build_01/external_apache-http.sh
time source steps/build_01/external_arm-optimized-routines.sh
time source steps/build_01/external_avb.sh
time source steps/build_01/external_bcc.sh
time source steps/build_01/external_boringssl.sh
time source steps/build_01/external_brotli.sh
time source steps/build_01/external_bsdiff.sh
time source steps/build_01/external_bzip2.sh
time source steps/build_01/external_compiler-rt.sh
time source steps/build_01/external_conscrypt.sh
time source steps/build_01/external_cpu_features.sh
time source steps/build_01/external_crosvm.sh
time source steps/build_01/external_curl.sh
time source steps/build_01/external_dng_sdk.sh
time source steps/build_01/external_dtc.sh
time source steps/build_01/external_dynamic_depth.sh
time source steps/build_01/external_e2fsprogs.sh
time source steps/build_01/external_eigen.sh
time source steps/build_01/external_erofs-utils.sh
time source steps/build_01/external_expat.sh
time source steps/build_01/external_f2fs-tools.sh
time source steps/build_01/external_fdlibm.sh
time source steps/build_01/external_fec.sh
time source steps/build_01/external_flac.sh
time source steps/build_01/external_flatbuffers.sh
time source steps/build_01/external_fmtlib.sh
time source steps/build_01/external_freetype.sh
time source steps/build_01/external_fsverity-utils.sh
time source steps/build_01/external_gemmlowp.sh
time source steps/build_01/external_gflags.sh
time source steps/build_01/external_giflib.sh
time source steps/build_01/external_golang-protobuf.sh
time source steps/build_01/external_google-breakpad.sh
time source steps/build_01/external_google-fonts_carrois-gothic-sc.sh
time source steps/build_01/external_google-fonts_coming-soon.sh
time source steps/build_01/external_google-fonts_cutive-mono.sh
time source steps/build_01/external_google-fonts_dancing-script.sh
time source steps/build_01/external_google-fonts_source-sans-pro.sh
time source steps/build_01/external_google-fruit.sh
time source steps/build_01/external_googletest.sh
time source steps/build_01/external_gptfdisk.sh
time source steps/build_01/external_grpc-grpc.sh
time source steps/build_01/external_gwp_asan.sh
time source steps/build_01/external_harfbuzz_ng.sh
time source steps/build_01/external_icu.sh
time source steps/build_01/external_image_io.sh
time source steps/build_01/external_ipsec-tools.sh
time source steps/build_01/external_iptables.sh
time source steps/build_01/external_jsoncpp.sh
time source steps/build_01/external_kmod.sh
time source steps/build_01/external_libaom.sh
time source steps/build_01/external_libavc.sh
time source steps/build_01/external_libcppbor.sh
time source steps/build_01/external_libcxx.sh
time source steps/build_01/external_libcxxabi.sh
time source steps/build_01/external_libdivsufsort.sh
time source steps/build_01/external_libdrm.sh
time source steps/build_01/external_libepoxy.sh
time source steps/build_01/external_libevent.sh
time source steps/build_01/external_libgav1.sh
time source steps/build_01/external_libgsm.sh
time source steps/build_01/external_libhevc.sh
time source steps/build_01/external_libjpeg-turbo.sh
time source steps/build_01/external_libmpeg2.sh
time source steps/build_01/external_libnl.sh
time source steps/build_01/external_libogg.sh
time source steps/build_01/external_libopus.sh
time source steps/build_01/external_libpcap.sh
time source steps/build_01/external_libpng.sh
time source steps/build_01/external_libsrtp2.sh
time source steps/build_01/external_libtextclassifier.sh
time source steps/build_01/external_libusb.sh
time source steps/build_01/external_libutf.sh
time source steps/build_01/external_libvpx.sh
time source steps/build_01/external_libwebm.sh
time source steps/build_01/external_libwebsockets.sh
time source steps/build_01/external_libxml2.sh
time source steps/build_01/external_libyuv.sh
time source steps/build_01/external_llvm.sh
time source steps/build_01/external_lz4.sh
time source steps/build_01/external_lzma.sh
time source steps/build_01/external_mdnsresponder.sh
time source steps/build_01/external_minigbm.sh
time source steps/build_01/external_minijail.sh
time source steps/build_01/external_mksh.sh
time source steps/build_01/external_modp_b64.sh
time source steps/build_01/external_ms-tpm-20-ref.sh
time source steps/build_01/external_nanopb-c.sh
time source steps/build_01/external_neven.sh
time source steps/build_01/external_noto-fonts.sh
time source steps/build_01/external_oj-libjdwp.sh
time source steps/build_01/external_openscreen.sh
time source steps/build_01/external_parameter-framework.sh
time source steps/build_01/external_pcre.sh
time source steps/build_01/external_pdfium.sh
time source steps/build_01/external_perfetto.sh
time source steps/build_01/external_pffft.sh
time source steps/build_01/external_piex.sh
time source steps/build_01/external_protobuf.sh
time source steps/build_01/external_python_cpython2.sh
time source steps/build_01/external_rnnoise.sh
time source steps/build_01/external_roboto-fonts.sh
time source steps/build_01/external_rust_crates_bitflags.sh
time source steps/build_01/external_rust_crates_bytes.sh
time source steps/build_01/external_rust_crates_cfg-if.sh
time source steps/build_01/external_rust_crates_either.sh
time source steps/build_01/external_rust_crates_glob.sh
time source steps/build_01/external_rust_crates_grpcio-sys.sh
time source steps/build_01/external_rust_crates_lazy_static.sh
time source steps/build_01/external_rust_crates_lazycell.sh
time source steps/build_01/external_rust_crates_libc.sh
time source steps/build_01/external_rust_crates_memchr.sh
time source steps/build_01/external_rust_crates_paste.sh
time source steps/build_01/external_rust_crates_peeking_take_while.sh
time source steps/build_01/external_rust_crates_proc-macro-hack.sh
time source steps/build_01/external_rust_crates_regex-syntax.sh
time source steps/build_01/external_rust_crates_rustc-hash.sh
time source steps/build_01/external_rust_crates_shlex.sh
time source steps/build_01/external_rust_crates_termcolor.sh
time source steps/build_01/external_rust_crates_textwrap.sh
time source steps/build_01/external_rust_crates_unicode-segmentation.sh
time source steps/build_01/external_rust_crates_unicode-width.sh
time source steps/build_01/external_rust_crates_unicode-xid.sh
time source steps/build_01/external_rust_cxx.sh
time source steps/build_01/external_scrypt.sh
time source steps/build_01/external_scudo.sh
time source steps/build_01/external_selinux.sh
time source steps/build_01/external_sfntly.sh
time source steps/build_01/external_skia.sh
time source steps/build_01/external_sonivox.sh
time source steps/build_01/external_sqlite.sh
time source steps/build_01/external_tensorflow.sh
time source steps/build_01/external_tinyalsa.sh
time source steps/build_01/external_tinyxml2.sh
time source steps/build_01/external_tpm2-tss.sh
time source steps/build_01/external_tremolo.sh
time source steps/build_01/external_usrsctp.sh
time source steps/build_01/external_virglrenderer.sh
time source steps/build_01/external_vixl.sh
time source steps/build_01/external_vulkan-headers.sh
time source steps/build_01/external_webp.sh
time source steps/build_01/external_webrtc.sh
time source steps/build_01/external_xz-embedded.sh
time source steps/build_01/external_zlib.sh
time source steps/build_01/external_zopfli.sh
time source steps/build_01/external_zstd.sh
time source steps/build_01/frameworks_av.sh
time source steps/build_01/frameworks_base.sh
time source steps/build_01/frameworks_compile_libbcc.sh
time source steps/build_01/frameworks_ex.sh
time source steps/build_01/frameworks_libs_modules-utils.sh
time source steps/build_01/frameworks_minikin.sh
time source steps/build_01/frameworks_native.sh
time source steps/build_01/frameworks_opt_net_ims.sh
time source steps/build_01/frameworks_opt_net_voip.sh
time source steps/build_01/frameworks_opt_net_wifi.sh
time source steps/build_01/frameworks_opt_telephony.sh
time source steps/build_01/frameworks_rs.sh
time source steps/build_01/frameworks_wilhelm.sh
time source steps/build_01/hardware_interfaces.sh
time source steps/build_01/libnativehelper.sh
time source steps/build_01/packages_inputmethods_LatinIME.sh
time source steps/build_01/packages_modules_Connectivity.sh
time source steps/build_01/packages_modules_Gki.sh
time source steps/build_01/packages_modules_IPsec.sh
time source steps/build_01/packages_modules_NeuralNetworks.sh
time source steps/build_01/packages_modules_SdkExtensions.sh
time source steps/build_01/packages_modules_StatsD.sh
time source steps/build_01/packages_modules_Virtualization.sh
time source steps/build_01/packages_modules_Wifi.sh
time source steps/build_01/packages_modules_adb.sh
time source steps/build_01/packages_providers_MediaProvider.sh
time source steps/build_01/packages_services_Car.sh
time source steps/build_01/packages_wallpapers_LivePicker.sh
time source steps/build_01/prebuilts_build-tools.sh
time source steps/build_01/prebuilts_clang_host_linux-x86.sh
time source steps/build_01/prebuilts_misc.sh
time source steps/build_01/prebuilts_ndk.sh
time source steps/build_01/prebuilts_rust.sh
time source steps/build_01/prebuilts_vndk_v28.sh
time source steps/build_01/prebuilts_vndk_v29.sh
time source steps/build_01/prebuilts_vndk_v30.sh
time source steps/build_01/singletons.sh
time source steps/build_01/system_apex.sh
time source steps/build_01/system_bpf.sh
time source steps/build_01/system_bpfprogs.sh
time source steps/build_01/system_bt.sh
time source steps/build_01/system_ca-certificates.sh
time source steps/build_01/system_connectivity_wificond.sh
time source steps/build_01/system_core.sh
time source steps/build_01/system_extras.sh
time source steps/build_01/system_gsid.sh
time source steps/build_01/system_incremental_delivery.sh
time source steps/build_01/system_keymaster.sh
time source steps/build_01/system_libbase.sh
time source steps/build_01/system_libfmq.sh
time source steps/build_01/system_libhidl.sh
time source steps/build_01/system_libhwbinder.sh
time source steps/build_01/system_libprocinfo.sh
time source steps/build_01/system_libvintf.sh
time source steps/build_01/system_libziparchive.sh
time source steps/build_01/system_logging.sh
time source steps/build_01/system_media.sh
time source steps/build_01/system_memory_libdmabufheap.sh
time source steps/build_01/system_memory_libion.sh
time source steps/build_01/system_memory_libmeminfo.sh
time source steps/build_01/system_memory_libmemunreachable.sh
time source steps/build_01/system_memory_lmkd.sh
time source steps/build_01/system_netd.sh
time source steps/build_01/system_nfc.sh
time source steps/build_01/system_security.sh
time source steps/build_01/system_sepolicy.sh
time source steps/build_01/system_server_configurable_flags.sh
time source steps/build_01/system_teeui.sh
time source steps/build_01/system_timezone.sh
time source steps/build_01/system_tools_hidl.sh
time source steps/build_01/system_unwinding.sh
time source steps/build_01/test_vts-testcase_hal.sh
time source steps/build_01/tools_dexter.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/build-tools/ .
fi


du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h
df -h

