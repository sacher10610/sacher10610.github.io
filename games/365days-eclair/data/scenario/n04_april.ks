; ==================================================
; NORMAL ROUTE
; CHAPTER 04 / APRIL
; TITLE: 異世界人、厨房に落ちる
;
; NOTE:
;   ・「#主人公」は実装時に f.player_name を名前欄へバインドする。
;   ・CG/BG/BGM/SEはコメント指定。素材確定後に接続。
;   ・register_core_bad / register_mini_bad / show_core_bad /
;     show_mini_bad は system_common.ks 側の共通処理を想定。
; ==================================================

*scene_04_01
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="1000"]
[call storage="system_common.ks"]
[chara_hide name="女神"]
[chara_hide name="抹茶エクレア"]
[bg storage="apr_kitchen_morning.png"]
[chara_config pos_mode="false"]
[clearstack stack="if"]
[cm]
#
; --------------------------------------------------
; 4-01 朝の厨房
; --------------------------------------------------

[iscript]
f.scene = "04_01";
[endscript]

; [BG] shop_kitchen_morning
; [BGM] morning_shop

#
開店前の厨房には、オーブンの低い音だけが残っていた。
[p]

#
昨日の売上を、もう一度見る。
[p]

#
数字は見直しても増えない。
[p]

#主人公
「……今月も赤字」
[p]

#
先月よりは、少しだけまし。
[p]

#
ただし比較対象が先月なのが悲しい。
[p]

#
レジ横に置いた古いノートには、両親の字がまだ残っている。
[p]

#
仕入れ。
[r]
予約。
[r]
常連客の好み。
;クリスマスの仕込み量。
[p]

#
そこだけ時間が止まっているみたいだった。
[p]

#
店を閉める理由なら、いくつもある。
[p]

#
続ける理由は――まだ、うまく説明できない。
[p]

#主人公
「とりあえず、今日も開けないと」
[p]

#
ボウルを手に取る。
[p]

#
その瞬間。
[p]

#
厨房の中央が、妙に明るくなった。
[p]

#主人公
「……？」
[p]

*scene_04_02
[bg storage="apr_kitchen_morning.png"]
[chara_mod name="抹茶エクレア" face="default"]
[clearstack stack="if"]
[cm]
#
; --------------------------------------------------
; 4-02 異世界人、厨房に落ちる
; MINI CG 4-1
; --------------------------------------------------

[iscript]
f.scene = "04_02";
[endscript]

; [CG] mini_04_01_fall_into_kitchen
; [SE] teleport / crash
[iscript]
sf.cg_april_event_01 = true;
[endscript]
[skipstop]
[playse storage="se_matcha_teleport_land.wav" volume="70" loop="false"]
[bg storage="cg/april/CG01_A_Stranger_in_the_Kitchen.png" time="500"]

#
光の中から、人が落ちてきた。
[p]

