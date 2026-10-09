; CHAPTER 06 / JUNE - 抹茶エクレア改造計画
; 本文: JUNE_CODEX_LUNA_IMPLEMENTATION_PACK_v2/docs/03_SCENARIO.md

*eyecatch_05_06
[chara_face name="抹茶エクレア" face="summer_normal" storage="matcha_summer_normal.png"]
[chara_face name="抹茶エクレア" face="summer_alt" storage="matcha_summer_alt.png"]
[chara_face name="抹茶エクレア" face="summer_quiet" storage="matcha_summer_quiet.png"]
[chara_face name="三好文子" face="summer" storage="miyoshi_summer.png"]
[chara_new name="神田姫花" jname="神田姫花" storage="kanda_summer_normal.png" width="440" height="660"]
[chara_face name="神田姫花" face="summer_normal" storage="kanda_summer_normal.png"]
[skipstop]
[clearstack stack="if"]
[cm]
[mask time="700" color="0x000000"]
[stopbgm fadeout="true" time="700"]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="eyecatch/EYECATCH_05_06_June_Begins.png" time="0"]
[tb_hide_message_window]
[mask_off time="400"]
[playse storage="SE_EYECATCH_05_06_Jingle.wav" volume="75" loop="false"]
[wait time="3100"]
[mask time="400" color="0x000000"]
[jump target="*scene_06_01"]

