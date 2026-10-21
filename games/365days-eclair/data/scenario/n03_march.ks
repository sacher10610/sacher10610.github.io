; MARCH / 第12章 世界一の抹茶エクレア / approved v4 + latest override
*eyecatch_02_03
[skipstop]
[clearstack stack="if"]
[cm]
[clearfix]
[if exp="!window.MarchEnding"]
[loadjs storage="march_ending.js"]
[endif]
[call storage="system_common.ks"]
[call storage="system/future_character_define.ks"]
[call target="*march_character_define"]
[stopbgm fadeout="true" time="900"]
[mask time="700" color="0x000000"]
[stopse]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"contain","background-repeat":"no-repeat","background-position":"center","background-color":"#000"});
[endscript]
[bg storage="eyecatch/EYECATCH_02_03_MARCH.png" time="1"]
[tb_hide_message_window]
[mask_off time="400"]
[playse storage="SE_EYECATCH_05_06_Jingle.wav" volume="75" loop="false"]
[wait time="3100"]
[mask time="400" color="0x000000"]
[stopse]
[jump target="*scene_03_01"]

*scene_03_01
[if exp="!window.MarchEnding"]
[loadjs storage="march_ending.js"]
[endif]
[call storage="system_common.ks"]
[call storage="system/future_character_define.ks"]
[call target="*march_character_define"]
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
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="apr_kitchen_morning.png" time="1"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
[restore_april_quick_menu]
[eval exp="f.chapter = '03'; f.scene = '03_01'"]
[mask_off time="500"]
#主人公
「三月になったね」
[p]
#抹茶エクレア
「三月や！」
[p]
#主人公
「いよいよだね」
[p]
#抹茶エクレア
「いよいよやな」
[p]
#主人公
「一年前、ここで会った時は」
[p]
#抹茶エクレア
「降り立った時やな」
[p]
#主人公
「厨房に落ちてきた時だね」
[p]
#抹茶エクレア
「そこ、最終章まで揉めるん？」
[p]
#主人公
「大事なところだから」
[p]
#抹茶エクレア
「大事なん、そこちゃうやろ！」
[p]
#主人公
「藤代さんから、正式な出場確認が来たよ」
[p]
#抹茶エクレア
「ほんまに出られるんやな」
[p]
#主人公
「出場の手続きも通った。あとは大会の規定に沿って持っていくだけ」
[p]
#抹茶エクレア
「世界のパティシエが集まるんやろ？」
[p]
#主人公
「うん。久世さんもいる」
[p]
#抹茶エクレア
「……強そうやなあ」
[p]
#主人公
「九月と同じこと言ってる」
[p]
#抹茶エクレア
「今回は、ちゃんと勝負するんやで」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「でも、前とはちゃう」
[p]
#主人公
「どう違う？」
[p]
#抹茶エクレア
「久世さんに勝つために、何でもするんやない」
[p]
#抹茶エクレア
「ウチらの抹茶エクレアで、ちゃんと挑む」
[p]
#主人公
「……そうだね」
[p]
#主人公
「四月に、千個作ろうとしたね」
[p]
#抹茶エクレア
「いきなりその話！？」
[p]
#主人公
「五月は、お客さんに来てもらおうとして」
[p]
#抹茶エクレア
「六月、七月で味も変わった」
[p]
#主人公
「八月にバズって、九月に催事へ出て」
[p]
#抹茶エクレア
「十月は、知らん人にも味を伝えた」
[p]
#主人公
「十一月に女神様が来て、十二月は無理しないことを覚えて」
[p]
#抹茶エクレア
「一月は、点数の横のひとこと」
[p]
#主人公
「二月は……」
[p]
#抹茶エクレア
「今、一緒にすることを選んだ」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「全部、この一個につながってんねんな」
[p]
#主人公
「そう思う」
[p]
#抹茶エクレア
「ほな、世界一取りにいこか」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「……その前に」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「今日の分、作らな」
[p]
#主人公
「そこも覚えたんだ」
[p]
#抹茶エクレア
「当たり前や。Komorebiやもん」
[p]

