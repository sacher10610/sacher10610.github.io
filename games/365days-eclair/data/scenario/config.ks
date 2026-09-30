;=========================================
; コンフィグ モード　画面作成
;=========================================

;	メッセージレイヤ0を不可視に
	[layopt layer="message0" visible="false"]

;	fixボタンをクリア
	[clearfix]

;	キーコンフィグの無効化
	[stop_keyconfig]

;	レイヤーモードの解放
	[free_layermode time="100" wait="true"]

;	カメラのリセット
	[reset_camera time="100" wait="true"]
	
;	前景レイヤの中身をすべて空に
	[iscript]
	$(".layer_camera").empty();
	$("#bgmovie").remove();
	
	[endscript]

;	メニューボタン非表示
	[hidemenubutton]

	[iscript]

	TG.config.autoRecordLabel = "true"; // ラベル通過記録を有効に

	tf.current_bgm_vol = parseInt(TG.config.defaultBgmVolume); // BGM音量
	tf.current_se_vol = parseInt(TG.config.defaultSeVolume); // SE音量
	
	tf.current_ch_speed = parseInt(TG.config.chSpeed); // テキスト表示速度
	tf.current_auto_speed = parseInt(TG.config.autoSpeed); // オート時のテキスト表示速度
	
	tf.text_skip ="ON"; // 未読スキップ
	if(TG.config.unReadTextSkip != "true"){
		tf.text_skip ="OFF";
	}

	[endscript]

	[iscript]

	/* 画像類のパス */
	tf.img_path = '../image/config/';

	/* 同梱UI画像 */
	tf.btn_path_off = tf.img_path + 'config_step_off_trim.png';
	tf.btn_path_on = tf.img_path + 'config_step_on_trim.png';
	tf.toggle_path_off = tf.img_path + 'config_toggle_off.png';
	tf.toggle_path_on = tf.img_path + 'config_toggle_on.png';
    tf.btn_runtime_off = "./data/image/config/config_step_off_trim.png";
    tf.btn_runtime_on = "./data/image/config/config_step_on_trim.png";
    tf.toggle_runtime_off = "./data/image/config/config_toggle_off.png";
    tf.toggle_runtime_on = "./data/image/config/config_toggle_on.png";

	// ボタン画像の表示サイズと配置
	tf.btn_w = 42;
	tf.btn_h = 42;
	tf.config_x = [560, 500, 550, 600, 650, 700, 750, 800, 850, 900, 950];

	tf.config_y_bgm = 206;
	tf.config_y_se = 286;
	tf.config_y_ch = 366;
	tf.config_y_auto = 446;

	// ミュート解除時に戻す直前の音量
	tf.last_bgm_vol = tf.current_bgm_vol > 0 ? tf.current_bgm_vol : 50;
	tf.last_se_vol = tf.current_se_vol > 0 ? tf.current_se_vol : 50;

	// 既存の設定処理で使う選択番号
	tf.config_num_bgm;
	tf.config_num_se;
	tf.config_num_ch;
	tf.config_num_auto;

	// テキスト速度のサンプル
	tf.text_sample = 'テストメッセージです。このスピードでテキストが表示されます。';
	tf.text_sample_speed;
	tf.img_unread_skip;

	[endscript]

[cm]

;	コンフィグ用の背景を読み込んでトランジション
	[bg storage="&tf.img_path +'config_bg_new.png'" time="100"]

;	画面右上の「Back」ボタン
    [button name="config_ui_back" fix="true" graphic="&tf.img_path + 'back_white.png'" enterimg="&tf.img_path + 'back_white.png'" target="*backtitle" width="150" height="150" x="1120" y="0"]

[jump target="*config_page"]


