; JANUARY / 第10章 満点の味、ゼロの顔
; Adopted January v1 text. Runtime verification is performed by the user.
*eyecatch_12_01
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
[bg storage="eyecatch/EYECATCH_12_01_JANUARY.png" time="1"]
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"contain", "background-repeat":"no-repeat", "background-position":"center", "background-color":"#fff9e5"});
[endscript]
[tb_hide_message_window]
[mask_off time="400"]
[playse storage="SE_EYECATCH_05_06_Jingle.wav" volume="75" loop="false"]
[wait time="3100"]
[mask time="400" color="0x000000"]
[stopse]
[jump target="*scene_01_01"]

*scene_01_01
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
[eval exp="f.chapter = '01'; f.scene = '01_01'"]
[mask_off time="500"]
#主人公
「明けましておめでとう」
[p]
#抹茶エクレア
「おめでとうさん！」
[p]
#主人公
「今年もよろしく」
[p]
#抹茶エクレア
「こちらこそ！」
[p]
[wait time="300"]
#抹茶エクレア
「……ほんまに今年になってもうた」
[p]
#主人公
「当たり前だけどね」
[p]
#抹茶エクレア
「四月に来た時は、年越す頃には世界一やと思ってた」
[p]
#主人公
「それはだいぶ早いな」
[p]
#抹茶エクレア
「夢は大きい方がええやろ」
[p]
#主人公
「期限は三月末だしね」
[p]
#抹茶エクレア
「あと三か月」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「……短いな」
[p]
#主人公
「そうだね」
[p]
#主人公
「でも、今日はまず仕込みだよ」
[p]
#抹茶エクレア
「せやな！」
[p]
#主人公
「年末に、無理しすぎないって決めたから」
[p]
#抹茶エクレア
「覚えてるで。休むんも仕込みのうち」
[p]
#主人公
「三好さんの言葉、気に入ったね」
[p]
#抹茶エクレア
「便利やもん」
[p]
#主人公
「都合よく使わないでよ」
[p]
#抹茶エクレア
「今日はちゃんと働くって！」
[p]
#抹茶エクレア
「……ん？」
[p]
#主人公
「ちょっと、考えたいことがあるんだ」
[p]
#抹茶エクレア
「新作？」
[p]
#主人公
「味の評価のこと」
[p]
#抹茶エクレア
「評価？」
[p]
#主人公
「十一月、女神様が言ってたでしょ」
[p]
#抹茶エクレア
「世界の人らに認められる実績が必要、って？」
[p]
#主人公
「うん。もし何かの審査を受けるなら、今のうちから客観的に味を見る練習はした方がいいと思って」
[p]
#抹茶エクレア
「審査の予定、決まったん？」
[p]
#主人公
「まだ。調べた一般的な試食評価の項目を、参考にしただけ」
[p]
#抹茶エクレア
「ふうん」
[p]
#主人公
「香り、口当たり、甘さと苦さのバランス、後味、見た目」
[p]
#抹茶エクレア
「……全部大事やな」
[p]
#主人公
「各二十点で、百点満点」
[p]
#抹茶エクレア
「百点！」
[p]
#主人公
「点数にすれば、何がよくなったか分かりやすい」
[p]
#抹茶エクレア
「じゃあ、ウチら今何点なん？」
[p]
#主人公
「……これから調べる」
[p]
#抹茶エクレア
「まだ測ってへんのかい！」
[p]
#主人公
「だから、試食してもらいたいんだ」
[p]
#抹茶エクレア
「ええやん。お客さんの声やな」
[p]
#主人公
「そう。今度は感覚だけじゃなくて、ちゃんと記録しよう」
[p]
#抹茶エクレア
「数字も、感想もやな」
[p]
#主人公
「……うん」
[p]
[wait time="350"]

