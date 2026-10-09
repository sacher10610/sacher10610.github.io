; ==================================================
; CHAPTER 05 / MAY
; 第2章「まず客を呼べ」
; 本文は MAY_SCENARIO_FINAL.txt に準拠。
; ==================================================

*scene_05_01
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="1000"]
[call storage="system_common.ks"]
[clearstack stack="if"]
[cm]
[clearfix name="april_ui"]
[hidemenubutton]
[tb_show_message_window]
[chara_hide name="女神"]
[chara_hide name="三好文子"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[bg storage="apr_shop_morning.png" time="400"]
[iscript]
f.chapter = "05";
f.scene = "05_01";
[endscript]
#
; SCENE 01 / 5月1日 朝「世界一の前に、まず一人」
#抹茶エクレア
「……ゼロ」
[p]
#主人公
「何が？」
[p]
#抹茶エクレア
「今、店の前通った人のうち、入ってきた人数」
[p]
#主人公
「開店して三分だよ」
[p]
#抹茶エクレア
「三分もあったんやで？」
[p]
#主人公
「その単位で焦るのやめない？」
[p]
#抹茶エクレア
「世界一まで、あと十一か月やろ？」
[p]
#主人公
「そうだけど」
[p]
#抹茶エクレア
「一日約三十人……いや、世界人口で割ったら……」
[p]
#主人公
「何を割ってるの？」
[p]
#抹茶エクレア
「世界一への道のり」
[p]
#主人公
「雑すぎる」
[p]
#抹茶エクレア
「でもな、あんた」
[p]
#抹茶エクレア
「世界一になる以前に、今のウチらにはもっと根本的な問題がある」
[p]
#主人公
「客が少ない」
[p]
#抹茶エクレア
「言うなや！　今ウチが格好よく言おうとしてたのに！」
[p]
#主人公
「事実だから」
[p]
#抹茶エクレア
「……せや。客が少ない」
[p]
#抹茶エクレア
「うまいもん作っても、誰にも食べてもらわれへんかったら始まらへん」
[p]
#主人公
「まず知ってもらう必要がある、か」
[p]
#抹茶エクレア
「そういうことや」
[p]
#抹茶エクレア
「五月の目標、決まったな」
[p]
#抹茶エクレア
「まず客を呼ぶで！」
[p]
#主人公
「世界一よりは、だいぶ現実的になった」
[p]
#抹茶エクレア
「最初から現実的やったわ！」
[p]
#主人公
「千個作ろうとしてた人が？」
[p]
#抹茶エクレア
「四月の話はもうええねん」
[p]

*scene_05_02
#
; SCENE 02 / 常連さんのひとこと
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_show name="三好文子" left="75" top="115"]
#三好文子
「おはよう」
[p]
#主人公
「いらっしゃいませ、三好さん」
[p]
#抹茶エクレア
「おはようございます！」
[p]
#三好文子
「あら。今日も元気ねえ」
[p]
#抹茶エクレア
「元気だけは世界一です！」
[p]
#主人公
「そこを世界一にするゲームじゃないから」
[p]
#三好文子
「ふふ」
[p]
#三好文子
「でも、前より明るくなったわね。このお店」
[p]
#主人公
「そうですか？」
[p]
#三好文子
「ええ」
[p]
#三好文子
「前はね、開いてるのか閉まってるのか、外から分からない日もあったもの」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「あんた」
[p]
#主人公
「何も言わないで」
[p]
#三好文子
「悪く言ってるんじゃないのよ」
[p]
#三好文子
「昔から知ってる人は入るけど、初めての人には少し入りづらかったかもしれないわね」
[p]
#抹茶エクレア
「なるほど……！」
[p]
#抹茶エクレア
「つまり、店の存在を世界に知らしめればええんやな！」
[p]
#主人公
「三好さんの話から、なんで世界まで飛ぶの？」
[p]
#三好文子
「若いっていいわねえ」
[p]
#主人公
「たぶんそういう話でもないです」
[p]
#抹茶エクレア
「よっしゃ。宣伝会議や！」
[p]
#主人公
「嫌な予感がする」
[p]
#抹茶エクレア
「失礼やな。今回はちゃんと考えるで」
[p]
#主人公
「今回は？」
[p]
#抹茶エクレア
「……ちゃんと考えるで！」
[p]

