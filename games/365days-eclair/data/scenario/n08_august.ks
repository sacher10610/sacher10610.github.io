; CHAPTER 08 / AUGUST - バズれ、抹茶エクレア
; 本文: AUGUST_CODEX_LUNA_IMPLEMENTATION_PACK_v2_1/docs/03_SCENARIO.md

*eyecatch_07_08
[skipstop]
[clearstack stack="if"]
[cm]
[mask time="700" color="0x000000"]
[stopbgm fadeout="true" time="700"]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="eyecatch/EYECATCH_07_08_AUGUST.png" time="0"]
[tb_hide_message_window]
[mask_off time="400"]
[playse storage="SE_EYECATCH_05_06_Jingle.wav" volume="75" loop="false"]
[wait time="3100"]
[mask time="400" color="0x000000"]
[jump target="*scene_08_01"]

*scene_08_01
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
[eval exp="f.chapter = '08'; f.scene = '08_01'"]
[mask_off time="500"]
[playse storage="se_phone_notify.wav" volume="70" loop="false"]
#抹茶エクレア
「……なあ」
[p]
#主人公
「何？」
[p]
[playse storage="se_phone_notify.wav" volume="70" loop="false"]
#抹茶エクレア
「なんか伸びてる」
[p]
#主人公
「何が？」
[p]
#抹茶エクレア
「昨日の投稿」
[p]
#主人公
「夏仕様の抹茶エクレア？」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「どれくらい？」
[p]
#抹茶エクレア
「昨日の夜、百ちょい」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「朝、千」
[p]
#主人公
「え」
[p]
#抹茶エクレア
「今」
[p]
#主人公
「今？」
[p]
#抹茶エクレア
「一万」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「バズった？」
[p]
#主人公
「たぶん」
[p]
#抹茶エクレア
「バズった！」
[p]
#主人公
「声」
[p]
#抹茶エクレア
「世界一への近道見つけた！」
[p]
#主人公
「一万で世界一は早い」
[p]
#抹茶エクレア
「でも一晩で百倍やで？」
[p]
#主人公
「怖い伸び方してるな」
[p]
#抹茶エクレア
「もっと伸ばそ」
[p]
#主人公
「そこから入るの？」
[p]
#抹茶エクレア
「伸びてる時に伸ばすんや！」
[p]
#主人公
「言ってることは分かるけど」
[p]
#抹茶エクレア
「次の投稿！」
[p]
#主人公
「店の仕込みは？」
[p]
#抹茶エクレア
「次の投稿！」
[p]
#主人公
「聞いて」
[p]

*scene_08_02
[eval exp="f.chapter = '08'; f.scene = '08_02'"]
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
「神田ちゃん！」
[p]
#神田姫花
「はい？」
[p]
#抹茶エクレア
「見た！？」
[p]
#神田姫花
「何をですか？」
[p]
#抹茶エクレア
「ウチらの投稿！」
[p]
#神田姫花
「ああ」
[p]
#神田姫花
「見ました」
[p]
#抹茶エクレア
「一万やで！」
[p]
#神田姫花
「すごいですね」
[p]
#抹茶エクレア
「せやろ！」
[p]
#神田姫花
「でも」
[p]
#抹茶エクレア
「でも？」
[p]
#神田姫花
「コメント、結構いろんな人いますよ」
[p]
#主人公
「いろんな人？」
[p]
#神田姫花
「近所の人もいますけど」
[p]
#神田姫花
「写真だけ見てる人とか」
[p]
#神田姫花
「海外の人とか」
[p]
#神田姫花
「“どこで買えるの？”って人とか」
[p]
#抹茶エクレア
「海外！」
[p]
#主人公
「そこだけ拾わない」
[p]
#神田姫花
「あと」
[p]
#神田姫花
「営業時間、聞いてる人もいます」
[p]
#主人公
「五月にもやったな、それ」
[p]
#抹茶エクレア
「歴史は繰り返す」
[p]
#主人公
「繰り返さないで」
[p]
#神田姫花
「でも、せっかく見てくれてるなら」
[p]
#神田姫花
「ちゃんと店のこと分かるようにした方がいいかもです」
[p]
#抹茶エクレア
「店のこと」
[p]
#神田姫花
「はい」
[p]
#神田姫花
「写真だけバズっても」
[p]
#神田姫花
「どこで買えるか分からなかったら、来れないので」
[p]
#主人公
「ごもっとも」
[p]
#抹茶エクレア
「……なるほどな」
[p]
#主人公
「今度はちゃんと聞いた？」
[p]
#抹茶エクレア
「聞いた聞いた」
[p]
#抹茶エクレア
「でも」
[p]
#主人公
「でも？」
[p]
#抹茶エクレア
「一万、もうちょい伸ばしたい」
[p]
#主人公
「そこは諦めないんだ」
[p]