*scene_01_02
[eval exp="f.chapter = '01'; f.scene = '01_02'"]
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
#主人公
「まずは、いつも買ってくれる人に意見を聞きたい」
[p]
#抹茶エクレア
「三好さんと神田ちゃん？」
[p]
#主人公
「来てくれたら、お願いしてみよう」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_mod name="三好文子" face="default"]
[chara_show name="三好文子" left="80" top="90" time="300"]
#三好文子
「こんにちは」
[p]
#抹茶エクレア
「三好さん！」
[p]
#主人公
「いらっしゃいませ」
[p]
#三好文子
「あら、今日は何かの試食会？」
[p]
#主人公
「少しだけ、味の採点をお願いしたくて」
[p]
#三好文子
「採点？」
[p]
#抹茶エクレア
「百点満点やで！」
[p]
#三好文子
「まあ、学校みたいね」
[p]
#主人公
「無理にとは言いません。いつものエクレアを召し上がってからで」
[p]
#三好文子
「それなら、喜んで」
[p]
[wait time="300"]
#三好文子
「……おいしいわ」
[p]
#主人公
「ありがとうございます。香りはいかがですか？」
[p]
#三好文子
「ふわっと来て、あとに残るのがいいわね」
[p]
#主人公
「二十点満点だと……？」
[p]
#三好文子
「うーん」
[p]
#抹茶エクレア
「難しそうやな」
[p]
[skipstop]
[eval exp="sf.cg_january_event_01 = true"]
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
[bg storage="cg/january/CG13_01_The_Five_Columns.png" time="500"]
#三好文子
「十八かしら。でもね」
[p]
#主人公
「はい」
[p]
#三好文子
「私はこのお茶と一緒に食べるのが好きなの」
[p]
#主人公
「……お茶」
[p]
#三好文子
「同じ一個でも、誰と、いつ食べるかで違って感じることもあるでしょう？」
[p]
#抹茶エクレア
「それはそうやな」
[p]
#主人公
「そうですね。欄外に書いておきます」
[p]
#三好文子
「点数より、話す方が長くなってしまうわね」
[p]
#主人公
「すみません」
[p]
#三好文子
「いいのよ。そういう時間が好きだから」
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
[chara_mod name="三好文子" face="default"]
[chara_show name="三好文子" left="80" top="90" time="300"]
[mask_off time="350"]
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_shop_day.png" time="1"]
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
「何ですか、この表？」
[p]
#抹茶エクレア
「百点満点の採点表！」
[p]
#神田姫花
「えっ、テストですか？」
[p]
#主人公
「味の参考に、よかったら書いてもらえますか」
[p]
#神田姫花
「いいですよ。こういうの、嫌いじゃないです」
[p]
[wait time="300"]
#神田姫花
「……あ、やっぱり好きです。後味が軽い」
[p]
#主人公
「じゃあ、後味は何点くらい？」
[p]
#神田姫花
「十九点、かな」
[p]
#抹茶エクレア
「おお！」
[p]
#神田姫花
「でも、最初の一口はもうちょっと抹茶が来てもいいかも」
[p]
#主人公
「香りを強くした方がいい？」
[p]
#神田姫花
「うーん、人によるとは思いますけど」
[p]
#抹茶エクレア
「そこが難しいとこやな」
[p]
#神田姫花
「私は今のままでも十分好きですよ」
[p]
#主人公
「……なるほど」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_hide name="神田姫花" time="300"]
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
[bg storage="apr_shop_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="450"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_mod name="藤代誠" face="default"]
[chara_show name="藤代誠" left="80" top="90" time="300"]
#藤代誠
「こんにちは」
[p]
#主人公
「藤代さん。いらっしゃいませ」
[p]
#抹茶エクレア
「また来てくれたんや！」
[p]
#藤代誠
「……おや、採点表」
[p]
#主人公
「試しに始めてみたんです」
[p]
#藤代誠
「いいですね。変化を見比べられますし」
[p]
#主人公
「そうなんです」
[p]
[wait time="350"]
#藤代誠
「……ただ」
[p]
#主人公
「？」
[p]
#藤代誠
「同じ点数でも、選ぶ理由は違うかもしれませんね」
[p]
#主人公
「選ぶ理由？」
[p]
#藤代誠
「例えば、今日、この店に寄りたくなった理由とか」
[p]
#抹茶エクレア
「……？」
[p]
#藤代誠
「いえ。美味しかったです」
[p]
#主人公
「ありがとうございます」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_hide name="藤代誠" time="300"]
#抹茶エクレア
「藤代さん、相変わらず言葉少ないな」
[p]
#主人公
「でも、考えることを置いていくね」
[p]
#抹茶エクレア
「せやな」
[p]
#主人公
「……よし。結果をまとめよう」
[p]
#抹茶エクレア
「その前にお茶は？」
[p]
#主人公
「あとで」
[p]
#抹茶エクレア
「……この前も聞いたな、それ」
[p]

