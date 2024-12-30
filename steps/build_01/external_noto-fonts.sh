set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform external/noto-fonts


echo "building NotoColorEmoji.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoColorEmoji.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/emoji-compat/NotoColorEmoji.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoColorEmoji.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/emoji-compat/NotoColorEmoji.ttf^android_x86_64

echo "building NotoColorEmojiFlags.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoColorEmojiFlags.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/emoji-compat/NotoColorEmojiFlags.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoColorEmojiFlags.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/emoji-compat/NotoColorEmojiFlags.ttf^android_x86_64

echo "building NotoNaskhArabic-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoNaskhArabic-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoNaskhArabic-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoNaskhArabic-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoNaskhArabic-Bold.ttf^android_x86_64

echo "building NotoNaskhArabic-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoNaskhArabic-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoNaskhArabic-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoNaskhArabic-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoNaskhArabic-Regular.ttf^android_x86_64

echo "building NotoNaskhArabicUI-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoNaskhArabicUI-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoNaskhArabicUI-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoNaskhArabicUI-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoNaskhArabicUI-Bold.ttf^android_x86_64

echo "building NotoNaskhArabicUI-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoNaskhArabicUI-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoNaskhArabicUI-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoNaskhArabicUI-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoNaskhArabicUI-Regular.ttf^android_x86_64

echo "building NotoSansAdlam-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansAdlam-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansAdlam-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansAdlam-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansAdlam-VF.ttf^android_x86_64

echo "building NotoSansAhom-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansAhom-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansAhom-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansAhom-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansAhom-Regular.otf^android_x86_64

echo "building NotoSansAnatolianHieroglyphs-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansAnatolianHieroglyphs-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansAnatolianHieroglyphs-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansAnatolianHieroglyphs-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansAnatolianHieroglyphs-Regular.otf^android_x86_64

echo "building NotoSansArmenian-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansArmenian-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansArmenian-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansArmenian-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansArmenian-VF.ttf^android_x86_64

echo "building NotoSansAvestan-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansAvestan-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansAvestan-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansAvestan-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansAvestan-Regular.ttf^android_x86_64

echo "building NotoSansBalinese-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansBalinese-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBalinese-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansBalinese-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBalinese-Regular.ttf^android_x86_64

echo "building NotoSansBamum-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansBamum-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBamum-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansBamum-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBamum-Regular.ttf^android_x86_64

echo "building NotoSansBassaVah-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansBassaVah-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBassaVah-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansBassaVah-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBassaVah-Regular.otf^android_x86_64

echo "building NotoSansBatak-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansBatak-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBatak-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansBatak-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBatak-Regular.ttf^android_x86_64

echo "building NotoSansBengali-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansBengali-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBengali-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansBengali-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBengali-VF.ttf^android_x86_64

echo "building NotoSansBengaliUI-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansBengaliUI-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBengaliUI-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansBengaliUI-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBengaliUI-VF.ttf^android_x86_64

echo "building NotoSansBhaiksuki-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansBhaiksuki-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBhaiksuki-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansBhaiksuki-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBhaiksuki-Regular.otf^android_x86_64

echo "building NotoSansBrahmi-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansBrahmi-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBrahmi-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansBrahmi-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBrahmi-Regular.ttf^android_x86_64

echo "building NotoSansBuginese-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansBuginese-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBuginese-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansBuginese-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBuginese-Regular.ttf^android_x86_64

echo "building NotoSansBuhid-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansBuhid-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBuhid-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansBuhid-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansBuhid-Regular.ttf^android_x86_64

echo "building NotoSansCJK-Regular.ttc^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansCJK-Regular.ttc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/cjk/NotoSansCJK-Regular.ttc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansCJK-Regular.ttc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/cjk/NotoSansCJK-Regular.ttc^android_x86_64

echo "building NotoSansCanadianAboriginal-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansCanadianAboriginal-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCanadianAboriginal-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansCanadianAboriginal-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCanadianAboriginal-Regular.ttf^android_x86_64

echo "building NotoSansCarian-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansCarian-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCarian-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansCarian-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCarian-Regular.ttf^android_x86_64

echo "building NotoSansChakma-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansChakma-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansChakma-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansChakma-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansChakma-Regular.otf^android_x86_64

echo "building NotoSansCham-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansCham-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCham-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansCham-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCham-Bold.ttf^android_x86_64

