; FEBRUARY / 第11章 帰還最優先
; Adopted February v2. Runtime verification is performed by the user.
*eyecatch_01_02
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
[bg storage="eyecatch/EYECATCH_01_02_FEBRUARY.png" time="1"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"contain", "background-repeat":"no-repeat", "background-position":"center", "background-color":"#fff9e5"});
[endscript]
[tb_hide_message_window]
[mask_off time="400"]
[playse storage="SE_EYECATCH_05_06_Jingle.wav" volume="75" loop="false"]
[wait time="3100"]
[mask time="400" color="0x000000"]
[stopse]
[jump target="*scene_02_01"]

*scene_02_01
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_kitchen_morning.png" time="1"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
[restore_april_quick_menu]
[eval exp="f.chapter = '02'; f.scene = '02_01'"]
[mask_off time="500"]
#主人公
「二月になったね」
[p]
#抹茶エクレア
「二月やな」
[p]
#主人公
「期限まで、あと二か月を切った」
[p]
#抹茶エクレア
「三月末までやからな」
[p]
#主人公
「この前、四月だった気がする」
[p]
#抹茶エクレア
「それはさすがに前すぎるやろ」
[p]
#主人公
「抹茶ちゃんが厨房に落ちてきた日」
[p]
#抹茶エクレア
「落ちてへん。降り立ったんや」
[p]
#主人公
「床に座ってたけど」
[p]
#抹茶エクレア
「着地したんや」
[p]
#主人公
「そういうことにしておこう」
[p]
[wait time="300"]
#抹茶エクレア
「なあ、店」
[p]
#主人公
「うん？」
[p]
#抹茶エクレア
「前より、ずっとお客さん来るようになったな」
[p]
#主人公
「うん。年末の予約も、初めて来た人が何人もいた」
[p]
#抹茶エクレア
「一月は採点に夢中になってもうたけど」
[p]
#主人公
「おかげで味は安定したよ」
[p]
#抹茶エクレア
「点数の外にも、おいしいがあるって分かったし」
[p]
#主人公
「そうだね」
[p]
#抹茶エクレア
「ええ一年になってきたなあ」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「どないしたん？」
[p]
#主人公
「いや。もうすぐ、その一年が終わるなって」
[p]
#抹茶エクレア
「せやな。世界一にならな」
[p]
#主人公
「うん」
[p]
[wait time="350"]
#主人公
「……十一月の話、覚えてる？」
[p]
#抹茶エクレア
「女神様の？」
[p]
#主人公
「条件を達成したら、帰れるって」
[p]
#抹茶エクレア
「覚えてるで」
[p]
#主人公
「帰るのは、義務じゃないとも言ってたね」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「……そっか」
[p]
#抹茶エクレア
「？」
[p]
#主人公
「ごめん。今日の材料、確認しよう」
[p]
#抹茶エクレア
「話、終わるん早ない？」
[p]
#主人公
「まだ始まってなかったから」
[p]
#抹茶エクレア
「変なやつやなあ」
[p]
#主人公
「今さら？」
[p]
#抹茶エクレア
「今さらや」
[p]

*scene_02_02
[eval exp="f.chapter = '02'; f.scene = '02_02'"]
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_kitchen_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="450"]
#主人公
「この棚、整理してもいい？」
[p]
#抹茶エクレア
「ええけど。何入ってるん？」
[p]
#主人公
「去年のレシピノートと、材料の予備」
[p]
#抹茶エクレア
「懐かし」
[p]
#主人公
「四月の試作メモ、出てきた」
[p]
#抹茶エクレア
「千個のやつ？」
[p]
#主人公
「もちろん」
[p]
#抹茶エクレア
「それ、もう殿堂入りやな」
[p]
#主人公
「消した方がいいかな」
[p]
#抹茶エクレア
「消したらあかん。戒めや」
[p]
#主人公
「それなら残そう」
[p]
#主人公
「……抹茶ちゃんの字だ」
[p]
#抹茶エクレア
「どれ？」
[p]
#主人公
「“クリームは香りが先。甘さはあとから”」
[p]
#抹茶エクレア
「おお。それウチが書いた」
[p]
#主人公
「七月の頃かな」
[p]
#抹茶エクレア
「暑い時やな」
[p]
#主人公
「こういうの、ちゃんとまとめておかなきゃね」
[p]
#抹茶エクレア
「今までの配合？」
[p]
#主人公
「うん。どの季節に何を変えたかも」
[p]
#抹茶エクレア
「次の夏も使えるもんな」
[p]
#主人公
「……そうだね」
[p]
[wait time="300"]
#抹茶エクレア
「なんや、また変な顔」
[p]
#主人公
「変な顔してた？」
[p]
#抹茶エクレア
「してた」
[p]
#主人公
「……いろいろ、整理しておきたくて」
[p]
#抹茶エクレア
「年末大掃除、二か月遅れ？」
[p]
#主人公
「そういうことにしといて」
[p]
#抹茶エクレア
「またそれや」
[p]
#主人公
「そういえば、もしもの時に備えて……」
[p]
#抹茶エクレア
「もしも？」
[p]
#主人公
「いや、何から始めるのがいいんだろう」
[p]