#抹茶エクレア
「いったぁぁぁ……！」
[p]
[bg storage="apr_kitchen_morning.png" time="500"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90"]
[xchgbgm storage="04_Matcha_Has_Arrived.mp3" time="1000"]

#主人公
「…………」
[p]
;[image layer="1" name="april_protagonist_sd" visible="false" folder="fgimage" storage="apr_protagonist_sd.png" x="35" y="55" width="210" height="280"]

#
床に座り込んだ見知らぬ少女。
[r]
見たことのない服。
[r]
さっきまで誰もいなかった厨房。
[p]

#
かなり非現実的だ。
[p]

#
でも、心当たりがないわけでもない。
[p]

#主人公
「……あ。異世界転移か」
[p]

#抹茶エクレア
「いや、なんでそんなすんなり受け入れんねん！？」
[p]

#主人公
「最近そういうアニメ多いし」
[p]

#抹茶エクレア
「アニメで現実理解すな！」
[p]

#主人公
「じゃあ不法侵入？」
[p]

#抹茶エクレア
「そっち行くん！？」
[p]

#主人公
「どっちがいい？」
[p]

#抹茶エクレア
「異世界から来ました！」
[p]

#主人公
「じゃあ最初ので合ってるね」
[p]

#抹茶エクレア
「納得の仕方が怖いわ！」
[p]

#
少女は立ち上がり、服についた粉を払う。
[p]

#
そして厨房を見回した。
[p]

#抹茶エクレア
「……ここ、菓子屋？」
[p]

#主人公
「一応」
[p]

#抹茶エクレア
「パティシエ？」
[p]

#主人公
「一応」
[p]

#抹茶エクレア
「なんやその自信ない返事」
[p]

#主人公
「急に店主になったから」
[p]

#抹茶エクレア
「……ほーん」
[p]

#
少女は何かを考えるように腕を組む。
[p]

#抹茶エクレア
「ちょうどええかもな」
[p]

#主人公
「何が？」
[p]

#抹茶エクレア
「まず話そ。長なる」
[p]

#主人公
「厨房の床で？」
[p]

#抹茶エクレア
「椅子ある？」
[p]

#主人公
「店に」
[p]

#抹茶エクレア
「ほな店行こ」
[p]

#主人公
「自分の店みたいに言うね」
[p]

#抹茶エクレア
「そのうちそうなるかもしれへんで？」
[p]

#主人公
「嫌な予感しかしない」
[p]

*scene_04_03
;[free layer="1" name="april_protagonist_sd"]
[bg storage="apr_shop_morning.png"]
[chara_mod name="抹茶エクレア" face="energy"]
[clearstack stack="if"]
[cm]
#
; --------------------------------------------------
; 4-03 事情説明
; --------------------------------------------------

[iscript]
f.scene = "04_03";
[endscript]

; [BG] shop_floor_morning

#
開店前の客席。
[p]

#
向かいに座った少女は、出した水を一気に飲み干した。
[p]

#抹茶エクレア
「まず自己紹介やな。ウチ、抹茶エクレア」
[p]

#主人公
「……名前が？」
[p]

#抹茶エクレア
「名前が」
[p]

#主人公
「抹茶エクレア？」
[p]

#抹茶エクレア
「抹茶エクレア」
[p]

#主人公
「すごく注文しづらい名前だね」
[p]

#抹茶エクレア
「慣れろ」
[p]

#主人公
「善処する」
[p]

#抹茶エクレア
「で、異世界から来た」
[p]

#主人公
「そこはさっき聞いた」
[p]

#抹茶エクレア
「女神様と、まあ……色々あってん」
[p]

#主人公
「色々」
[p]

#抹茶エクレア
「色々や」
[p]

#主人公
「そこを詳しく」
[p]

#抹茶エクレア
「そこはええねん！」
[p]

#
露骨に話を逸らされた。
[p]

#抹茶エクレア
「とにかく、一年以内に抹茶エクレアを世界一のお菓子にしたら、元の世界に帰してもらえる」
[p]

#主人公
「世界一って、何をもって？」
[p]

#抹茶エクレア
「……」
[p]

#主人公
「売上一位？」
[p]

#抹茶エクレア
「……」
[p]

#主人公
「人気？」
[p]

#抹茶エクレア
「……世界一は世界一やろ」
[p]

#主人公
「聞かなかったの？」
[p]

#抹茶エクレア
「転送される直前にそんな冷静な質問できるかい！」
[p]

#主人公
「まあ、それはそうか」
[p]

#抹茶エクレア
「で。あんた菓子作れるんやろ？」
[p]

#主人公
「基本的なものなら」
[p]

#抹茶エクレア
「店もある」
[p]

#主人公
「一応」
[p]

#抹茶エクレア
「客は？」
[p]

#主人公
「……」
[p]

#抹茶エクレア
「おらんの？」
[p]

#主人公
「ゼロではない」
[p]

#抹茶エクレア
「その言い方、一番あかんやつや！」
[p]

#主人公
「両親がやってた店なんだ」
[p]

#
抹茶エクレアの勢いが、少しだけ止まる。
[p]

#主人公
「半年前に事故で亡くなって、それから引き継いだ」
[p]

#抹茶エクレア
「……そっか」
[p]

#主人公
「別に、しんみりしなくていいよ」
[p]

#抹茶エクレア
「せえへん。そういうん苦手やし」
[p]

#主人公
「助かる」
[p]

#抹茶エクレア
「店、続けたいん？」
[p]

#
答えるまで、少し時間がかかった。
[p]

#主人公
「……潰したくはない」
[p]

#抹茶エクレア
「続けたいとは違うん？」
[p]

#主人公
「今は、それくらいしか分からない」
[p]

#抹茶エクレア
「ふーん」
[p]

#
そして、ぱん、と両手を打つ。
[p]

[iscript]
sf.cg_april_mini_01 = true;
[endscript]
[chara_hide name="抹茶エクレア"]
[skipstop]
[image layer="1" name="april_sdcg_image" folder="bgimage" storage="cg/april/SD01_Rigai_Icchi_Yan.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="april_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]

#抹茶エクレア
「ほな利害一致やん！」
[p]
[free layer="1" name="april_sdcg_image" time="150" wait="false"]
[free layer="1" name="april_sdcg_frame" time="150"]
[chara_mod name="抹茶エクレア" face="energy"]
[chara_show name="抹茶エクレア" left="790" top="90"]

#主人公
「どの辺が？」
[p]

#抹茶エクレア
「ウチが抹茶エクレア売る。店が儲かる。ウチ世界一。あんた店存続。完璧や」
[p]

#主人公
「すごく雑だけど、完全には否定できないな……」
[p]

#抹茶エクレア
「決まり！」
[p]

#主人公
「まだ何も決めてない」
[p]

#抹茶エクレア
「ほな最初に何個作る？」
[p]

#主人公
「話が早すぎる」
[p]

#抹茶エクレア
「世界一まで一年しかないんやで！」
[p]

#
抹茶エクレアが、勢いよく立ち上がる。
[p]

#抹茶エクレア
「まず千個や！」
[p]

#主人公
「……千？」
[p]

; [CG] mini_04_02_make_1000

*choice_04_production
[clearstack stack="if"]
[cm]
#
; --------------------------------------------------
; 4-04 最初の選択
; 4月のみ、BAD001または002を経験するまでLEARNED非表示
; --------------------------------------------------

[iscript]
f.scene = "04_04";
[endscript]

[glink target="*choice_04_a" text="「じゃあ、1000個作ろう」" color="green" x="320" y="145" width="640" height="135" size="22" font_color="0x3B2A1B" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink target="*choice_04_b" text="「いや、10個だけにしよう」" color="green" x="320" y="299" width="640" height="135" size="22" font_color="0x3B2A1B" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]

[if exp="sf.core_bad_001 == true || sf.core_bad_002 == true"]
[glink target="*choice_04_c" text="「その前に、何個なら売れそうか調べよう」" color="green" x="320" y="453" width="640" height="146" size="18" font_color="0x3B2A1B" graphic="april_ui/v2/choices/choice_learned_normal.png" enterimg="april_ui/v2/choices/choice_learned_hover.png" name="april_choice april_learned"]
[endif]

[s]

*choice_04_a
[clearstack stack="if"]
[cm]
#
[iscript]
f.april_production_choice = "1000";
[endscript]

[if exp="sf.core_bad_001 == true"]
#
その結末は、もう知っている。
[r]
#
『1000個のエクレア』
[p]
[jump target="*choice_04_production"]
[endif]

[jump target="*bad_001_start"]

*choice_04_b
[clearstack stack="if"]
[cm]
#
[iscript]
f.april_production_choice = "10";
[endscript]

[if exp="sf.core_bad_002 == true"]
#
その結末は、もう知っている。
[r]
#
『慎重すぎて何も始まらない』
[p]
[jump target="*choice_04_production"]
[endif]

[jump target="*bad_002_start"]

*choice_04_c
[clearstack stack="if"]
[cm]
#
[iscript]
f.april_production_choice = "learned";
[endscript]
[jump target="*scene_04_07"]


*bad_001_start
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="1000"]
[bg storage="apr_kitchen_day.png"]
[clearstack stack="if"]
[cm]
#
; --------------------------------------------------
; CORE BAD 001
; TITLE: 1000個のエクレア
; UNLOCK: sf.core_bad_001
; RETRY: *choice_04_production
; --------------------------------------------------