echo "building NotoSansCham-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansCham-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCham-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansCham-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCham-Regular.ttf^android_x86_64

echo "building NotoSansCherokee-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansCherokee-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCherokee-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansCherokee-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCherokee-Regular.ttf^android_x86_64

echo "building NotoSansCoptic-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansCoptic-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCoptic-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansCoptic-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCoptic-Regular.ttf^android_x86_64

echo "building NotoSansCuneiform-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansCuneiform-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCuneiform-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansCuneiform-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCuneiform-Regular.ttf^android_x86_64

echo "building NotoSansCypriot-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansCypriot-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCypriot-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansCypriot-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansCypriot-Regular.ttf^android_x86_64

echo "building NotoSansDeseret-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansDeseret-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansDeseret-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansDeseret-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansDeseret-Regular.ttf^android_x86_64

echo "building NotoSansDevanagari-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansDevanagari-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansDevanagari-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansDevanagari-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansDevanagari-VF.ttf^android_x86_64

echo "building NotoSansDevanagariUI-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansDevanagariUI-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansDevanagariUI-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansDevanagariUI-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansDevanagariUI-VF.ttf^android_x86_64

echo "building NotoSansEgyptianHieroglyphs-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansEgyptianHieroglyphs-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansEgyptianHieroglyphs-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansEgyptianHieroglyphs-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansEgyptianHieroglyphs-Regular.ttf^android_x86_64

echo "building NotoSansElbasan-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansElbasan-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansElbasan-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansElbasan-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansElbasan-Regular.otf^android_x86_64

echo "building NotoSansEthiopic-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansEthiopic-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansEthiopic-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansEthiopic-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansEthiopic-VF.ttf^android_x86_64

echo "building NotoSansGeorgian-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansGeorgian-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGeorgian-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansGeorgian-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGeorgian-VF.ttf^android_x86_64

echo "building NotoSansGlagolitic-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansGlagolitic-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGlagolitic-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansGlagolitic-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGlagolitic-Regular.ttf^android_x86_64

echo "building NotoSansGothic-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansGothic-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGothic-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansGothic-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGothic-Regular.ttf^android_x86_64

echo "building NotoSansGrantha-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansGrantha-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGrantha-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansGrantha-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGrantha-Regular.ttf^android_x86_64

echo "building NotoSansGujarati-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansGujarati-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGujarati-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansGujarati-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGujarati-Bold.ttf^android_x86_64

echo "building NotoSansGujarati-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansGujarati-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGujarati-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansGujarati-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGujarati-Regular.ttf^android_x86_64

echo "building NotoSansGujaratiUI-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansGujaratiUI-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGujaratiUI-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansGujaratiUI-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGujaratiUI-Bold.ttf^android_x86_64

echo "building NotoSansGujaratiUI-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansGujaratiUI-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGujaratiUI-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansGujaratiUI-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGujaratiUI-Regular.ttf^android_x86_64

echo "building NotoSansGunjalaGondi-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansGunjalaGondi-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGunjalaGondi-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansGunjalaGondi-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGunjalaGondi-Regular.otf^android_x86_64

echo "building NotoSansGurmukhi-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansGurmukhi-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGurmukhi-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansGurmukhi-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGurmukhi-VF.ttf^android_x86_64

echo "building NotoSansGurmukhiUI-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansGurmukhiUI-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGurmukhiUI-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansGurmukhiUI-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansGurmukhiUI-VF.ttf^android_x86_64

echo "building NotoSansHanifiRohingya-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansHanifiRohingya-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansHanifiRohingya-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansHanifiRohingya-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansHanifiRohingya-Regular.otf^android_x86_64

echo "building NotoSansHanunoo-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansHanunoo-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansHanunoo-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansHanunoo-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansHanunoo-Regular.ttf^android_x86_64

echo "building NotoSansHatran-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansHatran-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansHatran-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansHatran-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansHatran-Regular.otf^android_x86_64

echo "building NotoSansHebrew-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansHebrew-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansHebrew-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansHebrew-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansHebrew-Bold.ttf^android_x86_64

echo "building NotoSansHebrew-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansHebrew-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansHebrew-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansHebrew-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansHebrew-Regular.ttf^android_x86_64