*choice_05_01
[clearstack stack="if"]
[cm]
#
[glink text="「まずは、とにかく話題になろう」" color="green" font_color="0x3B2A1B" x="310" y="205" width="660" height="100" size="21" bold="true" target="*may_bad003_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="「毎日たくさん投稿して、存在感を出そう」" color="green" font_color="0x3B2A1B" x="310" y="325" width="660" height="100" size="21" bold="true" target="*may_bad004_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="「その前に、来てくれている人に理由を聞こう」" color="green" font_color="0x3B2A1B" x="310" y="445" width="660" height="100" size="21" bold="true" target="*may_normal_route" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]



*may_bad003_entry
[chara_hide name="三好文子"]
[if exp="sf.core_bad_003 == true"]
[clearstack stack="if"]
[cm]
#
[font color="0x305332" bold="true"]
CORE BAD 003
[resetfont]
[r]
『炎上は知名度に入りますか？』
[r]
その結末は、もう知っている。
[p]
[jump target="*choice_05_01"]
[endif]
[jump target="*may_bad003"]

*may_bad003
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="900"]
[clearstack stack="if"]
[cm]
[bg storage="apr_shop_morning.png"]
#
; BRANCH A / BAD003
#主人公
「まずは、とにかく話題になろう」
[p]
#抹茶エクレア
「ほう」
[p]
#主人公
「良くも悪くも、知られなきゃ始まらない」
[p]
#抹茶エクレア
「……良くも悪くも？」
[p]
#主人公
「言い方の問題」
[p]
#抹茶エクレア
「その言い方、だいたい後で問題になるやつやで」
[p]
#主人公
「でも、普通に投稿しても埋もれるだろ」
[p]
#抹茶エクレア
「せやな」
[p]
#主人公
「ちょっと強い言葉を使うとか」
[p]
#抹茶エクレア
「たとえば？」
[p]
#主人公
「『抹茶嫌い、かかってこい』」
[p]
#抹茶エクレア
「ええやん」
[p]
#主人公
「え、いいの？」
[p]
#抹茶エクレア
「『この苦味に耐えられへんやつはまだ早い』」
[p]
#主人公
「待って。方向性が急に煽りになった」
[p]
#抹茶エクレア
「『甘いだけのお菓子に飽きた人へ』」
[p]
#主人公
「それはまだ普通」
[p]
#抹茶エクレア
「『抹茶を名乗るならこの濃さ超えてみい』」
[p]
#主人公
「誰と戦ってるの？」
[p]
#抹茶エクレア
「世界」
[p]
#主人公
「やっぱりやめようかな」
[p]
#抹茶エクレア
「もう遅いで」
[p]
#主人公
「え？」
[p]
#抹茶エクレア
「投稿した」
[p]
#主人公
「早いな！？」
[p]
#
数時間後
[p]
[playse storage="se_phone_notify.wav" volume="70" loop="false"]
[wait time="550"]
[playse storage="se_phone_notify.wav" volume="70" loop="false"]
[wait time="550"]
[playse storage="se_phone_notify.wav" volume="70" loop="false"]
#主人公
「……通知、止まらないな」
[p]
#抹茶エクレア
「見て見て！　めっちゃ伸びてる！」
[p]
#主人公
「ほんとだ」
[p]
#抹茶エクレア
「引用もいっぱいや！」
[p]
#主人公
「内容は？」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「内容は？」
[p]
#抹茶エクレア
「『なんやこの店』」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「『喧嘩売ってて草』」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「『ちょっと見に行きたい』」
[p]
#主人公
「一応、来店にはつながりそう」
[p]
#抹茶エクレア
「勝ったな」
[p]
#主人公
「まだ何にも勝ってない」
[p]
#
その日の午後
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
#客A
「あ、ここだここだ」
[p]
#客B
「例の店？」
[p]
#客A
「写真撮っていいですか？」
[p]
#主人公
「商品でしたら……」
[p]
#客A
「いや、店の外観」
[p]
#主人公
「……どうぞ」
[p]
#客B
「店員さんも映っていいです？」
[p]
#抹茶エクレア
「ええけど、買うていかへんの？」
[p]
#客B
「今日はいいかな」
[p]
#抹茶エクレア
「え？」
[p]
#客A
「投稿できた。行こ」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
#抹茶エクレア
「……」
[p]
#主人公
「人は来た」
[p]
#抹茶エクレア
「来ただけやな」
[p]
#
夕方
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_show name="三好文子" left="75" top="115"]
#三好文子
「今日はずいぶん賑やかだったのね」
[p]
#主人公
「賑やかではありました」
[p]
#三好文子
「売れたの？」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「……」
[p]
#三好文子
「あら」
[p]
#抹茶エクレア
「なあ、あんた」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「知ってもらうって」
[p]
#抹茶エクレア
「嫌われてもええ、って意味やったっけ」
[p]
#主人公
「違ったみたいだ」
[p]
#抹茶エクレア
「数字は増えたのにな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「店のこと好きになってくれた人は、増えたんかな」
[p]
#主人公
「……たぶん、ほとんど」
[p]
#抹茶エクレア
「増えてへんな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「これ、知名度だけなら成功扱いなん？」
[p]
#主人公
「……知名度には、入るかもしれない」
[p]
#抹茶エクレア
「嫌な成功やなあ」
[p]
[iscript]
sf.cg_may_mini_01 = true;
[endscript]
[skipstop]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[image layer="1" name="may_sdcg_image" folder="bgimage" storage="cg/may/SD01_Bad003_Flame_Publicity.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="may_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#
[p]
[free layer="1" name="may_sdcg_image" time="150" wait="false"]
[free layer="1" name="may_sdcg_frame" time="150"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[chara_show name="三好文子" left="75" top="115"]
[iscript]
f.april_bad = {kind:"CORE", id:"003", title:"炎上は知名度に入りますか？", lesson:"刺激の強い発信で注目だけは集めた。店を知る人は増えたが、「行きたい店」「また来たい店」にはならなかった。", retry:"*choice_05_01", storage:"n05_may.ks", month:"05"};
[endscript]
[register_core_bad id="003"]
[call storage="system_common.ks" target="*show_core_bad"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[jump target="*choice_05_01"]

*may_bad004_entry
[chara_hide name="三好文子"]
[if exp="sf.core_bad_004 == true"]
[clearstack stack="if"]
[cm]
#
[font color="0x305332" bold="true"]
CORE BAD 004
[resetfont]
[r]
『投稿する店』
[r]
その結末は、もう知っている。
[p]
[jump target="*choice_05_01"]
[endif]
[jump target="*may_bad004"]

*may_bad004
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="900"]
[clearstack stack="if"]
[cm]
[chara_hide name="三好文子"]
#
; BRANCH B / BAD004
#主人公
「毎日たくさん投稿して、存在感を出そう」
[p]
#抹茶エクレア
「たくさんって？」
[p]
#主人公
「朝、昼、夕方、閉店後」
[p]
#抹茶エクレア
「一日四回？」
[p]
#主人公
「新商品があれば追加」
[p]
#抹茶エクレア
「五回？」
[p]
#主人公
「仕込み中も」
[p]
#抹茶エクレア
「六回？」
[p]
#主人公
「材料が届いたら」
[p]
#抹茶エクレア
「七回？」
[p]
#主人公
「……多い？」
[p]
#抹茶エクレア
「もう店より投稿の方が営業してへん？」
[p]
#主人公
「でも更新が止まってる店って、不安じゃない？」
[p]
#抹茶エクレア
「それはそうやけど」
[p]
#主人公
「じゃあやろう」
[p]
#抹茶エクレア
「よっしゃ。やるからには徹底的にや！」
[p]
#
数日後
[p]
[bg storage="apr_kitchen_day.png" time="300"]
#抹茶エクレア
「あんた！　クリーム絞るのちょっと待って！」
[p]
#主人公
「なんで？」
[p]
#抹茶エクレア
「写真撮るから」
[p]
#主人公
「もう絞り袋持ってるんだけど」
[p]
#抹茶エクレア
「その角度やと映えへん」
[p]
#主人公
「食べ物を作ってるんだけど」
[p]
#抹茶エクレア
「投稿も仕事や！」
[p]
#主人公
「最近それしか聞いてない気がする」
[p]
#
店内
[p]
[bg storage="apr_shop_morning.png" time="300"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
#客
「あの、すみません」
[p]
#主人公
「いらっしゃいませ」
[p]
#抹茶エクレア
「ちょ、待って！」
[p]
#主人公
「今度は何？」
[p]
#抹茶エクレア
「新しい看板撮ってるとこやねん」
[p]
#客
「あ……」
[p]
#主人公
「ご注文どうぞ」
[p]
#客
「えっと……」
[p]
[playse storage="se_phone_notify.wav" volume="70" loop="false"]
#抹茶エクレア
「反応きた！」
[p]
#主人公
「今は見なくていい」
[p]
#抹茶エクレア
「でも投稿した直後が大事やろ？」
[p]
#主人公
「目の前のお客さんの方が大事」
[p]
#客
「……また今度にします」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
#主人公
「あ」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「帰ってもうた」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「フォロワーは増えたで」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「でも、お客さん減ってへん？」
[p]
#主人公
「たぶん」
[p]
#抹茶エクレア
「なあ」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「ウチら、何の店やったっけ」
[p]
#主人公
「パティスリー」
[p]
#抹茶エクレア
「最近ずっと、投稿する店になってたな」
[p]
#主人公
「……なってた」
[p]
[iscript]
sf.cg_may_mini_02 = true;
[endscript]
[skipstop]
[chara_hide name="抹茶エクレア"]
[image layer="1" name="may_sdcg_image" folder="bgimage" storage="cg/may/SD02_Bad004_Posting_Shop.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="may_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#
[p]
[free layer="1" name="may_sdcg_image" time="150" wait="false"]
[free layer="1" name="may_sdcg_frame" time="150"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[iscript]
f.april_bad = {kind:"CORE", id:"004", title:"投稿する店", lesson:"発信すること自体が目的になり、画面の向こうばかり見ているうちに、目の前のお客さんを置いてきぼりにしてしまった。", retry:"*choice_05_01", storage:"n05_may.ks", month:"05"};
[endscript]
[register_core_bad id="004"]
[call storage="system_common.ks" target="*show_core_bad"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[jump target="*choice_05_01"]

*may_normal_route
*scene_05_03
[clearstack stack="if"]
[chara_hide name="三好文子"]
[bg storage="apr_shop_morning.png" time="300"]
#
; BRANCH C / 正解ルート
#主人公
「その前に、来てくれている人に理由を聞こう」
[p]
#抹茶エクレア
「理由？」
[p]
#主人公
「どうしてこの店に来てくれるのか」
[p]
#抹茶エクレア
「なんでや？」
[p]
#主人公
「客を増やしたいなら、まず今いる客が何を気に入ってるのか知った方がいい」
[p]
#抹茶エクレア
「なるほど」
[p]
#主人公
「あと、初めての人が入りづらい理由も」
[p]
#抹茶エクレア
「……地味やな」
[p]
#主人公
「嫌なら派手に失敗する？」
[p]
#抹茶エクレア
「四月で学んだわ」
[p]
#主人公
「偉い」
[p]
#抹茶エクレア
「その言い方腹立つな」
[p]
#主人公
「じゃあ三好さんに聞いてみよう」
[p]
#抹茶エクレア
「よっしゃ」
[p]
#抹茶エクレア
「世界一へ向けて、市場調査や！」
[p]
#主人公
「急に言葉だけ大きくするな」
[p]
#
; SCENE 03 / 「なんで、この店に？」
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_show name="三好文子" left="75" top="115"]
#三好文子
「どうして来るのか、ですか？」
[p]
#主人公
「はい」
[p]
#三好文子
「急にどうしたの？」
[p]
#抹茶エクレア
「世界一になるためです！」
[p]
#主人公
「そこは気にしないでください」
[p]
#三好文子
「ふふ。そうねえ」
[p]
#三好文子
「昔から知ってる、というのもあるけれど」
[p]
#三好文子
「ここのお菓子、食べ疲れないのよ」
[p]
#抹茶エクレア
「食べ疲れ？」
[p]
#三好文子
「甘すぎないし、毎日じゃなくても、ふと思い出すの」
[p]
#主人公
「ふと思い出す」
[p]
#三好文子
「それに」
[p]
#三好文子
「前はあなたのお父さんたちがいたでしょう？」
[p]
#主人公
「……はい」
[p]
#三好文子
「顔を覚えてくれてね」
[p]
#三好文子
「『今日はこれがいいですよ』って言われるのが、私は好きだったわ」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「商品だけやないんやな」
[p]
#三好文子
「お店って、そういうものじゃない？」
[p]
[iscript]
sf.cg_may_event_01 = true;
[endscript]
[skipstop]
[chara_hide name="三好文子"]
[chara_hide name="抹茶エクレア"]
[bg storage="cg/may/CG01_Why_This_Shop.png" time="500"]
#抹茶エクレア
「……覚えとく」
[p]
[chara_hide name="三好文子"]
[bg storage="apr_shop_morning.png" time="400"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
#
別のお客さん
[p]
#客
「ここ、前から気にはなってたんです」
[p]
#主人公
「そうなんですか？」
[p]
#客
「はい。でも、何のお店かちょっと分かりづらくて」
[p]
#抹茶エクレア
「ケーキ屋やで！」
[p]
#客
「入ったら分かりました」
[p]
#主人公
「外から分からなかったんですね」
[p]
#客
「あと、営業時間が検索してもよく分からなくて」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「あんた」
[p]
#主人公
「四月の話はもういいから」
[p]
#抹茶エクレア
「まだ何も言うてへん」
[p]
#
閉店後
[p]
[chara_hide name="三好文子"]
#抹茶エクレア
「まとめるで」
[p]
#抹茶エクレア
「一、何の店か分かる」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「二、いつ開いてるか分かる」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「三、何がおすすめか分かる」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「四、来た人の顔を見る」
[p]
#主人公
「それが一番大事かも」
[p]
#抹茶エクレア
「宣伝って、もっとこう」
[p]
#抹茶エクレア
「バーン！」
[p]
#抹茶エクレア
「ドーン！」
[p]
#抹茶エクレア
「世界へ発信！」
[p]
#抹茶エクレア
「みたいなん想像してた」
[p]
#主人公
「古いテレビCMみたい」
[p]
#抹茶エクレア
「でも」
[p]
#抹茶エクレア
「『ちゃんと伝える』だけでも、宣伝なんやな」
[p]
#主人公
「たぶんね」
[p]
#抹茶エクレア
「よし」
[p]
#抹茶エクレア
「ほな、ちゃんと伝えよ」
[p]

*scene_05_04
#
; SCENE 04 / 小さな宣伝作戦
#主人公
「まず、店の前に今日のおすすめを書く」
[p]
#抹茶エクレア
「『本日のおすすめ、抹茶エクレア』」
[p]
#主人公
「毎日それになりそう」
[p]
#抹茶エクレア
「問題ある？」
[p]
#主人公
「ある」
[p]
#抹茶エクレア
「ほな、その日のほんまのおすすめを書く」
[p]
#主人公
「そうして」
[p]
#抹茶エクレア
「営業時間も大きめに」
[p]
#主人公
「SNSには？」
[p]
#抹茶エクレア
「営業時間と、今日あるお菓子」
[p]
#主人公
「写真は一枚」
[p]
#抹茶エクレア
「え、一枚だけ？」
[p]
#主人公
「一枚で伝わるなら、それでいい」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「ちょっと大人になった気分や」
[p]
#主人公
「先月千個作ろうとしてたからな」
[p]
#抹茶エクレア
「四月の話はもうええて！」
[p]

*choice_05_02
[clearstack stack="if"]
[cm]
#
[glink text="「今日のお菓子を見せよう」" color="green" font_color="0x3B2A1B" x="310" y="225" width="660" height="100" size="21" bold="true" target="*choice_05_02_a" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="「店の雰囲気を見せよう」" color="green" font_color="0x3B2A1B" x="310" y="345" width="660" height="100" size="21" bold="true" target="*choice_05_02_b" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="「営業時間と場所を分かりやすくしよう」" color="green" font_color="0x3B2A1B" x="310" y="465" width="660" height="100" size="21" bold="true" target="*choice_05_02_c" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*choice_05_02_a
#主人公
「今日のお菓子を見せよう」
[p]
#抹茶エクレア
「商品で勝負やな」
[p]
#主人公
「写真一枚でいい」
[p]
#抹茶エクレア
「角度は？」
[p]
#主人公
「普通で」
[p]
#抹茶エクレア
「照明は？」
[p]
#主人公
「普通で」
[p]
#抹茶エクレア
「背景に葉っぱとか置かへん？」
[p]
#主人公
「普通で」
[p]
#抹茶エクレア
「おもんない！」
[p]
#主人公
「食べ物だから、それでいい」
[p]
#抹茶エクレア
「……まあ、美味しそうに見えたら勝ちか」
[p]
#主人公
「そういうこと」
[p]
[jump target="*scene_05_05"]

*choice_05_02_b
#主人公
「店の雰囲気を見せよう」
[p]
#抹茶エクレア
「ウチも映る？」
[p]
#主人公
「映りたいの？」
[p]
#抹茶エクレア
「別に？」
[p]
#主人公
「顔が映りたいって言ってる」
[p]
#抹茶エクレア
「ちゃうし」
[p]
#主人公
「じゃあ店だけ」
[p]
#抹茶エクレア
「……端っこくらいなら」
[p]
#主人公
「映りたいんじゃん」
[p]
#抹茶エクレア
「店の雰囲気の一部や！」
[p]
[jump target="*scene_05_05"]

*choice_05_02_c
#主人公
「営業時間と場所を分かりやすくしよう」
[p]
#抹茶エクレア
「地味やなあ」
[p]
#主人公
「来たいと思っても、開いてる時間が分からなかったら来られないだろ」
[p]
#抹茶エクレア
「……せやな」
[p]
#主人公
「来てもらうための情報も宣伝だよ」
[p]
#抹茶エクレア
「なるほど」
[p]
#抹茶エクレア
「地味やけど、強いな」
[p]
#主人公
「褒めてる？」
[p]
#抹茶エクレア
「たぶん」
[p]
[jump target="*scene_05_05"]

*scene_05_05
[mask time="400" color="0x000000"]
[cm]
[wait time="150"]
[mask_off time="450"]
#
; SCENE 05 / 初めてのお客さん
数日後
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
#客
「こんにちは」
[p]
#主人公
「いらっしゃいませ」
[p]
#抹茶エクレア
「いらっしゃいませ！」
[p]
#客
「SNSで見て」
[p]
#抹茶エクレア
「！」
[p]
#主人公
「ありがとうございま……」
[p]
#抹茶エクレア
「どの投稿ですか！？」
[p]
#主人公
「近い近い」
[p]
#客
「あ、えっと」
[p]
#主人公
「すみません」
[p]
#抹茶エクレア
「ご、ごゆっくりどうぞ」
[p]
#主人公
「下がって」
[p]
#抹茶エクレア
「はい」
[p]
#
購入後
[p]
#客
「美味しかったです」
[p]
#主人公
「ありがとうございます」
[p]
#抹茶エクレア
「……」
[p]
#客
「また来ます」
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
#
少し間
[p]
#抹茶エクレア
「……聞いた？」
[p]
#主人公
「聞いた」
[p]
#抹茶エクレア
「『また来ます』って」
[p]
#主人公
「言ってたね」
[p]
#抹茶エクレア
「SNSで見て来て」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「食べて」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「また来るって」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「……これや」
[p]
#主人公
「何が？」
[p]
#抹茶エクレア
「ウチらが欲しかったん」
[p]
#抹茶エクレア
「『見た』やなくて」
[p]
#抹茶エクレア
「『来た』だけでもなくて」
[p]
#抹茶エクレア
「『また来る』や」
[p]
#主人公
「それが増えたら、店は強くなる」
[p]
#抹茶エクレア
「世界一にも近づく？」
[p]
#主人公
「たぶん、一歩くらい」
[p]
#抹茶エクレア
「一歩かあ」
[p]
#主人公
「五月で世界一になるつもりだった？」
[p]
#抹茶エクレア
「できれば」
[p]
#主人公
「あと十か月あるから」
[p]
#抹茶エクレア
「……」
[p]
#抹茶エクレア
「なあ、あんた」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「一歩でも」
[p]
#抹茶エクレア
「ちゃんと前に進んでるなら」
[p]
#抹茶エクレア
「それでええんかもな」
[p]
#主人公
「珍しくいいこと言った」
[p]
#抹茶エクレア
「珍しくは余計や！」
[p]
[jump target="*scene_05_06"]

*scene_05_06
[mask time="400" color="0x000000"]
[cm]
[wait time="150"]
[mask_off time="450"]
#
; SCENE 06 / 数日後「ほんまに、また来た」
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
#客
「こんにちは」
[p]
#主人公
「あ」
[p]
#抹茶エクレア
「あ！」
[p]
#客
「この前の、もう一度ください」
[p]
#抹茶エクレア
「……！」
[p]
#主人公
「抹茶ちゃん」
[p]
#抹茶エクレア
「分かってる」
[p]
#抹茶エクレア
「今度は近づきすぎへん」
[p]
#主人公
「成長した」
[p]
#抹茶エクレア
「やかましい」
[p]
#客
「今日は友達も連れてきました」
[p]
[iscript]
sf.cg_may_event_02 = true;
[endscript]
[skipstop]
[chara_hide name="抹茶エクレア"]
[bg storage="cg/may/CG02_See_You_Again.png" time="500"]
#友人
「こんにちは」
[p]
#主人公
「いらっしゃいませ」
[p]
#抹茶エクレア
「……いらっしゃいませ！」
[p]
; CG02は最後の会話からCLEARまで継続して表示する。
#
二人が席についたあと
[p]
#主人公
「フォロワー、何人増えた？」
[p]
#抹茶エクレア
「知らん」
[p]
#主人公
「見なくていいの？」
[p]
#抹茶エクレア
「あとでええ」
[p]
#主人公
「へえ」
[p]
#抹茶エクレア
「今は」
[p]
#抹茶エクレア
「あの人、ほんまにまた来てくれたから」
[p]
#主人公
「嬉しい？」
[p]
#抹茶エクレア
「……まあな」
[p]
#主人公
「顔に出てる」
[p]
#抹茶エクレア
「出てへん」
[p]
#主人公
「出てる」
[p]
#抹茶エクレア
「うるさいなあ」
[p]
#主人公
「じゃあ、五月の目標は達成？」
[p]
#抹茶エクレア
「『客を呼ぶ』だけやったらな」
[p]
#主人公
「違った？」
[p]
#抹茶エクレア
「呼んで終わりやない」
[p]
#抹茶エクレア
「来てくれた人に、また来たいって思ってもらう」
[p]
#抹茶エクレア
「その方が、ずっと難しい」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「……でも」
[p]
#抹茶エクレア
「そっちの方が、ええな」
[p]
#主人公
「そうだね」
[p]
[jump target="*may_clear"]

*may_clear
[iscript]
sf.normal_ch05_clear = true;
f.chapter = "05";
f.scene = "clear";
f.current_clear_month = "05";
[endscript]
[xchgbgm storage="06_One_Year_One_Eclair.mp3" time="1200"]
[chara_hide name="抹茶エクレア"]
[chara_hide name="三好文子"]
[skipstop]
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
5月 CLEAR『また来ます』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
「客を呼ぶ」ために必要なのは、ただ多くの人に知られることではなかった。
[p]
何の店かを伝え、来てくれた人と向き合い、もう一度来たいと思ってもらう。[r]
小さな店に、最初の「また来ます」が残った。
[p]
[jump target="*may_clear_menu"]

; 記録からは終了メニューへ直接戻り、総括を再生し直さない。
*may_clear_menu
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
5月 CLEAR『また来ます』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
抹茶ちゃんのひとこと[r]
「世界一って、一回来てもろた人数やないんやな。[r]
……また来てくれる人、増やしてこ」
[resetfont]
[glink text="タイトルへ" color="green" font_color="0x3B2A1B" x="675" y="150" width="400" height="85" size="23" bold="true" storage="title_screen.ks" target="*title" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="記録" color="green" font_color="0x3B2A1B" x="675" y="245" width="400" height="85" size="23" bold="true" storage="system_common.ks" target="*records_from_clear" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="6月へ" color="green" font_color="0x3B2A1B" x="675" y="340" width="400" height="85" size="23" bold="true" storage="n06_june.ks" target="*eyecatch_05_06" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[s]

; 旧版の終了画面を保存したデータでも、同名のローカル移動先を解決する。
*records_from_clear
[jump storage="system_common.ks" target="*records_from_clear"]