; [BG] shop_kitchen_day

#主人公
「……じゃあ、1000個作ろう」
[p]

#抹茶エクレア
「え」
[p]

#主人公
「抹茶ちゃんが言ったんでしょ」
[p]

#抹茶エクレア
「いや、言うたけど」
[p]

#主人公
「一年しかないなら、最初から攻めるのもありかもしれない」
[p]

#抹茶エクレア
「お、おう！　分かっとるやん！」
[p]

#
その日のうちに材料を発注した。
[p]

#
翌日。
[p]

#
さらにその翌日。
[p]

#
厨房は、エクレアで埋まった。
[p]
[iscript]
sf.cg_april_mini_02 = true;
[endscript]
[chara_hide name="抹茶エクレア"]
[skipstop]
[image layer="1" name="april_sdcg_image" folder="bgimage" storage="cg/april/SD02_1000_Eclairs.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="april_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]

#抹茶エクレア
「……なあ」
[p]

#主人公
「なに？」
[p]

#抹茶エクレア
「1000個って、思てたより1000個やったな」
[p]
[free layer="1" name="april_sdcg_image" time="150" wait="false"]
[free layer="1" name="april_sdcg_frame" time="150"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90"]

#主人公
「当たり前だよ」
[p]

#
売れたのは、初日で二十数個。
[p]

#
二日目は、それより少なかった。
[p]

#抹茶エクレア
「まだ九百……」
[p]

#主人公
「数えないで」
[p]

#
冷蔵庫は埋まった。
[r]
材料費の請求書も届いた。
[p]

#抹茶エクレア
「半額にする？」
[p]

#主人公
「それでも九百個近いよ」
[p]

#抹茶エクレア
「配る？」
[p]

#主人公
「商売じゃなくなる」
[p]

#抹茶エクレア
「……」
[p]

#主人公
「……」
[p]

#抹茶エクレア
「世界一、遠いな」
[p]

#主人公
「その前に今月を越えられないかも」
[p]

[iscript]
f.april_bad = {kind: "CORE", id: "001", title: "1000個のエクレア", lesson: "大量生産する前に、売れる数を確認する必要がある。", retry: "*choice_04_production", storage: "n04_april.ks"};
[endscript]
[register_core_bad id="001"]
[call storage="system_common.ks" target="*show_core_bad"]
[xchgbgm storage="04_Matcha_Has_Arrived.mp3" time="1000"]
[jump target="*choice_04_production"]


*bad_002_start
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="1000"]
[bg storage="apr_kitchen_day.png"]
[clearstack stack="if"]
[cm]
#
; --------------------------------------------------
; CORE BAD 002
; TITLE: 慎重すぎて何も始まらない
; UNLOCK: sf.core_bad_002
; RETRY: *choice_04_production
; --------------------------------------------------