echo "building NotoSansImperialAramaic-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansImperialAramaic-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansImperialAramaic-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansImperialAramaic-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansImperialAramaic-Regular.ttf^android_x86_64

echo "building NotoSansInscriptionalPahlavi-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansInscriptionalPahlavi-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansInscriptionalPahlavi-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansInscriptionalPahlavi-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansInscriptionalPahlavi-Regular.ttf^android_x86_64

echo "building NotoSansInscriptionalParthian-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansInscriptionalParthian-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansInscriptionalParthian-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansInscriptionalParthian-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansInscriptionalParthian-Regular.ttf^android_x86_64

echo "building NotoSansJavanese-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansJavanese-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansJavanese-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansJavanese-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansJavanese-Regular.otf^android_x86_64

echo "building NotoSansKaithi-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansKaithi-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKaithi-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansKaithi-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKaithi-Regular.ttf^android_x86_64

echo "building NotoSansKannada-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansKannada-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKannada-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansKannada-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKannada-VF.ttf^android_x86_64

echo "building NotoSansKannadaUI-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansKannadaUI-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKannadaUI-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansKannadaUI-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKannadaUI-VF.ttf^android_x86_64

echo "building NotoSansKayahLi-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansKayahLi-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKayahLi-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansKayahLi-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKayahLi-Regular.ttf^android_x86_64

echo "building NotoSansKharoshthi-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansKharoshthi-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKharoshthi-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansKharoshthi-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKharoshthi-Regular.ttf^android_x86_64

echo "building NotoSansKhmer-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansKhmer-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other-vf/NotoSansKhmer-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansKhmer-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other-vf/NotoSansKhmer-VF.ttf^android_x86_64

echo "building NotoSansKhmerUI-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansKhmerUI-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKhmerUI-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansKhmerUI-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKhmerUI-Bold.ttf^android_x86_64

echo "building NotoSansKhmerUI-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansKhmerUI-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKhmerUI-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansKhmerUI-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKhmerUI-Regular.ttf^android_x86_64

echo "building NotoSansKhojki-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansKhojki-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKhojki-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansKhojki-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansKhojki-Regular.otf^android_x86_64

echo "building NotoSansLao-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansLao-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLao-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansLao-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLao-Bold.ttf^android_x86_64

echo "building NotoSansLao-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansLao-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLao-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansLao-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLao-Regular.ttf^android_x86_64

echo "building NotoSansLaoUI-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansLaoUI-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLaoUI-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansLaoUI-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLaoUI-Bold.ttf^android_x86_64

echo "building NotoSansLaoUI-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansLaoUI-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLaoUI-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansLaoUI-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLaoUI-Regular.ttf^android_x86_64

echo "building NotoSansLepcha-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansLepcha-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLepcha-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansLepcha-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLepcha-Regular.ttf^android_x86_64

echo "building NotoSansLimbu-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansLimbu-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLimbu-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansLimbu-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLimbu-Regular.ttf^android_x86_64

echo "building NotoSansLinearA-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansLinearA-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLinearA-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansLinearA-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLinearA-Regular.otf^android_x86_64

echo "building NotoSansLinearB-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansLinearB-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLinearB-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansLinearB-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLinearB-Regular.ttf^android_x86_64

echo "building NotoSansLisu-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansLisu-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLisu-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansLisu-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLisu-Regular.ttf^android_x86_64

echo "building NotoSansLycian-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansLycian-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLycian-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansLycian-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLycian-Regular.ttf^android_x86_64

echo "building NotoSansLydian-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansLydian-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLydian-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansLydian-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansLydian-Regular.ttf^android_x86_64

echo "building NotoSansMalayalam-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMalayalam-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMalayalam-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMalayalam-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMalayalam-VF.ttf^android_x86_64

echo "building NotoSansMalayalamUI-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMalayalamUI-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMalayalamUI-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMalayalamUI-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMalayalamUI-VF.ttf^android_x86_64

echo "building NotoSansMandaic-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMandaic-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMandaic-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMandaic-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMandaic-Regular.ttf^android_x86_64

echo "building NotoSansManichaean-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansManichaean-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansManichaean-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansManichaean-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansManichaean-Regular.otf^android_x86_64

echo "building NotoSansMarchen-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMarchen-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMarchen-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMarchen-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMarchen-Regular.otf^android_x86_64

