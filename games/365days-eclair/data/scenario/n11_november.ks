; CHAPTER 11 / NOVEMBER - 女神様、説明不足です
; Confirmed November v3 dialogue; user performs the final in-app acceptance checks.
*eyecatch_10_11
[skipstop]
[clearstack stack="if"]
[cm]
[clearfix]
[call storage="system_common.ks"]
[call target="*november_character_define"]
[stopbgm fadeout="true" time="700"]
[mask time="700" color="0x000000"]
[stopse]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="eyecatch/EYECATCH_10_11_NOVEMBER.png" time="0"]
[tb_hide_message_window]
[mask_off time="400"]
[playse storage="SE_EYECATCH_05_06_Jingle.wav" volume="75" loop="false"]
[wait time="3100"]
[mask time="400" color="0x000000"]
[stopse]
[jump target="*scene_11_01"]

*scene_11_01
[call storage="system_common.ks"]
[call target="*november_character_define"]
[clearstack stack="if"]
[cm]
[clearfix]
[hidemenubutton]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_kitchen_morning.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
[restore_april_quick_menu]
[eval exp="f.chapter = '11'; f.scene = '11_01'"]
[mask_off time="500"]
#主人公
「十一月だね」
[p]
#抹茶エクレア
「十一月やな」
[p]
#主人公
「今年もあと二か月か」
[p]
#抹茶エクレア
「……え？」
[p]
#主人公
「え？」
[p]
#抹茶エクレア
「十一月？」
[p]
#主人公
「いま言ったよね」
[p]
#抹茶エクレア
「ちょっと待って」
[p]
#主人公
「どうしたの」
[p]
#抹茶エクレア
「四月にこっち来て」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「五月にお客さん呼んで」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「六月、七月、八月……九月に久世さんと会うて」
[p]
#主人公
「十月は海外からお客さんが来たね」
[p]
#抹茶エクレア
「そう！　で、十一月！」
[p]
#主人公
「省略したね」
[p]
#抹茶エクレア
「半年以上経ってるやん！」
[p]
#主人公
「今さら？」
[p]
#抹茶エクレア
「一年って、案外短いな」
[p]
#主人公
「まだ終わってないよ」
[p]
#抹茶エクレア
「せやな。まだ世界一ちゃうし」
[p]
#主人公
「それもあるけど」
[p]
#抹茶エクレア
「ところで、世界一になったかどうかって」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「結局、誰が決めるん？」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「女神様？」
[p]
#主人公
「そもそも、どうやって知らせるんだろう」
[p]
#抹茶エクレア
「ウチが大声で言うたら？」
[p]
#主人公
「自己申告はちょっと」
[p]
#抹茶エクレア
「世界一の抹茶エクレア、できましたー！」
[p]
#主人公
「店中に響く声で言わないで」
[p]
#抹茶エクレア
「聞こえるかもしれへんやん」
[p]
#主人公
「どこまで？」
[p]
#抹茶エクレア
「天まで」
[p]
#主人公
「……女神様、説明が足りないな」
[p]
[wait time="350"]
[skipstop]
[eval exp="sf.cg_november_event_01 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[xchgbgm storage="03_A_Goddess_Forgot_to_Explain.mp3" time="900"]
[playse storage="se_matcha_teleport_land.wav" volume="70" loop="false"]
[bg storage="cg/november/CG11_01_She_Really_Came.png" time="500"]
#女神
「お呼びでしょうか？」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「来た」
[p]
#抹茶エクレア
「呼んだら来るん！？」
[p]

*scene_11_02
[eval exp="f.chapter = '11'; f.scene = '11_02'"]
#女神
「ご無沙汰しております」
[p]
#主人公
「いらっしゃいませ……でいいんでしょうか」
[p]
#女神
「ええ。ですが、お菓子は後ほどで」
[p]
#抹茶エクレア
「食べに来たんちゃうんや」
[p]
#女神
「もちろん、それも楽しみではありますが」
[p]
#主人公
「楽しみではあるんですね」
[p]
#女神
「近況を伺いに参りました」
[p]
[mask time="450" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_kitchen_morning.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="女神" face="default"]
[chara_show name="女神" left="80" top="90" time="250"]
[mask_off time="450"]
#抹茶エクレア
「ほな聞いて！　お客さん増えてん！」
[p]
#女神
「それは素晴らしいですね」
[p]
#抹茶エクレア
「海外の人も来た！」
[p]
#女神
「まあ」
[p]
#抹茶エクレア
「久世さんいう、すごいパティシエもおった！」
[p]
#女神
「まあまあ」
[p]
#抹茶エクレア
「ウチ、世界一に近づいてるやろ？」
[p]
#女神
「努力されていることは、よく伝わってきます」
[p]
#抹茶エクレア
「近づいてるやろ？」
[p]
#女神
「それは、まだ私には判定できません」
[p]
#抹茶エクレア
「急に現実的やな！」
[p]
#主人公
「そもそも判定の仕組みが分からなくて」
[p]
#女神
「そうでしたか」
[p]
#主人公
「四月は、条件の話で精いっぱいだったので」
[p]
#女神
「ええ。一年以内に世界一になること」
[p]
#抹茶エクレア
「そこは覚えてる」
[p]
#女神
「期限は、翌年三月末までですね」
[p]
#主人公
「具体的には、誰が世界一だと認めればいいんでしょう」
[p]
#女神
「それは……世界の方々が認める実績、といったところでしょうか」
[p]
#主人公
「といったところ？」
[p]
#女神
「私一人の好みで決めるものではありませんから」
[p]
#抹茶エクレア
「女神様が認定してくれたら早いのに」
[p]
#女神
「私も公平でありたいのです」
[p]
#主人公
「……なるほど」
[p]
#女神
「それに、どうか無理はなさらないでくださいね」
[p]
#主人公
「はい」
[p]
#女神
「お客様の声も大切に」
[p]
#抹茶エクレア
「うん」
[p]
#女神
「あとは、約束が叶えば帰還できるよう、こちらで準備しておきます」
[p]
[wait time="300"]
#主人公
「帰還……」
[p]
#抹茶エクレア
「……」
[p]
#女神
「ほかに、ご不明なことはございますか？」
[p]
#主人公
「……」
[p]

*choice_11_00
[eval exp="f.chapter = '11'; f.scene = '11_choice_00'"]
[clearstack stack="if"]
[cm]
[glink text="まずはエクレアでご機嫌を取ろう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="150" bold="true" target="*mini_m04_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="聞き漏らし防止に108問用意しよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="245" bold="true" target="*mini_m05_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="回り道せず、そのまま質問しよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="340" bold="true" target="*choice_11_00_to_01" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*choice_11_00_to_01
[cm]
#主人公
「では、さっきのお話について……」
[p]
#抹茶エクレア
「ウチら、ちゃんと分かっとかなあかんな」
[p]
#女神
「ええ。遠慮なくお聞きください」
[p]
[jump target="*choice_11_01"]

*choice_11_01
[eval exp="f.chapter = '11'; f.scene = '11_choice_01'"]
[clearstack stack="if"]
[cm]
[glink text="女神様のお言葉を、そのまま正解にしよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="150" bold="true" target="*bad012_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="この言葉には、隠された条件があるはず" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="245" bold="true" target="*bad013_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="分からないところを、今ここで聞こう" color="green" font_color="0x3B2A1B" x="310" width="660" height="85" size="21" y="340" bold="true" target="*correct_11" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*mini_m04_entry
[if exp="sf.mini_bad_m04 === true"]
[cm]
#
その結末は、もう知っている。
[r]
MINI BAD M04『神様へのお供え物』
[p]
[jump target="*choice_11_00"]
[endif]
[jump target="*mini_11_m04"]

*mini_11_m04
[eval exp="f.chapter = '11'; f.scene = '11_mini_m04'"]
[cm]
#主人公
「その前に、お菓子をお出ししようか」
[p]
#抹茶エクレア
「せや！ 女神様、せっかく来てくれたんやし！」
[p]
#女神
「まあ、ありがとうございます」
[p]
#抹茶エクレア
「ほな、抹茶エクレアの食べ比べや！」
[p]
#主人公
「食べ比べ？」
[p]
#抹茶エクレア
「いつもの、少し冷やしたの、それから試作中のやつ！」
[p]
#女神
「どれも素敵ですね」
[p]
#主人公
「……そろそろ質問を」
[p]
#抹茶エクレア
「待って、今の感想めっちゃ大事や！」
[p]
#女神
「こちらの香りも、また良いですね」
[p]
#主人公
「うん。大事だけど」
[p]
[mask time="450" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_kitchen_morning.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="女神" face="default"]
[chara_show name="女神" left="80" top="90" time="250"]
[mask_off time="450"]
#抹茶エクレア
「ほな次は、クリームの濃さ違い！」
[p]
#主人公
「まだあるの！？」
[p]
#女神
「私としては、たいへん嬉しいのですが……」
[p]
#主人公
「……肝心のこと、ひとつも聞いてない」
[p]
#抹茶エクレア
「……あ」
[p]
[skipstop]
[eval exp="sf.cg_november_mini_01 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[image layer="1" name="november_sdcg_image" folder="bgimage" storage="cg/november/SD11_01_MiniBad004_Offering_for_the_Goddess.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="november_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#女神
「質問のお時間でしたね」
[p]
#抹茶エクレア
「女神様を喜ばせるんが目的になってもうた……」
[p]
[free layer="1" name="november_sdcg_image"]
[free layer="1" name="november_sdcg_frame"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[iscript]
f.april_bad = {"kind": "MINI", "id": "m04", "title": "神様へのお供え物", "lesson": "「女神様を喜ばせるんが目的になってもうた……」", "retry": "*choice_11_00", "storage": "n11_november.ks", "month": "11"};
[endscript]
[register_mini_bad id="m04"]
[call storage="system_common.ks" target="*show_mini_bad"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_kitchen_morning.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="女神" face="default"]
[chara_show name="女神" left="80" top="90" time="250"]
[mask_off time="650"]
[jump target="*choice_11_00"]

*mini_m05_entry
[if exp="sf.mini_bad_m05 === true"]
[cm]
#
その結末は、もう知っている。
[r]
MINI BAD M05『神託FAQ・全108問』
[p]
[jump target="*choice_11_00"]
[endif]
[jump target="*mini_11_m05"]

*mini_11_m05
[eval exp="f.chapter = '11'; f.scene = '11_mini_m05'"]
[cm]
#主人公
「質問を全部書き出してからにしよう」
[p]
#抹茶エクレア
「全部？」
[p]
#主人公
「聞き漏らしは避けたいから」
[p]
#女神
「もちろん、お答えできることでしたら」
[p]
[wait time="350"]
#主人公
「……百八問になった」
[p]
#抹茶エクレア
「煩悩の数やん」
[p]
#女神
「そんなにございましたか」
[p]
#主人公
「第一問。女神様は、抹茶の苦味をどう定義しますか？」
[p]
#女神
「ええと……」
[p]
#主人公
「第二問。『世界』には神様の世界も含まれますか？」
[p]
#女神
「それは、ご質問の趣旨によりますが……」
[p]
#抹茶エクレア
「なあ、もっと大事な質問から聞かへん？」
[p]
#主人公
「第十七問。『一年以内』の秒数はうるう年を……」
[p]
#抹茶エクレア
「聞いて！」
[p]
[mask time="450" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_kitchen_morning.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="女神" face="default"]
[chara_show name="女神" left="80" top="90" time="250"]
[mask_off time="450"]
#女神
「……あの。お店の営業は大丈夫でしょうか？」
[p]
#主人公
「え？」
[p]
#抹茶エクレア
「もう開店の時間やで！」
[p]
[skipstop]
[eval exp="sf.cg_november_mini_02 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[image layer="1" name="november_sdcg_image" folder="bgimage" storage="cg/november/SD11_02_MiniBad005_FAQ108.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="november_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#主人公
「……大事な質問、まだ一つもできてない」
[p]
#女神
「まずは大切な点から、順番に伺いましょうね」
[p]
#抹茶エクレア
「それ、最初に言うてほしかったわ……」
[p]
[free layer="1" name="november_sdcg_image"]
[free layer="1" name="november_sdcg_frame"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[iscript]
f.april_bad = {"kind": "MINI", "id": "m05", "title": "神託FAQ・全108問", "lesson": "「それ、最初に言うてほしかったわ……」", "retry": "*choice_11_00", "storage": "n11_november.ks", "month": "11"};
[endscript]
[register_mini_bad id="m05"]
[call storage="system_common.ks" target="*show_mini_bad"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_kitchen_morning.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="女神" face="default"]
[chara_show name="女神" left="80" top="90" time="250"]
[mask_off time="650"]
[jump target="*choice_11_00"]

*bad012_entry
[if exp="sf.core_bad_012 === true"]
[cm]
#
その結末は、もう知っている。
[r]
CORE BAD 012『神様の言うとおり』
[p]
[jump target="*choice_11_01"]
[endif]
[jump target="*bad_11_012"]

*bad_11_012
[eval exp="f.chapter = '11'; f.scene = '11_bad012'"]
[cm]
#主人公
「女神様のお言葉を、そのまま正解にしよう」
[p]
#抹茶エクレア
「そのまま？」
[p]
#主人公
「うん。女神様が『無理するな』『お客様の声を大切に』って言った」
[p]
#抹茶エクレア
「ええこと言うてはるやん」
[p]
#主人公
「それなら、何か変える必要もない。女神様に言われたことだけ守ろう」
[p]
#抹茶エクレア
「……それ、そういう意味なん？」
[p]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_shop_day.png" time="0"]
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#主人公
「新しい試作は、女神様から言われてないから保留で」
[p]
#抹茶エクレア
「えっ。お客さんから『もうちょい香りが』って言われたで？」
[p]
#主人公
「でも『無理はしないで』って」
[p]
#抹茶エクレア
「それ、試作したらあかんってこと？」
[p]
#主人公
「……たぶん」
[p]
#主人公
「海外向けの追加案内も、女神様から言われてないし」
[p]
#抹茶エクレア
「十月にせっかく作ったやん」
[p]
#主人公
「言われたこと以上はしない方が安全だと思う」
[p]
#抹茶エクレア
「……何が安全なんやろ」
[p]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#主人公
「今月は、ほとんど何も進まなかったね」
[p]
#抹茶エクレア
「店は開けた。でも、考えるんを止めてもうた」
[p]
#主人公
「女神様の言うとおりにしたのに」
[p]
[chara_mod name="女神" face="default"]
[chara_show name="女神" left="80" top="90" time="500"]
#女神
「……あの」
[p]
#主人公
「女神様！」
[p]
#女神
「私は、あなた方の工夫まで止めるつもりはなかったのですが」
[p]
#抹茶エクレア
「せやんな？」
[p]
#女神
「むしろ、お二人で考えることを大切にしていただきたくて」
[p]
#主人公
「……」
[p]
#女神
「『無理をしないで』は、文字どおりのお気遣いでして……」
[p]
#抹茶エクレア
「ほんまに、それだけやったんや」
[p]
#主人公
「神様が言ったからって」
[p]
#主人公
「考えることまで預けちゃだめだったんだね」
[p]
[chara_hide name="女神" time="250"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[iscript]
f.april_bad = {"kind": "CORE", "id": "012", "title": "神様の言うとおり", "lesson": "「考えることまで預けちゃだめだったんだね」", "retry": "*choice_11_01", "storage": "n11_november.ks", "month": "11"};
[endscript]
[register_core_bad id="012"]
[call storage="system_common.ks" target="*show_core_bad"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_kitchen_morning.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="女神" face="default"]
[chara_show name="女神" left="80" top="90" time="250"]
[mask_off time="650"]
[jump target="*choice_11_01"]

*bad013_entry
[if exp="sf.core_bad_013 === true"]
[cm]
#
その結末は、もう知っている。
[r]
CORE BAD 013『深読みしすぎ』
[p]
[jump target="*choice_11_01"]
[endif]
[jump target="*bad_11_013"]

*bad_11_013
[eval exp="f.chapter = '11'; f.scene = '11_bad013'"]
[cm]
#主人公
「この言葉には、隠された条件があるはず」
[p]
#抹茶エクレア
「隠された？」
[p]
#主人公
「世界一って、具体的に言わなかったでしょ」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「『お客様の声も大切に』も、何かの暗号なのかもしれない」
[p]
#抹茶エクレア
「暗号？」
[p]
#主人公
「きっと普通に作るだけじゃ足りない。神様だから、試してるんだ」
[p]
#抹茶エクレア
「……なんか嫌な方向へ賢くなってへん？」
[p]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_kitchen_day.png" time="0"]
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#主人公
「『一年以内』って、もしかして三百六十五個ぴったり作れって意味かな」
[p]
#抹茶エクレア
「四月に千個作ろうとして怒られたんやで？」
[p]
#主人公
「じゃあ、三百六十五種類？」
[p]
#抹茶エクレア
「もっと無理やろ！」
[p]
#主人公
「『世界一』だから、世界地図の中心で売る必要が……」
[p]
#抹茶エクレア
「どこやねん、それ」
[p]
#主人公
「『お客様の声』って、全員の声を録音して集める……？」
[p]
#抹茶エクレア
「お客さんびっくりするわ！」
[p]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_kitchen_night.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#抹茶エクレア
「……もう閉店やで」
[p]
#主人公
「ごめん。隠し条件の一覧、まだ途中」
[p]
#抹茶エクレア
「今日の売上、見た？」
[p]
#主人公
「……見てない」
[p]
#抹茶エクレア
「明日の仕込みは？」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「神様の秘密を探してる間に」
[p]
#抹茶エクレア
「目の前の店、ほったらかしや」
[p]
[chara_mod name="女神" face="default"]
[chara_show name="女神" left="80" top="90" time="500"]
#女神
「……申し訳ありませんが」
[p]
#主人公
「見つけましたか、隠し条件！」
[p]
#女神
「隠しておりません」
[p]
#主人公
「……」
[p]
#女神
「もし私の言葉が分かりにくければ、聞いてくださればよかったのです」
[p]
#抹茶エクレア
「それや……」
[p]
#主人公
「答えを探してるつもりで」
[p]
#主人公
「質問するのを忘れてた」
[p]
[chara_hide name="女神" time="250"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[iscript]
f.april_bad = {"kind": "CORE", "id": "013", "title": "深読みしすぎ", "lesson": "「質問するのを忘れてた」", "retry": "*choice_11_01", "storage": "n11_november.ks", "month": "11"};
[endscript]
[register_core_bad id="013"]
[call storage="system_common.ks" target="*show_core_bad"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_kitchen_morning.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="女神" face="default"]
[chara_show name="女神" left="80" top="90" time="250"]
[mask_off time="650"]
[jump target="*choice_11_01"]

*correct_11
[eval exp="f.chapter = '11'; f.scene = '11_correct'"]
[cm]
#主人公
「分からないところを、今ここで聞こう」
[p]
#女神
「はい。どうぞ」
[p]
#主人公
「まず、世界一かどうかは、女神様の好みで決めるわけじゃないんですよね」
[p]
#女神
「ええ。客観的に認められる実績が必要です」
[p]
#抹茶エクレア
「ウチが『世界一や！』言うだけじゃあかん？」
[p]
#女神
「それは、もう少しだけ説得力が必要かと」
[p]
#抹茶エクレア
「もう少しで済むんや」
[p]
#主人公
「女神様は、作り方まで指定しているんですか？」
[p]
#女神
「いいえ。条件だけです。方法は、お二人でお決めください」
[p]
#主人公
「さっきの『無理はしないで』は？」
[p]
#女神
「心配しただけです」
[p]
#抹茶エクレア
「普通に優しかった」
[p]
#女神
「普通に優しくしてはいけませんか？」
[p]
#主人公
「いえ、ありがたいです」
[p]
[wait time="300"]
#主人公
「それと、帰還のことも確認させてください」
[p]
#女神
「はい」
[p]
#主人公
「条件を満たしたら、元の世界に帰ることができる……で合っていますか？」
[p]
#女神
「ええ。帰還するための道を開くことができます」
[p]
#主人公
「必ず、その日に帰らないといけないんでしょうか」
[p]
#女神
「いいえ。強制ではありません」
[p]
#抹茶エクレア
「……へえ」
[p]
#主人公
「そうなんですね」
[p]
#女神
「はい。帰還は、叶えられる権利のようなものです」
[p]
#主人公
「分かりました。ありがとうございます」
[p]
#女神
「よかった。ほかにも何かあれば、どうぞ尋ねてくださいね」
[p]
#抹茶エクレア
「ほな最後に一個！」
[p]
#女神
「はい」
[p]
#抹茶エクレア
「女神様、抹茶エクレア食べる？」
[p]
#女神
「……もちろん」
[p]
#主人公
「一番大事な質問、それ？」
[p]
#抹茶エクレア
「何を言うてんねん。お客さんやで」
[p]
#女神
「ふふ。では、一ついただきましょう」
[p]

*scene_11_03
[eval exp="f.chapter = '11'; f.scene = '11_03'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="女神" face="default"]
[chara_show name="女神" left="80" top="90" time="250"]
[mask_off time="650"]
[skipstop]
[eval exp="sf.cg_november_event_02 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="cg/november/CG11_02_A_Goddess_Is_Also_a_Customer.png" time="500"]
#女神
「……なるほど」
[p]
#抹茶エクレア
「ど、どう？」
[p]
#女神
「以前より、ずいぶん軽やかですね」
[p]
#主人公
「六月と七月に、たくさん試したので」
[p]
#女神
「抹茶の香りも、きちんと残っています」
[p]
#抹茶エクレア
「せやろ！」
[p]
#女神
「そして、少しだけほろ苦い」
[p]
#抹茶エクレア
「そこがええねん」
[p]
#女神
「最初は、もっと甘い方が好きだと思っていましたが」
[p]
#主人公
「思っていました？」
[p]
#女神
「ええ。けれど、食べてみると」
[p]
#女神
「このくらいが、おいしいですね」
[p]
#抹茶エクレア
「……！」
[p]
#主人公
「どうした？」
[p]
#抹茶エクレア
「女神様にも、うちの今の味、伝わった」
[p]
#女神
「そういうことですね」
[p]
#抹茶エクレア
「十月に考えた説明、無駄やなかったな」
[p]
#主人公
「店で実際に食べてもらうのが一番だしね」
[p]
#女神
「説明して、食べてもらって、その声を聞く」
[p]
#女神
「……お二人は、随分いろいろ学ばれたのですね」
[p]
#主人公
「失敗もしましたけど」
[p]
#抹茶エクレア
「いっぱいな！」
[p]
#主人公
「胸張るところかな」
[p]
#女神
「失敗した分だけ、話し合ってきたのでしょう？」
[p]
#抹茶エクレア
「……まあな」
[p]
[mask time="450" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="女神" face="default"]
[chara_show name="女神" left="80" top="90" time="250"]
[mask_off time="450"]
#女神
「ごちそうさまでした。私は、そろそろ」
[p]
#主人公
「また、いつでもどうぞ」
[p]
#抹茶エクレア
「次は新作も食べてな！」
[p]
#女神
「ええ。お二人の答えを、楽しみにしています」
[p]
[chara_hide name="女神" time="500"]

*scene_11_04
[eval exp="f.chapter = '11'; f.scene = '11_04'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#主人公
「女神様、来てくれてよかったね」
[p]
#抹茶エクレア
「せやな。分からんこと、だいぶ減った」
[p]
#主人公
「世界一の条件も、ちゃんと実績が必要だって分かった」
[p]
#抹茶エクレア
「じゃあ、世界一やって胸張れる何か、探さなな」
[p]
#主人公
「十月の海外企画の記事にも、海外の菓子イベントの話があったし」
[p]
#抹茶エクレア
「大会とか？」
[p]
#主人公
「そういう機会もあるのかもしれない」
[p]
#抹茶エクレア
「久世さんも出そうやな」
[p]
#主人公
「なんでそうなるの」
[p]
#抹茶エクレア
「あの人、強そうやし」
[p]
#主人公
「強いのは否定しないけど」
[p]
#抹茶エクレア
「……楽しみや」
[p]
#主人公
「まずは、今日の注文を全部確認してからね」
[p]
#抹茶エクレア
「分かってるって」
[p]
#主人公
「そういえば、今後の予定を整理しようと思って」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「十二月は年末の注文が増えるかもしれないから」
[p]
#抹茶エクレア
「去年は？」
[p]
#主人公
「忙しかった。……両親がいた頃はもっと」
[p]
#抹茶エクレア
「……そうなんや」
[p]
#主人公
「だから、今度はちゃんと計画を立てたい」
[p]
#抹茶エクレア
「ほな、ウチも一緒に考える」
[p]
#主人公
「うん。頼りにしてる」
[p]
#抹茶エクレア
「任しとき」
[p]

*scene_11_05
[eval exp="f.chapter = '11'; f.scene = '11_05'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="女神" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_kitchen_morning.png" time="0"]
[xchgbgm storage="06_One_Year_One_Eclair.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="650"]
#抹茶エクレア
「なあ」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「世界一って、女神様が決めるんちゃうんやな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「ウチらが、ちゃんと届くもんを作らなあかん」
[p]
#主人公
「そうだね」
[p]
#抹茶エクレア
「神様でも、聞いたら普通に答えてくれる」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「なんか、ちょっと安心したわ」
[p]
#主人公
「何が？」
[p]
#抹茶エクレア
「間違うても、分からんかったら聞けばええんやって」
[p]
#主人公
「……そうだね」
[p]
[wait time="350"]
#主人公
「帰還のことも、聞けてよかった」
[p]
#抹茶エクレア
「……うん」
[p]
#主人公
「まだ先だけど」
[p]
#抹茶エクレア
「せやな。まずは世界一や」
[p]
#主人公
「そうだね」
[p]
#抹茶エクレア
「十二月、忙しなるんやろ？」
[p]
#主人公
「たぶんね」
[p]
#抹茶エクレア
「今のうちに、ちゃんと仕込み考えとこ」
[p]
#主人公
「……君が言うと頼もしいな」
[p]
[chara_mod name="抹茶エクレア" face="default"]
#抹茶エクレア
「ウチも店の人やからな！」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「で、今日の仕込みは？」
[p]
#主人公
「いつもどおり」
[p]
#抹茶エクレア
「千個？」
[p]
#主人公
「四月を引きずりすぎ」
[p]
#抹茶エクレア
「覚えやすいねん！」
[p]

*november_clear
[iscript]
sf.normal_ch11_clear = true; f.chapter = "11"; f.scene = "clear"; f.current_clear_month = "11";
[endscript]
[skipstop]
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
11月 CLEAR『神様の言葉、ウチらの答え』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
女神が再び店を訪れ、一年の条件について確かめた。
[p]
神様の言葉だからといって、考えることをやめる必要はない。
[r]
不思議な言葉だからといって、隠れた意味を探し続ける必要もない。
[p]
分からないことは、聞けばいい。
[r]
十一月に覚えたのは、答えを決めつける前に、問いかけることだった。
[p]
[jump target="*november_clear_menu"]

*november_clear_menu
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
11月 CLEAR『神様の言葉、ウチらの答え』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
抹茶ちゃんのひとこと
[r]
「分からんまま悩むより、聞いてみた方が早いこともあるんやな」
[resetfont]
[glink text="タイトルへ" color="green" font_color="0x3B2A1B" x="675" width="400" height="85" size="23" y="150" bold="true" storage="title_screen.ks" target="*title" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="記録" color="green" font_color="0x3B2A1B" x="675" width="400" height="85" size="23" y="245" bold="true" storage="system_common.ks" target="*records_from_clear" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="12月へ" color="green" font_color="0x3B2A1B" x="675" y="340" width="400" height="85" size="23" bold="true" storage="n12_december.ks" target="*eyecatch_11_12" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[s]

; Registration only; safe for preview and older saves without a goddess definition.
*november_character_define
[call storage="system/future_character_define.ks"]
[if exp="!TYRANO.kag.stat.charas['女神']"]
[chara_new name="女神" jname="女神" storage="apr_goddess.png" width="495" height="660"]
[endif]
[return]