#主人公
「いや、10個だけにしよう」
[p]

#抹茶エクレア
「少なっ！」
[p]

#主人公
「売れ残ったら困るから」
[p]

#抹茶エクレア
「世界一やで？」
[p]

#主人公
「だからこそ、まず安全に」
[p]

#
初日。
[p]

#
十個、完売。
[p]

#抹茶エクレア
「売れた！」
[p]

#主人公
「よかった」
[p]

#
翌日も十個。
[p]

#
完売。
[p]

#
その翌日も十個。
[p]

#
完売。
[p]

#
一週間後。
[p]

#抹茶エクレア
「なあ」
[p]

#主人公
「なに？」
[p]

#抹茶エクレア
「ずっと十個なん？」
[p]

#主人公
「売れ残るのは怖いから」
[p]

#抹茶エクレア
「毎日売り切れとるやん」
[p]

#主人公
「でも明日は売れないかもしれない」
[p]

#
一か月後。
[p]

#
売上は、ほとんど変わっていなかった。
[p]
[iscript]
sf.cg_april_mini_03 = true;
[endscript]
[chara_hide name="抹茶エクレア"]
[skipstop]
[image layer="1" name="april_sdcg_image" folder="bgimage" storage="cg/april/SD03_Cautious_Standstill.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="april_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]

#
店も潰れていない。
[p]