echo "building NotoSansMasaramGondi-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMasaramGondi-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMasaramGondi-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMasaramGondi-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMasaramGondi-Regular.otf^android_x86_64

echo "building NotoSansMedefaidrin-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMedefaidrin-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMedefaidrin-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMedefaidrin-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMedefaidrin-VF.ttf^android_x86_64

echo "building NotoSansMeeteiMayek-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMeeteiMayek-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMeeteiMayek-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMeeteiMayek-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMeeteiMayek-Regular.ttf^android_x86_64

echo "building NotoSansMeroitic-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMeroitic-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMeroitic-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMeroitic-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMeroitic-Regular.otf^android_x86_64

echo "building NotoSansMiao-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMiao-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMiao-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMiao-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMiao-Regular.otf^android_x86_64

echo "building NotoSansModi-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansModi-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansModi-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansModi-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansModi-Regular.ttf^android_x86_64

echo "building NotoSansMongolian-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMongolian-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMongolian-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMongolian-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMongolian-Regular.ttf^android_x86_64

echo "building NotoSansMro-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMro-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMro-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMro-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMro-Regular.otf^android_x86_64

echo "building NotoSansMultani-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMultani-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMultani-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMultani-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMultani-Regular.otf^android_x86_64

echo "building NotoSansMyanmar-Bold.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMyanmar-Bold.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMyanmar-Bold.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMyanmar-Bold.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMyanmar-Bold.otf^android_x86_64

echo "building NotoSansMyanmar-Medium.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMyanmar-Medium.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMyanmar-Medium.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMyanmar-Medium.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMyanmar-Medium.otf^android_x86_64

echo "building NotoSansMyanmar-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMyanmar-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMyanmar-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMyanmar-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMyanmar-Regular.otf^android_x86_64

echo "building NotoSansMyanmarUI-Bold.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMyanmarUI-Bold.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMyanmarUI-Bold.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMyanmarUI-Bold.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMyanmarUI-Bold.otf^android_x86_64

echo "building NotoSansMyanmarUI-Medium.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMyanmarUI-Medium.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMyanmarUI-Medium.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMyanmarUI-Medium.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMyanmarUI-Medium.otf^android_x86_64

echo "building NotoSansMyanmarUI-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansMyanmarUI-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMyanmarUI-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansMyanmarUI-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansMyanmarUI-Regular.otf^android_x86_64

echo "building NotoSansNKo-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansNKo-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansNKo-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansNKo-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansNKo-Regular.ttf^android_x86_64

echo "building NotoSansNabataean-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansNabataean-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansNabataean-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansNabataean-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansNabataean-Regular.otf^android_x86_64

echo "building NotoSansNewTaiLue-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansNewTaiLue-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansNewTaiLue-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansNewTaiLue-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansNewTaiLue-Regular.ttf^android_x86_64

echo "building NotoSansNewa-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansNewa-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansNewa-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansNewa-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansNewa-Regular.otf^android_x86_64

echo "building NotoSansOgham-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansOgham-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOgham-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansOgham-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOgham-Regular.ttf^android_x86_64

echo "building NotoSansOlChiki-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansOlChiki-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOlChiki-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansOlChiki-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOlChiki-Regular.ttf^android_x86_64

echo "building NotoSansOldItalic-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansOldItalic-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOldItalic-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansOldItalic-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOldItalic-Regular.ttf^android_x86_64

echo "building NotoSansOldNorthArabian-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansOldNorthArabian-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOldNorthArabian-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansOldNorthArabian-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOldNorthArabian-Regular.otf^android_x86_64

echo "building NotoSansOldPermic-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansOldPermic-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOldPermic-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansOldPermic-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOldPermic-Regular.otf^android_x86_64

echo "building NotoSansOldPersian-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansOldPersian-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOldPersian-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansOldPersian-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOldPersian-Regular.ttf^android_x86_64

echo "building NotoSansOldSouthArabian-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansOldSouthArabian-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOldSouthArabian-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansOldSouthArabian-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOldSouthArabian-Regular.ttf^android_x86_64

echo "building NotoSansOldTurkic-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansOldTurkic-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOldTurkic-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansOldTurkic-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOldTurkic-Regular.ttf^android_x86_64

echo "building NotoSansOriya-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansOriya-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOriya-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansOriya-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOriya-Bold.ttf^android_x86_64