*choice_01_00
[eval exp="f.chapter = '01'; f.scene = '01_choice_00'"]
[clearstack stack="if"]
[cm]
[glink text="アンケートをもっと細かく十二枚にしよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="150" bold="true" target="*mini_m08_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="提供温度を0.1℃刻みで完璧に合わせよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="245" bold="true" target="*mini_m09_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="点数も、食べた時の言葉も残そう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="340" bold="true" target="*correct_01_00" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*mini_m08_entry
[if exp="sf.mini_bad_m08 === true"]
[cm]
#
その結末は、もう知っている。
[r]
MINI BAD M08『試食アンケート十二枚』
[p]
[jump target="*choice_01_00"]
[endif]
[jump target="*mini_01_m08"]

*mini_01_m08
[eval exp="f.chapter = '01'; f.scene = '01_mini_m08'"]
[cm]
#主人公
「もっと丁寧に聞けば、正確になると思う」
[p]
#抹茶エクレア
「ほな何聞くん？」
[p]
#主人公
「香りの立ち方、広がる時間、最初の苦さ、最後の甘さ……」
[p]
#抹茶エクレア
「おお」
[p]
#主人公
「食感は三つに分けて……」
[p]
#抹茶エクレア
「まだ増えるん？」
[p]
#主人公
「紙が十二枚になった」
[p]
#抹茶エクレア
「十二枚！？」
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
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
「三好さん、もしよければこちらを」
[p]
#三好文子
「……まあ。ずいぶん立派ね」
[p]
#抹茶エクレア
「アンケートやで」
[p]
[preload storage="./data/bgimage/cg/january/SD13_01_MiniBad008_Survey_12_Pages.png" wait="true"]
[skipstop]
[eval exp="sf.cg_january_mini_01 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[image layer="1" name="january_sdcg_image" folder="bgimage" storage="cg/january/SD13_01_MiniBad008_Survey_12_Pages.png" x="320" y="100" width="640" visible="true"]
[image layer="1" name="january_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#三好文子
「全部書いたら、エクレアが冷めてしまいそう」
[p]
#主人公
「……あ」
[p]
#抹茶エクレア
「しかも冷めたら温度の点数変わるやん！」
[p]
#主人公
「それも質問欄に……」
[p]
#抹茶エクレア
「増やしたらあかん！」
[p]
[free layer="1" name="january_sdcg_image"]
[free layer="1" name="january_sdcg_frame"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[iscript]
f.april_bad = {"kind": "MINI", "id": "m08", "title": "試食アンケート十二枚", "lesson": "「お菓子食べに来た人に、宿題十二枚も出したらあかんわ……」", "retry": "*choice_01_00", "storage": "n01_january.ks", "month": "01"};
[endscript]
[register_mini_bad id="m08"]
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
[bg storage="apr_shop_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
[jump target="*choice_01_00"]

*mini_m09_entry
[if exp="sf.mini_bad_m09 === true"]
[cm]
#
その結末は、もう知っている。
[r]
MINI BAD M09『理想温度、あと0.1℃』
[p]
[jump target="*choice_01_00"]
[endif]
[jump target="*mini_01_m09"]

*mini_01_m09
[eval exp="f.chapter = '01'; f.scene = '01_mini_m09'"]
[cm]
#主人公
「提供温度も、ぴったりにした方が点数が安定するかな」
[p]
#抹茶エクレア
「冷やしすぎんようにするんやな」
[p]
#主人公
「一度ずつじゃ粗いな。0.1℃刻みで」
[p]
#抹茶エクレア
「こまかっ！」
[p]
#主人公
「……あと0.2℃」
[p]
#抹茶エクレア
「もう出してええんちゃう？」
[p]
#主人公
「いや、あと0.1℃」
[p]
[wait time="300"]
#抹茶エクレア
「お客さん待ってるで」
[p]
#主人公
「……あ、0.2℃下がりすぎた」
[p]
#抹茶エクレア
「戻すん！？」
[p]
#主人公
「もう一度調整すれば」
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_shop_night.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
[preload storage="./data/bgimage/cg/january/SD13_02_MiniBad009_Zero_Point_One_Degree.png" wait="true"]
[skipstop]
[eval exp="sf.cg_january_mini_02 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[if exp="TYRANO.kag.stat.charas['女神']"]
[chara_hide name="女神" time="0"]
[endif]
[image layer="1" name="january_sdcg_image" folder="bgimage" storage="cg/january/SD13_02_MiniBad009_Zero_Point_One_Degree.png" x="320" y="100" width="640" visible="true"]
[image layer="1" name="january_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#抹茶エクレア
「……お客さん、帰ってもうた」
[p]
#主人公
「温度はちょうどになったよ」
[p]
#抹茶エクレア
「食べてもらう人、おらへんけどな！」
[p]
[free layer="1" name="january_sdcg_image"]
[free layer="1" name="january_sdcg_frame"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[iscript]
f.april_bad = {"kind": "MINI", "id": "m09", "title": "理想温度、あと0.1℃", "lesson": "「温度計は満足したかもしれへんけど、お客さんに食べてもらわななあ……」", "retry": "*choice_01_00", "storage": "n01_january.ks", "month": "01"};
[endscript]
[register_mini_bad id="m09"]
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
[bg storage="apr_shop_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
[jump target="*choice_01_00"]

*correct_01_00
[eval exp="f.chapter = '01'; f.scene = '01_choice00_correct'"]
[cm]
#主人公
「点数だけじゃなくて、言葉も残そう」
[p]
#抹茶エクレア
「『好き』『また食べたい』とか？」
[p]
#主人公
「うん。どんな時に食べたいかも」
[p]
#抹茶エクレア
「それ、ええやん」
[p]
#主人公
「一度、試作の比較にも使ってみよう」
[p]

*scene_01_03
[eval exp="f.chapter = '01'; f.scene = '01_03'"]
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
[bg storage="apr_kitchen_morning.png" time="1"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#主人公
「集まった点数をまとめてみた」
[p]
#抹茶エクレア
「どない？」
[p]
#主人公
「全体では、けっこう高いよ」
[p]
#抹茶エクレア
「やった！」
[p]
#主人公
「ただ、香りの点数は人によって違う」
[p]
#抹茶エクレア
「三好さんは今ので好き言うてたな」
[p]
#主人公
「神田さんは、もう少し強くてもいいって」
[p]
#抹茶エクレア
「せやな」
[p]
#主人公
「じゃあ、中間に合わせれば……」
[p]
#抹茶エクレア
「みんなの真ん中？」
[p]
#主人公
「極端な点を減らせるかもしれない」
[p]
#抹茶エクレア
「ふうん」
[p]
[mask time="400" color="0x000000"]
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
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="400"]
#主人公
「甘さも同じだ。好みが分かれない数値に寄せよう」
[p]
#抹茶エクレア
「何回も細かく変えるんやな」
[p]
#主人公
「うん。口当たりも、ばらつきをなくす」
[p]
#抹茶エクレア
「でも、あの香りの立ち方、ウチは好きやで」
[p]
#主人公
「点数が割れてる部分だから、少し抑えれば平均は上がると思う」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「ほら、これなら項目ごとの欠点が少ない」
[p]
#抹茶エクレア
「たしかに、きれいにはまとまってる」
[p]
#主人公
「これを続ければ、百点も狙えるかも」
[p]
#抹茶エクレア
「……百点」
[p]
#主人公
「世界一を目指すなら、満点に近い方がいいよね」
[p]
#抹茶エクレア
「……ほんまに？」
[p]
#主人公
「え？」
[p]
#抹茶エクレア
「点数が高かったら、それでええんかな」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「採点するんは、味をよくするためやろ？」
[p]
#主人公
「そうだけど」
[p]
#抹茶エクレア
「食べる人は、紙の点数見ておいしい言うわけちゃうやん」
[p]
#主人公
「でも、基準がないと比べられないよ」
[p]
#抹茶エクレア
「それもそうやねん」
[p]
[wait time="350"]
#主人公
「……じゃあ、どうしよう」
[p]

*choice_01_01
[eval exp="f.chapter = '01'; f.scene = '01_choice_01'"]
[clearstack stack="if"]
[cm]
[glink text="採点表で百点になる味へ、徹底的に寄せよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="195" bold="true" target="*bad015_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="点数は参考にして、食べる人の反応も確かめよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="290" bold="true" target="*correct_01_01" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*bad015_entry
[if exp="sf.core_bad_015 === true"]
[cm]
#
その結末は、もう知っている。
[r]
CORE BAD 015『満点の味、ゼロの顔』
[p]
[jump target="*choice_01_01"]
[endif]
[jump target="*bad_01_015"]

*bad_01_015
[eval exp="f.chapter = '01'; f.scene = '01_bad015'"]
[cm]
#主人公
「採点表で百点になる味へ、徹底的に寄せよう」
[p]
#抹茶エクレア
「百点になるまで？」
[p]
#主人公
「うん。項目を一つずつ埋めよう」
[p]
#抹茶エクレア
「……分かった。一回やってみよか」
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_kitchen_morning.png" time="1"]
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#主人公
「香り、二十」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「口当たり、二十」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「甘さと苦さ、二十」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「後味、二十」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「見た目、二十」
[p]
#主人公
「合計、百点！」
[p]
#抹茶エクレア
「……満点やな」
[p]
#主人公
「やった。自分たちの採点表では、完全に満点だ」
[p]
#抹茶エクレア
「……食べてみて」
[p]
#主人公
「うん。欠点がない」
[p]
#抹茶エクレア
「ウチも食べたけど」
[p]
#主人公
「どう？」
[p]
#抹茶エクレア
「……よう出来てる」
[p]
#主人公
「でしょ？」
[p]
#抹茶エクレア
「……せやな」
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
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
#抹茶エクレア
「三好さん。新しい試作、食べてみて」
[p]
#三好文子
「まあ。ありがとう」
[p]
[wait time="300"]
#三好文子
「……きれいにまとまっているわね」
[p]
#主人公
「採点表では満点になったんです」
[p]
#三好文子
「そうなの」
[p]
#主人公
「どうですか？」
[p]
#三好文子
「とても丁寧だと思うわ」
[p]
#主人公
「ありがとうございます」
[p]
#三好文子
「……でも」
[p]
#主人公
「？」
[p]
#三好文子
「私が前に好きだと言った香りは、少し遠くなったかしら」
[p]
#主人公
「好みが分かれる部分だったので、抑えたんです」
[p]
#三好文子
「なるほどね」
[p]
#三好文子
「きっと、点数をつければ高いのでしょうね」
[p]
#抹茶エクレア
「……」
[p]
[skipstop]
[wait time="700"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_hide name="三好文子" time="300"]
[mask time="650" color="0x000000"]
[cm]
[skipstop]
[eval exp="sf.cg_january_event_02 = true"]
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
[bg storage="cg/january/CG13_02_A_Perfect_Score_An_Empty_Smile.png" time="1"]
[mask_off time="650"]
#主人公
「今日の試食、どうだった？」
[p]
#抹茶エクレア
「平均点は高かったで」
[p]
#主人公
「そう」
[p]
#抹茶エクレア
「でもな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「前みたいに『これ好き！』って笑う人、減った気する」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「おいしくないわけちゃう。まずいわけでもない」
[p]
#主人公
「点数は高いし」
[p]
#抹茶エクレア
「せや。でも、みんな、食べたら黙って帰るねん」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「三好さんも、神田ちゃんも」
[p]
#抹茶エクレア
「『また食べたい』って、今日は言わへんかった」
[p]
#主人公
「……百点なのに」
[p]
#抹茶エクレア
「百点って、誰の百点なん？」
[p]
#主人公
「……」
[p]
[wait time="350"]
#主人公
「採点表に、笑顔の欄はなかった」
[p]
#抹茶エクレア
「……」
[p]
#抹茶エクレア
「点数は増えたのに」
[p]
#抹茶エクレア
「食べてくれる人の顔、見んようになってたんやな」
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
[iscript]
TYRANO.kag.layer.getLayer("base", "fore").css({"background-size":"", "background-repeat":"", "background-position":"", "background-color":""});
[endscript]
[bg storage="apr_shop_day.png" time="1"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
[iscript]
f.april_bad = {"kind": "CORE", "id": "015", "title": "満点の味、ゼロの顔", "lesson": "「百点の紙は残った。でも、あの人らの『また食べたい』を置いてきてもうたんやな……」", "retry": "*choice_01_01", "storage": "n01_january.ks", "month": "01"};
[endscript]
[register_core_bad id="015"]
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
[bg storage="apr_kitchen_morning.png" time="1"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
[jump target="*choice_01_01"]

*correct_01_01
[eval exp="f.chapter = '01'; f.scene = '01_choice01_correct'"]
[cm]
#主人公
「点数は参考にして、食べる人の反応も確かめよう」
[p]
#抹茶エクレア
「数字、捨てるん？」
[p]
#主人公
「捨てないよ」
[p]
#主人公
「温度や重さ、作り方が安定してるかは、測った方が分かる」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「香りが強いって意見があれば、理由を考えられる」
[p]
#抹茶エクレア
「でも、みんな同じ点数になるようにするんやなくて」
[p]
#主人公
「うん」
[p]
#主人公
「誰が、どんな時に食べたいかを聞きたい」
[p]
#抹茶エクレア
「三好さんのお茶の話みたいに」
[p]
#主人公
「そう」
[p]
#抹茶エクレア
「点数と、顔」
[p]
#主人公
「どっちも見る」
[p]
#抹茶エクレア
「……ええな」
[p]
#主人公
「それで、今の味をどうするか二人で決めよう」
[p]
#抹茶エクレア
「ウチらの店の味やしな」
[p]

*scene_01_04
[eval exp="f.chapter = '01'; f.scene = '01_04'"]
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
#主人公
「採点表、少し作り直した」
[p]
#抹茶エクレア
「枚数増やしたん？」
[p]
#主人公
「減らしたよ」
[p]
#抹茶エクレア
「えらい！」
[p]
#主人公
「子ども扱いしないで」
[p]
#抹茶エクレア
「褒めてんねん！」
[p]
#主人公
「五つの項目はそのまま」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「でも、下に自由に書ける欄を作った」
[p]
#抹茶エクレア
「何て書いてあるん？」
[p]
#主人公
「『どんな時に、また食べたいですか？』」
[p]
#抹茶エクレア
「……ええな、それ」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_mod name="神田姫花" face="default"]
[chara_show name="神田姫花" left="80" top="90" time="300"]
#神田姫花
「こんにちは」
[p]
#抹茶エクレア
「神田ちゃん！」
[p]
#神田姫花
「今日は何点をつければいいんですか？」
[p]
#主人公
「何点でもいいです。今回は感想も聞きたくて」
[p]
#神田姫花
「それなら、もう答えはあります」
[p]
#抹茶エクレア
「早っ！」
[p]
[skipstop]
[eval exp="sf.cg_january_event_03 = true"]
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
[bg storage="cg/january/CG13_03_Beyond_the_Score.png" time="500"]
#神田姫花
「勉強とか作業のあとに、一個食べたいんです」
[p]
#主人公
「作業のあとに？」
[p]
#神田姫花
「はい。頭を使ったあとって、甘いものが欲しくなるんですけど」
[p]
#神田姫花
「重すぎないから、ここのはちょうどいいんですよ」
[p]
#抹茶エクレア
「……！」
[p]
#主人公
「なるほど。神田さんには、そこが大事なんだね」
[p]
#神田姫花
「そうです。あと、抹茶の香りがちゃんとするところ」
[p]
#抹茶エクレア
「せやろ！」
[p]
#神田姫花
「……それと、二つ買って、あとでもう一つ食べるのも好きです」
[p]
#主人公
「二つ」
[p]
#抹茶エクレア
「神田ちゃん、ブレへんなあ」
[p]
#神田姫花
「そこは覚えてていいです！」
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
[chara_mod name="神田姫花" face="default"]
[chara_show name="神田姫花" left="80" top="90" time="300"]
[mask_off time="350"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_hide name="神田姫花" time="300"]
#主人公
「……採点表に書かなかった話が、いっぱい出てきた」
[p]
#抹茶エクレア
「な。神田ちゃんの味や」
[p]
#主人公
「同じエクレアでも、楽しみ方が違うんだね」
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
#三好文子
「今日は少し、ゆっくりできそうね」
[p]
#抹茶エクレア
「一月は落ち着いてるで」
[p]
#三好文子
「よかった。じゃあ、お茶と一緒にいただこうかしら」
[p]
#主人公
「ぜひ」
[p]
[wait time="350"]
#三好文子
「……うん。やっぱり好きだわ」
[p]
#抹茶エクレア
「ほんま？」
[p]
#三好文子
「ええ。甘いだけじゃなくて、香りが少し残るところ」
[p]
#主人公
「……」
[p]
#三好文子
「点数にしたら、何点かしらね」
[p]
#主人公
「何点でもいいんです」
[p]
#三好文子
「あら」
[p]
#主人公
「また食べたいと思ってもらえたなら、理由を聞かせてもらいたいです」
[p]
#三好文子
「ふふ。やっと、いつもの店主さんに戻ったわね」
[p]
#主人公
「そうですか？」
[p]
#三好文子
「ええ」
[p]
#抹茶エクレア
「最近、計算機と話してばっかりやったしな」
[p]
#主人公
「話してないよ」
[p]
#抹茶エクレア
「顔は話してた」
[p]
#三好文子
「それは大変ね」
[p]
[wait time="350"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_hide name="三好文子" time="300"]
#抹茶エクレア
「なあ」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「今日、ええ顔いっぱい見たな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「それ、何点やろ」
[p]
#主人公
「……点数にしなくてもいいんじゃない？」
[p]
#抹茶エクレア
「せやな」
[p]

*scene_01_05
[eval exp="f.chapter = '01'; f.scene = '01_05'"]
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
「今月の結果、まとめたよ」
[p]
#抹茶エクレア
「何点やった？」
[p]
#主人公
「ばらつきはある。でも、前より安定してる」
[p]
#抹茶エクレア
「ええやん」
[p]
#主人公
「香りを強くする試作もやったけど、今のレシピを基本にしたい」
[p]
#抹茶エクレア
「……なんで？」
[p]
#主人公
「三好さんは、お茶と一緒に食べるのが好き」
[p]
#主人公
「神田さんは、作業のあとに食べる軽さが好き」
[p]
#主人公
「藤代さんは、変わるところと変わらないところを見てる」
[p]
#抹茶エクレア
「……みんな違うな」
[p]
#主人公
「うん。でも、どの人も、うちのエクレアを選んでくれてる」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「点数で分かる変化は、大事にしよう」
[p]
#主人公
「でも、点数を上げるためだけに、その理由を消さない」
[p]
#抹茶エクレア
「……うん」
[p]
#主人公
「百点じゃないかもしれないけど」
[p]
#抹茶エクレア
「せやけど？」
[p]
#主人公
「この味で、また来てもらいたい」
[p]
#抹茶エクレア
「ウチも！」
[p]
#抹茶エクレア
「なあ、採点表、もういらんの？」
[p]
#主人公
「使うよ。明日も」
[p]
#抹茶エクレア
「ええんか？」
[p]
#主人公
「うん。自分たちを確かめるためにね」
[p]
#抹茶エクレア
「採点表が店長にならんようにせな」
[p]
#主人公
「店長は自分だから」
[p]
#抹茶エクレア
「ウチは？」
[p]
#主人公
「大事な相棒」
[p]
#抹茶エクレア
「……よろしい！」
[p]

*scene_01_06
[eval exp="f.chapter = '01'; f.scene = '01_06'"]
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
#抹茶エクレア
「一月も終わりやな」
[p]
#主人公
「早いね」
[p]
#抹茶エクレア
「世界一まで、あと二か月」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「今月、百点取れへんかったな」
[p]
#主人公
「そうだね」
[p]
#抹茶エクレア
「悔しい？」
[p]
#主人公
「少しだけ」
[p]
#抹茶エクレア
「正直やな」
[p]
#主人公
「でも、悪くなかったと思う」
[p]
#抹茶エクレア
「なんで？」
[p]
#主人公
「点数で見つけたこともあるし」
[p]
#主人公
「人に聞かなきゃ分からなかったこともある」
[p]
#抹茶エクレア
「三好さんが、お茶と一緒に食べるん好きって」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「神田ちゃんが二個買うんも、理由あんねんな」
[p]
#主人公
「……そこはいつも二個なだけかも」
[p]
#抹茶エクレア
「ええねん。二個は二個や」
[p]
[wait time="300"]
#主人公
「点数って、便利なんだよね」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「でも、そこに全部の答えがあるわけじゃない」
[p]
#抹茶エクレア
「人の顔、数字にしたらこぼれてまうもんもあるしな」
[p]
#主人公
「……うん」
[p]
#抹茶エクレア
「なあ」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「世界一になったら、満点やと思う？」
[p]
#主人公
「どうだろうね」
[p]
#抹茶エクレア
「ウチは、たぶん」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「その日も、誰かの『おいしい』聞きたいわ」
[p]
#主人公
「……そうだね」
[p]
[chara_mod name="抹茶エクレア" face="default"]
#抹茶エクレア
「ほな、今日も作ろか」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「ちゃんと休みながら！」
[p]
#主人公
「十二月の復習？」
[p]
#抹茶エクレア
「テスト範囲やで」
[p]
#主人公
「まだテスト続いてるんだ」
[p]
#抹茶エクレア
「ウチらの店は、毎日実技試験やからな！」
[p]
#主人公
「厳しいなあ」
[p]

*january_clear
[iscript]
sf.normal_ch01_clear = true; f.chapter = "01"; f.scene = "clear"; f.current_clear_month = "01";
[endscript]
[skipstop]
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
1月 CLEAR『点数の外にある、おいしい』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
世界一に近づくため、二人は味を点数で確かめ始めた。
数字にすると変化が見え、より安定した商品を作れた。
[p]
けれど、点数には「どんな時に食べたいか」「誰と食べると嬉しいか」までは書き切れなかった。
数値は味を磨く道具。
[p]
最後に見つめるのは、目の前で食べる人の顔だった。
[p]
[jump target="*january_clear_menu"]

*january_clear_menu
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
1月 CLEAR『点数の外にある、おいしい』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
抹茶ちゃんのひとこと
[r]
「百点にしたいんは、紙の上やなくて、食べてくれた人の一日かもしれへんな」
[resetfont]
[glink text="タイトルへ" color="green" font_color="0x3B2A1B" x="675" width="400" height="85" size="23" y="150" bold="true" storage="title_screen.ks" target="*title" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="記録" color="green" font_color="0x3B2A1B" x="675" width="400" height="85" size="23" y="245" bold="true" storage="system_common.ks" target="*records_from_clear" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="2月へ" color="green" font_color="0x3B2A1B" x="675" y="340" width="400" height="85" size="23" bold="true" storage="n02_february.ks" target="*eyecatch_01_02" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[s]
