; ==================================================
; PROLOGUE
; TITLE: 口約束
; Route: NORMAL / first play
; NOTE:
;   ・女神は「帰してあげます」とだけ言う。
;   ・「必ず帰る」「帰らなければならない」は絶対に言わせない。
;   ・画像/BGM/SE指定はコメントのみ。素材確定後にCodex側で接続する。
; ==================================================

*start
[xchgbgm storage="03_A_Goddess_Forgot_to_Explain.mp3" time="1000"]
[cm]
[tb_show_message_window]
[bg storage="bg_goddess_realm.png" time="200"]
; [BG] goddess_realm
; TODO: 正式素材待ち
; [BGM] goddess_theme
[layopt layer="message0" visible="true"]
[chara_config pos_mode="false"]
[chara_new name="抹茶エクレア" jname="抹茶エクレア" storage="apr_matcha_normal.png" width="440" height="660"]
[chara_face name="抹茶エクレア" face="energy" storage="apr_matcha_energy.png"]
[chara_face name="抹茶エクレア" face="quiet" storage="apr_matcha_quiet.png"]
[chara_new name="女神" jname="女神" storage="apr_goddess.png" width="495" height="660"]
[button name="april_quick_log" role="backlog" graphic="april_ui/quick_log_normal.png" enterimg="april_ui/quick_log_hover.png" x="565" y="12" width="110" height="48"]
[button name="april_quick_auto" role="auto" graphic="april_ui/quick_auto_normal.png" enterimg="april_ui/quick_auto_hover.png" x="682" y="12" width="110" height="48"]
[button name="april_quick_save" role="save" graphic="april_ui/v3/quick_menu/quick_save_normal.png" enterimg="april_ui/v3/quick_menu/quick_save_hover.png" x="799" y="12" width="110" height="48"]
[button name="april_quick_load" role="load" graphic="april_ui/v3/quick_menu/quick_load_normal.png" enterimg="april_ui/v3/quick_menu/quick_load_hover.png" x="916" y="12" width="110" height="48"]
[button name="april_quick_skip" role="skip" graphic="april_ui/quick_skip_normal.png" enterimg="april_ui/quick_skip_hover.png" x="1033" y="12" width="110" height="48"]
[button name="april_quick_config" role="sleepgame" storage="config.ks" graphic="april_ui/quick_config_normal.png" enterimg="april_ui/quick_config_hover.png" x="1150" y="12" width="110" height="48"]
[chara_show name="抹茶エクレア" face="default" left="745" top="95"]
[chara_show name="女神" left="45" top="95"]

#女神
「……ですから、もう十分いただきましたよ？」
[p]

#抹茶エクレア
「まだや！　今のんは普通の抹茶エクレアやろ？」
[p]

#女神
「普通……だったのですか？」
[p]

[chara_mod name="抹茶エクレア" face="energy"]
#抹茶エクレア
「次が本命や。抹茶増量、クリーム改良版！」
[p]

#女神
「先ほども“本命”とおっしゃっていたような……」
[p]

#抹茶エクレア
「細かいこと気にしたらあかん！」
[p]

#女神
「……」
[p]

#抹茶エクレア
「ほら、食べてみ？　世界一うまいで！」
[p]

#女神
「世界一、ですか」
[p]

#抹茶エクレア
「せや！」
[p]

#
少しだけ、女神は考え込んだ。
[p]

#女神
「そこまで世界一のお菓子だとおっしゃるのでしたら……」
[p]

#抹茶エクレア
「ん？」
[p]

#女神
「一年以内に、本当に世界一のお菓子にしてみてはいかがですか？」
[p]

[chara_move name="抹茶エクレア" left="550" top="95" width="440" height="660" time="250"]
[chara_mod name="抹茶エクレア" face="quiet"]
[iscript]
sf.cg_april_event_02 = true;
[endscript]
[chara_hide name="女神"]
[chara_hide name="抹茶エクレア"]
[skipstop]
[bg storage="cg/april/CG02_The_Goddess_Condition.png" time="600"]
#抹茶エクレア
「……は？」
[p]

#女神
「抹茶エクレアを、世界一に」
[p]

#抹茶エクレア
「…………」
[p]

#女神
「難しいでしょうか？」
[p]

#抹茶エクレア
「望むところや！」
[p]
[bg storage="bg_goddess_realm.png" time="500"]
[chara_mod name="抹茶エクレア" face="energy"]
[chara_show name="抹茶エクレア" left="550" top="95"]
[chara_show name="女神" left="45" top="95"]

#
勢いよく返事をしたあとで、抹茶エクレアは一瞬だけ首を傾げる。
[p]

#抹茶エクレア
「……で、どこで？」
[p]

#女神
「ちょうどよい世界があります」
[p]

#抹茶エクレア
「ちょうどよい世界ってなんやねん」
[p]

#女神
「達成できましたら、元の世界へ帰してあげます」
[p]

#抹茶エクレア
「ほんまやな？」
[p]

#女神
「ええ。お約束します」
[p]

#抹茶エクレア
「ほな決まりや！」
[p]

#女神
「はい。では、いってらっしゃいませ」
[p]

#抹茶エクレア
「おう！」
[p]

#
一拍。
[p]

#抹茶エクレア
「……ん？」
[p]

#
足元に光が広がった。
[p]

#抹茶エクレア
「ちょ、待って」
[p]

#女神
「はい？」
[p]

#抹茶エクレア
「今すぐ！？」
[p]

#女神
「今すぐです」
[p]

#抹茶エクレア
「荷造りくらいさせぇぇぇぇぇ――！」
[p]

; [SE] teleport

#
画面が白く染まる。
[p]

[iscript]
f.route = "normal";
f.chapter = "04";
f.scene = "04_01";
[endscript]

[jump storage="n04_april.ks" target="*scene_04_01"]