#
借金も増えていない。
[p]
[free layer="1" name="april_sdcg_image" time="150" wait="false"]
[free layer="1" name="april_sdcg_frame" time="150"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90"]

#
ただ、何も進んでいない。
[p]

#抹茶エクレア
「これ、一年で世界一いける？」
[p]

#主人公
「……無理だね」
[p]

#抹茶エクレア
「言い切った！」
[p]

#主人公
「このペースなら3650個しか売れないから」
[p]

#抹茶エクレア
「急に具体的な絶望出すな！」
[p]

[iscript]
f.april_bad = {kind: "CORE", id: "002", title: "慎重すぎて何も始まらない", lesson: "失敗を避け続けても、期限には間に合わない。", retry: "*choice_04_production", storage: "n04_april.ks"};
[endscript]
[register_core_bad id="002"]
[call storage="system_common.ks" target="*show_core_bad"]
[xchgbgm storage="04_Matcha_Has_Arrived.mp3" time="1000"]
[jump target="*choice_04_production"]


*scene_04_07
[bg storage="apr_shop_day.png"]
[clearstack stack="if"]
[cm]
#
; --------------------------------------------------
; 4-07 店を知る
; --------------------------------------------------

[iscript]
f.scene = "04_07";
[endscript]

#主人公
「待って。そもそも今、この店で何個売れるんだ？」
[p]

#抹茶エクレア
「……知らん」
[p]

#主人公
「客数は？」
[p]

#抹茶エクレア
「知らん」
[p]

#主人公
「一番売れる時間帯」
[p]

#抹茶エクレア
「知らん」
[p]

#主人公
「僕もちゃんと把握してない」
[p]

#抹茶エクレア
「店主ぃ！」
[p]

#主人公
「半年前まで店主になる予定なかったんだよ……」
[p]

#
売上帳。
[r]
発注記録。
[r]
過去の予約表。
[p]

#
二人で片っ端から広げる。
[p]

#抹茶エクレア
「数字多いな」
[p]

#主人公
「経営ってだいたい数字多いよ」
[p]

#抹茶エクレア
「世界一ってもっとこう、キラキラした話ちゃうん？」
[p]

#主人公
「そのキラキラを支えるのが、この地味な数字なんじゃない？」
[p]

#抹茶エクレア
「夢ないなぁ」
[p]

#主人公
「店は夢だけだと家賃払えないから」
[p]

; ---- MINI BAD M01 optional choice ----
#抹茶エクレア
「でも調べるより先に、今ある材料で作れるだけ作ったらええんちゃう？」
[p]

*choice_04_m01
[clearstack stack="if"]
[cm]
#
[glink target="*mini_bad_m01" text="「在庫確認はあとでいい。先に仕込もう」" color="green" x="320" y="240" width="640" height="135" size="22" font_color="0x3B2A1B" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink target="*scene_04_07_continue" text="「先に在庫と発注量を確認しよう」" color="green" x="320" y="395" width="640" height="135" size="22" font_color="0x3B2A1B" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]


*mini_bad_m01
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="1000"]
[clearstack stack="if"]
[cm]
#
[if exp="sf.mini_bad_m01 == true"]
#
#
その結末は、もう知っている。
[p]
[jump target="*choice_04_m01"]
[endif]
#主人公
「じゃあ、とりあえず仕込もう」
[p]

#
十分後。
[p]

#主人公
「小麦粉がない」
[p]

#抹茶エクレア
「……買いに行こか」
[p]

#主人公
「生クリームも少ない」
[p]

#抹茶エクレア
「……」
[p]

#主人公
「抹茶も」
[p]

#抹茶エクレア
「それはあかん！」
[p]

[iscript]
f.april_bad = {kind: "MINI", id: "m01", title: "材料がありません", lesson: "まずは在庫を確認してからや。", retry: "*choice_04_m01", storage: "n04_april.ks"};
[endscript]
[register_mini_bad id="m01"]
[call storage="system_common.ks" target="*show_mini_bad"]
[xchgbgm storage="04_Matcha_Has_Arrived.mp3" time="1000"]
[jump target="*choice_04_m01"]

*scene_04_07_continue
[chara_new name="三好文子" jname="三好文子" storage="apr_fumiko.png" width="420" height="630"]
[chara_show name="三好文子" left="75" top="115"]
[clearstack stack="if"]
[cm]
#

#
昼前。
[p]

#
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
店の扉が開く。
[p]

#三好文子
「おはようさん」
[p]

#主人公
「いらっしゃいませ、文子さん」
[p]

#三好文子
「あら？」
[p]

#
文子さんの視線が、抹茶エクレアへ向く。
[p]

#三好文子
「新しい子？」
[p]

#抹茶エクレア
「まあ、そんな感じや！」
[p]

#主人公
「説明を諦めたね」
[p]

#三好文子
「元気な子やなあ」
[p]

#抹茶エクレア
「抹茶エクレアや！」
[p]

#三好文子
「あら、ちょうど甘いもん買いに来たんよ」
[p]

#主人公
「名前です」
[p]

#三好文子
「……名前？」
[p]