*config_page
;------------------------------------------------------------------------------------------------------
; BGM音量
;------------------------------------------------------------------------------------------------------
	[button name="bgmvol,bgmvol_10"  fix="true" target="*vol_bgm_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[1]"  y="&tf.config_y_bgm" exp="tf.current_bgm_vol = 10; tf.last_bgm_vol = 10; tf.config_num_bgm = 1"]
	[button name="bgmvol,bgmvol_20"  fix="true" target="*vol_bgm_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[2]"  y="&tf.config_y_bgm" exp="tf.current_bgm_vol = 20; tf.last_bgm_vol = 20; tf.config_num_bgm = 2"]
	[button name="bgmvol,bgmvol_30"  fix="true" target="*vol_bgm_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[3]"  y="&tf.config_y_bgm" exp="tf.current_bgm_vol = 30; tf.last_bgm_vol = 30; tf.config_num_bgm = 3"]
	[button name="bgmvol,bgmvol_40"  fix="true" target="*vol_bgm_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[4]"  y="&tf.config_y_bgm" exp="tf.current_bgm_vol = 40; tf.last_bgm_vol = 40; tf.config_num_bgm = 4"]
	[button name="bgmvol,bgmvol_50"  fix="true" target="*vol_bgm_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[5]"  y="&tf.config_y_bgm" exp="tf.current_bgm_vol = 50; tf.last_bgm_vol = 50; tf.config_num_bgm = 5"]
	[button name="bgmvol,bgmvol_60"  fix="true" target="*vol_bgm_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[6]"  y="&tf.config_y_bgm" exp="tf.current_bgm_vol = 60; tf.last_bgm_vol = 60; tf.config_num_bgm = 6"]
	[button name="bgmvol,bgmvol_70"  fix="true" target="*vol_bgm_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[7]"  y="&tf.config_y_bgm" exp="tf.current_bgm_vol = 70; tf.last_bgm_vol = 70; tf.config_num_bgm = 7"]
	[button name="bgmvol,bgmvol_80"  fix="true" target="*vol_bgm_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[8]"  y="&tf.config_y_bgm" exp="tf.current_bgm_vol = 80; tf.last_bgm_vol = 80; tf.config_num_bgm = 8"]
	[button name="bgmvol,bgmvol_90"  fix="true" target="*vol_bgm_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[9]"  y="&tf.config_y_bgm" exp="tf.current_bgm_vol = 90; tf.last_bgm_vol = 90; tf.config_num_bgm = 9"]
	[button name="bgmvol,bgmvol_100" fix="true" target="*vol_bgm_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[10]" y="&tf.config_y_bgm" exp="tf.current_bgm_vol = 100; tf.last_bgm_vol = 100; tf.config_num_bgm = 10"]

;	BGMミュート
    [button name="bgmvol,bgmvol_0" fix="true" target="*vol_bgm_change" graphic="&tf.toggle_path_off" width="138" height="69" x="560" y="535" exp="tf.current_bgm_vol = tf.current_bgm_vol > 0 ? 0 : tf.last_bgm_vol; tf.config_num_bgm = tf.current_bgm_vol == 0 ? 0 : Math.round(tf.current_bgm_vol / 10)"]

;------------------------------------------------------------------------------------------------------
; SE音量
;------------------------------------------------------------------------------------------------------
	[button name="sevol,sevol_10"  fix="true" target="*vol_se_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[1]"  y="&tf.config_y_se" exp="tf.current_se_vol = 10; tf.last_se_vol = 10; tf.config_num_se = 1"]
	[button name="sevol,sevol_20"  fix="true" target="*vol_se_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[2]"  y="&tf.config_y_se" exp="tf.current_se_vol = 20; tf.last_se_vol = 20; tf.config_num_se = 2"]
	[button name="sevol,sevol_30"  fix="true" target="*vol_se_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[3]"  y="&tf.config_y_se" exp="tf.current_se_vol = 30; tf.last_se_vol = 30; tf.config_num_se = 3"]
	[button name="sevol,sevol_40"  fix="true" target="*vol_se_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[4]"  y="&tf.config_y_se" exp="tf.current_se_vol = 40; tf.last_se_vol = 40; tf.config_num_se = 4"]
	[button name="sevol,sevol_50"  fix="true" target="*vol_se_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[5]"  y="&tf.config_y_se" exp="tf.current_se_vol = 50; tf.last_se_vol = 50; tf.config_num_se = 5"]
	[button name="sevol,sevol_60"  fix="true" target="*vol_se_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[6]"  y="&tf.config_y_se" exp="tf.current_se_vol = 60; tf.last_se_vol = 60; tf.config_num_se = 6"]
	[button name="sevol,sevol_70"  fix="true" target="*vol_se_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[7]"  y="&tf.config_y_se" exp="tf.current_se_vol = 70; tf.last_se_vol = 70; tf.config_num_se = 7"]
	[button name="sevol,sevol_80"  fix="true" target="*vol_se_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[8]"  y="&tf.config_y_se" exp="tf.current_se_vol = 80; tf.last_se_vol = 80; tf.config_num_se = 8"]
	[button name="sevol,sevol_90"  fix="true" target="*vol_se_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[9]"  y="&tf.config_y_se" exp="tf.current_se_vol = 90; tf.last_se_vol = 90; tf.config_num_se = 9"]
	[button name="sevol,sevol_100" fix="true" target="*vol_se_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[10]" y="&tf.config_y_se" exp="tf.current_se_vol = 100; tf.last_se_vol = 100; tf.config_num_se = 10"]