echo "building NotoSansOriya-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansOriya-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOriya-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansOriya-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOriya-Regular.ttf^android_x86_64

echo "building NotoSansOriyaUI-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansOriyaUI-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOriyaUI-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansOriyaUI-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOriyaUI-Bold.ttf^android_x86_64

echo "building NotoSansOriyaUI-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansOriyaUI-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOriyaUI-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansOriyaUI-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOriyaUI-Regular.ttf^android_x86_64

echo "building NotoSansOsage-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansOsage-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOsage-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansOsage-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOsage-Regular.ttf^android_x86_64

echo "building NotoSansOsmanya-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansOsmanya-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOsmanya-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansOsmanya-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansOsmanya-Regular.ttf^android_x86_64

echo "building NotoSansPahawhHmong-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansPahawhHmong-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansPahawhHmong-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansPahawhHmong-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansPahawhHmong-Regular.otf^android_x86_64

echo "building NotoSansPalmyrene-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansPalmyrene-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansPalmyrene-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansPalmyrene-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansPalmyrene-Regular.otf^android_x86_64

echo "building NotoSansPauCinHau-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansPauCinHau-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansPauCinHau-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansPauCinHau-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansPauCinHau-Regular.otf^android_x86_64

echo "building NotoSansPhagsPa-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansPhagsPa-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansPhagsPa-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansPhagsPa-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansPhagsPa-Regular.ttf^android_x86_64

echo "building NotoSansPhoenician-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansPhoenician-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansPhoenician-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansPhoenician-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansPhoenician-Regular.ttf^android_x86_64

echo "building NotoSansRejang-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansRejang-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansRejang-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansRejang-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansRejang-Regular.ttf^android_x86_64

echo "building NotoSansRunic-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansRunic-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansRunic-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansRunic-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansRunic-Regular.ttf^android_x86_64

echo "building NotoSansSamaritan-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansSamaritan-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSamaritan-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansSamaritan-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSamaritan-Regular.ttf^android_x86_64

echo "building NotoSansSaurashtra-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansSaurashtra-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSaurashtra-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansSaurashtra-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSaurashtra-Regular.ttf^android_x86_64

echo "building NotoSansSharada-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansSharada-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSharada-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansSharada-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSharada-Regular.otf^android_x86_64

echo "building NotoSansShavian-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansShavian-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansShavian-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansShavian-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansShavian-Regular.ttf^android_x86_64

echo "building NotoSansSinhala-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansSinhala-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSinhala-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansSinhala-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSinhala-VF.ttf^android_x86_64

echo "building NotoSansSinhalaUI-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansSinhalaUI-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSinhalaUI-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansSinhalaUI-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSinhalaUI-VF.ttf^android_x86_64

echo "building NotoSansSoraSompeng-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansSoraSompeng-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSoraSompeng-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansSoraSompeng-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSoraSompeng-Regular.otf^android_x86_64

echo "building NotoSansSoyombo-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansSoyombo-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSoyombo-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansSoyombo-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSoyombo-VF.ttf^android_x86_64

echo "building NotoSansSundanese-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansSundanese-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSundanese-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansSundanese-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSundanese-Regular.ttf^android_x86_64

echo "building NotoSansSylotiNagri-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansSylotiNagri-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSylotiNagri-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansSylotiNagri-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSylotiNagri-Regular.ttf^android_x86_64

echo "building NotoSansSymbols-Regular-Subsetted.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansSymbols-Regular-Subsetted.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSymbols-Regular-Subsetted.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansSymbols-Regular-Subsetted.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSymbols-Regular-Subsetted.ttf^android_x86_64

echo "building NotoSansSymbols-Regular-Subsetted2.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansSymbols-Regular-Subsetted2.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSymbols-Regular-Subsetted2.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansSymbols-Regular-Subsetted2.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSymbols-Regular-Subsetted2.ttf^android_x86_64

echo "building NotoSansSyriacEastern-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansSyriacEastern-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSyriacEastern-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansSyriacEastern-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSyriacEastern-Regular.ttf^android_x86_64

echo "building NotoSansSyriacEstrangela-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansSyriacEstrangela-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSyriacEstrangela-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansSyriacEstrangela-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSyriacEstrangela-Regular.ttf^android_x86_64