#抹茶エクレア
「名前や！」
[p]

#
文子さんは数秒考えた。
[p]

#三好文子
「今どきやなあ」
[p]

#主人公
「受け入れるんだ……」
[p]

#
文子さんはいつもの焼き菓子を買って帰っていった。
[p]
[chara_hide name="三好文子"]

#抹茶エクレア
「常連？」
[p]

#主人公
「両親の頃から」
[p]

#抹茶エクレア
「ほな、ああいう人が何人おるか調べよ」
[p]

#主人公
「うん。それなら、作る数も考えられる」
[p]

#
二人で売上帳に戻る。
[p]

#
初めて、数字が少しだけ意味のあるものに見えた。
[p]


*scene_04_08
[chara_hide name="三好文子"]
[bg storage="apr_kitchen_day.png"]
[clearstack stack="if"]
[cm]
#
; --------------------------------------------------
; 4-08 最初の試作
; --------------------------------------------------

[iscript]
f.scene = "04_08";
[endscript]

; [BG] shop_kitchen_day
; [BGM] trial_and_error

#抹茶エクレア
「ほな作ろ！」
[p]

#主人公
「抹茶エクレアを？」
[p]

#抹茶エクレア
「それ以外何作んねん」
[p]

#主人公
「普通のエクレアとか」
[p]

#抹茶エクレア
「世界一への寄り道や！」
[p]

#
まずは、今の店で無理なく作れる配合から。
[p]

#
シュー生地。
[r]
クリーム。
[r]
抹茶。
[p]

#抹茶エクレア
「もっと抹茶！」
[p]

#主人公
「苦くなるよ」
[p]

#抹茶エクレア
「もっと！」
[p]

#主人公
「苦くなる」
[p]

#抹茶エクレア
「抹茶は濃ければ濃いほど偉いんや！」
[p]

#主人公
「そんな宗教みたいなルールないよ」
[p]

; ---- MINI BAD M02 ----
*choice_04_m02
[clearstack stack="if"]
[cm]
#
[cm]
[glink target="*mini_bad_m02" text="「じゃあ限界まで濃くしてみる」" color="green" x="320" y="240" width="640" height="135" size="22" font_color="0x3B2A1B" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink target="*scene_04_08_continue" text="「ちゃんと食べられる濃さにする」" color="green" x="320" y="395" width="640" height="135" size="22" font_color="0x3B2A1B" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]


*mini_bad_m02
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="1000"]
[clearstack stack="if"]
[cm]
#
[if exp="sf.mini_bad_m02 == true"]
#
#
その結末は、もう知っている。
[p]
[jump target="*choice_04_m02"]
[endif]

#
抹茶を増やした。
[p]

#
さらに増やした。
[p]

#
もう少し増やした。
[p]

#
完成。
[p]

#抹茶エクレア
「見た目は強そうやな」
[p]

#主人公
「食べてみて」
[p]

#抹茶エクレア
「いただきます」
[p]

#
一口。
[p]

#抹茶エクレア
「…………」
[p]

#主人公
「どう？」
[p]

#抹茶エクレア
「口ん中、茶畑」
[p]

#主人公
「世界一？」
[p]

#抹茶エクレア
「世界一しんどい」
[p]

[iscript]
f.april_bad = {kind: "MINI", id: "m02", title: "抹茶100％", lesson: "抹茶好きでも、入れすぎたらあかん。", retry: "*choice_04_m02", storage: "n04_april.ks"};
[endscript]
[register_mini_bad id="m02"]
[call storage="system_common.ks" target="*show_mini_bad"]
[xchgbgm storage="04_Matcha_Has_Arrived.mp3" time="1000"]
[jump target="*choice_04_m02"]

*scene_04_08_continue
[clearstack stack="if"]
[cm]
#

#
何度か調整して、ようやく一つの形になる。
[p]

#主人公
「……これなら」
[p]

#抹茶エクレア
「うん」
[p]

#
二人で同時に一口。
[p]

#抹茶エクレア
「……」
[p]

#主人公
「……」
[p]

#抹茶エクレア
「悪ない」
[p]

#主人公
「その言い方、かなり気に入ってる？」
[p]

#抹茶エクレア
「まあまあや」
[p]

#主人公
「顔が笑ってるよ」
[p]

#抹茶エクレア
「笑ってへん！」
[p]