;	SEミュート
    [button name="sevol,sevol_0" fix="true" target="*vol_se_change" graphic="&tf.toggle_path_off" width="138" height="69" x="920" y="535" exp="tf.current_se_vol = tf.current_se_vol > 0 ? 0 : tf.last_se_vol; tf.config_num_se = tf.current_se_vol == 0 ? 0 : Math.round(tf.current_se_vol / 10)"]

;------------------------------------------------------------------------------------------------------
; テキスト速度
;------------------------------------------------------------------------------------------------------
	[button name="ch,ch_100" fix="true" target="*ch_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[1]"  y="&tf.config_y_ch" exp="tf.set_ch_speed =100; tf.config_num_ch = 0"]
	[button name="ch,ch_80"  fix="true" target="*ch_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[2]"  y="&tf.config_y_ch" exp="tf.set_ch_speed = 80; tf.config_num_ch = 1"]
	[button name="ch,ch_50"  fix="true" target="*ch_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[3]"  y="&tf.config_y_ch" exp="tf.set_ch_speed = 50; tf.config_num_ch = 2"]
	[button name="ch,ch_40"  fix="true" target="*ch_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[4]"  y="&tf.config_y_ch" exp="tf.set_ch_speed = 40; tf.config_num_ch = 3"]
	[button name="ch,ch_30"  fix="true" target="*ch_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[5]"  y="&tf.config_y_ch" exp="tf.set_ch_speed = 30; tf.config_num_ch = 4"]
	[button name="ch,ch_25"  fix="true" target="*ch_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[6]"  y="&tf.config_y_ch" exp="tf.set_ch_speed = 25; tf.config_num_ch = 5"]
	[button name="ch,ch_20"  fix="true" target="*ch_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[7]"  y="&tf.config_y_ch" exp="tf.set_ch_speed = 20; tf.config_num_ch = 6"]
	[button name="ch,ch_11"  fix="true" target="*ch_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[8]"  y="&tf.config_y_ch" exp="tf.set_ch_speed = 11; tf.config_num_ch = 7"]
	[button name="ch,ch_8"   fix="true" target="*ch_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[9]"  y="&tf.config_y_ch" exp="tf.set_ch_speed =  8; tf.config_num_ch = 8"]
	[button name="ch,ch_5"   fix="true" target="*ch_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[10]" y="&tf.config_y_ch" exp="tf.set_ch_speed =  5; tf.config_num_ch = 9"]

;------------------------------------------------------------------------------------------------------
; オート速度
;------------------------------------------------------------------------------------------------------
	[button name="auto,auto_5000" fix="true" target="*auto_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[1]"  y="&tf.config_y_auto" exp="tf.set_auto_speed = 5000; tf.config_num_auto = 0"]
	[button name="auto,auto_4500" fix="true" target="*auto_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[2]"  y="&tf.config_y_auto" exp="tf.set_auto_speed = 4500; tf.config_num_auto = 1"]
	[button name="auto,auto_4000" fix="true" target="*auto_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[3]"  y="&tf.config_y_auto" exp="tf.set_auto_speed = 4000; tf.config_num_auto = 2"]
	[button name="auto,auto_3500" fix="true" target="*auto_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[4]"  y="&tf.config_y_auto" exp="tf.set_auto_speed = 3500; tf.config_num_auto = 3"]
	[button name="auto,auto_3000" fix="true" target="*auto_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[5]"  y="&tf.config_y_auto" exp="tf.set_auto_speed = 3000; tf.config_num_auto = 4"]
	[button name="auto,auto_2500" fix="true" target="*auto_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[6]"  y="&tf.config_y_auto" exp="tf.set_auto_speed = 2500; tf.config_num_auto = 5"]
	[button name="auto,auto_2000" fix="true" target="*auto_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[7]"  y="&tf.config_y_auto" exp="tf.set_auto_speed = 2000; tf.config_num_auto = 6"]
	[button name="auto,auto_1300" fix="true" target="*auto_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[8]"  y="&tf.config_y_auto" exp="tf.set_auto_speed = 1300; tf.config_num_auto = 7"]
	[button name="auto,auto_800"  fix="true" target="*auto_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[9]"  y="&tf.config_y_auto" exp="tf.set_auto_speed =  800; tf.config_num_auto = 8"]
	[button name="auto,auto_500"  fix="true" target="*auto_speed_change" graphic="&tf.btn_path_off" width="&tf.btn_w" height="&tf.btn_h" x="&tf.config_x[10]" y="&tf.config_y_auto" exp="tf.set_auto_speed =  500; tf.config_num_auto = 9"]

