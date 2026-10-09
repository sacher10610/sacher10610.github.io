; CHAPTER 07 / JULY - 夏にエクレアは売れるのか
; 本文: JULY_CODEX_LUNA_IMPLEMENTATION_PACK_v2/docs/03_SCENARIO.md

*eyecatch_06_07
[skipstop]
[clearstack stack="if"]
[cm]
[mask time="700" color="0x000000"]
[stopbgm fadeout="true" time="700"]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="eyecatch/EYECATCH_06_07_JULY.png" time="0"]
[tb_hide_message_window]
[mask_off time="400"]
[playse storage="SE_EYECATCH_05_06_Jingle.wav" volume="75" loop="false"]
[wait time="3100"]
[mask time="400" color="0x000000"]
[jump target="*scene_07_01"]

*scene_07_01
[call storage="system_common.ks"]
[call storage="system/future_character_define.ks"]
[clearstack stack="if"]
[cm]
[hidemenubutton]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[chara_hide name="抹茶エクレア"]
[bg storage="apr_shop_day.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
[eval exp="f.chapter = '07'; f.scene = '07_01'"]
[mask_off time="500"]
#抹茶エクレア
「暑い」
[p]
#主人公
「暑いね」
[p]
#抹茶エクレア
「暑い」
[p]
#主人公
「二回言っても気温は下がらないよ」
[p]
#抹茶エクレア
「気持ちは下がるかもしれへん」
[p]
#主人公
「下がってるのはやる気じゃない？」
[p]
#抹茶エクレア
「それはあかん」
[p]
#主人公
「今週、抹茶エクレアの売れ方がちょっと鈍い」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「アイスとかゼリーとか、冷たいものに流れてる感じ」
[p]
#抹茶エクレア
「エクレアが夏に負けてる」
[p]
#主人公
「夏は敵じゃないよ」
[p]
#抹茶エクレア
「ほな、強敵や」
[p]
#主人公
「敵から離れて」
[p]
#抹茶エクレア
「でも、このままは嫌やな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「六月は“また買える”やった」
[p]
#主人公
「そうだね」
[p]
#抹茶エクレア
「七月は」
[p]
#抹茶エクレア
「“暑くても買いたい”にせなあかん」
[p]
#主人公
「それは分かる」
[p]
#抹茶エクレア
「よし」
[p]
#主人公
「何する気？」
[p]
#抹茶エクレア
「冷たくする」
[p]
#主人公
「雑だな」
[p]
#抹茶エクレア
「夏やで？」
[p]
#主人公
「夏だけど」
[p]
#抹茶エクレア
「冷たければ勝ちやろ」
[p]
#主人公
「六月で何を学んだの」
[p]
#抹茶エクレア
「全部を高級にしたらあかん」
[p]
#主人公
「そこだけ？」
[p]

*scene_07_02
[eval exp="f.chapter = '07'; f.scene = '07_02'"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_mod name="神田姫花" face="summer_normal"]
[chara_show name="神田姫花" left="75" top="105"]
#神田姫花
「こんにちは」
[p]
#主人公
「いらっしゃいませ」
[p]
#抹茶エクレア
「神田ちゃん、ちょうどええところに！」
[p]
#神田姫花
「えっ」
[p]
#主人公
「最近それ多いね」
[p]
#抹茶エクレア
「なあ」
[p]
#抹茶エクレア
「夏に食べたいお菓子って何？」
[p]
#神田姫花
「急ですね」
[p]
#抹茶エクレア
「暑いから」
[p]
#神田姫花
「……アイス」
[p]
#抹茶エクレア
「やっぱり！」
[p]
#主人公
「顔が“勝った”って言ってる」
[p]
#神田姫花
「あと、ゼリーとか」
[p]
#抹茶エクレア
「ほら！」
[p]
#主人公
「まだ何にも勝ってない」
[p]
#神田姫花
「でも」
[p]
#抹茶エクレア
「でも？」
[p]
#神田姫花
「冷たいものばっかりだと、たまにちゃんと甘いものも食べたくなります」
[p]
#抹茶エクレア
「ちゃんと甘いもの」
[p]
#神田姫花
「ただ、重いのはちょっと」
[p]
#主人公
「暑い日にクリームたっぷりだと、手が止まる？」
[p]
#神田姫花
「はい」
[p]
#神田姫花
「冷たくて、軽くて」
[p]
#神田姫花
「でも、お菓子食べたって感じはほしいです」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「今の、結構ヒントじゃない？」
[p]
#抹茶エクレア
「冷たい」
[p]
#抹茶エクレア
「軽い」
[p]
#抹茶エクレア
「でも、お菓子」
[p]
#主人公
「最後が大事そう」
[p]
#抹茶エクレア
「よっしゃ」
[p]
#主人公
「嫌な予感がする」
[p]
#抹茶エクレア
「夏用に変身や！」
[p]
#主人公
「“変身”はやめよう」
[p]

*choice_07_01
[clearstack stack="if"]
[cm]
#
[glink text="思い切って、冷たいデザートに作り変えよう" color="green" font_color="0x3B2A1B" x="310" y="205" width="660" height="100" size="21" bold="true" target="*july_bad007_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="何も変えず、しっかり冷やして出そう" color="green" font_color="0x3B2A1B" x="310" y="325" width="660" height="100" size="21" bold="true" target="*july_detour" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="エクレアの形は残して、夏向けに整えよう" color="green" font_color="0x3B2A1B" x="310" y="445" width="660" height="100" size="21" bold="true" target="*july_normal_route" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*july_bad007_entry
[chara_hide name="神田姫花"]
[if exp="sf.core_bad_007 == true"]
[clearstack stack="if"]
[cm]
#
CORE BAD 007『それ、もうエクレアちゃうやん』
[r]
その結末は、もう知っている。
[p]
[jump target="*choice_07_01"]
[endif]
[jump target="*july_bad007"]

*july_bad007
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="900"]
[eval exp="f.chapter = '07'; f.scene = '07_bad007'"]
#主人公
「思い切って、冷たいデザートに作り変えよう」
[p]
#抹茶エクレア
「それや！」
[p]
#主人公
「いや、言ってみただけ」
[p]
#抹茶エクレア
「もう遅い！」
[p]
[chara_mod name="抹茶エクレア" face="summer_alt"]
#抹茶エクレア
「まず凍らせる」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「クリーム増やす」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「生地は……」
[p]
#主人公
「生地は？」
[p]
#抹茶エクレア
「邪魔やな」
[p]
#主人公
「待って」
[p]
#抹茶エクレア
「グラスに入れよ」
[p]
#主人公
「待って」
[p]
#抹茶エクレア
「上に抹茶アイス」
[p]
#主人公
「待って」
[p]
#抹茶エクレア
「白玉も乗せる」
[p]
#主人公
「待って」
[p]
#抹茶エクレア
「あんこも」
[p]
#主人公
「完全に別の方向へ走ってる」
[p]
#抹茶エクレア
「夏やから！」
[p]
#主人公
「夏って万能免罪符じゃないよ」
[p]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="apr_shop_day.png" time="0"]
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="700"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[mask_off time="650"]
#
翌日
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_mod name="神田姫花" face="summer_normal"]
[chara_show name="神田姫花" left="75" top="105"]
#神田姫花
「こんにちは」
[p]
#抹茶エクレア
「できたで！」
[p]
#神田姫花
「……？」
[p]
#主人公
「夏向け新作」
[p]
#神田姫花
「わあ」
[p]
#神田姫花
「抹茶パフェですか？」
[p]
#抹茶エクレア
「ちゃう」
[p]
#神田姫花
「え？」
[p]
#抹茶エクレア
「抹茶エクレアや」
[p]
#神田姫花
「……」
[p]
#主人公
「言いたいことは分かる」
[p]
#神田姫花
「エクレア……？」
[p]
#抹茶エクレア
「エクレアや」
[p]
#神田姫花
「どこが？」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「聞いちゃった」
[p]
#神田姫花
「あ、ごめんなさい」
[p]
#抹茶エクレア
「いや」
[p]
#抹茶エクレア
「ええねん」
[p]
#抹茶エクレア
「ウチも今、ちょっと思った」
[p]
#主人公
「何を？」
[p]
#抹茶エクレア
「それ」
[p]
#抹茶エクレア
「もうエクレアちゃうやん」
[p]
#主人公
「自分で言った」
[p]
[eval exp="sf.cg_july_mini_01 = true"]
[skipstop]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[image layer="1" name="july_sdcg_image" folder="bgimage" storage="cg/july/SD07_01_Bad007_Not_an_Eclair.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="july_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#
[p]
[free layer="1" name="july_sdcg_image" time="150" wait="false"]
[free layer="1" name="july_sdcg_frame" time="150"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[iscript]
f.april_bad = {kind:"CORE", id:"007", title:"それ、もうエクレアちゃうやん", lesson:"夏に合わせて変えすぎたら、商品の芯まで置いてきてしまった。", retry:"*choice_07_01", storage:"n07_july.ks", month:"07"};
[endscript]
[register_core_bad id="007"]
[call storage="system_common.ks" target="*show_core_bad"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[jump target="*choice_07_01"]

*july_detour
[chara_hide name="神田姫花"]
[eval exp="f.chapter = '07'; f.scene = '07_detour'"]
#主人公
「何も変えず、しっかり冷やして出そう」
[p]
#抹茶エクレア
「変えへんの？」
[p]
#主人公
「六月に変えたばかりだし」
[p]
#抹茶エクレア
「まあ、それもそうか」
[p]
#主人公
「まず様子を見る」
[p]
#抹茶エクレア
「慎重やなあ」
[p]
#主人公
「四月に言われたくない」
[p]
#抹茶エクレア
「千個はもう忘れて」
[p]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="apr_shop_day.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="700"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[mask_off time="650"]
#
数日後
[p]
#主人公
「売れないわけじゃない」
[p]
#抹茶エクレア
「でも、伸びへんな」
[p]
#主人公
「冷やしただけだと、夏に選ぶ理由にはならないみたい」
[p]
#抹茶エクレア
「変えすぎたらあかん」
[p]
#抹茶エクレア
「変えへんかったら届かへん」
[p]
#主人公
「その間を探すしかないね」
[p]
#抹茶エクレア
「……難しいな」
[p]
#主人公
「だから聞こう」
[p]
#抹茶エクレア
「また？」
[p]
#主人公
「また」
[p]
#抹茶エクレア
「もう店の名物、聞き込みやん」
[p]
#主人公
「悪くないと思うよ」
[p]
[jump target="*scene_07_03"]

*july_normal_route
[chara_hide name="神田姫花"]
[eval exp="f.chapter = '07'; f.scene = '07_normal'"]
#主人公
「エクレアの形は残して、夏向けに整えよう」
[p]
#抹茶エクレア
「形だけ？」
[p]
#主人公
「形だけじゃない」
[p]
#主人公
「生地とクリームがあって」
[p]
#主人公
「かじった時に“エクレア食べてる”って分かるところは残す」
[p]
#抹茶エクレア
「その上で、夏向けにする」
[p]
#主人公
「そう」
[p]
#抹茶エクレア
「……それやな」
[p]
#主人公
「珍しく即決だ」
[p]
#抹茶エクレア
「六月で成長したからな」
[p]
#主人公
「自分で言うんだ」
[p]
[jump target="*scene_07_03"]

*scene_07_03
[eval exp="f.chapter = '07'; f.scene = '07_03'"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_mod name="三好文子" face="summer"]
[chara_show name="三好文子" left="75" top="115"]
#三好文子
「夏のエクレア？」
[p]
#抹茶エクレア
「そう」
[p]
#抹茶エクレア
「冷たくしたいんやけど」
[p]
#抹茶エクレア
「別もんにはしたくないねん」
[p]
#三好文子
「難しそうね」
[p]
#主人公
「三好さんにとって、エクレアって何が残ってたらエクレアですか？」
[p]
#三好文子
「そうねえ」
[p]
#三好文子
「細長い形もそうだけど」
[p]
[eval exp="sf.cg_july_event_01 = true"]
[skipstop]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[bg storage="cg/july/CG07_01_What_Makes_an_Eclair.png" time="500"]
#三好文子
「かじった時の生地とクリームかしら」
[p]
#抹茶エクレア
「生地とクリーム」
[p]
#三好文子
「それと」
[p]
#三好文子
「ちょっと手で持って食べられる感じ」
[p]
#主人公
「パフェみたいに器が必要になったら、だいぶ遠い？」
[p]
#三好文子
「私はそう思うわ」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「どうした？」
[p]
#抹茶エクレア
「思ってたより、“エクレアらしさ”ってちゃんとあるんやな」
[p]
#三好文子
「でも、全部同じじゃなくていいんじゃない？」
[p]
#抹茶エクレア
「え？」
[p]
#三好文子
「夏なら、夏の食べやすさがあってもいいでしょう」
[p]
#抹茶エクレア
「変えてええ」
[p]
#三好文子
「ええ」
[p]
#抹茶エクレア
「でも、戻ってこれるくらいにする」
[p]
#三好文子
「ふふ」
[p]
#三好文子
「そういう感じ」
[p]

*scene_07_04
[eval exp="f.chapter = '07'; f.scene = '07_04'"]
[mask time="600" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="apr_kitchen_day.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="700"]
[chara_mod name="抹茶エクレア" face="summer_alt"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[mask_off time="600"]
#主人公
「変える候補を整理しよう」
[p]
#抹茶エクレア
「まず、ちゃんと冷たい」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「クリームは少し軽く」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「でも、生地は残す」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「手で持って食べられる」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「見た目も涼しそうに」
[p]
#主人公
「そこはやりすぎない」
[p]
#抹茶エクレア
「分かってるって」
[p]
#主人公
「前科があるから」
[p]
#抹茶エクレア
「パフェは忘れて」
[p]

*choice_07_02
[clearstack stack="if"]
[cm]
#
[glink text="冷たさ" color="green" font_color="0x3B2A1B" x="310" y="205" width="660" height="100" size="21" bold="true" target="*choice_07_02_a" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="軽さ" color="green" font_color="0x3B2A1B" x="310" y="325" width="660" height="100" size="21" bold="true" target="*choice_07_02_b" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="エクレアらしさ" color="green" font_color="0x3B2A1B" x="310" y="445" width="660" height="100" size="21" bold="true" target="*choice_07_02_c" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*choice_07_02_a
#主人公
「まず、冷たさ」
[p]
#抹茶エクレア
「夏やもんな」
[p]
#主人公
「ただし、凍らせすぎない」
[p]
#抹茶エクレア
「パフェ禁止」
[p]
#主人公
「よく分かってる」
[p]
#抹茶エクレア
「反省したからな」
[p]
[jump target="*scene_07_05"]

*choice_07_02_b
#主人公
「軽さ」
[p]
#抹茶エクレア
「六月も軽さの話したな」
[p]
#主人公
「でも今回は“暑い日に重くない”が目的」
[p]
#抹茶エクレア
「同じ軽さでも、理由が違う」
[p]
#主人公
「そういうこと」
[p]
#抹茶エクレア
「ちょっと分かってきた」
[p]
[jump target="*scene_07_05"]

*choice_07_02_c
#主人公
「エクレアらしさ」
[p]
#抹茶エクレア
「そこ守ったら、夏向けにならへんくない？」
[p]
#主人公
「守るところを決めた方が、変えるところも決めやすい」
[p]
#抹茶エクレア
「……なるほど」
[p]
#抹茶エクレア
「芯があったら、周りはいじれる」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「ええやん」
[p]
[jump target="*scene_07_05"]

*scene_07_05
[eval exp="f.chapter = '07'; f.scene = '07_05'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="apr_shop_day.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="700"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[mask_off time="650"]
#
数日後
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_mod name="神田姫花" face="summer_normal"]
[chara_show name="神田姫花" left="75" top="105"]
#神田姫花
「こんにちは」
[p]
#抹茶エクレア
「神田ちゃん！」
[p]
#主人公
「いらっしゃいませ」
[p]
#神田姫花
「あ、新しいやつですか？」
[p]
#抹茶エクレア
「夏仕様や」
[p]
#神田姫花
「夏仕様」
[p]
#主人公
「冷たくして、少し軽くしてます」
[p]
#抹茶エクレア
「でもエクレアやで」
[p]
#神田姫花
「そこ強調するんですね」
[p]
#主人公
「色々あって」
[p]
#神田姫花
「？」
[p]
#抹茶エクレア
「気にせんでええ」
[p]
#神田姫花
「じゃあ、一個ください」
[p]
#主人公
「ありがとうございます」
[p]
[wait time="250"]
#神田姫花
「……あ」
[p]
#抹茶エクレア
「どう？」
[p]
#神田姫花
「冷たい」
[p]
#抹茶エクレア
「うん」
[p]
[eval exp="sf.cg_july_event_02 = true"]
[skipstop]
[chara_hide name="抹茶エクレア"]
[chara_hide name="神田姫花"]
[bg storage="cg/july/CG07_02_Cold_But_Still_an_Eclair.png" time="500"]
#神田姫花
「でも、ちゃんとエクレアです」
[p]
#抹茶エクレア
「……！」
[p]
#主人公
「そこ？」
[p]
#抹茶エクレア
「そこや！」
[p]
#神田姫花
「え？」
[p]
#抹茶エクレア
「いや、なんでもない」
[p]
#神田姫花
「クリーム軽いから、暑い日でも食べやすいです」
[p]
#主人公
「よかった」
[p]
#神田姫花
「これ、友達にも言います」
[p]
#抹茶エクレア
「ほんま？」
[p]
#神田姫花
「はい」
[p]
#抹茶エクレア
「よっしゃ」
[p]
#主人公
「声」
[p]
#抹茶エクレア
「今日はええやろ」
[p]
#主人公
「先月も聞いた」
[p]

*scene_07_06
[eval exp="f.chapter = '07'; f.scene = '07_06'"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[mask time="600" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="apr_shop_night.png" time="0"]
[xchgbgm storage="06_One_Year_One_Eclair.mp3" time="700"]
[chara_mod name="抹茶エクレア" face="summer_quiet"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[mask_off time="600"]
#抹茶エクレア
「なあ」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「六月は、良くしようとして高くしすぎた」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「七月は、夏に合わせようとして」
[p]
#抹茶エクレア
「変えすぎたら別もんになる」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「でも、変えへんかったら届かへん」
[p]
#主人公
「難しいね」
[p]
#抹茶エクレア
「せやな」
[p]
#主人公
「でも、今日はうまくいった」
[p]
#抹茶エクレア
「冷たい」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「軽い」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「でも、エクレア」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「なんか」
[p]
#抹茶エクレア
「変わっても残るもんってあるんやな」
[p]
#主人公
「たぶん、それが“らしさ”なんじゃない？」
[p]
#抹茶エクレア
「らしさ」
[p]
#主人公
「全部同じじゃなくても、戻ってこれるところ」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「どうした？」
[p]
#抹茶エクレア
「世界一って」
[p]
#抹茶エクレア
「変わり続けることなんか」
[p]
#主人公
「まだ分からない」
[p]
#抹茶エクレア
「即否定せんようになったな」
[p]
#主人公
「少しはね」
[p]
#抹茶エクレア
「成長したやん」
[p]
#主人公
「そっちが言う？」
[p]

*july_clear
[iscript]
sf.normal_ch07_clear = true;
f.chapter = "07"; f.scene = "clear"; f.current_clear_month = "07";
[endscript]
[skipstop]
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
7月 CLEAR『夏でも、エクレア』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
季節に合わせるために、
[r]
全部を別物へ変える必要はなかった。
[p]
冷たくして、少し軽くして、
[r]
それでも生地とクリームは残す。
[p]
変えていいところと、残したいところ。
[r]
七月に見つけたのは、変わりながら「らしさ」を残すやり方だった。
[p]
[jump target="*july_clear_menu"]

*july_clear_menu
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
7月 CLEAR『夏でも、エクレア』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
抹茶ちゃんのひとこと
[r]
「夏仕様でも、ちゃんと“ウチらのエクレア”や」
[resetfont]
[glink text="タイトルへ" color="green" font_color="0x3B2A1B" x="675" y="150" width="400" height="85" size="23" bold="true" storage="title_screen.ks" target="*title" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="記録" color="green" font_color="0x3B2A1B" x="675" y="245" width="400" height="85" size="23" bold="true" storage="system_common.ks" target="*records_from_clear" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="8月へ" color="green" font_color="0x3B2A1B" x="675" y="340" width="400" height="85" size="23" bold="true" storage="n08_august.ks" target="*eyecatch_07_08" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[s]