#主人公
「じゃあ、これを最初の商品にしよう」
[p]

#抹茶エクレア
「最初？」
[p]

#主人公
「世界一まで、ずっと同じ味じゃないでしょ」
[p]

#抹茶エクレア
「……それもそうやな」
[p]

#
一個目のレシピを、ノートに書き残した。
[p]


*scene_04_09
[bg storage="apr_shop_day.png"]
[clearstack stack="if"]
[cm]
#
; --------------------------------------------------
; 4-09 初日販売
; --------------------------------------------------

[iscript]
f.scene = "04_09";
[endscript]

; [BG] shop_floor_day

#
調べた数字から、最初の販売数を決めた。
[p]

#
多すぎず。
[r]
少なすぎず。
[p]

#
抹茶エクレアをショーケースに並べる。
[p]

#抹茶エクレア
「……地味やな」
[p]

#主人公
「商品？」
[p]

#抹茶エクレア
「始まり方が」
[p]

#主人公
「いきなり世界大会とか期待してた？」
[p]

#抹茶エクレア
「ちょっと」
[p]

#主人公
「この店、そんな権力ないよ」
[p]

; ---- MINI BAD M03 ----
#抹茶エクレア
「ところで、今日何時まで店開けるん？」
[p]

*choice_04_m03
[clearstack stack="if"]
[cm]
#
[glink target="*mini_bad_m03" text="「客が来なくなるまで適当に」" color="green" x="320" y="240" width="640" height="135" size="22" font_color="0x3B2A1B" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink target="*scene_04_09_continue" text="「いつもの営業時間でいこう」" color="green" x="320" y="395" width="640" height="135" size="22" font_color="0x3B2A1B" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]


*mini_bad_m03
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="1000"]
[clearstack stack="if"]
[cm]
#
[if exp="sf.mini_bad_m03 == true"]
#
#
その結末は、もう知っている。
[p]
[jump target="*choice_04_m03"]
[endif]

#主人公
「客が来なくなるまで適当に」
[p]

#抹茶エクレア
「ほーん」
[p]

#
数時間後。
[p]

#
客が来た。
[p]

#客
「昨日、夕方に来たら閉まってたんですけど……今日は何時までですか？」
[p]

#主人公
「……」
[p]

#抹茶エクレア
「……」
[p]

#客
「？」
[p]

#主人公
「営業時間、決めます」
[p]

[iscript]
f.april_bad = {kind: "MINI", id: "m03", title: "営業時間、未定", lesson: "営業時間くらい決めとこ。", retry: "*choice_04_m03", storage: "n04_april.ks"};
[endscript]
[register_mini_bad id="m03"]
[call storage="system_common.ks" target="*show_mini_bad"]
[xchgbgm storage="04_Matcha_Has_Arrived.mp3" time="1000"]
[jump target="*choice_04_m03"]

*scene_04_09_continue
[clearstack stack="if"]
[cm]
#

#
午前中。
[r]
一個。
[p]

#
昼前に二個。
[p]

#
午後に三個。
[p]

#
派手には売れない。
[p]

#
でも、少しずつ減っていく。
[p]

#
夕方。
[p]
[playse storage="se_shop_door_chime.wav" volume="65" loop="false"]
[chara_show name="三好文子" left="75" top="115"]

#三好文子
「これが例の子の？」
[p]

#抹茶エクレア
「例の子ってウチか！」
[p]

#三好文子
「ほな一個もらおかな」
[p]

#主人公
「ありがとうございます」
[p]

#
文子さんが一口食べる。
[p]

#三好文子
「うん。ええやん」
[p]

#抹茶エクレア
「ほんま！？」
[p]

#三好文子
「抹茶しっかりしてるけど、食べやすいわ」
[p]

#抹茶エクレア
「ほら！　ウチの抹茶や！」
[p]

#主人公
「作ったのはほぼこっちだけど」
[p]

#抹茶エクレア
「精神的監修！」
[p]

#主人公
「便利な役職だね」
[p]

[chara_hide name="三好文子"]
#
閉店前。
[p]

#
最後の一個が売れた。
[p]

#
ショーケースが空になる。
[p]

#主人公
「……売れたね」
[p]

#抹茶エクレア
「売れたな」
[p]

#主人公
「少しだけど」
[p]