echo "building NotoSansSyriacWestern-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansSyriacWestern-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSyriacWestern-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansSyriacWestern-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansSyriacWestern-Regular.ttf^android_x86_64

echo "building NotoSansTagalog-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansTagalog-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTagalog-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansTagalog-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTagalog-Regular.ttf^android_x86_64

echo "building NotoSansTagbanwa-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansTagbanwa-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTagbanwa-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansTagbanwa-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTagbanwa-Regular.ttf^android_x86_64

echo "building NotoSansTaiLe-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansTaiLe-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTaiLe-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansTaiLe-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTaiLe-Regular.ttf^android_x86_64

echo "building NotoSansTaiTham-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansTaiTham-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTaiTham-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansTaiTham-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTaiTham-Regular.ttf^android_x86_64

echo "building NotoSansTaiViet-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansTaiViet-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTaiViet-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansTaiViet-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTaiViet-Regular.ttf^android_x86_64

echo "building NotoSansTakri-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansTakri-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTakri-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansTakri-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTakri-VF.ttf^android_x86_64

echo "building NotoSansTamil-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansTamil-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTamil-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansTamil-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTamil-VF.ttf^android_x86_64

echo "building NotoSansTamilUI-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansTamilUI-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTamilUI-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansTamilUI-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTamilUI-VF.ttf^android_x86_64

echo "building NotoSansTelugu-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansTelugu-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTelugu-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansTelugu-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTelugu-VF.ttf^android_x86_64

echo "building NotoSansTeluguUI-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansTeluguUI-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTeluguUI-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansTeluguUI-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTeluguUI-VF.ttf^android_x86_64

echo "building NotoSansThaana-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansThaana-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansThaana-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansThaana-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansThaana-Bold.ttf^android_x86_64

echo "building NotoSansThaana-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansThaana-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansThaana-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansThaana-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansThaana-Regular.ttf^android_x86_64

echo "building NotoSansThai-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansThai-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansThai-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansThai-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansThai-Bold.ttf^android_x86_64

echo "building NotoSansThai-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansThai-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansThai-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansThai-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansThai-Regular.ttf^android_x86_64

echo "building NotoSansThaiUI-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansThaiUI-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansThaiUI-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansThaiUI-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansThaiUI-Bold.ttf^android_x86_64

echo "building NotoSansThaiUI-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansThaiUI-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansThaiUI-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansThaiUI-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansThaiUI-Regular.ttf^android_x86_64

echo "building NotoSansTifinagh-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansTifinagh-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTifinagh-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansTifinagh-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansTifinagh-Regular.otf^android_x86_64

echo "building NotoSansUgaritic-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansUgaritic-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansUgaritic-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansUgaritic-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansUgaritic-Regular.ttf^android_x86_64

echo "building NotoSansVai-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansVai-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansVai-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansVai-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansVai-Regular.ttf^android_x86_64

echo "building NotoSansWancho-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansWancho-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansWancho-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansWancho-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansWancho-Regular.otf^android_x86_64

echo "building NotoSansWarangCiti-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansWarangCiti-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansWarangCiti-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansWarangCiti-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansWarangCiti-Regular.otf^android_x86_64

echo "building NotoSansYi-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSansYi-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansYi-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSansYi-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSansYi-Regular.ttf^android_x86_64

echo "building NotoSerif-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerif-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerif-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerif-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerif-Bold.ttf^android_x86_64

echo "building NotoSerif-BoldItalic.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerif-BoldItalic.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerif-BoldItalic.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerif-BoldItalic.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerif-BoldItalic.ttf^android_x86_64

echo "building NotoSerif-Italic.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerif-Italic.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerif-Italic.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerif-Italic.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerif-Italic.ttf^android_x86_64

echo "building NotoSerif-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerif-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerif-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerif-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerif-Regular.ttf^android_x86_64

echo "building NotoSerifArmenian-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifArmenian-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifArmenian-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifArmenian-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifArmenian-VF.ttf^android_x86_64

echo "building NotoSerifBengali-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifBengali-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifBengali-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifBengali-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifBengali-VF.ttf^android_x86_64

echo "building NotoSerifCJK-Regular.ttc^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifCJK-Regular.ttc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/cjk/NotoSerifCJK-Regular.ttc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifCJK-Regular.ttc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/cjk/NotoSerifCJK-Regular.ttc^android_x86_64