;------------------------------------------------------------------------------------------------------
; 未読スキップ
;------------------------------------------------------------------------------------------------------

;	未読スキップ-OFF
    [button name="unread_off" fix="true" target="*skip_off" graphic="&tf.toggle_path_off" width="112" height="56" x="150" y="540"]

;	未読スキップ-ON
    [button name="unread_on" fix="true" target="*skip_on" graphic="&tf.toggle_path_off" width="112" height="56" x="275" y="540"]

;------------------------------------------------------------------------------------------------------
; Fullscreen toggle
    [button name="config_ui_fullscreen" role="fullscreen" fix="true" hint="全画面表示とウィンドウ表示を切り替えます" graphic="&tf.img_path + 'fullscreen_toggle_normal.svg'" enterimg="&tf.img_path + 'fullscreen_toggle_hover.svg'" width="400" height="58" x="440" y="606"]

; コンフィグ起動時の画面更新
;------------------------------------------------------------------------------------------------------

	[iscript]
	$(".bgmvol").attr("src",tf.btn_runtime_off);
	$(".sevol").attr("src",tf.btn_runtime_off);
	$(".ch").attr("src",tf.btn_runtime_off);
	$(".auto").attr("src",tf.btn_runtime_off);
	if(tf.current_bgm_vol > 0){ $(".bgmvol_"+tf.current_bgm_vol).attr("src",tf.btn_runtime_on); }
	if(tf.current_se_vol > 0){ $(".sevol_"+tf.current_se_vol).attr("src",tf.btn_runtime_on); }
	$(".bgmvol_0").attr("src",tf.current_bgm_vol == 0 ? tf.toggle_runtime_off : tf.toggle_runtime_on);
	$(".sevol_0").attr("src",tf.current_se_vol == 0 ? tf.toggle_runtime_off : tf.toggle_runtime_on);
	$(".ch_"+tf.current_ch_speed).attr("src",tf.btn_runtime_on);
	$(".auto_"+tf.current_auto_speed).attr("src",tf.btn_runtime_on);
	if(tf.text_skip == 'OFF'){
		$(".unread_off").attr("src",tf.toggle_runtime_on);
		$(".unread_on").attr("src",tf.toggle_runtime_off);
	}else{
		$(".unread_off").attr("src",tf.toggle_runtime_off);
		$(".unread_on").attr("src",tf.toggle_runtime_on);
	}
	[endscript]

	[layopt layer="0" visible="true"]
	[ptext name="config_ui_text" layer="0" x="145" y="210" width="270" text="BGM Volume" size="25" color="0x2F3B2D" bold="true"]
	[ptext name="config_ui_text" layer="0" x="145" y="290" width="270" text="SE Volume" size="25" color="0x2F3B2D" bold="true"]
	[ptext name="config_ui_text" layer="0" x="145" y="370" width="270" text="Text Speed" size="25" color="0x2F3B2D" bold="true"]
	[ptext name="config_ui_text" layer="0" x="145" y="450" width="300" text="Auto Text Speed" size="25" color="0x2F3B2D" bold="true"]
	[ptext name="config_ui_text" layer="0" x="140" y="507" width="320" text="Unread Text Skip" size="22" color="0x2F3B2D" bold="true"]
	[ptext name="config_ui_text" layer="0" x="505" y="507" width="220" text="BGM Mute" size="22" color="0x2F3B2D" bold="true"]
	[ptext name="config_ui_text" layer="0" x="865" y="507" width="220" text="SE Mute" size="22" color="0x2F3B2D" bold="true"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[1]" y="250" width="42" align="center" text="10" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[2]" y="250" width="42" align="center" text="20" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[3]" y="250" width="42" align="center" text="30" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[4]" y="250" width="42" align="center" text="40" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[5]" y="250" width="42" align="center" text="50" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[6]" y="250" width="42" align="center" text="60" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[7]" y="250" width="42" align="center" text="70" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[8]" y="250" width="42" align="center" text="80" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[9]" y="250" width="42" align="center" text="90" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[10]" y="250" width="42" align="center" text="100" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[1]" y="330" width="42" align="center" text="10" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[2]" y="330" width="42" align="center" text="20" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[3]" y="330" width="42" align="center" text="30" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[4]" y="330" width="42" align="center" text="40" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[5]" y="330" width="42" align="center" text="50" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[6]" y="330" width="42" align="center" text="60" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[7]" y="330" width="42" align="center" text="70" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[8]" y="330" width="42" align="center" text="80" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[9]" y="330" width="42" align="center" text="90" size="16" color="0x62563F"]
    [ptext name="config_ui_text" layer="0" x="&tf.config_x[10]" y="330" width="42" align="center" text="100" size="16" color="0x62563F"]
[s]

;--------------------------------------------------------------------------------
; コンフィグモードの終了
;--------------------------------------------------------------------------------
*backtitle
[cm]

	
;	テキスト速度のサンプル表示に使用していたメッセージレイヤを非表示に
	[layopt layer="message1" visible="false"]

;	fixボタンをクリア
[iscript]
$(".config_ui_text").remove();
[endscript]

	[clearfix]

;	キーコンフィグの有効化
	[start_keyconfig]

;	コールスタックのクリア
	[clearstack]

;	ゲーム復帰
	[awakegame]

;================================================================================

; ボタンクリック時の処理

;================================================================================
;--------------------------------------------------------------------------------
; BGM音量
;--------------------------------------------------------------------------------
*vol_bgm_change

[iscript]
	$(".bgmvol").attr("src",tf.btn_runtime_off);
	if(tf.current_bgm_vol > 0){ $(".bgmvol_"+tf.current_bgm_vol).attr("src",tf.btn_runtime_on); }
    $(".bgmvol_0").attr("src",tf.current_bgm_vol == 0 ? tf.toggle_runtime_off : tf.toggle_runtime_on);
[endscript]

[bgmopt volume="&tf.current_bgm_vol"]

[return]

;--------------------------------------------------------------------------------
; SE音量
;--------------------------------------------------------------------------------
*vol_se_change

[iscript]
	$(".sevol").attr("src",tf.btn_runtime_off);
	if(tf.current_se_vol > 0){ $(".sevol_"+tf.current_se_vol).attr("src",tf.btn_runtime_on); }
    $(".sevol_0").attr("src",tf.current_se_vol == 0 ? tf.toggle_runtime_off : tf.toggle_runtime_on);
[endscript]

[seopt volume="&tf.current_se_vol"]

[return]

;---------------------------------------------------------------------------------
; テキスト速度
;--------------------------------------------------------------------------------
*ch_speed_change

	[iscript]

	$(".ch").attr("src",tf.btn_runtime_off);
	$(".ch_"+tf.set_ch_speed).attr("src",tf.btn_runtime_on);
	tf.current_ch_speed = tf.set_ch_speed;

	[endscript]

	[configdelay speed="&tf.set_ch_speed"]

;	テキスト表示速度のサンプルに使用するメッセージレイヤの設定
	[position layer="message1" left="90" top="610" width="1100" height="60" margint="2" marginl="30" page="fore" visible="true" opacity="0"]
	[layopt layer="message1" visible="true"]
	[current layer="message1"]

;	サンプルテキストを表示する
	[emb exp="tf.text_sample"]

		[iscript]
		$(".current_span").css("color","#66564C"); // サンプルテキストのフォントカラーを指定
		tf.system.backlog.pop(); // サンプルテキストを履歴から削除（nolog～endnologタグと同じです）
		[endscript]

;	待ち時間をテキスト速度とサンプルの文字数に対応（消えるのが早すぎるときは後ろの数字を好きなだけ増やそう）
	[eval exp="tf.text_sample_speed = tf.set_ch_speed * tf.text_sample.length + 700"]
	[wait time="&tf.text_sample_speed"]

	[er]
	[layopt layer="message1" visible="false"]

[return]

;--------------------------------------------------------------------------------
; オート速度
;--------------------------------------------------------------------------------
*auto_speed_change

	[iscript]

	$(".auto").attr("src",tf.btn_runtime_off);
	$(".auto_"+tf.set_auto_speed).attr("src",tf.btn_runtime_on);

	[endscript]
	[autoconfig speed="&tf.set_auto_speed"]

[return]

;--------------------------------------------------------------------------------
; スキップ処理-OFF
;--------------------------------------------------------------------------------
*skip_off

	[iscript]
	$(".unread_off").attr("src",tf.toggle_runtime_on);
	$(".unread_on").attr("src",tf.toggle_runtime_off);
	tf.text_skip = "OFF";
	[endscript]

	[config_record_label skip="false"]

[return]

;--------------------------------------------------------------------------------
; スキップ処理-ON
;--------------------------------------------------------------------------------
*skip_on

	[iscript]
	$(".unread_off").attr("src",tf.toggle_runtime_off);
	$(".unread_on").attr("src",tf.toggle_runtime_on);
	tf.text_skip = "ON";
	[endscript]

	[config_record_label skip="true"]

[return]

;================================================================================

; サブルーチン

;================================================================================
;--------------------------------------------------------------------------------

; BGM更新

;--------------------------------------------------------------------------------
*icon_bgm

	[iscript]

	// 設定した音量によって色付き画像の表示・非表示を切替える

	$( ".bgm_img_0").css( "visibility", tf.config_num_bgm == 0 ? 'visible' : 'hidden' );
	$( ".bgm_img_1").css( "visibility", tf.config_num_bgm >  0 ? 'visible' : 'hidden' );
	$( ".bgm_img_2").css( "visibility", tf.config_num_bgm >  1 ? 'visible' : 'hidden' );
	$( ".bgm_img_3").css( "visibility", tf.config_num_bgm >  2 ? 'visible' : 'hidden' );
	$( ".bgm_img_4").css( "visibility", tf.config_num_bgm >  3 ? 'visible' : 'hidden' );
	$( ".bgm_img_5").css( "visibility", tf.config_num_bgm >  4 ? 'visible' : 'hidden' );
	$( ".bgm_img_6").css( "visibility", tf.config_num_bgm >  5 ? 'visible' : 'hidden' );
	$( ".bgm_img_7").css( "visibility", tf.config_num_bgm >  6 ? 'visible' : 'hidden' );
	$( ".bgm_img_8").css( "visibility", tf.config_num_bgm >  7 ? 'visible' : 'hidden' );
	$( ".bgm_img_9").css( "visibility", tf.config_num_bgm >  8 ? 'visible' : 'hidden' );
	$(".bgm_img_10").css( "visibility", tf.config_num_bgm >  9 ? 'visible' : 'hidden' );

	[endscript]

[return]

;--------------------------------------------------------------------------------

; SE更新

;--------------------------------------------------------------------------------
*icon_se

	[iscript]

	$(".se_img_0").css( "visibility", tf.config_num_se == 0 ? 'visible' : 'hidden');
	$(".se_img_1").css( "visibility", tf.config_num_se >  0 ? 'visible' : 'hidden');
	$(".se_img_2").css( "visibility", tf.config_num_se >  1 ? 'visible' : 'hidden');
	$(".se_img_3").css( "visibility", tf.config_num_se >  2 ? 'visible' : 'hidden');
	$(".se_img_4").css( "visibility", tf.config_num_se >  3 ? 'visible' : 'hidden');
	$(".se_img_5").css( "visibility", tf.config_num_se >  4 ? 'visible' : 'hidden');
	$(".se_img_6").css( "visibility", tf.config_num_se >  5 ? 'visible' : 'hidden');
	$(".se_img_7").css( "visibility", tf.config_num_se >  6 ? 'visible' : 'hidden');
	$(".se_img_8").css( "visibility", tf.config_num_se >  7 ? 'visible' : 'hidden');
	$(".se_img_9").css( "visibility", tf.config_num_se >  8 ? 'visible' : 'hidden');
	$(".se_img_10").css("visibility", tf.config_num_se >  9 ? 'visible' : 'hidden');

	[endscript]

[return]

;--------------------------------------------------------------------------------

; テキスト速度更新

;--------------------------------------------------------------------------------
*icon_ch

	[iscript]

	$(".ch_img_1").css( "visibility", tf.config_num_ch >= 0 ? 'visible' : 'hidden');
	$(".ch_img_2").css( "visibility", tf.config_num_ch >  0 ? 'visible' : 'hidden');
	$(".ch_img_3").css( "visibility", tf.config_num_ch >  1 ? 'visible' : 'hidden');
	$(".ch_img_4").css( "visibility", tf.config_num_ch >  2 ? 'visible' : 'hidden');
	$(".ch_img_5").css( "visibility", tf.config_num_ch >  3 ? 'visible' : 'hidden');
	$(".ch_img_6").css( "visibility", tf.config_num_ch >  4 ? 'visible' : 'hidden');
	$(".ch_img_7").css( "visibility", tf.config_num_ch >  5 ? 'visible' : 'hidden');
	$(".ch_img_8").css( "visibility", tf.config_num_ch >  6 ? 'visible' : 'hidden');
	$(".ch_img_9").css( "visibility", tf.config_num_ch >  7 ? 'visible' : 'hidden');
	$(".ch_img_10").css("visibility", tf.config_num_ch >  8 ? 'visible' : 'hidden');

	[endscript]

[return]

;--------------------------------------------------------------------------------

; オート速度更新

;--------------------------------------------------------------------------------
*icon_auto

	[iscript]

	$(".auto_img_1").css( "visibility", tf.config_num_auto >= 0 ? 'visible' : 'hidden');
	$(".auto_img_2").css( "visibility", tf.config_num_auto >  0 ? 'visible' : 'hidden');
	$(".auto_img_3").css( "visibility", tf.config_num_auto >  1 ? 'visible' : 'hidden');
	$(".auto_img_4").css( "visibility", tf.config_num_auto >  2 ? 'visible' : 'hidden');
	$(".auto_img_5").css( "visibility", tf.config_num_auto >  3 ? 'visible' : 'hidden');
	$(".auto_img_6").css( "visibility", tf.config_num_auto >  4 ? 'visible' : 'hidden');
	$(".auto_img_7").css( "visibility", tf.config_num_auto >  5 ? 'visible' : 'hidden');
	$(".auto_img_8").css( "visibility", tf.config_num_auto >  6 ? 'visible' : 'hidden');
	$(".auto_img_9").css( "visibility", tf.config_num_auto >  7 ? 'visible' : 'hidden');
	$(".auto_img_10").css("visibility", tf.config_num_auto >  8 ? 'visible' : 'hidden');

	[endscript]

[return]

;================================================================================

; 画像の読み込み（コンフィグ画面の起動時のみコール）

;================================================================================
*load_img

	[layopt layer="0" visible="true"]

;	BGM
	[image layer="0" name="bgm_img_0"  storage="&tf.img_path + 'set1.png'"  x="&tf.config_x[0]"  y="&tf.config_y_bgm"]
	[image layer="0" name="bgm_img_1"  storage="&tf.img_path + 'set1.png'"  x="&tf.config_x[1]"  y="&tf.config_y_bgm"]
	[image layer="0" name="bgm_img_2"  storage="&tf.img_path + 'set1.png'"  x="&tf.config_x[2]"  y="&tf.config_y_bgm"]
	[image layer="0" name="bgm_img_3"  storage="&tf.img_path + 'set1.png'"  x="&tf.config_x[3]"  y="&tf.config_y_bgm"]
	[image layer="0" name="bgm_img_4"  storage="&tf.img_path + 'set1.png'"  x="&tf.config_x[4]"  y="&tf.config_y_bgm"]
	[image layer="0" name="bgm_img_5"  storage="&tf.img_path + 'set1.png'"  x="&tf.config_x[5]"  y="&tf.config_y_bgm"]
	[image layer="0" name="bgm_img_6"  storage="&tf.img_path + 'set1.png'"  x="&tf.config_x[6]"  y="&tf.config_y_bgm"]
	[image layer="0" name="bgm_img_7"  storage="&tf.img_path + 'set1.png'"  x="&tf.config_x[7]"  y="&tf.config_y_bgm"]
	[image layer="0" name="bgm_img_8"  storage="&tf.img_path + 'set1.png'"  x="&tf.config_x[8]"  y="&tf.config_y_bgm"]
	[image layer="0" name="bgm_img_9"  storage="&tf.img_path + 'set1.png'"  x="&tf.config_x[9]"  y="&tf.config_y_bgm"]
	[image layer="0" name="bgm_img_10" storage="&tf.img_path + 'set1.png'"  x="&tf.config_x[10]" y="&tf.config_y_bgm"]

;	SE
	[image layer="0" name="se_img_0"  storage="&tf.img_path + 'set2.png'" x="&tf.config_x[0]"  y="&tf.config_y_se"]
	[image layer="0" name="se_img_1"  storage="&tf.img_path + 'set2.png'" x="&tf.config_x[1]"  y="&tf.config_y_se"]
	[image layer="0" name="se_img_2"  storage="&tf.img_path + 'set2.png'" x="&tf.config_x[2]"  y="&tf.config_y_se"]
	[image layer="0" name="se_img_3"  storage="&tf.img_path + 'set2.png'" x="&tf.config_x[3]"  y="&tf.config_y_se"]
	[image layer="0" name="se_img_4"  storage="&tf.img_path + 'set2.png'" x="&tf.config_x[4]"  y="&tf.config_y_se"]
	[image layer="0" name="se_img_5"  storage="&tf.img_path + 'set2.png'" x="&tf.config_x[5]"  y="&tf.config_y_se"]
	[image layer="0" name="se_img_6"  storage="&tf.img_path + 'set2.png'" x="&tf.config_x[6]"  y="&tf.config_y_se"]
	[image layer="0" name="se_img_7"  storage="&tf.img_path + 'set2.png'" x="&tf.config_x[7]"  y="&tf.config_y_se"]
	[image layer="0" name="se_img_8"  storage="&tf.img_path + 'set2.png'" x="&tf.config_x[8]"  y="&tf.config_y_se"]
	[image layer="0" name="se_img_9"  storage="&tf.img_path + 'set2.png'" x="&tf.config_x[9]"  y="&tf.config_y_se"]
	[image layer="0" name="se_img_10" storage="&tf.img_path + 'set2.png'" x="&tf.config_x[10]" y="&tf.config_y_se"]

;	テキスト速度
	[image layer="0" name="ch_img_1"  storage="&tf.img_path + 'set1.png'" x="&tf.config_x[1]"  y="&tf.config_y_ch"]
	[image layer="0" name="ch_img_2"  storage="&tf.img_path + 'set1.png'" x="&tf.config_x[2]"  y="&tf.config_y_ch"]
	[image layer="0" name="ch_img_3"  storage="&tf.img_path + 'set1.png'" x="&tf.config_x[3]"  y="&tf.config_y_ch"]
	[image layer="0" name="ch_img_4"  storage="&tf.img_path + 'set1.png'" x="&tf.config_x[4]"  y="&tf.config_y_ch"]
	[image layer="0" name="ch_img_5"  storage="&tf.img_path + 'set1.png'" x="&tf.config_x[5]"  y="&tf.config_y_ch"]
	[image layer="0" name="ch_img_6"  storage="&tf.img_path + 'set1.png'" x="&tf.config_x[6]"  y="&tf.config_y_ch"]
	[image layer="0" name="ch_img_7"  storage="&tf.img_path + 'set1.png'" x="&tf.config_x[7]"  y="&tf.config_y_ch"]
	[image layer="0" name="ch_img_8"  storage="&tf.img_path + 'set1.png'" x="&tf.config_x[8]"  y="&tf.config_y_ch"]
	[image layer="0" name="ch_img_9"  storage="&tf.img_path + 'set1.png'" x="&tf.config_x[9]"  y="&tf.config_y_ch"]
	[image layer="0" name="ch_img_10" storage="&tf.img_path + 'set1.png'" x="&tf.config_x[10]" y="&tf.config_y_ch"]

;	オート速度
	[image layer="0" name="auto_img_1"  storage="&tf.img_path + 'set2.png'"  x="&tf.config_x[1]"  y="&tf.config_y_auto"]
	[image layer="0" name="auto_img_2"  storage="&tf.img_path + 'set2.png'"  x="&tf.config_x[2]"  y="&tf.config_y_auto"]
	[image layer="0" name="auto_img_3"  storage="&tf.img_path + 'set2.png'"  x="&tf.config_x[3]"  y="&tf.config_y_auto"]
	[image layer="0" name="auto_img_4"  storage="&tf.img_path + 'set2.png'"  x="&tf.config_x[4]"  y="&tf.config_y_auto"]
	[image layer="0" name="auto_img_5"  storage="&tf.img_path + 'set2.png'"  x="&tf.config_x[5]"  y="&tf.config_y_auto"]
	[image layer="0" name="auto_img_6"  storage="&tf.img_path + 'set2.png'"  x="&tf.config_x[6]"  y="&tf.config_y_auto"]
	[image layer="0" name="auto_img_7"  storage="&tf.img_path + 'set2.png'"  x="&tf.config_x[7]"  y="&tf.config_y_auto"]
	[image layer="0" name="auto_img_8"  storage="&tf.img_path + 'set2.png'"  x="&tf.config_x[8]"  y="&tf.config_y_auto"]
	[image layer="0" name="auto_img_9"  storage="&tf.img_path + 'set2.png'"  x="&tf.config_x[9]"  y="&tf.config_y_auto"]
	[image layer="0" name="auto_img_10" storage="&tf.img_path + 'set2.png'"  x="&tf.config_x[10]" y="&tf.config_y_auto"]

[return]
