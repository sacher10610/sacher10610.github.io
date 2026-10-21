; CHAPTER 12 / DECEMBER - 完売、そして倒れる
; Adopted December v2 text. Final in-app verification is performed by the user.
*eyecatch_11_12
[skipstop]
[clearstack stack="if"]
[cm]
[clearfix]
[call storage="system_common.ks"]
[call storage="system/future_character_define.ks"]
[stopbgm fadeout="true" time="1000"]
[mask time="700" color="0x000000"]
[wait time="300"]
[stopse]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="eyecatch/EYECATCH_11_12_DECEMBER.png" time="0"]
[tb_hide_message_window]
[mask_off time="400"]
[playse storage="SE_EYECATCH_05_06_Jingle.wav" volume="75" loop="false"]
[wait time="3100"]
[mask time="400" color="0x000000"]
[stopse]
[jump target="*scene_12_01"]

*scene_12_01
[call storage="system_common.ks"]
[call storage="system/future_character_define.ks"]
[clearstack stack="if"]
[cm]
[clearfix]
[hidemenubutton]
[chara_config pos_mode="false"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="apr_kitchen_morning.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
[restore_april_quick_menu]
[eval exp="f.chapter = '12'; f.scene = '12_01'"]
[mask_off time="500"]
#主人公
「予約、増えてる」
[p]
#抹茶エクレア
「ええやん！」
[p]
#主人公
「うん。いいことなんだけど」
[p]
#抹茶エクレア
「“けど”？」
[p]
#主人公
「思ってたより多い」
[p]
#抹茶エクレア
「クリスマスやしな」
[p]
#主人公
「11月に決めた上限、覚えてる？」
[p]
#抹茶エクレア
「覚えてるで」
[p]
#主人公
「何個？」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「覚えてない？」
[p]
#抹茶エクレア
「覚えてる。数字がいっぱいあったんや」
[p]
#主人公
「それは覚えてないって言うんだよ」
[p]
#抹茶エクレア
「でも、無理せんように決めたんやろ？」
[p]
#主人公
「そう。普段の営業と、予約の両方を続けられる数」
[p]
#抹茶エクレア
「ほな、それでええやん」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「何や、その顔」
[p]
#主人公
「断るの、ちょっと苦手で」
[p]
#抹茶エクレア
「知ってる」
[p]
#主人公
「即答するね」
[p]
#抹茶エクレア
「八月も九月も、お客さん増やそうって頑張ったやん」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「やっと来てくれた人に、ないですって言うの、嫌なんやろ」
[p]
#主人公
「……うん」
[p]
#抹茶エクレア
「分かるで」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「でも、十一月に一緒に決めたやん」
[p]
#主人公
「決めたね」
[p]
#抹茶エクレア
「まずは、今日の仕込みから」
[p]
#主人公
「抹茶ちゃんがその台詞を言う日が来るなんて」
[p]
#抹茶エクレア
「成長したんや」
[p]
#主人公
「そうだね」
[p]
#抹茶エクレア
「で、今日は何個？」
[p]
#主人公
「千個じゃないよ」
[p]
#抹茶エクレア
「まだ言うてへん！」
[p]
#主人公
「予防線」
[p]
[wait time="300"]
#主人公
「今年は、店のクリスマスをちゃんと迎えたいな」
[p]
#抹茶エクレア
「ウチもや」
[p]
#抹茶エクレア
「店に来てから初めてのクリスマスやし」
[p]
#主人公
「そうか。抹茶ちゃんにとっては初めてだね」
[p]
#抹茶エクレア
「ちゃんと忙しくして、ちゃんと楽しみたい」
[p]
#主人公
「両立、できるかな」
[p]
#抹茶エクレア
「二人で考えたらええやん」
[p]

*scene_12_02
[eval exp="f.chapter = '12'; f.scene = '12_02'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="apr_shop_morning.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#主人公
「予約票、ここにまとめておいた」
[p]
#抹茶エクレア
「多いなあ」
[p]
#主人公
「受け取り日、個数、商品、連絡先」
[p]
#抹茶エクレア
「ほな、順番に作るだけやな」
[p]
#主人公
「その“順番”を間違えないようにしたい」
[p]
#抹茶エクレア
「分かった」
[p]
#主人公
「包装もいつもと違うから、混ざると困る」
[p]
#抹茶エクレア
「クリスマス限定の帯紙、かわええで」
[p]
#主人公
「かわいいけど、作る順番と別に管理しよう」
[p]
#抹茶エクレア
「……賢そうなこと言うな」
[p]
#主人公
「店主だからね」
[p]
#抹茶エクレア
「そうやった」
[p]
#主人公
「忘れないで」
[p]

*choice_12_00
[eval exp="f.chapter = '12'; f.scene = '12_choice_00'"]
[clearstack stack="if"]
[cm]
[glink text="予約票を目立つところに全部貼ろう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="150" bold="true" target="*mini_m06_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="特別感を出すため、リボンを何重にも結ぼう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="245" bold="true" target="*mini_m07_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="受け取り日ごとに一覧にしよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="340" bold="true" target="*correct_12_00" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*mini_m06_entry
[if exp="sf.mini_bad_m06 === true"]
[cm]
#
その結末は、もう知っている。
[r]
MINI BAD M06『予約票タワー』
[p]
[jump target="*choice_12_00"]
[endif]
[jump target="*mini_12_m06"]

*mini_12_m06
[eval exp="f.chapter = '12'; f.scene = '12_mini_m06'"]
[cm]
#主人公
「予約票を、全部壁に貼っておこう」
[p]
#抹茶エクレア
「おお。店中で確認できるやん！」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「……」
[p]
[skipstop]
[eval exp="sf.cg_december_mini_01 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[image layer="1" name="december_sdcg_image" folder="bgimage" storage="cg/december/SD12_01_MiniBad006_Reservation_Tower.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="december_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#抹茶エクレア
「壁、見えへん」
[p]
#主人公
「まだ貼り終わってない」
[p]
#抹茶エクレア
「クリスマスツリーより高いで」
[p]
#主人公
「まさか」
[p]
#抹茶エクレア
「あっ。あれ、何日の予約？」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「全部はがして確認しようか」
[p]
#抹茶エクレア
「なんでやねん！」
[p]
[free layer="1" name="december_sdcg_image"]
[free layer="1" name="december_sdcg_frame"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[iscript]
f.april_bad = {"kind": "MINI", "id": "m06", "title": "予約票タワー", "lesson": "「目立つことと、見つけやすいことは違うんやな……」", "retry": "*choice_12_00", "storage": "n12_december.ks", "month": "12"};
[endscript]
[register_mini_bad id="m06"]
[call storage="system_common.ks" target="*show_mini_bad"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="apr_shop_morning.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
[jump target="*choice_12_00"]

*mini_m07_entry
[if exp="sf.mini_bad_m07 === true"]
[cm]
#
その結末は、もう知っている。
[r]
MINI BAD M07『リボンの迷宮』
[p]
[jump target="*choice_12_00"]
[endif]
[jump target="*mini_12_m07"]

*mini_12_m07
[eval exp="f.chapter = '12'; f.scene = '12_mini_m07'"]
[cm]
#主人公
「今年は特別だから、包装をもっと豪華にしよう」
[p]
#抹茶エクレア
「ええやん！」
[p]
#主人公
「この箱に二本。上からもう一本」
[p]
#抹茶エクレア
「かわええ！」
[p]
#主人公
「それから飾りを追加して」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「……」
[p]
[skipstop]
[eval exp="sf.cg_december_mini_02 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[image layer="1" name="december_sdcg_image" folder="bgimage" storage="cg/december/SD12_02_MiniBad007_Ribbon_Maze.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="december_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#抹茶エクレア
「これ、どっから開けるん？」
[p]
#主人公
「端を引っ張れば」
[p]
#抹茶エクレア
「……開かへん」
[p]
#主人公
「いや、ちょっと貸して」
[p]
#抹茶エクレア
「今、箱と戦ってる場合ちゃうで！」
[p]
[wait time="300"]
#主人公
「包装だけで、こんなに時間が……」
[p]
#抹茶エクレア
「特別すぎて、食べる前にクリスマス終わるわ！」
[p]
[free layer="1" name="december_sdcg_image"]
[free layer="1" name="december_sdcg_frame"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[iscript]
f.april_bad = {"kind": "MINI", "id": "m07", "title": "リボンの迷宮", "lesson": "「中身より箱に時間かけたら、何屋か分からんくなるわ……」", "retry": "*choice_12_00", "storage": "n12_december.ks", "month": "12"};
[endscript]
[register_mini_bad id="m07"]
[call storage="system_common.ks" target="*show_mini_bad"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="apr_shop_morning.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
[jump target="*choice_12_00"]

*correct_12_00
[eval exp="f.chapter = '12'; f.scene = '12_choice00_correct'"]
[cm]
#主人公
「受け取り日ごとに一覧にしよう」
[p]
#抹茶エクレア
「で、包装の種類も分ける」
[p]
#主人公
「そう。あと、予備の分も数えて」
[p]
#抹茶エクレア
「なるほど。壁も箱も助かったな」
[p]
#主人公
「壁？」
[p]
#抹茶エクレア
「なんでもない」
[p]
#主人公
「……？」
[p]

*scene_12_03
[eval exp="f.chapter = '12'; f.scene = '12_03'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_mod name="三好文子" face="default"]
[chara_show name="三好文子" left="80" top="90" time="300"]
#三好文子
「こんにちは」
[p]
#主人公
「いらっしゃいませ、三好さん」
[p]
#抹茶エクレア
「三好さん！」
[p]
#三好文子
「すっかりクリスマスね」
[p]
#抹茶エクレア
「せやろ。包装も変えたで」
[p]
#三好文子
「可愛いわ」
[p]
#主人公
「ありがとうございます」
[p]
#三好文子
「……忙しそうね」
[p]
#主人公
「おかげさまで」
[p]
#三好文子
「それなら、いいこと」
[p]
[wait time="300"]
#三好文子
「でも、店主さん」
[p]
#主人公
「はい」
[p]
#三好文子
「少し、肩に力が入ってるわよ」
[p]
#主人公
「そうですか？」
[p]
#三好文子
「前から、そういうところがあるから」
[p]
#主人公
「……」
[p]
#三好文子
「昔、ご両親もこの季節は忙しそうだったわ」
[p]
#主人公
「はい」
[p]
#三好文子
「でも、忙しいときほど、ちゃんとお茶を飲んでいた」
[p]
#抹茶エクレア
「三好さん、お茶の宣伝上手やな」
[p]
#三好文子
「あら、そう聞こえた？」
[p]
#主人公
「ふふ」
[p]
#三好文子
「休む時間も、仕込みのうちってことよ」
[p]
#主人公
「……はい」
[p]
#三好文子
「じゃあ、いつものを二つお願い」
[p]
#抹茶エクレア
「おおきに！」
[p]
#三好文子
「クリスマスの日も、いつもの味が食べられるのね」
[p]
#主人公
「はい。できる限り」
[p]
#三好文子
「“できる限り”でいいのよ」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_hide name="三好文子" time="300"]
[mask time="450" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="450"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_mod name="神田姫花" face="default"]
[chara_show name="神田姫花" left="80" top="90" time="300"]
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
「予約、まだ間に合いますか？」
[p]
#主人公
「受け取り日によります。確認しますね」
[p]
#神田姫花
「ありがとうございます」
[p]
[wait time="250"]
; Whisper: the protagonist is checking reservations away from the counter.
[font size="24"]
#抹茶エクレア
「なあ、暗黒皇帝にもクリスマス休暇あるん？」
[p]
[resetfont]
; Whisper: the protagonist is checking reservations away from the counter.
[font size="24"]
#神田姫花
「……っ！ その呼び方、やめてください！」
[p]
[resetfont]
; Whisper: the protagonist is checking reservations away from the counter.
[font size="24"]
#抹茶エクレア
「そない焦らんでも」
[p]
[resetfont]
; Whisper: the protagonist is checking reservations away from the counter.
[font size="24"]
#神田姫花
「ほかの人に聞こえます！」
[p]
[resetfont]
; Whisper: the protagonist is checking reservations away from the counter.
[font size="24"]
#抹茶エクレア
「ごめんごめん。内緒やったな」
[p]
[resetfont]
#神田姫花
「……もう」
[p]
#主人公
「お待たせしました。希望の日、大丈夫ですよ」
[p]
#神田姫花
「よかった。じゃあ、二つお願いします」
[p]
#抹茶エクレア
「二個やな！」
[p]
#神田姫花
「そこは覚えてるんですね」
[p]
#抹茶エクレア
「もちろんや！」
[p]
#神田姫花
「……あの」
[p]
#主人公
「はい」
[p]
#神田姫花
「お二人とも、顔色だけは気をつけてくださいね」
[p]
#主人公
「そんなに疲れて見えます？」
[p]
#神田姫花
「ちょっとだけ」
[p]
#抹茶エクレア
「聞いた？ ちょっとだけやって」
[p]
#主人公
「そこを強調しないで」
[p]
#神田姫花
「無理しないでください」
[p]
#主人公
「ありがとうございます」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_hide name="神田姫花" time="300"]
#抹茶エクレア
「……みんな同じこと言うな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「なあ」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「疲れたら言うてな」
[p]
#主人公
「大丈夫だよ」
[p]
#抹茶エクレア
「まだ何も聞いてへんのに」
[p]
#主人公
「……癖かな」
[p]
#抹茶エクレア
「困った癖やな」
[p]

*scene_12_04
[eval exp="f.chapter = '12'; f.scene = '12_04'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="apr_kitchen_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#主人公
「今日の分、終わった」
[p]
#抹茶エクレア
「終わったあ！」
[p]
#主人公
「明日の準備もしないと」
[p]
#抹茶エクレア
「その前に休憩やろ」
[p]
#主人公
「……五分だけ」
[p]
#抹茶エクレア
「五分って」
[p]
#主人公
「じゃあ十分」
[p]
#抹茶エクレア
「最初からそう言い！」
[p]
[playse storage="se_shop_telephone_ring.wav" volume="65" loop="false" buf="1"]
#
店舗のほうで、固定電話が鳴った。
[p]
#主人公
「電話だ。ちょっと出てくる」
[p]
[mask time="350" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[bg storage="apr_shop_day.png" time="0"]
[stopse buf="1" fadeout="true" time="120"]
[mask_off time="350"]
#
受話器を取り、注文の相談を聞いた。
[p]
[mask time="500" color="0x000000"]
[cm]
[bg storage="apr_kitchen_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="500"]
#抹茶エクレア
「なんやったん？」
[p]
#主人公
「……注文の相談」
[p]
#抹茶エクレア
「今？」
[p]
#主人公
「近くの会社から。クリスマス用にまとまった数が欲しいって」
[p]
#抹茶エクレア
「おお」
[p]
#主人公
「しかも、うちのお菓子を催事で知ったらしい」
[p]
#抹茶エクレア
「九月の！」
[p]
#主人公
「そう。お店に来てくれた人が、会社でも配りたいって」
[p]
#抹茶エクレア
「……嬉しいな」
[p]
#主人公
「うん。すごく」
[p]
[wait time="300"]
#抹茶エクレア
「でも、明日の分、いっぱいなんやろ？」
[p]
#主人公
「……そうだね」
[p]
#抹茶エクレア
「追加で作れる？」
[p]
#主人公
「工夫すれば、何とか」
[p]
#抹茶エクレア
「何を工夫するん？」
[p]
#主人公
「夜を使えば」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「今日だけ、ちょっと」
[p]
#抹茶エクレア
「その“今日だけ”が、続いたら？」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「断るん、嫌なんやろ」
[p]
#主人公
「うん」
[p]
#主人公
「せっかく、Komorebiを選んでくれたんだ」
[p]
#抹茶エクレア
「分かるで」
[p]
#主人公
「今、受けられるなら、受けたい」
[p]
#抹茶エクレア
「……」
[p]
#抹茶エクレア
「なあ」
[p]
#主人公
「？」
[p]
#抹茶エクレア
「十一月、女神様に何て言われた？」
[p]
#主人公
「“無理はしないで”」
[p]
#抹茶エクレア
「せや」
[p]
#主人公
「でも、あれはただの心配だって」
[p]
#抹茶エクレア
「神様の命令やなくても、心配は心配や」
[p]
#主人公
「……」
[p]
[skipstop]
[eval exp="sf.cg_december_event_01 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="cg/december/CG12_01_Just_One_More_Order.png" time="500"]
#抹茶エクレア
「ウチも、心配してる」
[p]
[wait time="350"]
#主人公
「……どうしよう」
[p]
[mask time="450" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="apr_kitchen_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="450"]
[jump target="*choice_12_01"]

*choice_12_01
[eval exp="f.chapter = '12'; f.scene = '12_choice_01'"]
[clearstack stack="if"]
[cm]
[glink text="期待を裏切れない。全部受けて、夜も作ろう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="195" bold="true" target="*bad014_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="作れる数を守って、残りは別の日を相談しよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="290" bold="true" target="*correct_12_01" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*bad014_entry
[if exp="sf.core_bad_014 === true"]
[cm]
#
その結末は、もう知っている。
[r]
CORE BAD 014『完売、そして倒れる』
[p]
[jump target="*choice_12_01"]
[endif]
[jump target="*bad_12_014"]

*bad_12_014
[eval exp="f.chapter = '12'; f.scene = '12_bad014'"]
[cm]
#主人公
「期待を裏切れない。全部受けて、夜も作ろう」
[p]
#抹茶エクレア
「……ほんまに？」
[p]
#主人公
「今日だけ頑張ればいいから」
[p]
#抹茶エクレア
「今日だけ、やな？」
[p]
#主人公
「うん」
[p]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="apr_kitchen_night.png" time="0"]
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#主人公
「この分だけ、先に箱へ」
[p]
#抹茶エクレア
「はい」
[p]
#主人公
「次はクリームの仕込み」
[p]
#抹茶エクレア
「分かった」
[p]
#抹茶エクレア
「……なあ、もう遅いで」
[p]
#主人公
「あと少し」
[p]
#抹茶エクレア
「さっきも言うた」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「顔、青い」
[p]
#主人公
「そう？」
[p]
#抹茶エクレア
「手、止まってる」
[p]
#主人公
「……ごめん」
[p]
#抹茶エクレア
「謝らんでええから、座って」
[p]
#主人公
「でも、まだ」
[p]
#抹茶エクレア
「まだちゃう！」
[p]
[wait time="350"]
#主人公
「……少し休んだら、戻るよ」
[p]
#抹茶エクレア
「うん。ちゃんと休も」
[p]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="apr_kitchen_morning.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#主人公
「……最後の箱」
[p]
#抹茶エクレア
「全部？」
[p]
#主人公
「うん。予約分、全部そろった」
[p]
#抹茶エクレア
「……ほんまに？」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「……なあ、もうええよ」
[p]
#主人公
「え？」
[p]
#抹茶エクレア
「ここからはウチがやる」
[p]
#主人公
「大丈夫。店を開けないと」
[p]
#抹茶エクレア
「大丈夫ちゃう。顔見たら分かる」
[p]
#主人公
「……あと少し」
[p]
[skipstop]
[eval exp="sf.cg_december_event_02 = true"]
[mask time="120" color="0x000000"]
[cm]
[wait time="180"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="cg/december/CG12_02_Sold_Out_Then_Collapse.png" time="0"]
[mask_off time="220"]
#抹茶エクレア
「……っ！」
[p]
#抹茶エクレア
「なあ！　聞こえる！？」
[p]
[mask time="900" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="apr_shop_night.png" time="0"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#抹茶エクレア
「……注文、全部そろったのに」
[p]
#抹茶エクレア
「今日の店、開けられへん」
[p]
#抹茶エクレア
「喜んでもらいたかったんは、ほんまや」
[p]
#抹茶エクレア
「でも」
[p]
#抹茶エクレア
「一緒に店やる人がおらへんかったら……」
[p]
[wait time="350"]
#抹茶エクレア
「完売したって、何の意味があるんやろ」
[p]
[iscript]
f.april_bad = {"kind": "CORE", "id": "014", "title": "完売、そして倒れる", "lesson": "「売り切れるより、あんたがちゃんと店におる方が大事や。ウチ、一人で世界一なっても嬉しないで」", "retry": "*choice_12_01", "storage": "n12_december.ks", "month": "12"};
[endscript]
[register_core_bad id="014"]
[call storage="system_common.ks" target="*show_core_bad"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="apr_kitchen_day.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
[jump target="*choice_12_01"]

*correct_12_01
[eval exp="f.chapter = '12'; f.scene = '12_choice01_correct'"]
[cm]
#主人公
「作れる数を守ろう」
[p]
#抹茶エクレア
「……うん」
[p]
#主人公
「全部は受けられない。残りは、別の日にしてもらえるか相談する」
[p]
#抹茶エクレア
「お客さん、残念がるかもしれへんな」
[p]
#主人公
「そうだね」
[p]
#抹茶エクレア
「でも、無理して店閉める方がもっと困る」
[p]
#主人公
「……うん」
[p]
#抹茶エクレア
「正直に言お」
[p]
#主人公
「そうしよう」
[p]
[wait time="250"]
#主人公
「……」
[p]
#抹茶エクレア
「どない？」
[p]
#主人公
「一部だけクリスマス前に。それ以外は年末に受け取れるならお願いしたいって」
[p]
#抹茶エクレア
「ええん！？」
[p]
#主人公
「うん。そもそも必要な日は、全部同じじゃなかったらしい」
[p]
#抹茶エクレア
「聞いてみるもんやな」
[p]
#主人公
「十一月に学んだことだね」
[p]
#抹茶エクレア
「女神様、役に立ってるやん」
[p]
#主人公
「ちゃんと覚えてたんだ」
[p]
#抹茶エクレア
「ウチ、成長したんやで」
[p]
#主人公
「そうだね」
[p]
[wait time="300"]
#主人公
「受ける数を減らすって、負けた感じがしてた」
[p]
#抹茶エクレア
「九月みたいやな」
[p]
#主人公
「……うん」
[p]
#抹茶エクレア
「でも、何と勝負してんの？」
[p]
[wait time="250"]
#主人公
「……」
[p]
#抹茶エクレア
「今回は売上やなくて、昨日の自分か？」
[p]
#主人公
「そうかも」
[p]
#抹茶エクレア
「ウチら、ずっとここで店やるんやろ」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「ほな、今日で全部使い切ったらあかん」
[p]
#主人公
「……そうだね」
[p]

*scene_12_05
[eval exp="f.chapter = '12'; f.scene = '12_05'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#抹茶エクレア
「最後の予約分、渡したで！」
[p]
#主人公
「ありがとう」
[p]
#抹茶エクレア
「今日の分も、あとちょっと」
[p]
#主人公
「予定してた数はちゃんと作れたね」
[p]
#抹茶エクレア
「うん」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_mod name="三好文子" face="default"]
[chara_show name="三好文子" left="80" top="90" time="300"]
#三好文子
「こんにちは」
[p]
#主人公
「いらっしゃいませ」
[p]
#抹茶エクレア
「三好さん、メリークリスマス！」
[p]
#三好文子
「メリークリスマス」
[p]
#三好文子
「今日はちゃんと休めてる？」
[p]
#主人公
「休憩、取ってます」
[p]
#三好文子
「あら、それは安心」
[p]
#抹茶エクレア
「ウチが見張ってるからな」
[p]
#主人公
「監督が厳しいんです」
[p]
#三好文子
「頼もしい監督ね」
[p]
#抹茶エクレア
「せやろ！」
[p]
[skipstop]
[eval exp="sf.cg_december_event_03 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="cg/december/CG12_03_The_Last_Customer_of_the_Year.png" time="500"]
#三好文子
「……いつもの抹茶エクレア、二つお願い」
[p]
#主人公
「はい」
[p]
#抹茶エクレア
「ちょうどあと二つやで」
[p]
#三好文子
「それじゃ、私が今年の最後のお客さんかしら」
[p]
#主人公
「今日は、そうなりそうです」
[p]
#三好文子
「そう」
[p]
[wait time="300"]
#三好文子
「ご両親がいた頃も、この季節はよく売り切れていたわ」
[p]
#主人公
「……はい」
[p]
#三好文子
「でもね」
[p]
#主人公
「？」
[p]
#三好文子
「いつ来ても、ちゃんと次の日がある店だった」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「……そうですね」
[p]
#三好文子
「今も、そういう店でいてね」
[p]
#主人公
「はい」
[p]
#三好文子
「ごちそうさま。二人も、いいクリスマスを」
[p]
#抹茶エクレア
「三好さんも！」
[p]
[mask time="350" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="三好文子" face="default"]
[chara_show name="三好文子" left="80" top="90" time="300"]
[mask_off time="350"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_hide name="三好文子" time="300"]
#抹茶エクレア
「完売や」
[p]
#主人公
「うん。今日、作るって決めてた分だけね」
[p]
#抹茶エクレア
「……なんか」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「前より、気持ちええな」
[p]
#主人公
「全部の注文を取れたわけじゃないけどね」
[p]
#抹茶エクレア
「それでも、ちゃんと作ったやん」
[p]
#主人公
「そうだね」
[p]
#抹茶エクレア
「しかも」
[p]
#主人公
「うん？」
[p]
#抹茶エクレア
「今夜はちゃんと寝られる」
[p]
#主人公
「そこが一番大事？」
[p]
#抹茶エクレア
「今日はな」
[p]
#主人公
「……そうかも」
[p]

*scene_12_06
[eval exp="f.chapter = '12'; f.scene = '12_06'"]
[mask time="700" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[bg storage="apr_kitchen_morning.png" time="0"]
[xchgbgm storage="06_One_Year_One_Eclair.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="700"]
#主人公
「今月の数字、まとめたよ」
[p]
#抹茶エクレア
「どないやった？」
[p]
#主人公
「去年より、ずっとよかった」
[p]
#抹茶エクレア
「やったやん！」
[p]
#主人公
「うん。でも、全部の注文を受けたわけじゃない」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「前だったら、それがずっと気になってたと思う」
[p]
#抹茶エクレア
「今は？」
[p]
#主人公
「今は、来年もこの店で作れる方がいいと思う」
[p]
#抹茶エクレア
「……うん」
[p]
#主人公
「これまで、抹茶ちゃんを止めることばかりだったね」
[p]
#抹茶エクレア
「そうやな。千個あかん、パフェあかん、勝負あかん」
[p]
#主人公
「全部が全部、だめだったわけじゃないよ」
[p]
#抹茶エクレア
「でも、止めてもろたから気づけたこと、いっぱいある」
[p]
#主人公
「……うん」
[p]
#抹茶エクレア
「今度は、ウチの番や」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「あんた、一人で背負いすぎやねん」
[p]
#主人公
「……そうだね」
[p]
#抹茶エクレア
「言うてくれたら、一緒に考えるのに」
[p]
#主人公
「店は自分が守らないと、ってずっと思ってたから」
[p]
#抹茶エクレア
「分かるで」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「でも、今はウチもおるやろ」
[p]
#主人公
「……うん」
[p]
#抹茶エクレア
「せやから、あんたの仕事は全部背負うことちゃう」
[p]
#主人公
「じゃあ、何だろう」
[p]
#抹茶エクレア
「明日も、一緒に作れるようにすること」
[p]
[wait time="350"]
#主人公
「……いい言葉だね」
[p]
#抹茶エクレア
「世界一のパティシエが言いそうやろ」
[p]
#主人公
「まだ世界一じゃないよ」
[p]
#抹茶エクレア
「予約や、予約！」
[p]
#主人公
「そっか」
[p]
#抹茶エクレア
「なあ」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「今年最後の仕込みやな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「来年も、ここで作ろな」
[p]
#主人公
「もちろん」
[p]
#抹茶エクレア
「……ほな」
[p]
#主人公
「うん」
[p]
[chara_mod name="抹茶エクレア" face="default"]
#抹茶エクレア
「まず、お茶飲も」
[p]
#主人公
「……仕込みじゃないの？」
[p]
#抹茶エクレア
「休むんも仕込みのうちやろ」
[p]
#主人公
「三好さんみたいだね」
[p]
#抹茶エクレア
「ええ言葉は使わな損や！」
[p]

*december_clear
[iscript]
sf.normal_ch12_clear = true; f.chapter = "12"; f.scene = "clear"; f.current_clear_month = "12";
[endscript]
[skipstop]
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
12月 CLEAR『明日も仕込みができるように』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
クリスマスの注文は、予想以上に増えた。
全部を引き受ければ、数字はもっと伸びたかもしれない。
[p]
けれど二人は、作れる数を守り、足りない分は日を改めて相談した。
完売して終わりではない。
[p]
来年も同じ厨房で作るために、休むことも店の仕事なのだと知った。
[p]
[jump target="*december_clear_menu"]

*december_clear_menu
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
12月 CLEAR『明日も仕込みができるように』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
抹茶ちゃんのひとこと
[r]
「世界一になっても、次の日にウチらがおらへんかったら意味ないもんな。明日も作れる店にしよ！」
[resetfont]
[glink text="タイトルへ" color="green" font_color="0x3B2A1B" x="675" width="400" height="85" size="23" y="150" bold="true" storage="title_screen.ks" target="*title" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="記録" color="green" font_color="0x3B2A1B" x="675" width="400" height="85" size="23" y="245" bold="true" storage="system_common.ks" target="*records_from_clear" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="1月へ" color="green" font_color="0x3B2A1B" x="675" y="340" width="400" height="85" size="23" bold="true" storage="n01_january.ks" target="*eyecatch_12_01" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[s]