echo "building NotoSerifDevanagari-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifDevanagari-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifDevanagari-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifDevanagari-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifDevanagari-VF.ttf^android_x86_64

echo "building NotoSerifDogra-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifDogra-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifDogra-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifDogra-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifDogra-Regular.ttf^android_x86_64

echo "building NotoSerifEthiopic-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifEthiopic-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifEthiopic-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifEthiopic-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifEthiopic-VF.ttf^android_x86_64

echo "building NotoSerifGeorgian-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifGeorgian-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifGeorgian-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifGeorgian-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifGeorgian-VF.ttf^android_x86_64

echo "building NotoSerifGujarati-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifGujarati-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifGujarati-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifGujarati-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifGujarati-VF.ttf^android_x86_64

echo "building NotoSerifGurmukhi-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifGurmukhi-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifGurmukhi-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifGurmukhi-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifGurmukhi-VF.ttf^android_x86_64

echo "building NotoSerifHebrew-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifHebrew-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifHebrew-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifHebrew-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifHebrew-Bold.ttf^android_x86_64

echo "building NotoSerifHebrew-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifHebrew-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifHebrew-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifHebrew-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifHebrew-Regular.ttf^android_x86_64

echo "building NotoSerifKannada-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifKannada-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifKannada-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifKannada-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifKannada-VF.ttf^android_x86_64

echo "building NotoSerifKhmer-Bold.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifKhmer-Bold.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifKhmer-Bold.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifKhmer-Bold.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifKhmer-Bold.otf^android_x86_64

echo "building NotoSerifKhmer-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifKhmer-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifKhmer-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifKhmer-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifKhmer-Regular.otf^android_x86_64

echo "building NotoSerifLao-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifLao-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifLao-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifLao-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifLao-Bold.ttf^android_x86_64

echo "building NotoSerifLao-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifLao-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifLao-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifLao-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifLao-Regular.ttf^android_x86_64

echo "building NotoSerifMalayalam-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifMalayalam-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifMalayalam-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifMalayalam-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifMalayalam-VF.ttf^android_x86_64

echo "building NotoSerifMyanmar-Bold.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifMyanmar-Bold.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifMyanmar-Bold.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifMyanmar-Bold.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifMyanmar-Bold.otf^android_x86_64

echo "building NotoSerifMyanmar-Regular.otf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifMyanmar-Regular.otf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifMyanmar-Regular.otf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifMyanmar-Regular.otf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifMyanmar-Regular.otf^android_x86_64

echo "building NotoSerifNyiakengPuachueHmong-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifNyiakengPuachueHmong-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifNyiakengPuachueHmong-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifNyiakengPuachueHmong-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifNyiakengPuachueHmong-VF.ttf^android_x86_64

echo "building NotoSerifSinhala-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifSinhala-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifSinhala-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifSinhala-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifSinhala-VF.ttf^android_x86_64

echo "building NotoSerifTamil-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifTamil-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifTamil-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifTamil-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifTamil-VF.ttf^android_x86_64

echo "building NotoSerifTelugu-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifTelugu-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifTelugu-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifTelugu-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifTelugu-VF.ttf^android_x86_64

echo "building NotoSerifThai-Bold.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifThai-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifThai-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifThai-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifThai-Bold.ttf^android_x86_64

echo "building NotoSerifThai-Regular.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifThai-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifThai-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifThai-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifThai-Regular.ttf^android_x86_64

echo "building NotoSerifTibetan-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifTibetan-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifTibetan-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifTibetan-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifTibetan-VF.ttf^android_x86_64

echo "building NotoSerifYezidi-VF.ttf^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja NotoSerifYezidi-VF.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifYezidi-VF.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/noto-fonts/NotoSerifYezidi-VF.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/noto-fonts/other/NotoSerifYezidi-VF.ttf^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_noto-fonts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/noto-fonts/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 external_noto-fonts.tar.zst --clobber

du -ah -d1 external_noto-fonts*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_noto-fonts.tar.zst" ]; then
  echo "Compressing external/noto-fonts -> external_noto-fonts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_noto-fonts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/noto-fonts/ .
fi

rm -rf aosp