*choice_08_01
[clearstack stack="if"]
[cm]
#
[glink text="今夜だけの“超限定”で、一気に数字を取りにいこう" color="green" font_color="0x3B2A1B" x="310" y="205" width="660" height="100" size="21" bold="true" target="*august_bad008_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="怖いから、しばらく投稿を止めよう" color="green" font_color="0x3B2A1B" x="310" y="325" width="660" height="100" size="21" bold="true" target="*august_detour" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="まず“いつもの店”に辿り着けるよう整えよう" color="green" font_color="0x3B2A1B" x="310" y="445" width="660" height="100" size="21" bold="true" target="*august_normal_route" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*august_bad008_entry
[chara_hide name="神田姫花"]
[if exp="sf.core_bad_008 == true"]
[cm]
#
CORE BAD 008『一夜の世界一』
[r]
その結末は、もう知っている。
[p]
[jump target="*choice_08_01"]
[endif]
[jump target="*august_bad008"]

*august_bad008
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="900"]
[eval exp="f.chapter = '08'; f.scene = '08_bad008'"]
#主人公
「今夜だけの“超限定”で、一気に数字を取りにいこう」
[p]
#抹茶エクレア
「それや！」
[p]
#主人公
「勢いに乗るなら、今しかない」
[p]
#抹茶エクレア
「限定！」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「数量限定！」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「時間限定！」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「写真投稿した人だけ特典！」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「先着！」
[p]
#主人公
「増えてきた」
[p]
#抹茶エクレア
「今夜だけ！」
[p]
#主人公
「条件が祭りみたいになってきた」
[p]
#抹茶エクレア
「祭りや！」
[p]
#主人公
「店だよ」
[p]
#抹茶エクレア
「今夜、世界一になるで！」
[p]
#主人公
「“今夜”って付いてる時点で不安なんだけど」
[p]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="apr_shop_night.png" time="0"]
[chara_mod name="抹茶エクレア" face="summer_alt"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[mask_off time="650"]
#
その夜
[p]
[playse storage="se_phone_notify.wav" volume="70" loop="false"]
#抹茶エクレア
「来てる！」
[p]
#主人公
「来てるね」
[p]
#抹茶エクレア
「通知も！」
[p]
#主人公
「すごい」
[p]
#抹茶エクレア
「売り切れ！」
[p]
#主人公
「早い」
[p]
#抹茶エクレア
「トレンド入った！」
[p]
#主人公
「え」
[p]
#抹茶エクレア
「抹茶スイーツ、急上昇一位！」
[p]
#主人公
「一位……」
[p]
#抹茶エクレア
「世界一！」
[p]
#主人公
「世界ではない」
[p]
#抹茶エクレア
「今日はええねん！」
[p]
#主人公
「今日だけでいいの？」
[p]
#抹茶エクレア
「え？」
[p]
#主人公
「いや」
[p]
#主人公
「なんでもない」
[p]
[mask time="700" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="apr_shop_morning.png" time="0"]
[chara_mod name="抹茶エクレア" face="summer_quiet"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[mask_off time="700"]
#
翌日
[p]
#抹茶エクレア
「……静かやな」
[p]
#主人公
「静かだね」
[p]
#抹茶エクレア
「昨日、あんなにおったのに」
[p]
#主人公
「限定、終わったから」
[p]
#抹茶エクレア
「通知も来えへん」
[p]
#主人公
「投稿も昨日ほど回ってない」
[p]
#抹茶エクレア
「一位やったのに」
[p]
#主人公
「一晩だけね」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「疲れた？」
[p]
#抹茶エクレア
「めっちゃ」
[p]
#主人公
「仕込みも空っぽ」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「昨日来た人の顔、覚えてる？」
[p]
#抹茶エクレア
「……あんまり」
[p]
#主人公
「また来てくれそうな人は？」
[p]
#抹茶エクレア
「分からへん」
[p]
#主人公
「昨日の数字はすごかった」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「でも」
[p]
#主人公
「店に何が残った？」
[p]
#抹茶エクレア
「……」
[p]
#抹茶エクレア
「スクショ」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「一位の」
[p]
#主人公
「それだけ？」
[p]
#抹茶エクレア
「……それだけや」
[p]
[eval exp="sf.cg_august_mini_01 = true"]
[skipstop]
[chara_hide name="抹茶エクレア"]
[chara_hide name="神田姫花"]
[image layer="1" name="august_sdcg_image" folder="bgimage" storage="cg/august/SD08_01_Bad008_One_Night_Number_One.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="august_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#
[p]
[free layer="1" name="august_sdcg_image" time="150" wait="false"]
[free layer="1" name="august_sdcg_frame" time="150"]
[chara_mod name="抹茶エクレア" face="summer_quiet"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[iscript]
f.april_bad = {kind:"CORE", id:"008", title:"一夜の世界一", lesson:"一晩だけ一位になっても、翌日の店に次へつながるものは残らなかった。", retry:"*choice_08_01", storage:"n08_august.ks", month:"08"};
[endscript]
[register_core_bad id="008"]
[call storage="system_common.ks" target="*show_core_bad"]
[mask time="500" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[chara_hide name="神田姫花"]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[mask_off time="500"]
[jump target="*choice_08_01"]

*august_detour
[chara_hide name="神田姫花"]
[eval exp="f.chapter = '08'; f.scene = '08_detour'"]
#主人公
「怖いから、しばらく投稿を止めよう」
[p]
#抹茶エクレア
「止めるん？」
[p]
#主人公
「急に人が増えるの、ちょっと怖い」
[p]
#抹茶エクレア
「まあ、それは分かる」
[p]
#主人公
「店が追いつかないかもしれないし」
[p]
#抹茶エクレア
「ほな、一旦静かにしよか」
[p]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[mask_off time="650"]
#
数日後
[p]
#主人公
「落ち着いたね」
[p]
#抹茶エクレア
「落ち着きすぎたな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「せっかく見てもろたのに」
[p]
#主人公
「何も伝えないのも違ったか」
[p]
#抹茶エクレア
「バズったらあかんわけやない」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「バズった後、どうするかやな」
[p]
#主人公
「そこを考えよう」
[p]
[jump target="*scene_08_03"]

*august_normal_route
[chara_hide name="神田姫花"]
[eval exp="f.chapter = '08'; f.scene = '08_normal'"]
#主人公
「まず、“いつもの店”に辿り着けるよう整えよう」
[p]
#抹茶エクレア
「いつもの店？」
[p]
#主人公
「バズった投稿だけ見て来るんじゃなくて」
[p]
#主人公
「営業時間」
[p]
#主人公
「場所」
[p]
#主人公
「普段どんなお菓子を売ってるか」
[p]
#主人公
「売り切れたら次はいつ買えるか」
[p]
#抹茶エクレア
「五月の続きやな」
[p]
#主人公
「そう」
[p]
#抹茶エクレア
「でも今回は、人が一気に増えた」
[p]
#主人公
「だから、なおさら」
[p]
#抹茶エクレア
「波に乗るんやなくて」
[p]
#主人公
「波から店に降りてもらう」
[p]
#抹茶エクレア
「言い方ちょっとええな」
[p]
#主人公
「今考えた」
[p]
#抹茶エクレア
「採用」
[p]
[jump target="*scene_08_03"]

*scene_08_03
[eval exp="f.chapter = '08'; f.scene = '08_03'"]
#主人公
「固定する情報はこれ」
[p]
#抹茶エクレア
「営業時間」
[p]
#主人公
「場所」
[p]
#抹茶エクレア
「いつもの抹茶エクレア」
[p]
#主人公
「夏仕様も」
[p]
#抹茶エクレア
「売り切れた時の次の販売」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「あと」
[p]
#主人公
「あと？」
[p]
#抹茶エクレア
「“初めての人へ”」
[p]
#主人公
「いいね」
[p]
#抹茶エクレア
「バズった投稿って」
[p]
#抹茶エクレア
「店の入口なんやな」
[p]
#主人公
「入口になればね」
[p]
#抹茶エクレア
「五月は店の入口」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「八月はSNSから店の入口」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「ちょっとずつ道増えてるな」
[p]
#主人公
「迷路にしないようにね」
[p]
#抹茶エクレア
「それは任せた」
[p]
#主人公
「丸投げ？」
[p]

*scene_08_04
[eval exp="f.chapter = '08'; f.scene = '08_04'"]
[mask time="600" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="apr_kitchen_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="summer_alt"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[mask_off time="600"]
#主人公
「次は在庫」
[p]
#抹茶エクレア
「いっぱい作る？」
[p]
#主人公
「四月」
[p]
#抹茶エクレア
「分かった」
[p]
#主人公
「まだ何も言ってない」
[p]
#抹茶エクレア
「千個は作らへん！」
[p]
#主人公
「よし」
[p]
#抹茶エクレア
「ほな何個？」
[p]
#主人公
「普段より少し増やす」
[p]
#抹茶エクレア
「少し」
[p]
#主人公
「売り切れたら、次の焼き上がりを案内する」
[p]
#抹茶エクレア
「売り切れを失敗にせん」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「次に来てもらう」
[p]
#主人公
「そう」
[p]
#抹茶エクレア
「……なんか」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「バズってるのに地味やな」
[p]
#主人公
「店を続けるのって、だいたい地味だよ」
[p]
#抹茶エクレア
「世界一も？」
[p]
#主人公
「たぶん」
[p]
#抹茶エクレア
「夢ないなあ」
[p]
#主人公
「現実はある」
[p]
#抹茶エクレア
「それは大事や」
[p]

*choice_08_02
[clearstack stack="if"]
[cm]
#
[glink text="次に買える日を分かるようにする" color="green" font_color="0x3B2A1B" x="310" y="205" width="660" height="100" size="21" bold="true" target="*choice_08_02_a" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="初めての人向けに店のことをまとめる" color="green" font_color="0x3B2A1B" x="310" y="325" width="660" height="100" size="21" bold="true" target="*choice_08_02_b" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="いつもの商品を、いつもの品質で出す" color="green" font_color="0x3B2A1B" x="310" y="445" width="660" height="100" size="21" bold="true" target="*choice_08_02_c" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*choice_08_02_a
#主人公
「次に買える日を分かるようにする」
[p]
#抹茶エクレア
「今日売り切れても」
[p]
#主人公
「明日につながる」
[p]
#抹茶エクレア
「“また来て”って言えるな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「ええやん」
[p]
[jump target="*scene_08_05"]

*choice_08_02_b
#主人公
「初めての人向けに店のことをまとめる」
[p]
#抹茶エクレア
「初見さん向けやな」
[p]
#主人公
「何屋か分からないまま来る人もいるから」
[p]
#抹茶エクレア
「抹茶エクレア屋」
[p]
#主人公
「パティスリー」
[p]
#抹茶エクレア
「ほぼ抹茶エクレア屋」
[p]
#主人公
「否定しきれない」
[p]
[jump target="*scene_08_05"]

*choice_08_02_c
#主人公
「いつもの商品を、いつもの品質で出す」
[p]
#抹茶エクレア
「バズったから豪華にせんでええ？」
[p]
#主人公
「初めて来た人に」
[p]
#主人公
「普段と違う店を見せても仕方ない」
[p]
#抹茶エクレア
「……確かに」
[p]
#主人公
「気に入ったら、また同じものを買える方がいい」
[p]
#抹茶エクレア
「昨日だけの味にせん」
[p]
#主人公
「そう」
[p]
[jump target="*scene_08_05"]

*scene_08_05
[eval exp="f.chapter = '08'; f.scene = '08_05'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[mask_off time="650"]
#
数日後
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
#客
「すみません」
[p]
#主人公
「いらっしゃいませ」
[p]
#客
「SNSで見たんですけど」
[p]
#抹茶エクレア
「ありがとうございます！」
[p]
#客
「これ、あの抹茶エクレアですか？」
[p]
#主人公
「はい」
[p]
#客
「じゃあ一個」
[p]
#抹茶エクレア
「おおきに！」
[p]
#主人公
「声」
[p]
#抹茶エクレア
「今日はええやん」
[p]
#主人公
「毎月言ってる」
[p]
[wait time="250"]
[eval exp="sf.cg_august_event_01 = true"]
[skipstop]
[chara_hide name="抹茶エクレア"]
[bg storage="cg/august/CG08_01_From_the_Post_to_the_Shop.png" time="500"]
#客
「……美味しい」
[p]
#抹茶エクレア
「ほんま？」
[p]
#客
「写真で見たより、普通なんですね」
[p]
#抹茶エクレア
「普通！？」
[p]
#主人公
「たぶん褒めてる」
[p]
#客
「もっと派手なの想像してて」
[p]
#客
「でも、ちゃんとお菓子屋さんの味っていうか」
[p]
#主人公
「ありがとうございます」
[p]
#客
「また来ます」
[p]
[bg storage="apr_shop_day.png" time="350"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
#抹茶エクレア
「……！」
[p]
#主人公
「どうした？」
[p]
#抹茶エクレア
「また来ます」
[p]
#主人公
「五月にも聞いたね」
[p]
#抹茶エクレア
「でも」
[p]
#抹茶エクレア
「一万人に見られた後に聞くと」
[p]
#抹茶エクレア
「なんか違うな」
[p]
#主人公
「どっちが嬉しい？」
[p]
#抹茶エクレア
「……」
[p]
#抹茶エクレア
「両方」
[p]
#主人公
「欲張り」
[p]
#抹茶エクレア
「世界一やからな」
[p]

*scene_08_05_5
[eval exp="f.chapter = '08'; f.scene = '08_05_5'"]
; 既存セーブから入った場合にも、登録がなければ既存の藤代立ち絵を定義する。
[if exp="!TYRANO.kag.stat.charas['藤代誠']"]
[chara_new name="藤代誠" jname="藤代誠" storage="fujishiro_normal.png" width="440" height="660"]
[endif]
[wait time="400"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_show name="藤代誠" storage="fujishiro_normal.png" left="70" top="90" time="350"]
#藤代
「すみません」
[p]
#主人公
「いらっしゃいませ」
[p]
#藤代
「藤代といいます」
[p]
#藤代
「SNSで見て、気になって来ました」
[p]
#抹茶エクレア
「ありがとうございます！」
[p]
#藤代
「抹茶エクレア、まだありますか？」
[p]
#主人公
「はい。あと少しなら」
[p]
#藤代
「じゃあ、一つお願いします」
[p]
#抹茶エクレア
「おおきに！」
[p]
[wait time="250"]
#藤代
「……美味しいです」
[p]
#抹茶エクレア
「ほんま？」
[p]
#藤代
「はい」
[p]
#藤代
「SNSで見た時は、もっと派手な商品なのかと思ってました」
[p]
#主人公
「今日、二回目だな。その感想」
[p]
#抹茶エクレア
「普通言われすぎちゃう？」
[p]
#藤代
「悪い意味じゃないです」
[p]
#藤代
「ちゃんと、店でずっと売れそうな味だなと思って」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「ありがとうございます」
[p]
#藤代
「これって、普段はこの店だけで販売してるんですか？」
[p]
#主人公
「今のところは、そうですね」
[p]
#藤代
「イベントとか、店の外では？」
[p]
#主人公
「まだないです」
[p]
#抹茶エクレア
「呼ばれたら行くで」
[p]
#主人公
「勝手に決めない」
[p]
#藤代
「ふふ」
[p]
#抹茶エクレア
「なんや」
[p]
#藤代
「いえ」
[p]
#藤代
「そういう店なんですね」
[p]
#主人公
「どういう店です？」
[p]
#藤代
「……楽しそうな店」
[p]
#抹茶エクレア
「せやろ？」
[p]
#主人公
「そこは即答なんだ」
[p]
[wait time="250"]
#藤代
「一日に作れる数って、決まってます？」
[p]
#主人公
「ある程度は」
[p]
#抹茶エクレア
「千個はいける」
[p]
#主人公
「いけない」
[p]
#藤代
「千個」
[p]
#主人公
「忘れてください」
[p]
#抹茶エクレア
「昔の話や」
[p]
#藤代
「なるほど」
[p]
#主人公
「何がです？」
[p]
#藤代
「いえ」
[p]
#藤代
「人気が出ると、大変そうだなと思っただけです」
[p]
#主人公
「……最近、実感してます」
[p]
#藤代
「でしょうね」
[p]
[wait time="300"]
#藤代
「ごちそうさまでした」
[p]
#主人公
「ありがとうございました」
[p]
#抹茶エクレア
「また来てな！」
[p]
#藤代
「はい」
[p]
#藤代
「また来ます」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_hide name="藤代誠" time="350"]
[wait time="300"]
#抹茶エクレア
「……」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「今日、“また来ます”多いな」
[p]
#主人公
「いいことじゃない？」
[p]
#抹茶エクレア
「せやな」
[p]
#抹茶エクレア
「一万いいねより、こっちの方が覚えやすい」
[p]
#主人公
「人数が違いすぎるからね」
[p]
#抹茶エクレア
「でも、あの人」
[p]
#主人公
「藤代さん？」
[p]
#抹茶エクレア
「変なとこ聞くな」
[p]
#主人公
「一日に作れる数とか？」
[p]
#抹茶エクレア
「そう」
[p]
#主人公
「仕事でお菓子好きなんじゃない？」
[p]
#抹茶エクレア
「そんな仕事ある？」
[p]
#主人公
「いっぱいあると思うよ」
[p]
#抹茶エクレア
「ふーん」
[p]
[wait time="250"]
#抹茶エクレア
「まあええか」
[p]
#主人公
「うん」
[p]

*scene_08_06
[eval exp="f.chapter = '08'; f.scene = '08_06'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[chara_hide name="神田姫花"]
[eval exp="sf.cg_august_event_02 = true"]
[bg storage="cg/august/CG08_02_The_Morning_After_the_Buzz.png" time="0"]
[xchgbgm storage="06_One_Year_One_Eclair.mp3" time="700"]
[mask_off time="650"]
#抹茶エクレア
「昨日もそこそこ伸びた」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「一万ほどやないけど」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「でも」
[p]
#主人公
「でも？」
[p]
#抹茶エクレア
「今日も店開けられる」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「仕込みもある」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「昨日来た人の顔も覚えてる」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「また来ます、も聞いた」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「……こっちの方が」
[p]
#抹茶エクレア
「世界一に近い気するな」
[p]
#主人公
「一晩の一位より？」
[p]
#抹茶エクレア
「うん」
[p]
#主人公
「スクショは？」
[p]
#抹茶エクレア
「残しとく」
[p]
#主人公
「残すんだ」
[p]
#抹茶エクレア
「思い出は大事や」
[p]
#主人公
「それならいいか」
[p]
#抹茶エクレア
「でも」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「バズるん、楽しかったな」
[p]
#主人公
「否定はしない」
[p]
#抹茶エクレア
「またバズりたい」
[p]
#主人公
「八月中はもう十分」
[p]
#抹茶エクレア
「けち」
[p]
#主人公
「店長ですから」
[p]

*august_clear
[iscript]
sf.normal_ch08_clear = true;
f.chapter = "08"; f.scene = "clear"; f.current_clear_month = "08";
[endscript]
[skipstop]
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
8月 CLEAR『バズった次の日』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
大きな数字が悪いわけではない。
[r]
一晩でたくさんの人に届くことも、店にとっては大きなチャンスだった。
[p]
でも本当に残したかったのは、一位の画面ではなく、
[r]
次の日にも店を開けられること。
[p]
また買えること。また来たいと思ってもらうこと。
[r]
八月に覚えたのは、バズの“その次”を作ることだった。
[p]
[jump target="*august_clear_menu"]

*august_clear_menu
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
8月 CLEAR『バズった次の日』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
抹茶ちゃんのひとこと
[r]
「一晩だけやなくて、次の日も続いてたら、もっと強いやんな」
[resetfont]
[glink text="タイトルへ" color="green" font_color="0x3B2A1B" x="675" y="150" width="400" height="85" size="23" bold="true" storage="title_screen.ks" target="*title" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="記録" color="green" font_color="0x3B2A1B" x="675" y="245" width="400" height="85" size="23" bold="true" storage="system_common.ks" target="*records_from_clear" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="9月へ" color="green" font_color="0x3B2A1B" x="675" y="340" width="400" height="85" size="23" bold="true" storage="n09_september.ks" target="*eyecatch_08_09" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[s]