*choice_02_00
[eval exp="f.chapter = '02'; f.scene = '02_choice_00'"]
[clearstack stack="if"]
[cm]
[glink text="必要そうなものを、全部箱に詰めておこう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="150" bold="true" target="*mini_m10_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="帰る時のお土産を、先にたくさん用意しよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="245" bold="true" target="*mini_m11_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="箱より先に、仕事と予定を整理しよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="340" bold="true" target="*correct_02_00" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*mini_m10_entry
[if exp="sf.mini_bad_m10 === true"]
[cm]
#
その結末は、もう知っている。
[r]
MINI BAD M10『厨房まるごと荷造り』
[p]
[jump target="*choice_02_00"]
[endif]
[jump target="*mini_02_m10"]

*mini_02_m10
[eval exp="f.chapter = '02'; f.scene = '02_mini_m10'"]
[cm]
#主人公
「先に荷造りしておこうか」
[p]
#抹茶エクレア
「何を？」
[p]
#主人公
「必要そうなもの」
[p]
#抹茶エクレア
「ほな、これとこれと……」
[p]
#抹茶エクレア
「ボウル入れたで」
[p]
#主人公
「泡立て器も」
[p]
#抹茶エクレア
「絞り袋も」
[p]
#主人公
「計量器も」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「なあ」
[p]
#主人公
「何？」
[p]
[preload storage="./data/bgimage/cg/february/SD14_01_MiniBad010_Kitchen_Packing.png" wait="true"]
[skipstop]
[eval exp="sf.cg_february_mini_01 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[image layer="1" name="february_sdcg_image" folder="bgimage" storage="cg/february/SD14_01_MiniBad010_Kitchen_Packing.png" x="320" y="100" width="640" visible="true"]
[image layer="1" name="february_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#抹茶エクレア
「今日のクリーム、何で混ぜるん？」
[p]
#主人公
「泡立て器で」
[p]
#抹茶エクレア
「どこに？」
[p]
#主人公
「……箱の中」
[p]
#抹茶エクレア
「何番の？」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「まさか、全部開けるん？」
[p]
#主人公
「うん。開けよう」
[p]
#抹茶エクレア
「店、引っ越しするんちゃうで！？」
[p]
[free layer="1" name="february_sdcg_image"]
[free layer="1" name="february_sdcg_frame"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[iscript]
f.april_bad = {"kind": "MINI", "id": "m10", "title": "厨房まるごと荷造り", "lesson": "「先のこと考えるんもええけど、今日のエクレア作れへんかったらあかんやろ！」", "retry": "*choice_02_00", "storage": "n02_february.ks", "month": "02"};
[endscript]
[register_mini_bad id="m10"]
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_kitchen_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
[jump target="*choice_02_00"]

*mini_m11_entry
[if exp="sf.mini_bad_m11 === true"]
[cm]
#
その結末は、もう知っている。
[r]
MINI BAD M11『お土産、誰の分？』
[p]
[jump target="*choice_02_00"]
[endif]
[jump target="*mini_02_m11"]

*mini_02_m11
[eval exp="f.chapter = '02'; f.scene = '02_mini_m11'"]
[cm]
#主人公
「帰る時のお土産も、用意しておこうか」
[p]
#抹茶エクレア
「ええな！　抹茶エクレアいっぱい持って帰ったろ！」
[p]
#主人公
「向こうでお世話になった人にも配れるように」
[p]
#抹茶エクレア
「ほな、箱もかわいくしよ！」
[p]
#主人公
「これで、みんなに渡せるかな」
[p]
[preload storage="./data/bgimage/cg/february/SD14_02_MiniBad011_Gifts_For_Whom.png" wait="true"]
[skipstop]
[eval exp="sf.cg_february_mini_02 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[image layer="1" name="february_sdcg_image" folder="bgimage" storage="cg/february/SD14_02_MiniBad011_Gifts_For_Whom.png" x="320" y="100" width="640" visible="true"]
[image layer="1" name="february_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#抹茶エクレア
「……誰に？」
[p]
#主人公
「え？」
[p]
#抹茶エクレア
「誰に配るん？」
[p]
#主人公
「……知り合いとか？」
[p]
#抹茶エクレア
「何人？」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「その人ら、抹茶好きなん？」
[p]
#主人公
「……分からない」
[p]
#抹茶エクレア
「女神様の分やったら、こっちで食べてもらえるしな」
[p]
#主人公
「……そもそも、まだ世界一になってないね」
[p]
#抹茶エクレア
「順番、全部逆やん！」
[p]
[free layer="1" name="february_sdcg_image"]
[free layer="1" name="february_sdcg_frame"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[iscript]
f.april_bad = {"kind": "MINI", "id": "m11", "title": "お土産、誰の分？", "lesson": "「気持ちは嬉しいけど、渡す相手も分からんまま山ほど作ってどないすんねん！」", "retry": "*choice_02_00", "storage": "n02_february.ks", "month": "02"};
[endscript]
[register_mini_bad id="m11"]
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_kitchen_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
[jump target="*choice_02_00"]

*correct_02_00
[eval exp="f.chapter = '02'; f.scene = '02_choice00_correct'"]
[cm]
#主人公
「箱より先に、仕事と予定を整理しよう」
[p]
#抹茶エクレア
「それはそうやな。まだ使う道具もいっぱいあるし」
[p]
#主人公
「まずは今月の注文と、来月までの準備」
[p]
#抹茶エクレア
「世界一の方もな」
[p]
#主人公
「うん。そっちが先だ」
[p]

*scene_02_03
[eval exp="f.chapter = '02'; f.scene = '02_03'"]
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_shop_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
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
「いつもの、二つください」
[p]
#抹茶エクレア
「二つやな。覚えたで」
[p]
#神田姫花
「もう半年以上買ってますからね」
[p]
#主人公
「確かに」
[p]
#神田姫花
「……あの、来月もここに来たら買えますよね？」
[p]
#抹茶エクレア
「当たり前やん！」
[p]
#主人公
「はい。営業時間も、今のところ変える予定はないです」
[p]
#神田姫花
「よかった」
[p]
#抹茶エクレア
「どしたん？」
[p]
#神田姫花
「春から学校の予定が変わるので、帰り道がちょっと変わるんです」
[p]
#主人公
「そうなんですね」
[p]
#神田姫花
「でも、ここには寄りたいから」
[p]
#抹茶エクレア
「……！」
[p]
#神田姫花
「そんなに驚きます？」
[p]
#抹茶エクレア
「いや、嬉しいなあって」
[p]
#神田姫花
「それなら、よかったです」
[p]
#神田姫花
「ごちそうさまです。三月も来ますね」
[p]
#抹茶エクレア
「待ってるで！」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_hide name="神田姫花" time="300"]
[wait time="350"]
#抹茶エクレア
「三月も来るって」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「店、続けてたら、来月も誰かと会えるんやな」
[p]
#主人公
「……そうだね」
[p]
#抹茶エクレア
「……あんた、また考え込んでる」
[p]
#主人公
「ごめん」
[p]
#抹茶エクレア
「何考えてんの？」
[p]
#主人公
「この店の、来月とその先のこと」
[p]
#抹茶エクレア
「それ、ウチも考えなあかんやつや」
[p]
#主人公
「うん」
[p]
[wait time="350"]
#主人公
「抹茶ちゃん」
[p]
#抹茶エクレア
「何？」
[p]
#主人公
「もし世界一になれたら、その時は……」
[p]
#抹茶エクレア
「……うん」
[p]
#主人公
「……いや。先に、今の仕事を終わらせよう」
[p]
#抹茶エクレア
「また途中でやめるん？」
[p]
#主人公
「ごめん」
[p]
#抹茶エクレア
「まあ、ええけど」
[p]
#抹茶エクレア
「言いかけたこと、忘れんといてな」
[p]
#主人公
「……うん」
[p]

*scene_02_04
[eval exp="f.chapter = '02'; f.scene = '02_04'"]
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_kitchen_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#主人公
「……ここまで、整理できた」
[p]
#抹茶エクレア
「何のノート？」
[p]
#主人公
「季節ごとのレシピ。材料の仕入れ先と、注文の流れも」
[p]
#抹茶エクレア
「ええやん。誰が見ても分かるようにするんやな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「一月の採点表もある？」
[p]
#主人公
「あるよ。でも、数字だけじゃ足りないから」
[p]
#抹茶エクレア
「感想も書いてる？」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「成長したなあ」
[p]
#主人公
「どっちが？」
[p]
#抹茶エクレア
「両方や」
[p]
#主人公
「……こうしておけば、春になっても、店は続けられる」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「誰が厨房にいても、同じ味を作れるように」
[p]
#抹茶エクレア
「……誰が？」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「ええけど、ウチの字読める？」
[p]
#主人公
「読めるよ」
[p]
#抹茶エクレア
「たまに自分でも読めへんで」
[p]
#主人公
「それは困るな」
[p]
[wait time="300"]
#主人公
「女神様が言ってたよね。条件を達成したら、帰る道を開けるって」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「抹茶ちゃんは、遠くから来たんだよね」
[p]
#抹茶エクレア
「そうやな」
[p]
#主人公
「だったら、帰れるように準備するのが、こっちの仕事なのかなって」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「もちろん、世界一になるのが先だけど」
[p]
#抹茶エクレア
「先やで」
[p]
#主人公
「うん」
[p]
#主人公
「でも、準備しておけば安心できるかなって」
[p]
#抹茶エクレア
「……誰が？」
[p]
#主人公
「え？」
[p]
[skipstop]
[eval exp="sf.cg_february_event_01 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"contain", "background-repeat":"no-repeat", "background-position":"center", "background-color":"#151b14"});
[endscript]
[bg storage="cg/february/CG14_01_Whose_Peace_of_Mind.png" time="500"]
#抹茶エクレア
「安心するん、誰？」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「ウチら、何を決めたらええんやろな」
[p]
#主人公
「……」
[p]
[wait time="350"]
#主人公
「……どうするのがいいんだろう」
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_kitchen_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="450"]
[jump target="*choice_02_01"]

*choice_02_01
[eval exp="f.chapter = '02'; f.scene = '02_choice_01'"]
[clearstack stack="if"]
[cm]
[glink text="帰れるように、こちらで段取りを全部決めよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="195" bold="true" target="*bad016_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="帰る話は先に決めず、三月の目標を二人で進めよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="290" bold="true" target="*correct_02_01" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*bad016_entry
[if exp="sf.core_bad_016 === true"]
[cm]
#
その結末は、もう知っている。
[r]
CORE BAD 016『帰還最優先』
[p]
[jump target="*choice_02_01"]
[endif]
[jump target="*bad_02_016"]

*bad_02_016
[eval exp="f.chapter = '02'; f.scene = '02_bad016'"]
[cm]
#主人公
「帰れるように、こちらで段取りを全部決めよう」
[p]
#抹茶エクレア
「……全部？」
[p]
#主人公
「うん。抹茶ちゃんに余計な心配をかけたくないから」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「帰還の手順も、レシピの引き継ぎも」
[p]
#抹茶エクレア
「ちょっと待って」
[p]
#主人公
「店のことは、自分が引き受けるよ」
[p]
#抹茶エクレア
「待って言うてるやん」
[p]
#主人公
「……ごめん」
[p]
#抹茶エクレア
「何で、ウチに聞かんと全部決めるん？」
[p]
#主人公
「……帰れる方が、いいと思って」
[p]
#抹茶エクレア
「誰が？」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「世界一は、一緒に目指してるやろ」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「その先のことも、ウチのことやで」
[p]
#主人公
「……」
[p]
#主人公
「でも、せっかく帰れるんだから」
[p]
#抹茶エクレア
「“せっかく”？」
[p]
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="quiet"]
[wait time="350"]
#抹茶エクレア
「……分かった」
[p]
#主人公
「……抹茶ちゃん？」
[p]
#抹茶エクレア
「帰る準備するんが一番大事なんやな」
[p]
#主人公
「そういうつもりじゃ……」
[p]
#抹茶エクレア
「……そっか」
[p]
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_kitchen_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="700"]
#主人公
「荷物は、ここにまとめておいたから」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「レシピも、自分が引き継げるようにした」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「帰還の準備の問い合わせもしておいた」
[p]
#抹茶エクレア
「……うん」
[p]
[wait time="300"]
#主人公
「……最近、話が短いね」
[p]
#抹茶エクレア
「必要なことは言うてるで」
[p]
#主人公
「……」
[p]
#主人公
「そういえば、来月の出店の話」
[p]
#抹茶エクレア
「出店？」
[p]
#主人公
「まだ決まってないけど、打診が来てたんだ」
[p]
#抹茶エクレア
「……そっか」
[p]
#主人公
「返事を待たせてて」
[p]
#抹茶エクレア
「なんで？」
[p]
#主人公
「帰還に合わせて予定を空けなきゃと思って」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「でも、世界一になるためにも……」
[p]
#抹茶エクレア
「世界一、どこで目指すん？」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「帰る準備ばっかりして」
[p]
#抹茶エクレア
「肝心の、世界一を取りに行く話、誰ともしてへん」
[p]
#主人公
「……ごめん」
[p]
#抹茶エクレア
「ウチのためにやってくれたんは、分かるで」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「でも、あんたが決めたことに従うだけやったら」
[p]
#抹茶エクレア
「ウチ、何のためにここまで来たんやろ」
[p]
[skipstop]
[mask time="700" color="0x000000"]
[cm]
[skipstop]
[eval exp="sf.cg_february_event_02 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"contain", "background-repeat":"no-repeat", "background-position":"center", "background-color":"#151b14"});
[endscript]
[bg storage="cg/february/CG14_02_The_Road_We_Closed.png" time="1"]
[mask_off time="700"]
#主人公
「……締め切り、昨日だった」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「帰れる道を整えることばかり考えて」
[p]
#主人公
「二人で進む道の方を、閉じてしまった」
[p]
#抹茶エクレア
「……」
[p]
#抹茶エクレア
「ウチ、世界一になりたかった」
[p]
#抹茶エクレア
「それ、あんたと決めたことやろ」
[p]
#主人公
「……うん」
[p]
#抹茶エクレア
「帰るかどうかは、その後の話やと思ってた」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「せめて、ウチの話も聞いてほしかった」
[p]
[stopbgm fadeout="true" time="900"]
[mask time="700" color="0x000000"]
[wait time="200"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_shop_night.png" time="1"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="500"]
[iscript]
f.april_bad = {"kind": "CORE", "id": "016", "title": "帰還最優先", "lesson": "「助けようとしてくれたんは分かる。でも、ウチのことはウチにも聞いてほしかった……」", "retry": "*choice_02_01", "storage": "n02_february.ks", "month": "02"};
[endscript]
[register_core_bad id="016"]
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_kitchen_day.png" time="1"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
[jump target="*choice_02_01"]

*correct_02_01
[eval exp="f.chapter = '02'; f.scene = '02_choice01_correct'"]
[cm]
#主人公
「帰る話は、先に決めないでおこう」
[p]
#抹茶エクレア
「……うん？」
[p]
#主人公
「自分が勝手に日程を決めるのは違うと思う」
[p]
#抹茶エクレア
「せやな」
[p]
#主人公
「でも、今やることは決まってる」
[p]
#抹茶エクレア
「世界一や」
[p]
#主人公
「うん。三月までの目標、二人で進めよう」
[p]
#抹茶エクレア
「そっちの方がええな」
[p]
#主人公
「帰還の準備は、必要になったら考えればいい」
[p]
#抹茶エクレア
「……うん」
[p]
#主人公
「まず、目の前の店と、次の機会」
[p]
#抹茶エクレア
「毎日のエクレアと、世界一のエクレアやな」
[p]
#主人公
「両方だね」
[p]
#抹茶エクレア
「せやで。いつもの味、忘れたらあかん」
[p]
#主人公
「一月に学んだから」
[p]
#抹茶エクレア
「覚えてたんや」
[p]
#主人公
「そりゃ覚えてるよ」
[p]
[wait time="300"]
#抹茶エクレア
「なあ、あんた」
[p]
#主人公
「うん？」
[p]
#抹茶エクレア
「ウチら、三月終わったら……」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「……いや」
[p]
#主人公
「その時、ちゃんと話そう」
[p]
#抹茶エクレア
「……うん」
[p]
[wait time="350"]
#主人公
「三月終わってから話す」
[p]
#抹茶エクレア
「約束やで」
[p]
#主人公
「約束」
[p]

*scene_02_05
[eval exp="f.chapter = '02'; f.scene = '02_05'"]
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_shop_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_mod name="藤代誠" face="default"]
[chara_show name="藤代誠" left="80" top="90" time="300"]
#藤代誠
「こんにちは」
[p]
#主人公
「藤代さん、いらっしゃいませ」
[p]
#抹茶エクレア
「いつもの一個？」
[p]
#藤代誠
「ええ。……今日は、それともうひとつ」
[p]
#抹茶エクレア
「二個？」
[p]
#藤代誠
「いえ」
[p]
#主人公
「？」
[p]
#藤代誠
「少しだけ、お仕事の話を」
[p]
#抹茶エクレア
「お仕事？」
[p]
#藤代誠
「驚かせるかもしれませんが」
[p]
#主人公
「……企画の仕事をされてるんですか？」
[p]
#藤代誠
「スイーツの催事や、新しい店の紹介に関わっています」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「えっ」
[p]
#藤代誠
「八月に初めて来た時から、気になっていました」
[p]
#抹茶エクレア
「あの時、変なこと聞いてた人！」
[p]
#藤代誠
「販売できる数とか、店の外で売ったことがあるか、とか」
[p]
#主人公
「……覚えてます」
[p]
#藤代誠
「すみません。先に仕事の話をすると、いつもの味を見られない気がして」
[p]
#抹茶エクレア
「なんや、ほんまに仕事やったんか！」
[p]
#藤代誠
「はい」
[p]
#主人公
「九月の催事も……」
[p]
#藤代誠
「候補の店として、担当者に紹介しました」
[p]
#抹茶エクレア
「……！」
[p]
#主人公
「じゃあ、あの招待は」
[p]
#藤代誠
「SNSで話題になったことも大きかったです。紹介したから必ず選ばれる、というわけではありません」
[p]
#抹茶エクレア
「でも、見つけてくれたんやな」
[p]
#藤代誠
「そうですね」
[p]
[wait time="300"]
#藤代誠
「八月は、店を見つけた」
[p]
#藤代誠
「十月は、説明が増えていた」
[p]
#藤代誠
「一月は、点数の話をしていた」
[p]
#抹茶エクレア
「よう見てるなあ」
[p]
#藤代誠
「仕事柄、つい」
[p]
#主人公
「それで、今日は？」
[p]
[skipstop]
[eval exp="sf.cg_february_event_03 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"contain", "background-repeat":"no-repeat", "background-position":"center", "background-color":"#151b14"});
[endscript]
[bg storage="cg/february/CG14_03_The_Invitation_to_the_World.png" time="500"]
#藤代誠
「国際エクレアコンペティションの、国内推薦の話です」
[p]
#抹茶エクレア
「……こくさい？」
[p]
#藤代誠
「World Éclair Grand Prix」
[p]
#主人公
「世界エクレア大会……」
[p]
#藤代誠
「来月、最終ステージがあります。これまでの実績と商品資料を確認したうえで、主催側が正式に出場を打診しています」
[p]
#主人公
「正式に、ですか？」
[p]
#藤代誠
「はい。参加枠は確認済みです。ただし、受諾手続きと出品条件の確認は必要です」
[p]
#抹茶エクレア
「……世界？」
[p]
#藤代誠
「はい」
[p]
#抹茶エクレア
「エクレア？」
[p]
#藤代誠
「はい」
[p]
#抹茶エクレア
「グランプリ？」
[p]
#藤代誠
「はい」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「抹茶ちゃん？」
[p]
#抹茶エクレア
「……きた」
[p]
#主人公
「え？」
[p]
[wait time="300"]
#抹茶エクレア
「世界一、取りに行く場所が来た！」
[p]
#藤代誠
「まだ、出場を受けていただけるかどうかの話ですけど」
[p]
#抹茶エクレア
「行く！」
[p]
#主人公
「即答なんだ」
[p]
#抹茶エクレア
「ここは即答やろ！」
[p]
#藤代誠
「……ふふ」
[p]
#藤代誠
「ただし、ひとつ」
[p]
#主人公
「はい」
[p]
#藤代誠
「推薦は、審査の有利不利を決めるものではありません」
[p]
#抹茶エクレア
「分かってる」
[p]
#藤代誠
「そこで評価されるのは、商品と、積み重ねてきたものです」
[p]
#主人公
「……はい」
[p]
#藤代誠
「あと、出場予定の方に」
[p]
#主人公
「？」
[p]
#藤代誠
「Pâtisserie Lienの久世玲さんもいらっしゃいます」
[p]
#抹茶エクレア
「……っ！」
[p]
#主人公
「久世さんも？」
[p]
#藤代誠
「ええ」
[p]
#抹茶エクレア
「……よっしゃ」
[p]
#主人公
「勝つって言わないでよ」
[p]
#抹茶エクレア
「言うてへんやん！」
[p]
#主人公
「目が言ってる」
[p]
#抹茶エクレア
「今度は、ウチらのやり方でやる！」
[p]
#藤代誠
「それが一番だと思います」
[p]
#主人公
「藤代さん」
[p]
#藤代誠
「はい」
[p]
#主人公
「……どうして、うちだったんですか？」
[p]
#藤代誠
「派手だから、ではありません」
[p]
#藤代誠
「一回来て終わりじゃないお客さんが、いる店だからです」
[p]
#主人公
「……」
[p]
#藤代誠
「私は、ここの味が好きですよ」
[p]
#抹茶エクレア
「……！」
[p]
#藤代誠
「それでは、お返事をお待ちしています」
[p]
#抹茶エクレア
「エクレアは？」
[p]
#藤代誠
「もちろん、一つください」
[p]
#主人公
「そこは普通のお客さんなんですね」
[p]
#藤代誠
「仕事の話は、終わりましたから」
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_shop_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="藤代誠" face="default"]
[chara_show name="藤代誠" left="80" top="90" time="300"]
[mask_off time="350"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_hide name="藤代誠" time="300"]
#抹茶エクレア
「……」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「なあ」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「藤代さん、何者やったん……」
[p]
#主人公
「ほんとにね」
[p]

*scene_02_06
[eval exp="f.chapter = '02'; f.scene = '02_06'"]
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_kitchen_night.png" time="1"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#主人公
「書類、全部読んだよ」
[p]
#抹茶エクレア
「どない？」
[p]
#主人公
「必要なのは、作品の説明と、今までの取り組み。それに、出場の確認」
[p]
#抹茶エクレア
「書けるやん！」
[p]
#主人公
「うん。四月からの記録、全部ある」
[p]
#抹茶エクレア
「千個のも？」
[p]
#主人公
「失敗も含めて、ね」
[p]
#抹茶エクレア
「そこ削ったらあかん？」
[p]
#主人公
「成長の説明としては有力だよ」
[p]
#抹茶エクレア
「うぅ……」
[p]
#主人公
「五月は、また来てもらうこと」
[p]
#抹茶エクレア
「六月は、高けりゃええわけちゃう」
[p]
#主人公
「七月は、エクレアのまま夏に合わせる」
[p]
#抹茶エクレア
「八月は、バズよりお店」
[p]
#主人公
「九月は、久世さんに勝つことが目的じゃなかった」
[p]
#抹茶エクレア
「十月は、味を守って伝え方変えて」
[p]
#主人公
「十一月は、分からなかったら聞く」
[p]
#抹茶エクレア
「十二月は、明日も作れるようにする」
[p]
#主人公
「一月は、点数の外の声も聞く」
[p]
#抹茶エクレア
「……」
[p]
[wait time="350"]
#主人公
「……全部、つながってるね」
[p]
#抹茶エクレア
「うん」
[p]
#抹茶エクレア
「ウチら、ほんまによくやったな」
[p]
#主人公
「まだ終わってないけど」
[p]
#抹茶エクレア
「そや。まだ一番大事なんが残ってる」
[p]
#主人公
「三月」
[p]
#抹茶エクレア
「世界一」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「どうしたん？」
[p]
#主人公
「少し、怖いなと思って」
[p]
#抹茶エクレア
「久世さん？」
[p]
#主人公
「それもある」
[p]
#抹茶エクレア
「他にも？」
[p]
#主人公
「……終わった後のこと」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「でも、今ここで勝手に答えを決めたくない」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「まずは、二人で大会に行こう」
[p]
#抹茶エクレア
「……せやな」
[p]
#抹茶エクレア
「ウチらの抹茶エクレア、持ってな」
[p]
#主人公
「うん」
[p]

*scene_02_07
[eval exp="f.chapter = '02'; f.scene = '02_07'"]
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_kitchen_morning.png" time="1"]
[xchgbgm storage="06_One_Year_One_Eclair.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="700"]
#主人公
「もう二月も終わりだね」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「大会の返事、出したよ」
[p]
#抹茶エクレア
「もちろん、出るんやろ？」
[p]
#主人公
「出る」
[p]
#抹茶エクレア
「よっしゃ！」
[p]
#主人公
「まだ準備、いっぱいあるよ」
[p]
#抹茶エクレア
「せやろな」
[p]
#主人公
「久世さんもいるし」
[p]
#抹茶エクレア
「せやな」
[p]
#主人公
「……緊張する？」
[p]
#抹茶エクレア
「するで」
[p]
#主人公
「意外」
[p]
#抹茶エクレア
「ウチかて緊張くらいするわ」
[p]
#主人公
「そうだね」
[p]
#抹茶エクレア
「……でも」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「四月のウチやったら、きっと一人で『世界一！』って叫んでた」
[p]
#主人公
「実際、叫んでたね」
[p]
#抹茶エクレア
「今はな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「誰かの『おいしい』も、店の明日も、ちゃんと一緒に持って行きたい」
[p]
#主人公
「……うん」
[p]
[wait time="350"]
#抹茶エクレア
「なあ、あんた」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「三月が終わったら、話す約束」
[p]
#主人公
「覚えてるよ」
[p]
#抹茶エクレア
「忘れたらあかんで」
[p]
#主人公
「忘れない」
[p]
#抹茶エクレア
「約束やからな」
[p]
#主人公
「……うん」
[p]
[chara_mod name="抹茶エクレア" face="default"]
#抹茶エクレア
「ほな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「今日も仕込みや！」
[p]
#主人公
「大会用の試作から？」
[p]
#抹茶エクレア
「その前に、今日のお客さんの分」
[p]
#主人公
「……抹茶ちゃんがそれ言うんだ」
[p]
#抹茶エクレア
「ウチも店の人やからな」
[p]
#主人公
「そうだったね」
[p]
#抹茶エクレア
「世界一を取りに行くんも、ここからやで」
[p]
#主人公
「……うん。ここからだね」
[p]

*february_clear
[iscript]
sf.normal_ch02_clear = true; f.chapter = "02"; f.scene = "clear"; f.current_clear_month = "02";
[endscript]
[skipstop]
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
2月 CLEAR『その日まで、ふたりで』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
一年の期限が近づき、帰還の準備を先回りして進めたくなった。
けれど、善意でも相手の未来を勝手に決めるべきではない。
今は二人で、世界一を目指して歩く。
[p]
その先に何があるかは、三月が終わってから話そうと約束した。
まだ言葉にできていない問いがあることには、気づかないまま。
[p]
[jump target="*february_clear_menu"]

*february_clear_menu
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
2月 CLEAR『その日まで、ふたりで』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
抹茶ちゃんのひとこと
[r]
「世界一になるんも、店を続けるんも、ウチら二人で考えてきたことや。最後まで、そうしたいな」
[resetfont]
[glink text="タイトルへ" color="green" font_color="0x3B2A1B" x="675" width="400" height="85" size="23" y="150" bold="true" storage="title_screen.ks" target="*title" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="記録" color="green" font_color="0x3B2A1B" x="675" width="400" height="85" size="23" y="245" bold="true" storage="system_common.ks" target="*records_from_clear" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="3月へ" color="green" font_color="0x3B2A1B" x="675" y="340" width="400" height="85" size="23" bold="true" storage="n03_march.ks" target="*eyecatch_02_03" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[s]