*scene_06_01
[call storage="system_common.ks"]
[clearstack stack="if"]
[cm]
[hidemenubutton]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[chara_hide name="抹茶エクレア"]
[bg storage="apr_shop_morning.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
[eval exp="f.chapter = '06'; f.scene = '06_01'"]
[mask_off time="500"]
#
; SCENE 01
#抹茶エクレア
「五月は客を呼んだ」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「しかも、また来てもろた」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「ということは」
[p]
#主人公
「嫌な予感がする」
[p]
#抹茶エクレア
「次は商品そのものを世界一仕様に改造する番や！」
[p]
#主人公
「ほら来た」
[p]
#抹茶エクレア
「なんでや！　順当な流れやろ！」
[p]
#主人公
「“改造”って言い方が不安なんだよ」
[p]
#抹茶エクレア
「安心しい」
[p]
#抹茶エクレア
「今回はちゃんと調べてきた」
[p]
#主人公
「その台詞、五月にも聞いた」
[p]
#抹茶エクレア
「今度こそほんまや！」
[p]
#主人公
「何を調べたの？」
[p]
#抹茶エクレア
「高級パティスリー」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「高級抹茶」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「高級チョコ」
[p]
#主人公
「もういい」
[p]
#抹茶エクレア
「まだ金箔が残ってるで」
[p]
#主人公
「やっぱり聞きたくなかった」
[p]
#抹茶エクレア
「世界一なんやから、材料も世界一にしたらええやん」
[p]
#主人公
「理屈は分かるけど」
[p]
#抹茶エクレア
「ほな決まりやな！」
[p]
#主人公
「まだ決まってない」
[p]

*scene_06_02
[eval exp="f.chapter = '06'; f.scene = '06_02'"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_mod name="三好文子" face="summer"]
[chara_show name="三好文子" left="75" top="115"]
; SCENE 02
#三好文子
「おはよう」
[p]
#主人公
「いらっしゃいませ、三好さん」
[p]
#抹茶エクレア
「ちょうどええところに！」
[p]
#三好文子
「あら、何かしら」
[p]
#抹茶エクレア
「三好さん」
[p]
#抹茶エクレア
「お菓子って、高い方が美味しいと思います？」
[p]
#三好文子
「まあ」
[p]
#主人公
「いきなり聞くことじゃないよ」
[p]
#三好文子
「そうねえ」
[p]
#三好文子
「高いものには、高い理由があるでしょうけど」
[p]
#抹茶エクレア
「ほら！」
[p]
#三好文子
「でも」
[p]
#抹茶エクレア
「でも？」
[p]
#三好文子
「高ければ毎週買える、とは限らないわね」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「そこなんだよな」
[p]
#三好文子
「私、このお店のお菓子」
[p]
#三好文子
「ちょっと疲れた日に、ふらっと買えるところが好きなの」
[p]
#抹茶エクレア
「ふらっと」
[p]
#三好文子
「“今日は特別な日だから覚悟して買う”お菓子も素敵よ」
[p]
#三好文子
「でも、このお店までそうならなくてもいいんじゃない？」
[p]
#抹茶エクレア
「……なるほどなあ」
[p]
#主人公
「聞いてる？」
[p]
#抹茶エクレア
「聞いてる聞いてる」
[p]
#抹茶エクレア
「でも世界一やで？」
[p]
#主人公
「まだ引っかかってる」
[p]
#抹茶エクレア
「一回、試すくらいええやろ？」
[p]
#主人公
「その一回で店が傾かなければね」
[p]

*choice_06_01
[clearstack stack="if"]
[cm]
#
[glink text="素材を全部、最高級にしよう" color="green" font_color="0x3B2A1B" x="310" y="205" width="660" height="100" size="21" bold="true" target="*june_bad005_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="一個を“究極の高級品”にしよう" color="green" font_color="0x3B2A1B" x="310" y="325" width="660" height="100" size="21" bold="true" target="*june_bad006_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="まず、今のお客さんが何を変えてほしいか聞こう" color="green" font_color="0x3B2A1B" x="310" y="445" width="660" height="100" size="20" bold="true" target="*june_normal_route" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*june_bad005_entry
[chara_hide name="三好文子"]
[if exp="sf.core_bad_005 == true"]
[clearstack stack="if"]
[cm]
#
CORE BAD 005『原価率100％』
[r]
その結末は、もう知っている。
[p]
[jump target="*choice_06_01"]
[endif]
[jump target="*june_bad005"]

*june_bad006_entry
[chara_hide name="三好文子"]
[if exp="sf.core_bad_006 == true"]
[clearstack stack="if"]
[cm]
#
CORE BAD 006『一個が遠い』
[r]
その結末は、もう知っている。
[p]
[jump target="*choice_06_01"]
[endif]
[jump target="*june_bad006"]

*june_bad005
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="900"]
[cm]
[bg storage="apr_kitchen_day.png" time="350"]
[chara_mod name="抹茶エクレア" face="summer_alt"]
[eval exp="f.chapter = '06'; f.scene = '06_bad005'"]
#主人公
「素材を全部、最高級にしよう」
[p]
#抹茶エクレア
「よっしゃ！」
[p]
#主人公
「ただし、一個ずつ試算しながら」
[p]
#抹茶エクレア
「分かってるって」
[p]
#抹茶エクレア
「抹茶は最高級」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「チョコも最高級」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「バターも最高級」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「卵も」
[p]
#主人公
「待って」
[p]
#抹茶エクレア
「箱も」
[p]
#主人公
「待って」
[p]
#抹茶エクレア
「リボンも」
[p]
#主人公
「食べられないところまで高級にしないで」
[p]
#抹茶エクレア
「世界一は箱開ける前から始まってるんや！」
[p]
#主人公
「名言っぽく言うな」
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
数日後
[p]
#抹茶エクレア
「売れた！」
[p]
#主人公
「売れたね」
[p]
#抹茶エクレア
「しかも評判ええ！」
[p]
#主人公
「評判もいい」
[p]
#抹茶エクレア
「勝ったな」
[p]
#主人公
「じゃあ帳簿見る？」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「どうしたの？」
[p]
#抹茶エクレア
「今、急に嫌な予感した」
[p]
#主人公
「成長したね」
[p]
#抹茶エクレア
「見せて」
[p]
#主人公
「材料費」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「包装費」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「試作ロス」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「一個売るたび」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「ほぼ何も残らない」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「正確には、忙しくなった分だけしんどさが残る」
[p]
#抹茶エクレア
「売れたのに？」
[p]
#主人公
「売れたのに」
[p]
#抹茶エクレア
「美味しいのに？」
[p]
#主人公
「美味しいのに」
[p]
#抹茶エクレア
「なんでやねん」
[p]
#主人公
「原価」
[p]
#抹茶エクレア
「原価って怖いな」
[p]
#主人公
「今さら？」
[p]
#抹茶エクレア
「世界一より強いやん」
[p]
#主人公
「敵にしないで」
[p]
[eval exp="sf.cg_june_mini_01 = true"]
[skipstop]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[image layer="1" name="june_sdcg_image" folder="bgimage" storage="cg/june/SD06_01_Bad005_Cost_100.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="june_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#
[p]
[free layer="1" name="june_sdcg_image" time="150" wait="false"]
[free layer="1" name="june_sdcg_frame" time="150"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[iscript]
f.april_bad = {kind:"CORE", id:"005", title:"原価率100％", lesson:"売れば売るほど店に何も残らない。良い商品と続けられる商品は、同じではなかった。", retry:"*choice_06_01", storage:"n06_june.ks", month:"06"};
[endscript]
[register_core_bad id="005"]
[call storage="system_common.ks" target="*show_core_bad"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[jump target="*choice_06_01"]

*june_bad006
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="900"]
[cm]
[bg storage="apr_shop_day.png" time="350"]
[eval exp="f.chapter = '06'; f.scene = '06_bad006'"]
#主人公
「一個を“究極の高級品”にしよう」
[p]
#抹茶エクレア
「それや！」
[p]
#主人公
「値段も、それに見合うようにする」
[p]
#抹茶エクレア
「世界一やもんな」
[p]
#主人公
「一個、二千円台」
[p]
#抹茶エクレア
「ええやん」
[p]
#主人公
「即答なんだ」
[p]
#抹茶エクレア
「箱も専用」
[p]
#主人公
「また箱」
[p]
#抹茶エクレア
「一個ずつ台座に置こう」
[p]
#主人公
「宝石？」
[p]
#抹茶エクレア
「照明も当てる」
[p]
#主人公
「展示会？」
[p]
#抹茶エクレア
「名前も変える」
[p]
#主人公
「もうエクレアって分からなくなるからやめて」
[p]
#抹茶エクレア
「でも高級感は出るで」
[p]
#主人公
「出すぎる気がする」
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
#主人公
「いらっしゃいませ」
[p]
#抹茶エクレア
「いらっしゃいませ！」
[p]
#神田姫花
「……あ」
[p]
#抹茶エクレア
「新作やで」
[p]
#神田姫花
「きれい……」
[p]
#抹茶エクレア
「せやろ？」
[p]
#神田姫花
「これ、一個ください」
[p]
#主人公
「ありがとうございます」
[p]
#神田姫花
「……」
[p]
#神田姫花
「えっと」
[p]
#主人公
「はい」
[p]
#神田姫花
「これ、値段……」
[p]
#抹茶エクレア
「二千四百円や」
[p]
#神田姫花
「……」
[p]
#主人公
「……」
[p]
#神田姫花
「ごめんなさい」
[p]
#神田姫花
「今日は、やめておきます」
[p]
#抹茶エクレア
「え」
[p]
#神田姫花
「また、お小遣い入ったら来ます」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「……」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_hide name="神田姫花"]
#抹茶エクレア
「遠かったな」
[p]
#主人公
「何が？」
[p]
#抹茶エクレア
「一個」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「ショーケースの向こうにあるんやけど」
[p]
#抹茶エクレア
「めっちゃ遠かった」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「美味しいだけやと、届かへんこともあるんやな」
[p]
[eval exp="sf.cg_june_mini_02 = true"]
[skipstop]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[image layer="1" name="june_sdcg_image" folder="bgimage" storage="cg/june/SD06_02_Bad006_Too_Far.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="june_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#
[p]
[free layer="1" name="june_sdcg_image" time="150" wait="false"]
[free layer="1" name="june_sdcg_frame" time="150"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[iscript]
f.april_bad = {kind:"CORE", id:"006", title:"一個が遠い", lesson:"立派になりすぎた一個は、ちょっと食べてみたい気持ちから遠ざかった。", retry:"*choice_06_01", storage:"n06_june.ks", month:"06"};
[endscript]
[register_core_bad id="006"]
[call storage="system_common.ks" target="*show_core_bad"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[jump target="*choice_06_01"]

*june_normal_route
[chara_hide name="三好文子"]
[eval exp="f.chapter = '06'; f.scene = '06_normal'"]
#主人公
「まず、今のお客さんが何を変えてほしいか聞こう」
[p]
#抹茶エクレア
「また聞くん？」
[p]
#主人公
「五月、それでうまくいった」
[p]
#抹茶エクレア
「成功体験に忠実やな」
[p]
#主人公
「失敗体験にも忠実だよ」
[p]
#抹茶エクレア
「千個の話はもうええねん」
[p]
#主人公
「言ってない」
[p]
#抹茶エクレア
「顔が言うてた」
[p]
#主人公
「じゃあ、三好さんに聞こう」
[p]
#抹茶エクレア
「よし」
[p]
#抹茶エクレア
「今度は“高い方がええですか”みたいな雑な聞き方せえへんで」
[p]
#主人公
「少し成長した」
[p]
#抹茶エクレア
「少しは余計や」
[p]

*scene_06_03
[eval exp="f.chapter = '06'; f.scene = '06_03'"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_mod name="三好文子" face="summer"]
[chara_show name="三好文子" left="10" top="115"]
#三好文子
「変えてほしいところ？」
[p]
#主人公
「はい」
[p]
#抹茶エクレア
「味でも、大きさでも、値段でも」
[p]
#三好文子
「そうねえ」
[p]
#三好文子
「私は、もう少しだけ抹茶の香りがすると嬉しいかしら」
[p]
#抹茶エクレア
「濃くする？」
[p]
#三好文子
「濃く、というより」
[p]
#三好文子
「食べたあとに、ふわっと残るくらい」
[p]
#抹茶エクレア
「なるほど」
[p]
#主人公
「“強く”じゃなくて“残る”か」
[p]
#三好文子
「そうそう」
[p]
#三好文子
「でも、今くらい軽い方が好きよ」
[p]
#抹茶エクレア
「重たくはしたくない、と」
[p]
#三好文子
「ええ」
[p]
#主人公
「ありがとう、三好さん」
[p]
#三好文子
「どういたしまして」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_mod name="神田姫花" face="summer_normal"]
[chara_show name="神田姫花" left="365" top="105"]
#神田姫花
「こんにちは」
[p]
#主人公
「いらっしゃいませ」
[p]
#抹茶エクレア
「こんにちは！」
[p]
#神田姫花
「……あ、三好さん」
[p]
#三好文子
「あら、姫花ちゃん」
[p]
#主人公
「お知り合いですか？」
[p]
#三好文子
「神田姫花ちゃん。お隣さんなの」
[p]
#抹茶エクレア
「神田ちゃんな。……ちょうどええわ」
[p]
#主人公
「ちょうどええ、って」
[p]
#抹茶エクレア
「なあなあ、神田ちゃんも聞かせて」
[p]
#神田姫花
「え？」
[p]
#抹茶エクレア
「お菓子買う時って、何を気にする？」
[p]
#神田姫花
「……値段」
[p]
#抹茶エクレア
「即答や」
[p]
#神田姫花
「学生なので」
[p]
#三好文子
「ふふ」
[p]
#主人公
「正直で助かる」
[p]
#神田姫花
「でも、安ければいいっていうより」
[p]
#神田姫花
「学校帰りに、自分のお金で買えるくらいだと嬉しいです」
[p]
#抹茶エクレア
「自分のお金で」
[p]
#神田姫花
「あと、一人で食べきれる大きさ」
[p]
#主人公
「なるほど」
[p]
#神田姫花
「友達にもすすめやすいし」
[p]
#三好文子
「たしかに、それは大事ね」
[p]
#神田姫花
「え？」
[p]
#三好文子
「良いものでも、気負わず買えるって嬉しいもの」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「どうした？」
[p]
[eval exp="sf.cg_june_event_01 = true"]
[skipstop]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="cg/june/CG06_01_What_to_Change_What_to_Keep.png" time="500"]
#抹茶エクレア
「世界一のヒント、いま二つ並んだ」
[p]
#主人公
「また大げさな」
[p]
#抹茶エクレア
「ちゃうねん」
[p]
#抹茶エクレア
「香りはちゃんと残したい」
[p]
#抹茶エクレア
「でも重すぎたらあかん」
[p]
#抹茶エクレア
「しかも、手ぇ届く値段で」
[p]
#抹茶エクレア
「それで、また買いたくなるやつ」
[p]
#三好文子
「素敵じゃない」
[p]
#神田姫花
「それ、食べてみたいです」
[p]
#主人公
「……見えてきたかも」
[p]
#抹茶エクレア
「うん」
[p]
#抹茶エクレア
「“豪華にする”んやなくて」
[p]
#抹茶エクレア
「“ちゃんと届くようにする”やな」
[p]
#主人公
「それだ」
[p]

*scene_06_04
[eval exp="f.chapter = '06'; f.scene = '06_04'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="apr_kitchen_day.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="700"]
[chara_mod name="抹茶エクレア" face="summer_alt"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[mask_off time="650"]
#
; SCENE 04
#主人公
「じゃあ、変えるところを決めよう」
[p]
#抹茶エクレア
「全部は変えへん」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「高くしすぎへん」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「でも、今よりちょっと良くする」
[p]
#主人公
「それが一番難しい」
[p]
#抹茶エクレア
「世界一やからな」
[p]
#主人公
「便利だな、その言葉」
[p]
#抹茶エクレア
「よし」
[p]
#抹茶エクレア
「一個ずつやろ」
[p]

*choice_06_02
[clearstack stack="if"]
[cm]
#
[glink text="抹茶の香りを少しだけ前に出す" color="green" font_color="0x3B2A1B" x="310" y="205" width="660" height="100" size="21" bold="true" target="*choice_06_02_a" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="クリームを少し軽くする" color="green" font_color="0x3B2A1B" x="310" y="325" width="660" height="100" size="21" bold="true" target="*choice_06_02_b" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="サイズと価格のバランスを整える" color="green" font_color="0x3B2A1B" x="310" y="445" width="660" height="100" size="21" bold="true" target="*choice_06_02_c" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*choice_06_02_a
#主人公
「抹茶の香りを少しだけ前に出そう」
[p]
#抹茶エクレア
「濃くするんやなくて？」
[p]
#主人公
「三好さんが言ってた。“残る”くらい」
[p]
#抹茶エクレア
「……なるほど」
[p]
#抹茶エクレア
「強さやなくて、余韻やな」
[p]
#主人公
「そういうこと」
[p]
#抹茶エクレア
「ちょっと格好ええやん」
[p]
#主人公
「味の話ね」
[p]
[jump target="*scene_06_05"]

*choice_06_02_b
#主人公
「クリームを少し軽くしよう」
[p]
#抹茶エクレア
「抹茶感、薄ならへん？」
[p]
#主人公
「そこは残す」
[p]
#抹茶エクレア
「軽くして、弱くせえへん」
[p]
#主人公
「難しい？」
[p]
#抹茶エクレア
「難しい」
[p]
#抹茶エクレア
「でも、おもろい」
[p]
#主人公
「ならやろう」
[p]
[jump target="*scene_06_05"]

*choice_06_02_c
#主人公
「サイズと価格のバランスを整えよう」
[p]
#抹茶エクレア
「味ちゃうん？」
[p]
#主人公
「食べてもらえなきゃ、味まで届かない」
[p]
#抹茶エクレア
「……五月みたいやな」
[p]
#主人公
「全部つながってるんだよ」
[p]
#抹茶エクレア
「ほな、ちゃんと届く一個にしよ」
[p]
[jump target="*scene_06_05"]

*scene_06_05
[eval exp="f.chapter = '06'; f.scene = '06_05'"]
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
[chara_mod name="三好文子" face="summer"]
[chara_show name="三好文子" left="75" top="115"]
#三好文子
「あら、新しくなったの？」
[p]
#抹茶エクレア
「ちょっとだけ」
[p]
#主人公
「大改造ではないです」
[p]
#三好文子
「ふふ。それくらいがいいわね」
[p]
#抹茶エクレア
「食べてみて」
[p]
#三好文子
「……うん」
[p]
#抹茶エクレア
「どう？」
[p]
#三好文子
「前より、抹茶がちゃんと残るわね」
[p]
#主人公
「重くないですか？」
[p]
#三好文子
「大丈夫」
[p]
#抹茶エクレア
「よっしゃ」
[p]
#三好文子
「でも」
[p]
#抹茶エクレア
「でも？」
[p]
#三好文子
「前のも好きだったわよ」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「全部変えなくてよかったな」
[p]
#抹茶エクレア
「せやな」
[p]
[wait time="250"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_hide name="三好文子"]
[chara_mod name="神田姫花" face="summer_normal"]
[chara_show name="神田姫花" left="75" top="105"]
#神田姫花
「こんにちは」
[p]
#抹茶エクレア
「いらっしゃいませ！」
[p]
#神田姫花
「あ、新しいやつ」
[p]
#主人公
「少しだけ変えました」
[p]
#神田姫花
「一個ください」
[p]
#主人公
「ありがとうございます」
[p]
#神田姫花
「……あ」
[p]
#抹茶エクレア
「どしたん？」
[p]
#神田姫花
「この値段なら」
[p]
#神田姫花
「もう一個、友達の分も」
[p]
#抹茶エクレア
「……！」
[p]
[eval exp="sf.cg_june_event_02 = true"]
[skipstop]
[chara_hide name="抹茶エクレア"]
[chara_hide name="神田姫花"]
[bg storage="cg/june/CG06_02_Two_Please.png" time="500"]
#主人公
「二個ですね」
[p]
#神田姫花
「はい」
[p]
#抹茶エクレア
「ありがと！」
[p]
#主人公
「声大きい」
[p]
#抹茶エクレア
「ええやん今日は！」
[p]

*scene_06_06
[eval exp="f.chapter = '06'; f.scene = '06_06'"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="apr_shop_night.png" time="0"]
[xchgbgm storage="06_One_Year_One_Eclair.mp3" time="700"]
[chara_mod name="抹茶エクレア" face="summer_quiet"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[mask_off time="650"]
#抹茶エクレア
「なあ」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「五月は“また来てもらう”やったやろ」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「六月は」
[p]
#抹茶エクレア
「“また買える”なんかもしれへんな」
[p]
#主人公
「また買える？」
[p]
#抹茶エクレア
「美味しいけど、一回で終わるんやなくて」
[p]
#抹茶エクレア
「店も続けられて」
[p]
#抹茶エクレア
「お客さんも、また手ぇ伸ばせて」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「それでちゃんと、前より良くなってる」
[p]
#主人公
「欲張りだな」
[p]
#抹茶エクレア
「世界一やから」
[p]
#主人公
「結局そこに戻るんだ」
[p]
#抹茶エクレア
「でも」
[p]
#抹茶エクレア
「前みたいに“高い＝世界一”とは思ってへんで」
[p]
#主人公
「成長したね」
[p]
#抹茶エクレア
「今度は素直に褒めてる？」
[p]
#主人公
「たぶん」
[p]
#抹茶エクレア
「なんやそれ」
[p]

*june_clear
[iscript]
sf.normal_ch06_clear = true;
f.chapter = "06"; f.scene = "clear"; f.current_clear_month = "06";
[endscript]
[skipstop]
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
6月 CLEAR『また買える味』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
良くするために、全部を豪華にする必要はなかった。
[p]
店が続けられて、お客さんがもう一度手を伸ばせて、
[r]
それでも少しだけ「前より良い」。
[p]
六月に見つけたのは、特別すぎない改良だった。
[p]
[jump target="*june_clear_menu"]

*june_clear_menu
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
6月 CLEAR『また買える味』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
抹茶ちゃんのひとこと
[r]
「世界一でも、また買えるくらい近い方がええんやな」
[resetfont]
[glink text="タイトルへ" color="green" font_color="0x3B2A1B" x="675" y="150" width="400" height="85" size="23" bold="true" storage="title_screen.ks" target="*title" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="記録" color="green" font_color="0x3B2A1B" x="675" y="245" width="400" height="85" size="23" bold="true" storage="system_common.ks" target="*records_from_clear" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="7月へ" color="green" font_color="0x3B2A1B" x="675" y="340" width="400" height="85" size="23" bold="true" storage="n07_july.ks" target="*eyecatch_06_07" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[s]

*records_from_clear
[jump storage="system_common.ks" target="*records_from_clear"]