*scene_03_02
[eval exp="f.chapter = '03'; f.scene = '03_02'"]
[mask time="450" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="apr_shop_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="450"]
#主人公
「準備のチェックをしよう」
[p]
#抹茶エクレア
「試作用の記録、製造手順、材料表」
[p]
#主人公
「保存条件、出品規定、搬入時間」
[p]
#抹茶エクレア
「全部大丈夫？」
[p]
#主人公
「今のところは」
[p]
#抹茶エクレア
「……世界一になったら、どうなるんやろ」
[p]
#主人公
「まだなってないから」
[p]
#抹茶エクレア
「せやな！」
[p]
#主人公
「何を先にする？」
[p]

*choice_03_00
[eval exp="f.chapter = '03'; f.scene = '03_choice_00'"]
[clearstack stack="if"]
[cm]
[glink text="優勝スピーチを最初から最後まで練習しよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="150" bold="true" target="*mini_m12_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="優勝記念の帯紙を、先に印刷しよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="245" bold="true" target="*mini_m13_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="大会用の段取りと、店の仕込みを確認しよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="340" bold="true" target="*correct_03_00" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*mini_m12_entry
[if exp="sf.mini_bad_m12 === true"]
[cm]
#
その結末は、もう知っている。
[r]
MINI BAD M12『優勝スピーチ三時間』
[p]
[jump target="*choice_03_00"]
[endif]
[cm]
#主人公
「もし優勝したら、挨拶が必要かもしれない」
[p]
#抹茶エクレア
「……演説？」
[p]
#主人公
「少し練習しておこう」
[p]
#抹茶エクレア
「任しとき！」
[p]
#抹茶エクレア
「えー、まず、この場を借りて、女神様へ感謝を」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「次に、四月の千個事件について」
[p]
#主人公
「そこ、世界へ発信する？」
[p]
#抹茶エクレア
「反省は大事や」
[p]
[mask time="400" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="apr_shop_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="400"]
#抹茶エクレア
「続きまして、七月のエクレアとは何か問題」
[p]
#主人公
「……まだ続くの？」
[p]
#抹茶エクレア
「九月の久世さんとの出会いは三十分でいける」
[p]
#主人公
「長いなあ」
[p]
[skipstop]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[image layer="1" name="march_sdcg_image" folder="bgimage" storage="cg/march/SD15_01_MiniBad012_Three_Hour_Speech.png" x="320" y="100" width="640" visible="true"]
[image layer="1" name="march_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
[eval exp="sf.cg_march_mini_01 = true"]
#主人公
「……三時間」
[p]
#抹茶エクレア
「まだ十二月までしか行ってへん」
[p]
#主人公
「最初の一個も、まだ作ってないよ」
[p]
#抹茶エクレア
「……あっ」
[p]
#主人公
「優勝してから考えよう」
[p]
#抹茶エクレア
「せやな。スピーチで世界一なってもしゃあない！」
[p]
[free layer="1" name="march_sdcg_image"]
[free layer="1" name="march_sdcg_frame"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[iscript]
f.april_bad = {"kind": "MINI", "id": "m12", "title": "優勝スピーチ三時間", "lesson": "「思い出、いっぱいやな……でも大会前に話しきるもんちゃうわ！」", "retry": "*choice_03_00", "storage": "n03_march.ks", "month": "03"};
[endscript]
[register_mini_bad id="m12"]
[call storage="system_common.ks" target="*show_mini_bad"]
[mask time="450" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="apr_shop_day.png" time="1"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="450"]
[jump target="*choice_03_00"]

*mini_m13_entry
[if exp="sf.mini_bad_m13 === true"]
[cm]
#
その結末は、もう知っている。
[r]
MINI BAD M13『世界一、先に印刷』
[p]
[jump target="*choice_03_00"]
[endif]
[cm]
#主人公
「優勝した後の包装も考えておこうか」
[p]
#抹茶エクレア
「ええな。世界一記念の帯紙！」
[p]
#主人公
「印刷の準備なら、先にできるかな」
[p]
#抹茶エクレア
「でっかく『WORLD No.1』や！」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「……」
[p]
[skipstop]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[image layer="1" name="march_sdcg_image" folder="bgimage" storage="cg/march/SD15_02_MiniBad013_Print_First.png" x="320" y="100" width="640" visible="true"]
[image layer="1" name="march_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
[eval exp="sf.cg_march_mini_02 = true"]
#主人公
「すごい量になったね」
[p]
#抹茶エクレア
「しかも、まだ優勝してへん」
[p]
#主人公
「そうなんだよね」
[p]
#抹茶エクレア
「これ、今は店で使えへんやん」
[p]
#主人公
「未確定の称号を付けるわけにはいかないから」
[p]
#抹茶エクレア
「……先に作るんは、帯紙やなかったな」
[p]
#主人公
「うん。中身だね」
[p]
#抹茶エクレア
「ほな、そっちから！」
[p]
[free layer="1" name="march_sdcg_image"]
[free layer="1" name="march_sdcg_frame"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[iscript]
f.april_bad = {"kind": "MINI", "id": "m13", "title": "世界一、先に印刷", "lesson": "「世界一って、印刷したらなれるもんちゃうな……」", "retry": "*choice_03_00", "storage": "n03_march.ks", "month": "03"};
[endscript]
[register_mini_bad id="m13"]
[call storage="system_common.ks" target="*show_mini_bad"]
[mask time="450" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="apr_shop_day.png" time="1"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="450"]
[jump target="*choice_03_00"]

*correct_03_00
[cm]
[eval exp="f.chapter = '03'; f.scene = '03_choice00_correct'"]
#主人公
「まず、段取りを全部確認しよう」
[p]
#抹茶エクレア
「それで、今日の店の分も作る」
[p]
#主人公
「うん。大会があっても店は店だから」
[p]
#抹茶エクレア
「今度こそ覚えてるで」
[p]
#主人公
「今度こそ？」
[p]
#抹茶エクレア
「そこは聞かんで！」
[p]

*scene_03_03
[eval exp="f.chapter = '03'; f.scene = '03_03'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="apr_shop_day.png" time="1"]
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
「いらっしゃいませ」
[p]
#抹茶エクレア
「三好さん！」
[p]
#三好文子
「いよいよなのね」
[p]
#主人公
「はい」
[p]
#三好文子
「大きな大会で、いつものを出すんですって？」
[p]
#抹茶エクレア
「そうやで」
[p]
#三好文子
「それがいいわね」
[p]
#主人公
「不安はありますけど」
[p]
#三好文子
「……あなたのご両親も、きっと喜ぶと思うわ」
[p]
#主人公
「……ありがとうございます」
[p]
#三好文子
「でも、今日は応援を伝えに来ただけじゃないの」
[p]
#抹茶エクレア
「？」
[p]
#三好文子
「いつものを、二つお願い」
[p]
#主人公
「はい」
[p]
#抹茶エクレア
「いつものお客さんやな」
[p]
#三好文子
「もちろん。大会の前も後も、ね」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_hide name="三好文子" time="350"]
[mask time="350" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="apr_shop_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="350"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_mod name="神田姫花" face="default"]
[chara_show name="神田姫花" left="80" top="90" time="300"]
#神田姫花
「こんにちは！」
[p]
#抹茶エクレア
「神田ちゃん！」
[p]
#神田姫花
「大会、がんばってくださいね」
[p]
#主人公
「ありがとう」
[p]
#神田姫花
「配信があったら見ます。学校が終わってからですけど」
[p]
#抹茶エクレア
「見てや！」
[p]
[font size="24"]
#抹茶エクレア
「暗黒皇帝陛下も応援してくれはる？」
[p]
[resetfont]
[font size="24"]
#神田姫花
「やめてくださいっ！ もう！」
[p]
[resetfont]
[font size="24"]
#抹茶エクレア
「ごめんごめん。内緒やったな」
[p]
[resetfont]
[font size="24"]
#神田姫花
「……ちゃんと、応援してますからね」
[p]
[resetfont]
#抹茶エクレア
「知ってるで」
[p]
#主人公
「何の話？」
[p]
#抹茶エクレア
「応援の話や」
[p]
#神田姫花
「そ、そうです！」
[p]
#主人公
「ありがとう。がんばってくるよ」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_hide name="神田姫花" time="350"]
#抹茶エクレア
「なあ」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「三好さんも神田ちゃんも、いつものを買うてくれた」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「世界に持っていくんも、いつもの一個でええな」
[p]
#主人公
「そうだね」
[p]

*scene_03_04
[eval exp="f.chapter = '03'; f.scene = '03_04'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="BG15_01_At_the_Worlds_Door.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#抹茶エクレア
「……うわ」
[p]
#主人公
「どうした？」
[p]
#抹茶エクレア
「ほんまに世界や」
[p]
#主人公
「いろんな国の出場者がいるね」
[p]
#抹茶エクレア
「誰も知らん店や」
[p]
#主人公
「向こうも、うちを知らないだろうね」
[p]
#抹茶エクレア
「……せやな」
[p]
#主人公
「緊張した？」
[p]
#抹茶エクレア
「ちょっとな」
[p]
#主人公
「ここまで来たら、やるだけだよ」
[p]
#抹茶エクレア
「うん」
[p]
[chara_mod name="藤代誠" face="default"]
[chara_show name="藤代誠" left="80" top="90" time="300"]
#藤代誠
「こんにちは。受付は済みましたか？」
[p]
#主人公
「藤代さん」
[p]
#藤代誠
「必要な書類の確認だけ、最後にお手伝いします」
[p]
#抹茶エクレア
「藤代さん、めっちゃ仕事の人や！」
[p]
#藤代誠
「いつもは普通のお客さんですから」
[p]
#主人公
「今でも、推薦してもらったのが不思議です」
[p]
#藤代誠
「私は、きっかけをお伝えしただけです」
[p]
#藤代誠
「評価は、ここにいる皆さんが下します」
[p]
#抹茶エクレア
「分かってる」
[p]
#藤代誠
「だからこそ、私は楽しみなんです」
[p]
#主人公
「何がですか？」
[p]
#藤代誠
「皆さんに、いつもの一個を食べてもらえることが」
[p]
#藤代誠
「では、私はここまで」
[p]
#抹茶エクレア
「藤代さん！」
[p]
#藤代誠
「はい」
[p]
#抹茶エクレア
「帰ったら、いつもの一個、買いに来てな！」
[p]
#藤代誠
「……もちろん」
[p]
[chara_hide name="藤代誠" time="400"]
#抹茶エクレア
「さ、準備や！」
[p]
#主人公
「うん」
[p]

*scene_03_05
[eval exp="f.chapter = '03'; f.scene = '03_05'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="BG15_02_Before_the_Finals.png" time="1"]
[xchgbgm storage="09_Measured_Grace.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="久世玲" face="normal"]
[chara_show name="久世玲" storage="kuze_rei_normal.png" left="80" top="90" time="300"]
[mask_off time="650"]
#久世玲
「……見つけた」
[p]
#主人公
「久世さん？」
[p]
#抹茶エクレア
「久世さん！」
[p]
#久世玲
「久しぶりね」
[p]
#抹茶エクレア
「九月ぶりや！」
[p]
#久世玲
「催事で隣だったわね」
[p]
#主人公
「お久しぶりです」
[p]
[skipstop]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"contain","background-repeat":"no-repeat","background-position":"center","background-color":"#000"});
[endscript]
[bg storage="cg/march/CG15_01_Across_the_Same_Stage.png" time="650"]
[eval exp="sf.cg_march_event_01 = true"]
#久世玲
「ここへ来ると思ってたわ」
[p]
#抹茶エクレア
「ほんまに？」
[p]
#久世玲
「毎日の店を続けてるなら、ね」
[p]
#抹茶エクレア
「……」
[p]
#久世玲
「出品は？」
[p]
#主人公
「うちで普段売っている抹茶エクレアです」
[p]
#久世玲
「そう」
[p]
#抹茶エクレア
「久世さんは？」
[p]
#久世玲
「私も、自分の店のエクレア」
[p]
#主人公
「……」
[p]
#久世玲
「九月、あなたたちに聞いたでしょう」
[p]
#久世玲
「何を売りたいの、って」
[p]
#抹茶エクレア
「覚えてる」
[p]
#久世玲
「答えは出た？」
[p]
#抹茶エクレア
「うん」
[p]
#抹茶エクレア
「ウチら、抹茶エクレアを売ってる」
[p]
#抹茶エクレア
「でも、それだけやない」
[p]
#久世玲
「……聞かせて」
[p]
#抹茶エクレア
「毎日、また来てもらえる店の味や」
[p]
#久世玲
「……」
[p]
#久世玲
「それは、いい答えね」
[p]
#抹茶エクレア
「久世さんは？」
[p]
#久世玲
「食べた人が、別の日にも思い出すような一個」
[p]
#抹茶エクレア
「……似てるな」
[p]
#久世玲
「案外ね」
[p]
#主人公
「でも、勝負は勝負なんですね」
[p]
#久世玲
「もちろん」
[p]
#抹茶エクレア
「ウチら、勝ちに来たで」
[p]
#久世玲
「知ってる」
[p]
#久世玲
「九月は、あなたたちが勝ちたがっていた」
[p]
#久世玲
「今は、どう？」
[p]
#抹茶エクレア
「ちゃんと一個、作るんが先」
[p]
#久世玲
「……ええ」
[p]
#久世玲
「じゃあ、明日」
[p]
#久世玲
「同じ舞台で」
[p]
#抹茶エクレア
「望むところや！」
[p]
[mask time="450" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="BG15_02_Before_the_Finals.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="450"]
[stopbgm fadeout="true" time="900"]
#主人公
「……強かったね」
[p]
#抹茶エクレア
「まだ何もしてへんやん」
[p]
#主人公
「空気が」
[p]
#抹茶エクレア
「明日、あの人の本気が見られるんやな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「負けられへんなあ」
[p]
#主人公
「でも」
[p]
#抹茶エクレア
「分かってる。ウチらのやり方で」
[p]

*scene_03_06
[eval exp="f.chapter = '03'; f.scene = '03_06'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="BG15_02_Before_the_Finals.png" time="1"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#主人公
「温度も量も規定内。試食用の数も確保した」
[p]
#抹茶エクレア
「香り、ええ感じやな」
[p]
#主人公
「練習より落ち着いてるね」
[p]
#抹茶エクレア
「そっちは？」
[p]
#主人公
「……手が少し震える」
[p]
#抹茶エクレア
「ウチもや」
[p]
#主人公
「そう見えない」
[p]
#抹茶エクレア
「見せへんのや」
[p]
#抹茶エクレア
「なあ。ほんまに変えんでええ？」
[p]
#主人公
「何を？」
[p]
#抹茶エクレア
「今から少し甘くするとか、豪華にするとか」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「世界の人に合わせた方が、ええんかな」
[p]
#主人公
「九月は、勝つために自分たちの目的を見失った」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「十月は、遠くへ届けるために説明を工夫した」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「一月は、数字の外の声を聞いた」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「最後は、どれを持っていこうか」
[p]

*choice_03_01
[eval exp="f.chapter = '03'; f.scene = '03_choice_01'"]
[clearstack stack="if"]
[cm]
[glink text="久世さんに勝てそうな派手なものを作ろう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="150" bold="true" target="*review_03_a" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="審査の数字だけが高くなるよう調整しよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="245" bold="true" target="*review_03_b" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="いつもの一個を、一番いい状態で届けよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="340" bold="true" target="*correct_03_01" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*review_03_a
[cm]
#主人公
「久世さんより目立つものに作り替えたら……」
[p]
#抹茶エクレア
「……九月も、似たこと言うたな」
[p]
#主人公
「結局、勝つことだけが目的になった」
[p]
#抹茶エクレア
「ここまで来て、同じ間違いはせえへん」
[p]
#主人公
「うん。考え直そう」
[p]
[jump target="*choice_03_01"]

*review_03_b
[cm]
#主人公
「審査の数字を最大化する方向で、ここから全部調整しようか」
[p]
#抹茶エクレア
「数字は大事やけど」
[p]
#抹茶エクレア
「百点って、誰の百点なん？」
[p]
#主人公
「……そうだったね」
[p]
#抹茶エクレア
「目の前の人が食べる一個、忘れたらあかん」
[p]
#主人公
「うん。考え直そう」
[p]
[jump target="*choice_03_01"]

*correct_03_01
[eval exp="f.chapter = '03'; f.scene = '03_choice01_correct'"]
[cm]
#主人公
「いつもの一個を、一番いい状態で届けよう」
[p]
#抹茶エクレア
「……うん！」
[p]
#主人公
「味も形も、今日だけ別物にはしない」
[p]
#抹茶エクレア
「作り慣れた、ウチらのエクレアや」
[p]
#主人公
「ただし、温度と時間は細かく確認しよう」
[p]
#抹茶エクレア
「一月の数字、ここで役立つな」
[p]
#主人公
「食べる人に説明もする」
[p]
#抹茶エクレア
「十月のカードも役立つ」
[p]
#主人公
「終わったら、店に戻ってまた作る」
[p]
#抹茶エクレア
「十二月の約束や」
[p]
#主人公
「できること、全部やったね」
[p]
#抹茶エクレア
「……まだや」
[p]
#主人公
「？」
[p]
#抹茶エクレア
「最後の一個、今から作るんやろ」
[p]
#主人公
「そうだね」
[p]

*scene_03_07
[eval exp="f.chapter = '03'; f.scene = '03_07'"]
[stopbgm fadeout="true" time="700"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="BG15_03_World_Eclair_Grand_Prix.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="久世玲" face="normal"]
[chara_show name="久世玲" storage="kuze_rei_normal.png" left="80" top="90" time="300"]
[mask_off time="650"]
#久世玲
「……準備、できた？」
[p]
#主人公
「はい」
[p]
#抹茶エクレア
「いつでも！」
[p]
#久世玲
「九月の催事、私たち隣同士だったわね」
[p]
#抹茶エクレア
「せやな」
[p]
#久世玲
「今日は、同じ決勝の舞台」
[p]
#主人公
「……はい」
[p]
#久世玲
「手加減はしない」
[p]
#抹茶エクレア
「こっちもや」
[p]
#久世玲
「……ふふ」
[p]
#久世玲
「じゃあ、本気で勝ちにいくわ」
[p]
[xchgbgm storage="15_The_Real_Patissier.mp3" time="500"]
[skipstop]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"contain","background-repeat":"no-repeat","background-position":"center","background-color":"#000"});
[endscript]
[bg storage="cg/march/CG15_02_The_Real_Patissier.png" time="650"]
[eval exp="sf.cg_march_event_02 = true"]
[wait time="800"]
#抹茶エクレア
「……すごいな」
[p]
#主人公
「久世さん、迷いがない」
[p]
#抹茶エクレア
「でも、ウチらも迷ってへんで」
[p]
#主人公
「うん」
[p]
#久世玲
「……あなたたちの抹茶、いい香りね」
[p]
#抹茶エクレア
「久世さんの生地も、すごい」
[p]
#久世玲
「ありがとう」
[p]
#抹茶エクレア
「でも、今日は譲らへん！」
[p]
#久世玲
「もちろん。私もよ」
[p]
#司会
「それでは、ファイナル審査を始めます」
[p]
#主人公
「行こう」
[p]
#抹茶エクレア
「……うん」
[p]
#抹茶エクレア
「ウチらの一年、食べてもらお！」
[p]

*scene_03_08
[eval exp="f.chapter = '03'; f.scene = '03_08'"]
[mask time="500" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="BG15_03_World_Eclair_Grand_Prix.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="500"]
#司会
「最終評価は、専門審査と一般試食評価を合わせた総合審査となります」
[p]
#審査員
「こちらの品について、説明をお願いします」
[p]
#主人公
「Pâtisserie Komorebiの抹茶エクレアです」
[p]
#抹茶エクレア
「毎日、店で作ってる一個やで」
[p]
#主人公
「軽いシュー生地に、抹茶の香りが立つクリーム。甘さの後に、ほろ苦さが残ります」
[p]
#審査員
「その味を選んだ理由は？」
[p]
#主人公
「何度も試して、お客さんの声を聞いた結果です」
[p]
#抹茶エクレア
「派手にした方がええ時もある。でも」
[p]
#抹茶エクレア
「明日もまた食べたい、って思える一個にしたかってん」
[p]
#審査員
「……香りが先に来ますね」
[p]
#審査員
「後味がきれいです」
[p]
[skipstop]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"contain","background-repeat":"no-repeat","background-position":"center","background-color":"#000"});
[endscript]
[bg storage="cg/march/CG15_03_One_Bite_One_World.png" time="650"]
[eval exp="sf.cg_march_event_03 = true"]
#審査員
「この軽さなら、もう一つ食べたくなります」
[p]
#抹茶エクレア
「……！」
[p]
#主人公
「ありがとうございます」
[p]
#試食客A
「初めて食べる味です」
[p]
#試食客B
「もう一口、と思いました」
[p]
#試食客C
「これ、お店でも買えるんですか？」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「どうした？」
[p]
#抹茶エクレア
「九月みたいや」
[p]
#主人公
「催事？」
[p]
#抹茶エクレア
「『店、どこにあるん？』って聞かれた日」
[p]
#主人公
「そうだね」
[p]
#抹茶エクレア
「ここでも、つながったな」
[p]
#主人公
「うん」
[p]
[mask time="450" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="BG15_03_World_Eclair_Grand_Prix.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="久世玲" face="normal"]
[chara_show name="久世玲" storage="kuze_rei_normal.png" left="80" top="90" time="300"]
[mask_off time="450"]
#久世玲
「……」
[p]
#抹茶エクレア
「久世さん？」
[p]
#久世玲
「どんな結果でも、今日の一個は自信があるわ」
[p]
#抹茶エクレア
「ウチも」
[p]
#久世玲
「……それでいいのよ」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「でも」
[p]
#久世玲
「？」
[p]
#抹茶エクレア
「やっぱり世界一、取りたい！」
[p]
#久世玲
「ふふ。私もよ」
[p]

*scene_03_09
[eval exp="f.chapter = '03'; f.scene = '03_09'"]
[stopbgm fadeout="true" time="1000"]
[mask time="700" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="BG15_03_World_Eclair_Grand_Prix.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="700"]
#司会
「審査結果を発表します」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「……」
[p]
#司会
「World Éclair Grand Prix、総合第1位は……」
[p]
[wait time="700"]
#司会
「Pâtisserie Komorebi。Matcha Éclair!」
[p]
[skipstop]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"contain","background-repeat":"no-repeat","background-position":"center","background-color":"#000"});
[endscript]
[bg storage="cg/march/CG15_04_The_Worlds_Best_Eclair.png" time="650"]
[eval exp="sf.cg_march_event_04 = true"]
[xchgbgm storage="06_One_Year_One_Eclair.mp3" time="900"]
[eval exp="sf.normal_ch03_clear = true"]
#抹茶エクレア
「……」
[p]
#主人公
「……抹茶ちゃん？」
[p]
#抹茶エクレア
「……うそ」
[p]
#主人公
「本当だよ」
[p]
#抹茶エクレア
「……ウチら？」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「世界一？」
[p]
#主人公
「……世界一だ」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「……泣いてる？」
[p]
#抹茶エクレア
「泣いてへん！」
[p]
#主人公
「声、震えてる」
[p]
#抹茶エクレア
「……うるさい！」
[p]
#抹茶エクレア
「四月のあの日から」
[p]
#抹茶エクレア
「ほんまに一年かけて」
[p]
#抹茶エクレア
「ウチら、世界一なったんやな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「ひとりやったら、ここまで来られへんかった」
[p]
#主人公
「自分もだよ」
[p]
[mask time="450" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="BG15_03_World_Eclair_Grand_Prix.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="久世玲" face="normal"]
[chara_show name="久世玲" storage="kuze_rei_normal.png" left="80" top="90" time="300"]
[mask_off time="450"]
#久世玲
「……おめでとう」
[p]
#抹茶エクレア
「久世さん」
[p]
#久世玲
「いいエクレアだったわ」
[p]
#主人公
「久世さんのも、すごかったです」
[p]
#久世玲
「ええ。私も、あれが自分の答え」
[p]
#久世玲
「今日は、あなたたちの一個が一番だった」
[p]
#抹茶エクレア
「……」
[p]
#久世玲
「でも、次もそうとは限らないわよ」
[p]
#抹茶エクレア
「……！」
[p]
#抹茶エクレア
「望むところや！」
[p]
#久世玲
「……ふふ」
[p]
[chara_hide name="久世玲" time="350"]
[chara_mod name="藤代誠" face="default"]
[chara_show name="藤代誠" left="80" top="90" time="300"]
#藤代誠
「……おめでとうございます」
[p]
#主人公
「藤代さん！」
[p]
#藤代誠
「私は、きっかけをお渡ししただけです」
[p]
#抹茶エクレア
「いつもの一個、今度は二個買うてな！」
[p]
#藤代誠
「……考えておきます」
[p]
#抹茶エクレア
「そこは即答して！」
[p]
[chara_hide name="藤代誠" time="350"]
#司会
「受賞者から、ひとことお願いします」
[p]
#抹茶エクレア
「……！」
[p]
#主人公
「三時間はだめだよ」
[p]
#抹茶エクレア
「分かってるって！」
[p]
#抹茶エクレア
「ウチらのエクレアは、失敗だらけでした」
[p]
#抹茶エクレア
「でも、そのたびに話して、食べてもらって、また作りました」
[p]
#抹茶エクレア
「今日、ここで食べてくれた人も」
[p]
#抹茶エクレア
「また店に来てくれる人も」
[p]
#抹茶エクレア
「みんな、ほんまにありがとう！」
[p]

*scene_03_10
[if exp="!window.MarchEnding"]
[loadjs storage="march_ending.js"]
[endif]
[call storage="system_common.ks"]
[call storage="system/future_character_define.ks"]
[call target="*march_character_define"]
[eval exp="f.chapter = '03'; f.scene = '03_10'"]
[if exp="TYRANO.kag.stat.current_bgm !== '06_One_Year_One_Eclair.mp3'"]
[xchgbgm storage="06_One_Year_One_Eclair.mp3" time="900"]
[endif]
[mask time="800" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="apr_kitchen_night.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="800"]
[autosave title="3月 世界一達成後・約束の厨房"]
#主人公
「帰ってきたね」
[p]
#抹茶エクレア
「帰ってきたな」
[p]
#主人公
「……世界一になったのに、厨房は変わらないね」
[p]
#抹茶エクレア
「ちゃんとあるで。いつもの台も、ボウルも」
[p]
#主人公
「四月、ここから始まったんだ」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「今日、世界一になった」
[p]
#抹茶エクレア
「……うん」
[p]
#主人公
「明日から、どうなるんだろう」
[p]
#抹茶エクレア
「……なあ」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「覚えてる？」
[p]
#主人公
「……三月終わってから話す、って約束」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「覚えてるよ」
[p]
[wait time="400"]
[playse storage="se_matcha_teleport_land.wav" volume="55" loop="false"]
[chara_show name="女神" left="80" top="90" time="800"]
#女神
「おめでとうございます」
[p]
#主人公
「……女神様」
[p]
#抹茶エクレア
「ほんまに来た！」
[p]
#女神
「今度は、お祝いを言いに参りました」
[p]
#女神
「客観的にも、世界一と認められる結果ですね」
[p]
#主人公
「条件、達成ですか」
[p]
#女神
「はい。お約束どおりです」
[p]
#抹茶エクレア
「……」
[p]
#女神
「帰還の道も、開く準備が整っています」
[p]
[if exp="sf.true_bad_seen === true"]
[jump target="*scene_03_11b"]
[else]
[jump target="*scene_03_11a"]
[endif]

*scene_03_11a
[eval exp="f.chapter = '03'; f.scene = '03_11a'"]
[clearstack stack="if"]
[cm]
#主人公
「よかったね、抹茶ちゃん」
[p]
#抹茶エクレア
「……え？」
[p]
#主人公
「これで、元の世界へ帰れる」
[p]
#抹茶エクレア
「……うん」
[p]
#主人公
「一年で、約束を果たしたんだ」
[p]
#抹茶エクレア
「……せやな」
[p]
#女神
「帰還は、今からでも可能です」
[p]
#主人公
「……長かったね」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「ここで会って、ここでお別れなんだね」
[p]
#抹茶エクレア
「……あんた」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「……ありがとな」
[p]
#主人公
「……こちらこそ」
[p]
#抹茶エクレア
「ウチ、あんたと店やれて、よかった」
[p]
#主人公
「自分も、抹茶ちゃんと作れてよかった」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「忘れないよ」
[p]
#抹茶エクレア
「……うん」
[p]
[wait time="450"]
[skipstop]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"contain","background-repeat":"no-repeat","background-position":"center","background-color":"#000"});
[endscript]
[bg storage="cg/march/CG15_05_One_Last_Look.png" time="650"]
[eval exp="sf.cg_march_event_05 = true"]
#抹茶エクレア
「ほな……」
[p]
#主人公
「……うん」
[p]
#抹茶エクレア
「元気でな」
[p]
#主人公
「抹茶ちゃんも」
[p]
[skipstop]
[cm]
[clearfix]
[tb_hide_message_window]
[stopse]
[stopbgm fadeout="true" time="3000"]
[mask time="3000" color="0x000000"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[bg storage="apr_kitchen_night.png" time="1"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":"#000", "background-image":"none"});
[endscript]
[mask_off time="1"]
[wait time="150"]
[march_movie storage="march_first_ending.mp4"]
[jump target="*scene_03_12a"]

*scene_03_12a
[eval exp="f.chapter = '03'; f.scene = '03_12a'"]
[stopbgm]
[stopse]
[mask time="800" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="apr_kitchen_morning.png" time="1"]
[mask_off time="800"]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
[restore_april_quick_menu]
#主人公
「……今日の予約は」
[p]
#主人公
「……増えたな」
[p]
#客
「これ、世界一になったエクレアですよね？」
[p]
#主人公
「はい」
[p]
#客
「一つ、お願いします」
[p]
#主人公
「ありがとうございます」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
#主人公
「……」
[p]
[wait time="650"]
[skipstop]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"contain","background-repeat":"no-repeat","background-position":"center","background-color":"#000"});
[endscript]
[bg storage="cg/march/CG15_06_The_Promise_Left_Unspoken.png" time="650"]
[eval exp="sf.cg_march_event_06 = true"]
#主人公
「……四月」
[p]
#抹茶エクレア
「ウチら、三月終わったら……」
[p]
#主人公
「その時、ちゃんと話そう」
[p]
#主人公
「三月終わってから話す」
[p]
#抹茶エクレア
「約束やで」
[p]
#主人公
「……」
[p]
#主人公
「……話してない」
[p]
#主人公
「帰れることは、聞いた」
[p]
#主人公
「帰らなきゃいけないわけじゃないことも、聞いた」
[p]
#主人公
「……でも」
[p]
#主人公
「抹茶ちゃんが、どうしたいかは」
[p]
#主人公
「……一度も」
[p]
[wait time="500"]
#女神
「……本当に、それでよかったのですか？」
[p]
#主人公
「……」
[p]
#主人公
「世界一には、なれたのに」
[p]
[wait time="900"]
[eval exp="f.current_march_end = 'core_017'"]
[jump target="*march_ending_menu"]

*scene_03_11b
[eval exp="f.chapter = '03'; f.scene = '03_11b'"]
[clearstack stack="if"]
[cm]
#女神
「帰還の道も、開く準備が整っています」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「なあ、あんた」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「三月終わったら、話す約束やったな」
[p]
#主人公
「……そうだね」
[p]
#主人公
「今度こそ、話そう」
[p]
#抹茶エクレア
「……うん」
[p]
#主人公
「帰ることはできる。帰らないこともできる」
[p]
#主人公
「でも、あの子にとっての答えを」
[p]
#主人公
「自分が決めていいのだろうか」
[p]
[preload storage="./data/bgimage/cg/march/CG15_07_By_Your_Name.png" wait="false"]
[preload storage="./data/bgimage/cg/march/CG15_08_The_Day_After.png" wait="false"]
[preload storage="./data/image/ending/ENDCARD_TRUE_01_FIN.png" wait="false"]
[preload storage="./data/bgm/16_Recipe_for_Day_366.mp3" wait="false"]
[jump target="*final_choice"]

*final_choice
[if exp="!window.MarchEnding"]
[loadjs storage="march_ending.js"]
[endif]
[iscript]
window.MarchEnding.cleanup();
[endscript]
[call storage="system_common.ks"]
[call storage="system/future_character_define.ks"]
[call target="*march_character_define"]
[clearstack stack="if"]
[if exp="sf.true_bad_seen !== true"]
[jump target="*scene_03_10"]
[endif]
[eval exp="f.chapter = '03'; f.scene = '03_final_choice'"]
[if exp="TYRANO.kag.stat.current_bgm !== '06_One_Year_One_Eclair.mp3'"]
[xchgbgm storage="06_One_Year_One_Eclair.mp3" time="900"]
[endif]
[mask time="450" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="apr_kitchen_night.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_show name="女神" left="80" top="90" time="1"]
[mask_off time="450"]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
[clearfix]
[restore_april_quick_menu]
[autosave title="3月 最後の問い"]
[cm]
[glink text="帰った方がいいと思う" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="150" bold="true" target="*normal_end_01" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="ここに残ってほしい" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="245" bold="true" target="*normal_end_02" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="抹茶ちゃんが決めればいい" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="340" bold="true" target="*true_end_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*normal_end_01
[eval exp="f.chapter = '03'; f.scene = '03_end01'"]
[cm]
#主人公
「……帰った方がいいと思う」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「元の世界に、大切なものがあるかもしれないから」
[p]
#抹茶エクレア
「……そうか」
[p]
#主人公
「だから、帰るべきだと思う」
[p]
#抹茶エクレア
「……あんたは、そう思うんやな」
[p]
#主人公
「……うん」
[p]
#抹茶エクレア
「心配してくれて、ありがとう」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「ほな、行くわ」
[p]
[chara_hide name="抹茶エクレア" time="700"]
#女神
「……お二人の答えが、同じだったかは」
[p]
#女神
「確かめなくても、よろしかったのですか？」
[p]
[chara_hide name="女神" time="650"]
#主人公
「……」
[p]
[eval exp="sf.march_end_01_seen = true; f.current_march_end = 'march_end_01'"]
[jump target="*march_ending_menu"]

*normal_end_02
[eval exp="f.chapter = '03'; f.scene = '03_end02'"]
[cm]
#主人公
「……ここに残ってほしい」
[p]
#抹茶エクレア
「……！」
[p]
#主人公
「この店に、ずっといてくれたら嬉しい」
[p]
#抹茶エクレア
「……あんた」
[p]
#主人公
「一緒に作りたいんだ」
[p]
#抹茶エクレア
「……そっか」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「そう言うてくれるんは、嬉しいで」
[p]
#主人公
「……うん」
[p]
#抹茶エクレア
「ほな、もうちょっと、ここにおろかな」
[p]
#主人公
「……ありがとう」
[p]
#抹茶エクレア
「……うん」
[p]
[mask time="750" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="apr_kitchen_morning.png" time="1"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="750"]
#抹茶エクレア
「……ウチがほんまに考えてたこと、まだ話してへんな」
[p]
#主人公
「……え？」
[p]
[eval exp="sf.march_end_02_seen = true; f.current_march_end = 'march_end_02'"]
[jump target="*march_ending_menu"]

*true_end_retry
[clearstack stack="if"]
[call storage="system/future_character_define.ks"]
[call target="*march_character_define"]
[mask time="450" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="apr_kitchen_night.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_show name="女神" left="80" top="90" time="1"]
[mask_off time="450"]
[jump target="*true_end_entry"]

*true_end_entry
[clearstack stack="if"]
[if exp="sf.true_bad_seen !== true"]
[jump target="*scene_03_10"]
[endif]
[eval exp="f.chapter = '03'; f.scene = '03_true'"]
[cm]
[clearfix]
[hidemenubutton]
[march_true_begin]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
[cm]
#主人公
「……抹茶ちゃんが決めればいい」
[march_true_wait at="3.259" minimum="1100"]
[cm]
#抹茶エクレア
「……え？」
[march_true_wait at="5.780" minimum="1100"]
[cm]
#主人公
「帰れる。帰らなくてもいい」
[march_true_wait at="8.891" minimum="1100"]
[cm]
#主人公
「でも、そこから先のことは、抹茶ちゃんの人生だ」
[march_true_wait at="12.739" minimum="1100"]
[cm]
#抹茶エクレア
「……」
[march_true_wait at="15.113" minimum="1100"]
[cm]
#主人公
「自分は、この店を一緒に続けたい」
[march_true_wait at="18.445" minimum="1100"]
[cm]
#主人公
「それは、自分の気持ち」
[march_true_wait at="21.408" minimum="1100"]
[cm]
#主人公
「でも、それだけで君の答えを決めたくない」
[march_true_wait at="25.036" minimum="1100"]
[cm]
#抹茶エクレア
「……あんた」
[march_true_wait at="27.630" minimum="1100"]
[cm]
#主人公
「帰っても、ここに残っても」
[march_true_wait at="30.741" minimum="1100"]
[cm]
#主人公
「君が選ぶなら、その選択を尊重したい」
[march_true_wait at="34.221" minimum="1100"]
[cm]
#主人公
「……だから、聞かせて」
[march_true_wait at="37.185" minimum="1100"]
[cm]
#主人公
「抹茶ちゃんは、どうしたい？」
[march_true_wait at="40.369" minimum="1100"]
[cm]
#抹茶エクレア
「……四月な」
[march_true_wait at="42.964" minimum="1100"]
[cm]
#主人公
「うん」
[march_true_wait at="45.338" minimum="1100"]
[cm]
#抹茶エクレア
「ここ来た時は、世界一なって、帰るんやと思うてた」
[march_true_wait at="49.260" minimum="1100"]
[cm]
#主人公
「……うん」
[march_true_wait at="51.781" minimum="1100"]
[cm]
#抹茶エクレア
「せやけど」
[march_true_wait at="54.302" minimum="1100"]
[cm]
#抹茶エクレア
「五月、また来てくれた人がおって」
[march_true_wait at="57.634" minimum="1100"]
[cm]
#抹茶エクレア
「六月、七月、味が変わってもエクレアで」
[march_true_wait at="61.188" minimum="1100"]
[cm]
#抹茶エクレア
「八月は大騒ぎで、九月は久世さんに会うて」
[march_true_wait at="64.815" minimum="1100"]
[cm]
#抹茶エクレア
「十月は、知らん人に伝える練習した」
[march_true_wait at="68.221" minimum="1100"]
[cm]
#抹茶エクレア
「十一月は、女神様が普通にお客さんやった」
[march_true_wait at="71.848" minimum="1100"]
[cm]
#抹茶エクレア
「十二月は、あんたが無理してたら止めた」
[march_true_wait at="75.402" minimum="1100"]
[cm]
#抹茶エクレア
「一月は、百点より先に、人の顔見た」
[march_true_wait at="78.808" minimum="1100"]
[cm]
#抹茶エクレア
「二月は……」
[march_true_wait at="81.403" minimum="1100"]
[cm]
#抹茶エクレア
「一緒に、今できることをやろって決めた」
[march_true_wait at="84.956" minimum="1100"]
[cm]
#主人公
「……うん」
[march_true_wait at="87.477" minimum="1100"]
[cm]
#抹茶エクレア
「ウチ、ここで毎日作るのが、好きになってん」
[march_true_wait at="91.178" minimum="1100"]
[cm]
#主人公
「……」
[march_true_wait at="93.552" minimum="1100"]
[cm]
#抹茶エクレア
「世界一、ほんまに嬉しい」
[march_true_wait at="96.589" minimum="1100"]
[cm]
#抹茶エクレア
「でも、世界一になったら全部終わり、やないやろ？」
[march_true_wait at="100.511" minimum="1100"]
[cm]
#主人公
「……うん」
[march_true_wait at="103.032" minimum="1100"]
[cm]
#抹茶エクレア
「ここの店、明日も開くんやろ？」
[march_true_wait at="106.291" minimum="1100"]
[cm]
#主人公
「開くよ」
[march_true_wait at="108.738" minimum="1100"]
[cm]
#抹茶エクレア
「三好さんも、神田ちゃんも、また来るやろ？」
[march_true_wait at="112.439" minimum="1100"]
[cm]
#主人公
「うん」
[march_true_wait at="114.813" minimum="1100"]
[cm]
#抹茶エクレア
「藤代さんも、いつもの一個、買いに来るやろ？」
[march_true_wait at="118.587" minimum="1100"]
[cm]
#主人公
「たぶんね」
[march_true_wait at="121.108" minimum="1100"]
[cm]
#抹茶エクレア
「久世さんとも、また勝負したいし」
[march_true_wait at="124.441" minimum="1100"]
[cm]
#主人公
「……うん」
[march_true_wait at="126.962" minimum="1100"]
[skipstop]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"contain","background-repeat":"no-repeat","background-position":"center","background-color":"#000"});
[endscript]
[bg storage="cg/march/CG15_07_By_Your_Name.png" time="650"]
[eval exp="sf.cg_march_event_07 = true"]
[cm]
#抹茶エクレア
[emb exp="'「あんた……いや、' + window.MarchEnding.playerName(f.player_name) + 'と一緒に、な」'"]
[march_true_wait at="130.368" minimum="1100"]
[cm]
#抹茶エクレア
「せやから」
[march_true_wait at="132.889" minimum="1100"]
[mask time="400" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="apr_kitchen_night.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_show name="女神" left="80" top="90" time="1"]
[mask_off time="400"]
[cm]
#抹茶エクレア
「女神様」
[march_true_wait at="135.336" minimum="1100"]
[cm]
#女神
「はい」
[march_true_wait at="137.709" minimum="1100"]
[cm]
#抹茶エクレア
「ウチ、帰らへん」
[march_true_wait at="140.452" minimum="1100"]
[cm]
#女神
「……そうですか」
[march_true_wait at="143.194" minimum="1100"]
[cm]
#抹茶エクレア
「うん」
[march_true_wait at="145.567" minimum="1100"]
[cm]
#女神
「お約束は、世界一になれば帰れるようにすること」
[march_true_wait at="149.416" minimum="1100"]
[cm]
#女神
「帰らなければならない、というものではありません」
[march_true_wait at="153.338" minimum="1100"]
[cm]
#抹茶エクレア
「……知ってる」
[march_true_wait at="156.007" minimum="1100"]
[cm]
#女神
「では、帰還の道は開かずにおきましょう」
[march_true_wait at="159.560" minimum="1100"]
[cm]
#女神
「あなた自身の望む答えであるなら、それでよいのです」
[march_true_wait at="163.556" minimum="1100"]
[cm]
#主人公
「……」
[march_true_wait at="165.930" minimum="1100"]
[cm]
#抹茶エクレア
「……なんや、その顔」
[march_true_wait at="168.820" minimum="1100"]
[cm]
#主人公
「うまく言えなくて」
[march_true_wait at="171.636" minimum="1100"]
[cm]
#抹茶エクレア
「ほな、言わんでもええで」
[march_true_wait at="174.673" minimum="1100"]
[cm]
#主人公
「でも、ありがとう」
[march_true_wait at="177.489" minimum="1100"]
[cm]
#抹茶エクレア
「そこは言うんか」
[march_true_wait at="180.231" minimum="1100"]
[cm]
#主人公
「言いたいから」
[march_true_wait at="182.900" minimum="1100"]
[cm]
#抹茶エクレア
「……ええよ」
[march_true_wait at="185.494" minimum="1100"]
[cm]
#女神
「ごちそうさまでした」
[march_true_wait at="188.384" minimum="1100"]
[cm]
#抹茶エクレア
「今日、まだエクレア出してへんで？」
[march_true_wait at="191.790" minimum="1100"]
[cm]
#女神
「一年分、十分にいただきましたよ」
[march_true_wait at="195.122" minimum="1100"]
[cm]
#主人公
「……女神様も変わりましたね」
[march_true_wait at="198.307" minimum="1100"]
[cm]
#女神
「お二人を見ておりましたから」
[march_true_wait at="201.492" minimum="1100"]
[chara_hide name="女神" time="650"]
[cm]
#抹茶エクレア
[emb exp="'「……なあ、' + window.MarchEnding.playerName(f.player_name) + '」'"]
[march_true_wait at="204.234" minimum="1100"]
[cm]
#主人公
「うん？」
[march_true_wait at="206.681" minimum="1100"]
[cm]
#抹茶エクレア
「明日、何個作る？」
[march_true_wait at="209.497" minimum="1100"]
[cm]
#主人公
「いつもどおり」
[march_true_wait at="212.166" minimum="1100"]
[cm]
#抹茶エクレア
「千個？」
[march_true_wait at="214.613" minimum="1100"]
[cm]
#主人公
「最後までそれ？」
[march_true_wait at="217.355" minimum="1100"]
[cm]
#抹茶エクレア
「最後ちゃうやろ」
[march_true_wait at="220.098" minimum="1100"]
[cm]
#主人公
「……そうだね」
[march_true_wait at="222.766" minimum="1100"]
[cm]
#抹茶エクレア
「世界一の、その次の日やで」
[march_true_wait at="225.877" minimum="1100"]
[cm]
#主人公
「……うん」
[march_true_wait at="228.398" minimum="1100"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"","background-repeat":"","background-position":"","background-color":""});
[endscript]
[bg storage="apr_kitchen_morning.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
[skipstop]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[chara_hide name="女神" time="0"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"contain","background-repeat":"no-repeat","background-position":"center","background-color":"#000"});
[endscript]
[bg storage="cg/march/CG15_08_The_Day_After.png" time="650"]
[eval exp="sf.cg_march_event_08 = true"]
[cm]
#三好文子
「おはよう。今日も開いてる？」
[march_true_wait at="231.583" minimum="1100"]
[cm]
#抹茶エクレア
「もちろんやで！」
[march_true_wait at="234.325" minimum="1100"]
[cm]
#主人公
「おはようございます」
[march_true_wait at="237.215" minimum="1100"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[cm]
#抹茶エクレア
「ほな、まず何から？」
[march_true_wait at="240.105" minimum="1100"]
[cm]
#主人公
「クリームから」
[march_true_wait at="242.773" minimum="1100"]
[cm]
#抹茶エクレア
「香りが先。甘さはあとから」
[march_true_wait at="245.884" minimum="1100"]
[cm]
#主人公
「覚えてる」
[march_true_wait at="248.405" minimum="1100"]
[cm]
#抹茶エクレア
「……そっか」
[march_true_wait at="251.000" minimum="1100"]
[cm]
#
世界一になった次の日も、店は朝から仕込みだった。
[march_true_wait at="260.000" minimum="6500"]
[cm]
[clearfix]
[tb_hide_message_window]
[stopse]
[march_true_card]
[jump storage="title_screen.ks" target="*title"]

*march_ending_menu
[clearstack stack="if"]
[cm]
[clearfix]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
[hidemenubutton]
[restore_april_quick_menu]
[if exp="f.current_march_end == 'core_017'"]
#
[font color="0x305332" bold="true" size="28"]
真・BAD END 017『約束どおり』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
「……あんたに、聞いてほしいことがあってん」
; Registration is after the complete BAD card has been constructed, never at movie end.
[if exp="f.scene == '03_12a'"]
[eval exp="sf.core_bad_017 = true; sf.true_bad_seen = true; f.scene = '03_ending_menu'"]
[endif]
[elsif exp="f.current_march_end == 'march_end_01'"]
#
[font color="0x305332" bold="true" size="28"]
END『帰るべき場所』
[resetfont]
[else]
#
[font color="0x305332" bold="true" size="28"]
END『あなたの答え』
[resetfont]
[endif]
[glink text="タイトルへ" color="green" font_color="0x3B2A1B" x="675" width="400" height="85" size="23" y="150" bold="true" storage="title_screen.ks" target="*title" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="記録" color="green" font_color="0x3B2A1B" x="675" width="400" height="85" size="23" y="245" bold="true" storage="system_common.ks" target="*records_from_march_end" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[if exp="f.current_march_end != 'core_017' && sf.true_bad_seen === true"]
[glink text="最後の選択肢へ" color="green" font_color="0x3B2A1B" x="675" width="400" height="85" size="23" y="340" bold="true" target="*final_choice" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[endif]
[s]

*march_character_define
[if exp="!TYRANO.kag.stat.charas['女神']"]
[chara_new name="女神" jname="女神" storage="apr_goddess.png" width="495" height="660"]
[endif]
[return]