#抹茶エクレア
「ゼロちゃうやろ」
[p]

#
その一言が、不思議と残った。
[p]


*scene_04_10
[bg storage="apr_shop_night.png"]
[chara_mod name="抹茶エクレア" face="quiet"]
[clearstack stack="if"]
[cm]
#
; --------------------------------------------------
; 4-10 この店で、やってみよう
; IMPORTANT CG 4-A
; --------------------------------------------------

[iscript]
f.scene = "04_10";
[endscript]

; [BG] shop_floor_night
; [CG] cg_04_a_try_in_this_shop
; [BGM] after_closing

#
閉店後。
[p]

#
売り物にしなかった試作品を一つ、二人で分けた。
[p]

#抹茶エクレア
「ウチ、いける気ぃしてきたわ」
[p]

#主人公
「一日で？」
[p]

#抹茶エクレア
「一日で十分や。ゼロやないって分かったし」
[p]

#主人公
「世界一までは、かなりあるよ」
[p]

#抹茶エクレア
「そらそうやろ。世界一やもん」
[p]

#
店内を見る。
[p]

#
昔から変わらないテーブル。
[r]
両親が選んだ照明。
[r]
何度も修理したショーケース。
[p]

#
今朝までは、ただ残っている場所だった。
[p]

#主人公
「……じゃあ、やってみようか」
[p]

#抹茶エクレア
「何を？」
[p]

#主人公
「抹茶エクレアを世界一にする」
[p]

#
抹茶エクレアが目を丸くする。
[p]

#
それから、笑った。
[p]

#抹茶エクレア
「おっそ！」
[p]

#主人公
「決心には時間がかかるタイプなんだよ」
[p]

#抹茶エクレア
「一年しかない言うたやろ！」
[p]

#主人公
「だから今日決めた」
[p]

#抹茶エクレア
「……まあ、ええわ」
[p]

[chara_mod name="抹茶エクレア" face="energy"]
#
抹茶エクレアが手を差し出す。
[p]

#抹茶エクレア
「ほな改めて。世界一まで、よろしくな」
[p]

#
一瞬だけ迷って、その手を取る。
[p]

#主人公
「よろしく」
[p]

#
握手は、ほんの数秒。
[p]

#
でも、その日から店は二人になった。
[p]


*scene_04_11
[bg storage="apr_kitchen_night.png"]
[chara_mod name="抹茶エクレア" face="default"]
[clearstack stack="if"]
[cm]
#
; --------------------------------------------------
; 4-11 ここ、落ち着くな
; --------------------------------------------------

[iscript]
f.scene = "04_11";
[endscript]

; [BG] shop_kitchen_night

#
片付けが終わった頃には、外はすっかり暗くなっていた。
[p]

#
抹茶エクレアは厨房の隅で、使ったボウルを眺めている。
[p]

#主人公
「何してるの？」
[p]

#抹茶エクレア
「別に」
[p]

#主人公
「疲れた？」
[p]

#抹茶エクレア
「ちょっとな」
[p]

#
沈黙。
[p]

#抹茶エクレア
「ここ、なんか落ち着くな」
[p]

#主人公
「古いから？」
[p]

#抹茶エクレア
「そういう意味ちゃうわ」
[p]

#主人公
「じゃあ、どういう意味？」
[p]

#抹茶エクレア
「……知らん」
[p]

#主人公
「適当だね」
[p]

#抹茶エクレア
「知らんもんは知らん」
[p]

#
抹茶エクレアは欠伸を一つ。
[p]

#抹茶エクレア
「明日、何個作る？」
[p]

#主人公
「今日の数字を見てから決めよう」
[p]

#抹茶エクレア
「地味」
[p]

#主人公
「大事」
[p]

#抹茶エクレア
「はいはい」
[p]

#
明日も店を開ける。
[p]

#
今までと同じことなのに。
[p]

#
少しだけ、意味が違って見えた。
[p]

; --------------------------------------------------
; CHAPTER CLEAR
; --------------------------------------------------

[iscript]
sf.normal_ch04_clear = true;
f.chapter = "04";
f.scene = "clear";
[endscript]

; [CHAPTER TITLE]
; 4月「異世界人、厨房に落ちる」 CLEAR

; Prototype:
; 5月未実装時はタイトル/開発中画面へ戻す。
[jump storage="system_common.ks" target="*april_clear"]

