; CHAPTER 09 / SEPTEMBER - はじめての催事
; Dialogue is transcribed without wording changes from docs/03_SCENARIO_CONFIRMED.md.
*eyecatch_08_09
[skipstop]
[clearstack stack="if"]
[cm]
[mask time="700" color="0x000000"]
[stopbgm fadeout="true" time="700"]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[chara_hide name="神田姫花"]
[chara_hide name="久世玲"]
[chara_hide name="藤代誠"]
[bg storage="eyecatch/EYECATCH_08_09_SEPTEMBER.png" time="0"]
[tb_hide_message_window]
[mask_off time="400"]
[playse storage="SE_EYECATCH_05_06_Jingle.wav" volume="75" loop="false"]
[wait time="3100"]
[mask time="400" color="0x000000"]
[jump target="*scene_09_01"]

*scene_09_01
[call storage="system_common.ks"]
[call storage="system/future_character_define.ks"]
[clearstack stack="if"]
[cm]
[hidemenubutton]
[chara_hide name="抹茶エクレア"]
[chara_hide name="久世玲"]
[bg storage="apr_shop_day.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
[eval exp="f.chapter = '09'; f.scene = '09_01'"]
[mask_off time="500"]
#主人公
「メール来てる」
[p]
#抹茶エクレア
「予約？」
[p]
#主人公
「違う」
[p]
#抹茶エクレア
「取材？」
[p]
#主人公
「それも違う」
[p]
#抹茶エクレア
「世界一認定？」
[p]
#主人公
「どうしてそこまで飛ぶの」
[p]
#抹茶エクレア
「ほな何？」
[p]
#主人公
「催事の出店依頼」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「百貨店の秋スイーツ催事」
[p]
#抹茶エクレア
「……催事？」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「店の外で売るやつ？」
[p]
#主人公
「そう」
[p]
#抹茶エクレア
「呼ばれたん？」
[p]
#主人公
「SNSで見たって」
[p]
#抹茶エクレア
「八月の！」
[p]
#主人公
「たぶん」
[p]
#抹茶エクレア
「バズ、仕事になった！」
[p]
#主人公
「その言い方だと急に軽いな」
[p]
#抹茶エクレア
「でも、そうやろ？」
[p]
#主人公
「まあ」
[p]
#抹茶エクレア
「出よ！」
[p]
#主人公
「即答なんだ」
[p]
#抹茶エクレア
「店の外やで？」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「知らん人いっぱいおるで？」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「世界一に一歩近づくやん！」
[p]
#主人公
「まず搬入時間確認しよう」
[p]
#抹茶エクレア
「夢ないなあ」
[p]
#主人公
「現実がないと催事会場に着けないよ」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「どしたん？」
[p]
#主人公
「ちょっと文章が丁寧すぎるなと思って」
[p]
#抹茶エクレア
「百貨店やからちゃう？」
[p]
#主人公
「そうかな」
[p]
#抹茶エクレア
「なんて書いてあるん？」
[p]
#主人公
「“SNSでの反響に加え、実店舗で継続して販売されている点も拝見し”」
[p]
#抹茶エクレア
「ちゃんと見られてるやん」
[p]
#主人公
「……誰か店まで見に来てたのかな」
[p]
#抹茶エクレア
「八月、いっぱい来たし分からへんな」
[p]
#主人公
「まあ、いいか」
[p]
#抹茶エクレア
「ええやん。呼ばれたんやし」
[p]
#主人公
「そうだね」
[p]

*scene_09_02
[eval exp="f.chapter = '09'; f.scene = '09_02'"]
[mask time="600" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[bg storage="apr_kitchen_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="summer_alt"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[mask_off time="600"]
#主人公
「持っていくのは夏仕様の抹茶エクレア」
[p]
#抹茶エクレア
「九月やけど、まだ暑いしな」
[p]
#主人公
「数量は普段より多め」
[p]
#抹茶エクレア
「千個？」
[p]
#主人公
「四月」
[p]
#抹茶エクレア
「言うてみただけやん」
[p]
#主人公
「怖いんだよ、その数字」
[p]
#抹茶エクレア
「箱」
[p]
#主人公
「ある」
[p]
#抹茶エクレア
「ショップカード」
[p]
#主人公
「ある」
[p]
#抹茶エクレア
「店の場所」
[p]
#主人公
「載せた」
[p]
#抹茶エクレア
「営業時間」
[p]
#主人公
「載せた」
[p]
#抹茶エクレア
「次に買える日」
[p]
#主人公
「それも」
[p]
#抹茶エクレア
「八月の復習ばっちりやな」
[p]
#主人公
「今回は店の外だから、余計に大事」
[p]
#抹茶エクレア
「店に戻ってきてもらう道」
[p]
#主人公
「そう」
[p]
#抹茶エクレア
「よし」
[p]
#抹茶エクレア
「催事、勝つで」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「なんやその顔」
[p]
#主人公
「何に？」
[p]
#抹茶エクレア
「催事に」
[p]
#主人公
「催事って勝負なの？」
[p]
#抹茶エクレア
「売上出るやろ」
[p]
#主人公
「出るけど」
[p]
#抹茶エクレア
「他の店も並ぶやろ」
[p]
#主人公
「並ぶけど」
[p]
#抹茶エクレア
「ほな勝負や」
[p]
#主人公
「嫌な予感するなあ」
[p]
#抹茶エクレア
「世界一目指してんねんで？」
[p]
#主人公
「世界一と、明日の売上順位は同じじゃないよ」
[p]
#抹茶エクレア
「似たようなもんやろ」
[p]
#主人公
「そうかな」
[p]
#抹茶エクレア
「そうや」
[p]
#主人公
「……覚えとこう、その台詞」
[p]

*scene_09_03
[eval exp="f.chapter = '09'; f.scene = '09_03'"]
[mask time="800" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[bg storage="bg09_department_store_event_hall.png" time="0"]
[xchgbgm storage="09_Measured_Grace.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[chara_mod name="久世玲" face="september_normal"]
[chara_show name="久世玲" left="120" top="90" time="450"]
[mask_off time="800"]
[wait time="350"]
#久世玲
「そこ、通路を半歩空けた方がいいわ」
[p]
#主人公
「え？」
[p]
#久世玲
「箱を積むと、お客さんが止まった時に詰まるから」
[p]
#主人公
「あ、ありがとうございます」
[p]
#抹茶エクレア
「……誰？」
[p]
#久世玲
「久世玲」
[p]
[eval exp="sf.cg_september_event_01 = true"]
[skipstop]
[chara_hide name="久世玲"]
[chara_hide name="抹茶エクレア"]
[bg storage="cg/september/CG09_01_The_Professional_Next_Door.png" time="500"]
#久世玲
「Pâtisserie Lien」
[p]
#主人公
「隣のブースの」
[p]
#久世玲
「ええ」
[p]
#抹茶エクレア
「めっちゃ慣れてる」
[p]
#久世玲
「催事は何度か出てるから」
[p]
#抹茶エクレア
「何度かで、あんな速く並べられるん？」
[p]
#久世玲
「慣れよ」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「どうした？」
[p]
#抹茶エクレア
「強そう」
[p]
#主人公
「戦わないよ」
[p]
#久世玲
「？」
[p]
#主人公
「気にしないでください」
[p]
#久世玲
「SNSで見たわ」
[p]
#抹茶エクレア
「ウチらの？」
[p]
#久世玲
「ええ」
[p]
#久世玲
「話題になってた抹茶エクレア」
[p]
#抹茶エクレア
「どうやった？」
[p]
#久世玲
「写真は上手ね」
[p]
#抹茶エクレア
「写真は？」
[p]
#主人公
「そこ拾わない」
[p]
#久世玲
「味は食べてないから知らない」
[p]
#抹茶エクレア
「ほな今日食べて」
[p]
#久世玲
「時間があれば」
[p]
#抹茶エクレア
「絶対やで」
[p]
#主人公
「押しが強い」
[p]
#久世玲
「……面白い子ね」
[p]
#抹茶エクレア
「子ちゃうし」
[p]
#主人公
「そこも拾わない」
[p]
#久世玲
「でも」
[p]
#主人公
「？」
[p]
#久世玲
「思ってたより、普通なのね」
[p]
#抹茶エクレア
「また普通言われた！」
[p]
#主人公
「八月から三回目」
[p]
#久世玲
「褒めてるのよ」
[p]
#抹茶エクレア
「ほんま？」
[p]
#久世玲
「催事用に変に盛ってない」
[p]
#久世玲
「普段の店で売ってるものを、そのまま持ってきたんでしょう？」
[p]
#主人公
「はい」
[p]
#久世玲
「それは嫌いじゃないわ」
[p]
#抹茶エクレア
「……」
[p]
#久世玲
「じゃあ、お互い頑張りましょう」
[p]
#抹茶エクレア
「勝つで」
[p]
#久世玲
「？」
[p]
#主人公
「ほんとに気にしないでください」
[p]

*scene_09_04
[eval exp="f.chapter = '09'; f.scene = '09_04'"]
[mask time="500" color="0x000000"]
[cm]
[chara_hide name="久世玲"]
[bg storage="bg09_department_store_event_hall.png" time="0"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[mask_off time="500"]
#主人公
「うちも来てる」
[p]
#抹茶エクレア
「来てる！」
[p]
#主人公
「久世さんのところもすごい」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「見てるね」
[p]
#抹茶エクレア
「見てへん」
[p]
#主人公
「見てる」
[p]
#抹茶エクレア
「ちょっとだけ」
[p]
#主人公
「列の長さ？」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「売上？」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「気にしてる？」
[p]
#抹茶エクレア
「気になるやろ！」
[p]
#主人公
「まあね」
[p]
#抹茶エクレア
「あっち、また五個売れた」
[p]
#主人公
「数えてるの？」
[p]
#抹茶エクレア
「ウチら三個」
[p]
#主人公
「数えてるんだ」
[p]
#抹茶エクレア
「負けてる」
[p]
#主人公
「今の時点ではね」
[p]
#抹茶エクレア
「追いつかな」
[p]
#主人公
「何のために？」
[p]
#抹茶エクレア
「勝つため」
[p]
#主人公
「何に？」
[p]
#抹茶エクレア
「久世さんに」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「なんや」
[p]
#主人公
「催事に来た目的、覚えてる？」
[p]
#抹茶エクレア
「売る」
[p]
#主人公
「その前は？」
[p]
#抹茶エクレア
「世界一」
[p]
#主人公
「その間が全部消えたね」
[p]
#抹茶エクレア
「でも」
[p]
#抹茶エクレア
「あの人より売れたら」
[p]
#抹茶エクレア
「ウチらの方が上ってことやろ？」
[p]
#主人公
「……そうかな」
[p]

*choice_09_01
[eval exp="f.chapter = '09'; f.scene = '09_choice_01'"]
[clearstack stack="if"]
[cm]
[free layer="1" name="september_choice_heading"]
[free layer="1" name="september_locked_button"]
[free layer="1" name="september_locked_label"]
[free layer="1" name="september_locked_hint"]
[glink text="久世さんより売ることを最優先にしよう" color="green" font_color="0x3B2A1B" x="310" y="205" width="660" height="100" size="21" bold="true" target="*bad009_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="勝負は気にせず、いつも通りだけやろう" color="green" font_color="0x3B2A1B" x="310" y="325" width="660" height="100" size="21" bold="true" target="*detour_09" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[if exp="sf.core_bad_009 === true"]
[glink text="催事で知ってもらって、店につなげよう" color="green" font_color="0x3B2A1B" x="310" y="445" width="660" height="100" size="21" bold="true" target="*learned_09" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[endif]
[s]

*bad009_entry
[free layer="1" name="september_choice_heading"]
[free layer="1" name="september_locked_button"]
[free layer="1" name="september_locked_label"]
[free layer="1" name="september_locked_hint"]
[if exp="sf.core_bad_009 === true"]
[cm]
#
その結末は、もう知っている。
[p]
[jump target="*choice_09_01"]
[endif]
[jump target="*bad_09_009"]

*bad_09_009
[eval exp="f.chapter = '09'; f.scene = '09_bad009'"]
[cm]
#主人公
「久世さんより売ることを最優先にしよう」
[p]
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="900"]
#抹茶エクレア
「よっしゃ！」
[p]
#抹茶エクレア
「まず値段下げよ」
[p]
#主人公
「少しだけなら」
[p]
#抹茶エクレア
「二個セット割」
[p]
#主人公
「まあ」
[p]
#抹茶エクレア
「三個でさらに割引」
[p]
#主人公
「待って」
[p]
#抹茶エクレア
「SNS投稿でおまけ」
[p]
#主人公
「八月」
[p]
#抹茶エクレア
「限定シール」
[p]
#主人公
「増えてきた」
[p]
#抹茶エクレア
「呼び込みもする！」
[p]
#主人公
「仕込み足りる？」
[p]
#抹茶エクレア
「追いつく！」
[p]
#主人公
「休憩は？」
[p]
#抹茶エクレア
「後！」
[p]
#主人公
「店に戻った後の分は？」
[p]
#抹茶エクレア
「今は催事！」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「勝つで！」
[p]
[mask time="650" color="0x000000"]
[cm]
[bg storage="bg09_department_store_event_hall.png" time="0"]
[mask_off time="650"]
#抹茶エクレア
「……勝った」
[p]
#主人公
「売上？」
[p]
#抹茶エクレア
「久世さんとこより上」
[p]
#主人公
「そうだね」
[p]
#抹茶エクレア
「完売時間も早かった」
[p]
#主人公
「そうだね」
[p]
#抹茶エクレア
「勝ったで」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「どうした？」
[p]
#抹茶エクレア
「なんでそんな顔してんの」
[p]
#主人公
「計算したから」
[p]
#抹茶エクレア
「何を？」
[p]
#主人公
「割引」
[p]
#主人公
「追加包装」
[p]
#主人公
「応援で増やした人件」
[p]
#主人公
「店の仕込みを止めた分」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「今日の数字だけなら勝ち」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「でも」
[p]
#主人公
「店としては、かなり無理した」
[p]
#抹茶エクレア
「でも久世さんより売れた」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「ほな」
[p]
#抹茶エクレア
「勝ちやろ？」
[p]
#主人公
「何に？」
[p]
#抹茶エクレア
「……」
[p]
[chara_mod name="久世玲" face="september_soft"]
[chara_show name="久世玲" left="120" top="90" time="350"]
#久世玲
「お疲れさま」
[p]
#主人公
「お疲れさまです」
[p]
#久世玲
「すごかったわね」
[p]
#抹茶エクレア
「……勝ったで」
[p]
#久世玲
「何に？」
[p]
#抹茶エクレア
「……」
[p]
#久世玲
「私はあなたたちと勝負してたつもり、なかったけど」
[p]
#抹茶エクレア
「……」
[p]
#久世玲
「明日も店、開けるんでしょう？」
[p]
#主人公
「はい」
[p]
#久世玲
「なら」
[p]
#久世玲
「今日の順位より、そっちの方が大事じゃない？」
[p]
#抹茶エクレア
「……」
[p]
#久世玲
「それじゃ、お疲れさま」
[p]
[chara_hide name="久世玲" time="350"]
#主人公
「……」
[p]
#抹茶エクレア
「勝ったけど」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「なんか」
[p]
#抹茶エクレア
「負けた気する」
[p]
#主人公
「たぶん」
[p]
#主人公
「目的に」
[p]
[eval exp="sf.cg_september_mini_01 = true"]
[skipstop]
[chara_hide name="抹茶エクレア"]
[image layer="1" name="september_sdcg_image" folder="bgimage" storage="cg/september/SD09_01_Bad009_Won_But_Lost.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="september_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#
[p]
[free layer="1" name="september_sdcg_image" time="150" wait="false"]
[free layer="1" name="september_sdcg_frame" time="150"]
[chara_mod name="抹茶エクレア" face="summer_quiet"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[iscript]
f.april_bad = {kind:"CORE", id:"009", title:"勝ったけど負けた", lesson:"相手に勝つことと、自分たちの目的を達成することは違う。", retry:"*choice_09_01", storage:"n09_september.ks", month:"09"};
[endscript]
[register_core_bad id="009"]
[call storage="system_common.ks" target="*show_core_bad"]
[mask time="500" color="0x000000"]
[cm]
[chara_hide name="久世玲"]
[chara_hide name="抹茶エクレア"]
[bg storage="bg09_department_store_event_hall.png" time="0"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[mask_off time="500"]
[jump target="*choice_09_01"]

*detour_09
[eval exp="f.chapter = '09'; f.scene = '09_detour'"]
[cm]
[free layer="1" name="september_choice_heading"]
[free layer="1" name="september_locked_button"]
[free layer="1" name="september_locked_label"]
[free layer="1" name="september_locked_hint"]
#主人公
「勝負は気にせず、いつも通りだけやろう」
[p]
#抹茶エクレア
「ほんまに？」
[p]
#主人公
「店と同じように売る」
[p]
#抹茶エクレア
「催事やのに？」
[p]
#主人公
「変に無理しない方がいい」
[p]
#抹茶エクレア
「まあ、それはそうやけど」
[p]
#客
「これ、何のお店ですか？」
[p]
#主人公
「パティスリーです」
[p]
#客
「普段はどこにあるんです？」
[p]
#主人公
「あ」
[p]
#抹茶エクレア
「ショップカード」
[p]
#主人公
「出してなかった」
[p]
#抹茶エクレア
「何してんねん」
[p]
#主人公
「いつもの店では要らないから」
[p]
#抹茶エクレア
「ここ店ちゃうで」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「勝負せえへんのと」
[p]
#抹茶エクレア
「何もせえへんのは違うやろ」
[p]
#主人公
「そうだね」
[p]
#抹茶エクレア
「ここに来た意味、作らな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「……でも、どうする？」
[p]
#主人公
「まだ分からない」
[p]
[jump target="*choice_09_01"]

*learned_09
[if exp="sf.core_bad_009 !== true"]
[jump target="*choice_09_01"]
[endif]
[eval exp="f.chapter = '09'; f.scene = '09_learned'"]
[cm]
[free layer="1" name="september_choice_heading"]
[free layer="1" name="september_locked_button"]
[free layer="1" name="september_locked_label"]
[free layer="1" name="september_locked_hint"]
#主人公
「催事で知ってもらって、店につなげよう」
[p]
#抹茶エクレア
「久世さんに勝たんでええ？」
[p]
#主人公
「勝てたら嬉しいけど」
[p]
#主人公
「それが目的じゃない」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「今日初めて知った人が」
[p]
#主人公
「次はKomorebiに来てくれる」
[p]
#主人公
「それなら催事に出た意味が残る」
[p]
#抹茶エクレア
「八月と似てるな」
[p]
#主人公
「SNSから店へ」
[p]
#抹茶エクレア
「今度は催事から店へ」
[p]
#主人公
「そう」
[p]
#抹茶エクレア
「入口、また増えた」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「……よし」
[p]
#抹茶エクレア
「勝つんやなくて」
[p]
#抹茶エクレア
「覚えて帰ってもらお」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「でも」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「売上も負けへんで」
[p]
#主人公
「そこは残るんだ」
[p]
#抹茶エクレア
「競争心は健康や」
[p]
#主人公
「限度による」
[p]

*scene_09_05
[eval exp="f.chapter = '09'; f.scene = '09_05'"]
[mask time="500" color="0x000000"]
[cm]
[chara_hide name="久世玲"]
[bg storage="bg09_department_store_event_hall.png" time="0"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[mask_off time="500"]
#客
「これ、美味しいですね」
[p]
#抹茶エクレア
「ありがとうございます！」
[p]
#客
「普段もここで買えるんですか？」
[p]
#主人公
「今日は催事だけで」
[p]
#主人公
「普段はPâtisserie Komorebiで販売しています」
[p]
#客
「どこにあるんですか？」
[p]
[eval exp="sf.cg_september_event_02 = true"]
[skipstop]
[chara_hide name="抹茶エクレア"]
[bg storage="cg/september/CG09_02_A_Way_Back_to_Komorebi.png" time="500"]
#抹茶エクレア
「ここやで」
[p]
#客
「近い」
[p]
#主人公
「営業時間も書いてあります」
[p]
#客
「じゃあ今度行ってみます」
[p]
#抹茶エクレア
「ぜひ！」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「どうした？」
[p]
#抹茶エクレア
「勝った」
[p]
#主人公
「何に？」
[p]
#抹茶エクレア
「昨日のウチに」
[p]
#主人公
「それならいいかも」
[p]
#抹茶エクレア
「催事から店につながった」
[p]
#主人公
「まだ来てないけどね」
[p]
#抹茶エクレア
「来る！」
[p]
#主人公
「自信あるな」
[p]
#抹茶エクレア
「世界一になるからな」
[p]

*scene_09_06
[eval exp="f.chapter = '09'; f.scene = '09_06'"]
[mask time="650" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[bg storage="bg09_department_store_event_hall.png" time="0"]
[xchgbgm storage="09_Measured_Grace.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="summer_normal"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[chara_mod name="久世玲" face="september_normal"]
[chara_show name="久世玲" left="120" top="90"]
[mask_off time="650"]
#久世玲
「お疲れさま」
[p]
#主人公
「お疲れさまです」
[p]
#抹茶エクレア
「久世さんも」
[p]
#久世玲
「どうだった？」
[p]
#抹茶エクレア
「疲れた」
[p]
#久世玲
「正直ね」
[p]
#主人公
「初めてだったので」
[p]
#久世玲
「でも、最後の方は慣れてたじゃない」
[p]
#抹茶エクレア
「見てたん？」
[p]
#久世玲
「隣だから」
[p]
#抹茶エクレア
「ウチら、どうやった？」
[p]
#久世玲
「どう、って？」
[p]
#抹茶エクレア
「勝ってた？」
[p]
#主人公
「まだ言う？」
[p]
#久世玲
「……」
[p]
#久世玲
「あなたたち」
[p]
[eval exp="sf.cg_september_event_03 = true"]
[skipstop]
[chara_hide name="抹茶エクレア"]
[chara_hide name="久世玲"]
[bg storage="cg/september/CG09_03_What_Do_You_Want_to_Sell.png" time="500"]
#久世玲
「何を売りたいの？」
[p]
#抹茶エクレア
「抹茶エクレア」
[p]
#久世玲
「本当に？」
[p]
#抹茶エクレア
「え？」
[p]
#久世玲
「商品だけ？」
[p]
#主人公
「……」
[p]
#久世玲
「私は」
[p]
#久世玲
「“この店なら、また何か買いたい”って思ってもらえる店を作りたい」
[p]
#抹茶エクレア
「……」
[p]
#久世玲
「だから催事では」
[p]
#久世玲
「今日の一個だけじゃなく」
[p]
#久世玲
「店の名前も覚えてもらいたい」
[p]
#主人公
「店そのものを売ってる」
[p]
#久世玲
「そうとも言える」
[p]
#抹茶エクレア
「……」
[p]
#久世玲
「あなたたちは？」
[p]
#抹茶エクレア
「ウチは」
[p]
#抹茶エクレア
「世界一の抹茶エクレア」
[p]
#久世玲
「それは聞いた」
[p]
#抹茶エクレア
「でも」
[p]
#抹茶エクレア
「そのために」
[p]
#抹茶エクレア
「Komorebi、好きになってもらいたい」
[p]
#久世玲
「……」
[p]
#抹茶エクレア
「たぶん」
[p]
#久世玲
「たぶん？」
[p]
#抹茶エクレア
「今考えたとこやから」
[p]
#久世玲
「ふふ」
[p]
#主人公
「笑った」
[p]
#久世玲
「悪い？」
[p]
#主人公
「いえ」
[p]
#久世玲
「また催事で会うかもしれないわね」
[p]
#抹茶エクレア
「次は勝つで」
[p]
#久世玲
「だから」
[p]
#主人公
「すみません」
[p]
#抹茶エクレア
「なんで謝るん！」
[p]

*scene_09_07
[eval exp="f.chapter = '09'; f.scene = '09_07'"]
[mask time="700" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア"]
[chara_hide name="久世玲"]
[bg storage="apr_shop_day.png" time="0"]
[xchgbgm storage="06_One_Year_One_Eclair.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="summer_quiet"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[mask_off time="700"]
#抹茶エクレア
「店、狭いな」
[p]
#主人公
「催事のあとだとね」
[p]
#抹茶エクレア
「でも」
[p]
#主人公
「でも？」
[p]
#抹茶エクレア
「落ち着く」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「昨日、知らん人いっぱいおった」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「久世さんもおった」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「めっちゃ売れてた」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「気になった」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「でも」
[p]
#抹茶エクレア
「ウチらはウチらやな」
[p]
#主人公
「そうだね」
[p]
#抹茶エクレア
「店の外出ても」
[p]
#抹茶エクレア
「ここに戻ってこれた」
[p]
#主人公
「それが大事なのかも」
[p]
#抹茶エクレア
「……次」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「久世さんより売る」
[p]
#主人公
「学んだ？」
[p]
#抹茶エクレア
「冗談やん」
[p]
#主人公
「目が本気なんだよ」
[p]
#抹茶エクレア
「半分だけ」
[p]
#主人公
「半分もあるの？」
[p]
#抹茶エクレア
「でも」
[p]
#主人公
「？」
[p]
#抹茶エクレア
「今度会う時は」
[p]
#抹茶エクレア
「ちゃんと、ウチらのやり方で勝ちたい」
[p]
#主人公
「……」
[p]
#主人公
「それなら」
[p]
#主人公
「ちょっと分かる」
[p]
#抹茶エクレア
「やろ？」
[p]

*september_clear
[iscript]
sf.normal_ch09_clear = true; f.chapter = "09"; f.scene = "clear"; f.current_clear_month = "09";
[endscript]
[skipstop]
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
9月 CLEAR『店の外でも、ウチらの店』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
初めて、店の外で他の店と並んだ。
[r]
数字も、行列も、売上も、比べようと思えばいくらでも比べられた。
[p]
でも催事で持ち帰りたかったのは、勝敗ではなかった。
[r]
店を知ってくれる人。次に店へ来てくれる人。
[p]
そして、自分たちが何を届けたいのかという答え。
[r]
九月に覚えたのは、外へ出ても、自分たちの目的を見失わないことだった。
[p]
[jump target="*september_clear_menu"]

*september_clear_menu
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
9月 CLEAR『店の外でも、ウチらの店』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
抹茶ちゃんのひとこと
[r]
「勝つんもええけど、ウチらの店を好きになってもらう方が、もっと強いかもしれへんな」
[resetfont]
[glink text="タイトルへ" color="green" font_color="0x3B2A1B" x="675" y="150" width="400" height="85" size="23" bold="true" storage="title_screen.ks" target="*title" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="記録" color="green" font_color="0x3B2A1B" x="675" y="245" width="400" height="85" size="23" bold="true" storage="system_common.ks" target="*records_from_clear" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[s]
