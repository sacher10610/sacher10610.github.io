; 4月プロトタイプの共通処理。既存のsfは初期化・消去しない。
; iscript / eval 実行後に、この同梱エンジンはsfを永続保存する。

[macro name="register_core_bad"]
[eval exp="sf['core_bad_' + mp.id] = true"]
[endmacro]

[macro name="register_mini_bad"]
[eval exp="sf['mini_bad_' + mp.id] = true"]
[endmacro]

; 記録・設定などでclearfixされた後に、共通クイックメニューを復元する。
; 通常進行中に重ねて呼ばず、UIを消した画面から本編へ戻る時だけ使う。
[macro name="restore_april_quick_menu"]
[button name="april_quick_log" role="backlog" graphic="april_ui/quick_log_normal.png" enterimg="april_ui/quick_log_hover.png" x="565" y="12" width="110" height="48"]
[button name="april_quick_auto" role="auto" graphic="april_ui/quick_auto_normal.png" enterimg="april_ui/quick_auto_hover.png" x="682" y="12" width="110" height="48"]
[button name="april_quick_save" role="save" graphic="april_ui/v3/quick_menu/quick_save_normal.png" enterimg="april_ui/v3/quick_menu/quick_save_hover.png" x="799" y="12" width="110" height="48"]
[button name="april_quick_load" role="load" graphic="april_ui/v3/quick_menu/quick_load_normal.png" enterimg="april_ui/v3/quick_menu/quick_load_hover.png" x="916" y="12" width="110" height="48"]
[button name="april_quick_skip" role="skip" graphic="april_ui/quick_skip_normal.png" enterimg="april_ui/quick_skip_hover.png" x="1033" y="12" width="110" height="48"]
[button name="april_quick_config" role="sleepgame" storage="config.ks" graphic="april_ui/quick_config_normal.png" enterimg="april_ui/quick_config_hover.png" x="1150" y="12" width="110" height="48"]
[endmacro]

[return]

*new_game
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="1000"]
[clearstack stack="if"]
[cm]
[clearfix name="april_ui"]
[hidemenubutton]
[stop_keyconfig]
[tb_show_message_window]
[iscript]
f.player_name = "";
f.april_bad = null;
f.route = "normal";
f.chapter = "04";
f.scene = "name_input";
f.current_clear_month = "04";
f.april_production_choice = "";
[endscript]
[resetfont]
[font color="0x3B2A1B"]
#
主人公の名前を入力してください。[r]
空欄の場合は「ユウ」になります。（12文字まで）
[resetfont]
[edit name="f.player_name" initial="ユウ" maxchars="12" left="400" top="250" width="460" height="48" size="28"]
[glink text="" color="green" x="450" y="330" width="340" height="84" size="26" cm="false" graphic="april_ui/v2/name_entry/name_confirm_normal.png" enterimg="april_ui/v2/name_entry/name_confirm_hover.png" target="*confirm_name"]
[s]

*confirm_name
[clearstack stack="if"]
; 同梱版のcommitは文字列をevalするため、入力値は直接代入する。
[iscript]
var input = TG.layer.getFreeLayer().find('input[name="f.player_name"]').val() || "";
f.player_name = Array.from(String(input).trim().replace(/[<>\[\]\r\n]/g, "")).slice(0, 12).join("") || "ユウ";
[endscript]
[cm]
[start_keyconfig]
[hidemenubutton]
[chara_new name="主人公" jname=&f.player_name storage="../image/noimage.png"]
[jump storage="prologue.ks" target="*start"]

*show_core_bad
[clearstack stack="if"]
[cm]
[layopt layer="message0" visible="true"]
#
[font color="0x305332" bold="true"]
CORE BAD [emb exp="f.april_bad.id"]
[resetfont]
[r]
『[emb exp="f.april_bad.title"]』[r]
[emb exp="f.april_bad.lesson"]
[glink text="選択肢から再挑戦" color="green" font_color="0x3B2A1B" x="675" y="245" width="400" height="85" size="23" bold="true" target="*retry_bad" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="記録" color="green" font_color="0x3B2A1B" x="675" y="350" width="400" height="85" size="23" bold="true" target="*records_from_bad" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[s]

*show_mini_bad
[clearstack stack="if"]
[cm]
[layopt layer="message0" visible="true"]
#
[font color="0x305332" bold="true"]
MINI BAD [emb exp="f.april_bad.id.toUpperCase()"]
[resetfont]
[r]
『[emb exp="f.april_bad.title"]』[r]
[if exp="f.april_bad.month != '01' && f.april_bad.month != '02' && f.april_bad.month != '03'"]
失敗の記録に登録しました。[r]
[endif]
[emb exp="f.april_bad.lesson"]
[glink text="選択肢から再挑戦" color="green" font_color="0x3B2A1B" x="675" y="245" width="400" height="85" size="23" bold="true" target="*retry_bad" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="記録" color="green" font_color="0x3B2A1B" x="675" y="350" width="400" height="85" size="23" bold="true" target="*records_from_bad" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[s]

*retry_bad
[clearstack stack="if"]
[cm]
[free layer="1" name="april_bad_frame"]
[return]

*records
[clearstack stack="if"]
[eval exp="f.april_record_screen_open = false"]
[eval exp="f.april_records_return = 'title'"]
[eval exp="f.april_record_tab = 'CORE'"]
[eval exp="f.april_record_month = '04'"]
[eval exp="f.april_record_selected = 'core_001'"]
[eval exp="f.april_record_cg_category = 'EVENT'"]
[jump target="*records_display"]

*records_from_bad
[clearstack stack="if"]
[eval exp="f.april_record_screen_open = false"]
[eval exp="f.april_records_return = 'bad'"]
[iscript]
f.april_record_month = (f.april_bad && f.april_bad.month) || "04";
if (f.april_bad && f.april_bad.kind === "MINI") {
 f.april_record_tab = "MINI";
 var miniId = String(f.april_bad.id || "m01").toLowerCase();
 f.april_record_selected = "mini_" + miniId;
} else {
 f.april_record_tab = "CORE";
 var badId = String((f.april_bad && f.april_bad.id) || "001");
 f.april_record_selected = /^(?:00[1-9]|01[0-7])$/.test(badId) ? "core_" + badId : "core_001";
}
[endscript]
[jump target="*records_display"]

*records_from_clear
[clearstack stack="if"]
[eval exp="f.april_record_screen_open = false"]
[eval exp="f.april_records_return = 'clear'"]
[iscript]
f.april_record_month = f.current_clear_month || "04";
f.april_record_tab = "CORE";
f.april_record_selected = f.april_record_month === "03" ? "march_clear" : (f.april_record_month === "02" ? "february_clear" : (f.april_record_month === "01" ? "january_clear" : (f.april_record_month === "12" ? "december_clear" : (f.april_record_month === "11" ? "november_clear" : (f.april_record_month === "10" ? "october_clear" : (f.april_record_month === "09" ? "september_clear" : (f.april_record_month === "08" ? "august_clear" : (f.april_record_month === "07" ? "july_clear" : (f.april_record_month === "06" ? "june_clear" : (f.april_record_month === "05" ? "may_clear" : "clear"))))))))));
[endscript]
[jump target="*records_display"]

*records_tab_core
[clearstack stack="if"]
[eval exp="f.april_record_tab = 'CORE'"]
[eval exp="f.april_record_selected = f.april_record_month == '03' ? 'core_017' : (f.april_record_month == '02' ? 'core_016' : (f.april_record_month == '01' ? 'core_015' : (f.april_record_month == '12' ? 'core_014' : (f.april_record_month == '11' ? 'core_012' : (f.april_record_month == '10' ? 'core_010' : ((f.april_record_month == '09' ? 'core_009' : (f.april_record_month == '08' ? 'core_008' : (f.april_record_month == '07' ? 'core_007' : (f.april_record_month == '06' ? 'core_005' : (f.april_record_month == '05' ? 'core_003' : 'core_001')))))))))))"]
[jump target="*records_display"]
*records_tab_mini
[clearstack stack="if"]
[eval exp="f.april_record_tab = 'MINI'"]
[eval exp="f.april_record_selected = f.april_record_month == '03' ? 'mini_m12' : (f.april_record_month == '02' ? 'mini_m10' : (f.april_record_month == '01' ? 'mini_m08' : (f.april_record_month == '12' ? 'mini_m06' : (f.april_record_month == '11' ? 'mini_m04' : (f.april_record_month == '10' ? 'october_mini_none' : ((f.april_record_month == '09' ? 'september_mini_none' : (f.april_record_month == '08' ? 'august_mini_none' : (f.april_record_month == '07' ? 'july_mini_none' : (f.april_record_month == '06' ? 'june_mini_none' : (f.april_record_month == '05' ? 'may_mini_none' : 'mini_m01')))))))))))"]
[jump target="*records_display"]
*records_tab_cg
[clearstack stack="if"]
[eval exp="f.april_record_tab = 'CG'"]
[eval exp="f.april_record_selected = 'event_01'"]
[eval exp="f.april_record_cg_category = 'EVENT'"]
[jump target="*records_display"]

*records_month_04
[clearstack stack="if"]
[eval exp="f.april_record_month = '04'"]
[jump target="*records_month_selection"]
*records_month_05
[clearstack stack="if"]
[eval exp="f.april_record_month = '05'"]
[jump target="*records_month_selection"]
*records_month_06
[clearstack stack="if"]
[eval exp="f.april_record_month = '06'"]
[jump target="*records_month_selection"]
*records_month_07
[clearstack stack="if"]
[eval exp="f.april_record_month = '07'"]
[jump target="*records_month_selection"]
*records_month_08
[clearstack stack="if"]
[eval exp="f.april_record_month = '08'"]
[jump target="*records_month_selection"]
*records_month_09
[clearstack stack="if"]
[eval exp="f.april_record_month = '09'"]
[jump target="*records_month_selection"]
*records_month_10
[clearstack stack="if"]
[eval exp="f.april_record_month = '10'"]
[jump target="*records_month_selection"]
*records_month_11
[clearstack stack="if"]
[eval exp="f.april_record_month = '11'"]
[jump target="*records_month_selection"]
*records_month_12
[clearstack stack="if"]
[eval exp="f.april_record_month = '12'"]
[jump target="*records_month_selection"]
*records_month_01
[clearstack stack="if"]
[eval exp="f.april_record_month = '01'"]
[jump target="*records_month_selection"]
*records_month_02
[clearstack stack="if"]
[eval exp="f.april_record_month = '02'"]
[jump target="*records_month_selection"]
*records_month_03
[clearstack stack="if"]
[eval exp="f.april_record_month = '03'"]
[jump target="*records_month_selection"]

*records_month_selection
[clearstack stack="if"]
[iscript]
if (f.april_record_tab === "CORE") f.april_record_selected = f.april_record_month === "03" ? "core_017" : (f.april_record_month === "02" ? "core_016" : (f.april_record_month === "01" ? "core_015" : (f.april_record_month === "12" ? "core_014" : (f.april_record_month === "11" ? "core_012" : (f.april_record_month === "10" ? "core_010" : (f.april_record_month === "09" ? "core_009" : (f.april_record_month === "08" ? "core_008" : (f.april_record_month === "07" ? "core_007" : (f.april_record_month === "06" ? "core_005" : (f.april_record_month === "05" ? "core_003" : "core_001"))))))))));
else if (f.april_record_tab === "MINI") f.april_record_selected = f.april_record_month === "03" ? "mini_m12" : (f.april_record_month === "02" ? "mini_m10" : (f.april_record_month === "01" ? "mini_m08" : (f.april_record_month === "12" ? "mini_m06" : (f.april_record_month === "11" ? "mini_m04" : (f.april_record_month === "10" ? "october_mini_none" : (f.april_record_month === "09" ? "september_mini_none" : (f.april_record_month === "08" ? "august_mini_none" : (f.april_record_month === "07" ? "july_mini_none" : (f.april_record_month === "06" ? "june_mini_none" : (f.april_record_month === "05" ? "may_mini_none" : "mini_m01"))))))))));
else f.april_record_selected = f.april_record_cg_category === "MINI" ? "mini_01" : "event_01";
[endscript]
[jump target="*records_display"]

*records_select_core_001
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_001'"]
[jump target="*records_display"]
*records_select_core_002
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_002'"]
[jump target="*records_display"]
*records_select_core_003
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_003'"]
[jump target="*records_display"]
*records_select_core_004
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_004'"]
[jump target="*records_display"]
*records_select_core_005
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_005'"]
[jump target="*records_display"]
*records_select_core_006
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_006'"]
[jump target="*records_display"]
*records_select_core_017
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_017'"]
[jump target="*records_display"]

*records_select_march_clear
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'march_clear'"]
[jump target="*records_display"]

*records_select_march_end_01
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'march_end_01'"]
[jump target="*records_display"]

*records_select_march_end_02
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'march_end_02'"]
[jump target="*records_display"]

*records_select_march_true
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'march_true'"]
[jump target="*records_display"]

*records_select_mini_m12
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_m12'"]
[jump target="*records_display"]

*records_select_mini_m13
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_m13'"]
[jump target="*records_display"]

*records_select_cg_event_04
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'event_04'"]
[jump target="*records_display"]

*records_select_cg_event_05
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'event_05'"]
[jump target="*records_display"]

*records_select_cg_event_06
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'event_06'"]
[jump target="*records_display"]

*records_select_cg_event_07
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'event_07'"]
[jump target="*records_display"]

*records_select_cg_event_08
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'event_08'"]
[jump target="*records_display"]

*records_select_core_016
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_016'"]
[jump target="*records_display"]

*records_select_mini_m10
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_m10'"]
[jump target="*records_display"]

*records_select_mini_m11
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_m11'"]
[jump target="*records_display"]

*records_select_february_clear
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'february_clear'"]
[jump target="*records_display"]

*records_select_core_015
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_015'"]
[jump target="*records_display"]

*records_select_mini_m08
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_m08'"]
[jump target="*records_display"]

*records_select_mini_m09
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_m09'"]
[jump target="*records_display"]

*records_select_january_clear
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'january_clear'"]
[jump target="*records_display"]

*records_select_core_014
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_014'"]
[jump target="*records_display"]

*records_select_mini_m06
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_m06'"]
[jump target="*records_display"]

*records_select_mini_m07
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_m07'"]
[jump target="*records_display"]

*records_select_december_clear
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'december_clear'"]
[jump target="*records_display"]

*records_select_core_012
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_012'"]
[jump target="*records_display"]

*records_select_core_013
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_013'"]
[jump target="*records_display"]

*records_select_mini_m04
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_m04'"]
[jump target="*records_display"]

*records_select_mini_m05
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_m05'"]
[jump target="*records_display"]

*records_select_november_clear
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'november_clear'"]
[jump target="*records_display"]

*records_select_core_010
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_010'"]
[jump target="*records_display"]

*records_select_core_011
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_011'"]
[jump target="*records_display"]

*records_select_october_clear
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'october_clear'"]
[jump target="*records_display"]

*records_select_core_009
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_009'"]
[jump target="*records_display"]

*records_select_september_clear
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'september_clear'"]
[jump target="*records_display"]

*records_select_core_008
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_008'"]
[jump target="*records_display"]
*records_select_august_clear
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'august_clear'"]
[jump target="*records_display"]
*records_select_core_007
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'core_007'"]
[jump target="*records_display"]
*records_select_july_clear
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'july_clear'"]
[jump target="*records_display"]
*records_select_june_clear
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'june_clear'"]
[jump target="*records_display"]
*records_select_mini_m01
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_m01'"]
[jump target="*records_display"]
*records_select_mini_m02
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_m02'"]
[jump target="*records_display"]
*records_select_mini_m03
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_m03'"]
[jump target="*records_display"]
*records_select_clear
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'clear'"]
[jump target="*records_display"]
*records_select_may_clear
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'may_clear'"]
[jump target="*records_display"]

*records_cg_event
[clearstack stack="if"]
[eval exp="f.april_record_cg_category = 'EVENT'"]
[eval exp="f.april_record_selected = 'event_01'"]
[jump target="*records_display"]

*records_cg_mini
[clearstack stack="if"]
[eval exp="f.april_record_cg_category = 'MINI'"]
[eval exp="f.april_record_selected = 'mini_01'"]
[jump target="*records_display"]

*records_select_cg_event_01
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'event_01'"]
[jump target="*records_display"]
*records_select_cg_event_02
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'event_02'"]
[jump target="*records_display"]
*records_select_cg_event_03
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'event_03'"]
[jump target="*records_display"]
*records_select_cg_mini_01
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_01'"]
[jump target="*records_display"]
*records_select_cg_mini_02
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_02'"]
[jump target="*records_display"]
*records_select_cg_mini_03
[clearstack stack="if"]
[eval exp="f.april_record_selected = 'mini_03'"]
[jump target="*records_display"]
*records_display
[if exp="!window.MarchEnding"]
[loadjs storage="march_ending.js"]
[endif]
[clearstack stack="if"]
[free layer="1" name="archive_cg_image"]
[if exp="f.april_record_screen_open == true"]
[free layer="1" name="archive_text"]
[else]
[image layer="1" name="archive_spread" folder="image" storage="april_ui/v4/record_archive_bg.svg" x="0" y="0" width="1280" height="720"]
[free layer="1" name="title_logo_main"]
[eval exp="f.april_record_screen_open = true"]
[endif]
[cm]
[layopt layer="1" visible="true"]
[hidemenubutton]
[tb_hide_message_window]
[eval exp="f.april_record_month = f.april_record_month || '04'"]
[eval exp="f.april_record_tab = f.april_record_tab || 'CORE'"]
[eval exp="f.april_record_selected = f.april_record_selected || 'core_001'"]
[eval exp="f.april_record_cg_category = f.april_record_cg_category || 'EVENT'"]

[if exp="f.april_record_tab == 'CORE'"]
[glink text="CORE BAD" color="green" font_color="0x3B2A1B" x="205" y="12" width="270" height="46" size="19" bold="true" target="*records_tab_core" name="archive_mode_tab archive_selected"]
[else]
[glink text="CORE BAD" color="green" font_color="0x3B2A1B" x="205" y="12" width="270" height="46" size="19" bold="true" target="*records_tab_core" name="archive_mode_tab"]
[endif]
[if exp="f.april_record_tab == 'MINI'"]
[glink text="MINI BAD" color="green" font_color="0x3B2A1B" x="505" y="12" width="270" height="46" size="19" bold="true" target="*records_tab_mini" name="archive_mode_tab archive_selected"]
[else]
[glink text="MINI BAD" color="green" font_color="0x3B2A1B" x="505" y="12" width="270" height="46" size="19" bold="true" target="*records_tab_mini" name="archive_mode_tab"]
[endif]
[if exp="f.april_record_tab == 'CG'"]
[glink text="CG" color="green" font_color="0x3B2A1B" x="805" y="12" width="270" height="46" size="19" bold="true" target="*records_tab_cg" name="archive_mode_tab archive_selected"]
[else]
[glink text="CG" color="green" font_color="0x3B2A1B" x="805" y="12" width="270" height="46" size="19" bold="true" target="*records_tab_cg" name="archive_mode_tab"]
[endif]
[if exp="f.april_record_month == '04'"]
[glink text="4月" color="green" font_color="0x3B2A1B" x="112" y="64" width="166" height="29" size="15" bold="true" target="*records_month_04" name="archive_month_tab archive_selected"]
[else]
[glink text="4月" color="green" font_color="0x3B2A1B" x="112" y="64" width="166" height="29" size="15" bold="true" target="*records_month_04" name="archive_month_tab"]
[endif]
[if exp="f.april_record_month == '05'"]
[glink text="5月" color="green" font_color="0x3B2A1B" x="288" y="64" width="166" height="29" size="15" bold="true" target="*records_month_05" name="archive_month_tab archive_selected"]
[else]
[glink text="5月" color="green" font_color="0x3B2A1B" x="288" y="64" width="166" height="29" size="15" bold="true" target="*records_month_05" name="archive_month_tab"]
[endif]
[if exp="f.april_record_month == '06'"]
[glink text="6月" color="green" font_color="0x3B2A1B" x="464" y="64" width="166" height="29" size="15" bold="true" target="*records_month_06" name="archive_month_tab archive_selected"]
[else]
[glink text="6月" color="green" font_color="0x3B2A1B" x="464" y="64" width="166" height="29" size="15" bold="true" target="*records_month_06" name="archive_month_tab"]
[endif]
[if exp="f.april_record_month == '07'"]
[glink text="7月" color="green" font_color="0x3B2A1B" x="640" y="64" width="166" height="29" size="15" bold="true" target="*records_month_07" name="archive_month_tab archive_selected"]
[else]
[glink text="7月" color="green" font_color="0x3B2A1B" x="640" y="64" width="166" height="29" size="15" bold="true" target="*records_month_07" name="archive_month_tab"]
[endif]
[if exp="f.april_record_month == '08'"]
[glink text="8月" color="green" font_color="0x3B2A1B" x="816" y="64" width="166" height="29" size="15" bold="true" target="*records_month_08" name="archive_month_tab archive_selected"]
[else]
[glink text="8月" color="green" font_color="0x3B2A1B" x="816" y="64" width="166" height="29" size="15" bold="true" target="*records_month_08" name="archive_month_tab"]
[endif]
[if exp="f.april_record_month == '09'"]
[glink text="9月" color="green" font_color="0x3B2A1B" x="992" y="64" width="166" height="29" size="15" bold="true" target="*records_month_09" name="archive_month_tab archive_selected"]
[else]
[glink text="9月" color="green" font_color="0x3B2A1B" x="992" y="64" width="166" height="29" size="15" bold="true" target="*records_month_09" name="archive_month_tab"]
[endif]
[if exp="f.april_record_month == '10'"]
[glink text="10月" color="green" font_color="0x3B2A1B" x="112" y="102" width="166" height="29" size="15" bold="true" target="*records_month_10" name="archive_month_tab archive_selected"]
[else]
[glink text="10月" color="green" font_color="0x3B2A1B" x="112" y="102" width="166" height="29" size="15" bold="true" target="*records_month_10" name="archive_month_tab"]
[endif]
[if exp="f.april_record_month == '11'"]
[glink text="11月" color="green" font_color="0x3B2A1B" x="288" y="102" width="166" height="29" size="15" bold="true" target="*records_month_11" name="archive_month_tab archive_selected"]
[else]
[glink text="11月" color="green" font_color="0x3B2A1B" x="288" y="102" width="166" height="29" size="15" bold="true" target="*records_month_11" name="archive_month_tab"]
[endif]
[if exp="f.april_record_month == '12'"]
[glink text="12月" color="green" font_color="0x3B2A1B" x="464" y="102" width="166" height="29" size="15" bold="true" target="*records_month_12" name="archive_month_tab archive_selected"]
[else]
[glink text="12月" color="green" font_color="0x3B2A1B" x="464" y="102" width="166" height="29" size="15" bold="true" target="*records_month_12" name="archive_month_tab"]
[endif]
[if exp="f.april_record_month == '01'"]
[glink text="1月" color="green" font_color="0x3B2A1B" x="640" y="102" width="166" height="29" size="15" bold="true" target="*records_month_01" name="archive_month_tab archive_selected"]
[else]
[glink text="1月" color="green" font_color="0x3B2A1B" x="640" y="102" width="166" height="29" size="15" bold="true" target="*records_month_01" name="archive_month_tab"]
[endif]
[if exp="f.april_record_month == '02'"]
[glink text="2月" color="green" font_color="0x3B2A1B" x="816" y="102" width="166" height="29" size="15" bold="true" target="*records_month_02" name="archive_month_tab archive_selected"]
[else]
[glink text="2月" color="green" font_color="0x3B2A1B" x="816" y="102" width="166" height="29" size="15" bold="true" target="*records_month_02" name="archive_month_tab"]
[endif]
[if exp="f.april_record_month == '03'"]
[glink text="3月" color="green" font_color="0x3B2A1B" x="992" y="102" width="166" height="29" size="15" bold="true" target="*records_month_03" name="archive_month_tab archive_selected"]
[else]
[glink text="3月" color="green" font_color="0x3B2A1B" x="992" y="102" width="166" height="29" size="15" bold="true" target="*records_month_03" name="archive_month_tab"]
[endif]
[iscript]
var archiveMonths = {"04":"4月","05":"5月","06":"6月","07":"7月","08":"8月","09":"9月","10":"10月","11":"11月","12":"12月","01":"1月","02":"2月","03":"3月"};
f.april_record_heading = "記録｜" + (archiveMonths[f.april_record_month] || "4月");
var archiveMap = {
 core_001:{title:"BAD001｜1000個のエクレア",classification:"CORE BAD",status:(sf.core_bad_001===true?"回収済み":""),condition1:"初期分岐で、大量生産寄りの",condition2:"危険な選択をする。",body1:"需要調査なしで大量生産に走り、",body2:"店の規模を無視して自滅する。",comment:"勢いだけでは厨房がもたへんで。",note:"どちらかのCORE BAD回収で、調査の選択肢が解放。"},
 core_002:{title:"BAD002｜慎重すぎて何も始まらない",classification:"CORE BAD",status:(sf.core_bad_002===true?"回収済み":""),condition1:"安全策・先延ばし寄りの選択をする。",condition2:"",body1:"動かなさすぎて何も始まらず、",body2:"状況も好転しなかった。",comment:"慎重なんは大事やけど、止まりすぎもあかんで。",note:"どちらかのCORE BAD回収で、調査の選択肢が解放。"},
 mini_m01:{title:"M01｜材料がありません",classification:"MINI BAD",status:(sf.mini_bad_m01===true?"回収済み":""),condition1:"仕込み・準備で基本を外す。",condition2:"",body1:"材料不足で、スタート以前に",body2:"身動きが取れなくなった。",comment:"まず材料確認や。準備が先やで。",note:"仕込みの基本を振り返る記録。"},
 mini_m02:{title:"M02｜抹茶100％",classification:"MINI BAD",status:(sf.mini_bad_m02===true?"回収済み":""),condition1:"抹茶に偏った極端な選択をする。",condition2:"",body1:"何でも抹茶に寄せすぎて、",body2:"商品の魅力が薄れてしまった。",comment:"好きでも限度はあるんやで。",note:"味のバランスを見直す記録。"},
 mini_m03:{title:"M03｜営業時間、未定",classification:"MINI BAD",status:(sf.mini_bad_m03===true?"回収済み":""),condition1:"営業面の準備を軽視する。",condition2:"",body1:"店の準備が整わず、お客さんが",body2:"来ても対応できなかった。",comment:"開ける時間くらい決めよ。",note:"営業準備の基本を見直す記録。"},
 clear:{title:"4月｜CLEAR",classification:"月間クリア",status:(sf.normal_ch04_clear===true?"達成済み":""),condition1:"4月の物語を最後まで進める。",condition2:"",body1:"異世界から来た抹茶エクレアと出会い、",body2:"店の再出発が始まった。4月は導入と土台作り。",comment:"ここからほんまに始まるで。",note:"4月の導入と土台作りを記録。"}
};
var mayArchiveMap = {
 core_003:{title:"BAD003｜炎上は知名度に入りますか？",classification:"CORE BAD",status:(sf.core_bad_003===true?"回収済み":""),condition1:"CHOICE 01で「まずは、とにかく話題になろう」を選ぶ。",condition2:"",body1:"刺激の強い発信で注目だけは集めた。",body2:"店を知る人は増えたが、",body3:"「行きたい店」「また来たい店」にはならなかった。",comment:"数字だけ燃えて、店まで焦げたら意味ないやんな……",note:"注目は集めたが、来店や再来店につながらなかった記録。"},
 core_004:{title:"BAD004｜投稿する店",classification:"CORE BAD",status:(sf.core_bad_004===true?"回収済み":""),condition1:"CHOICE 01で「毎日たくさん投稿して、存在感を出そう」を選ぶ。",condition2:"",body1:"発信すること自体が目的になり、",body2:"画面の向こうばかり見ているうちに、",body3:"目の前のお客さんを置いてきぼりにしてしまった。",comment:"フォロワーさんも大事やけど、まず目の前の人見なあかんな",note:"発信と接客のバランスを見直す記録。"},
 may_clear:{title:"5月 CLEAR『また来ます』",classification:"月間クリア",status:(sf.normal_ch05_clear===true?"達成済み":""),condition1:"5月の物語を最後まで進める。",condition2:"",body1:"「客を呼ぶ」ために必要なのは、ただ多くの人に知られることではなかった。",body2:"何の店かを伝え、来てくれた人と向き合い、もう一度来たいと思ってもらう。",body3:"小さな店に、最初の「また来ます」が残った。",comment:"世界一って、一回来てもろた人数やないんやな。",comment2:"……また来てくれる人、増やしてこ",note:"続きは6月『抹茶エクレア改造計画』へ。"}
};
var juneArchiveMap = {
 core_005:{title:"BAD005｜原価率100％",classification:"CORE BAD",status:(sf.core_bad_005===true?"回収済み":""),condition1:"CHOICE 01「素材を全部、最高級にしよう」",condition2:"",body1:"最高級を重ねれば、確かに味も見た目も良くなった。",body2:"でも、売れば売るほど店に何も残らない。",body3:"「良い商品」と「続けられる商品」は、同じではなかった。",comment:"売れたのに店がしんどなるって、",comment2:"成功の顔した失敗やん……",note:"原価と店の継続を見直す記録。"},
 core_006:{title:"BAD006｜一個が遠い",classification:"CORE BAD",status:(sf.core_bad_006===true?"回収済み":""),condition1:"CHOICE 01「一個を“究極の高級品”にしよう」",condition2:"",body1:"一個を特別にするほど、商品は立派になった。",body2:"でも立派になりすぎて、",body3:"「ちょっと食べてみたい」から遠ざかってしまった。",comment:"世界一でも、手ぇ伸ばせへんかったら",comment2:"食べてもらわれへんもんな……",note:"手に取りやすさを見直す記録。"},
 june_clear:{title:"6月 CLEAR『また買える味』",classification:"月間クリア",status:(sf.normal_ch06_clear===true?"達成済み":""),condition1:"6月の物語を最後まで進める。",condition2:"",body1:"良くするために、全部を豪華にする必要はなかった。",body2:"店が続けられて、お客さんがもう一度手を伸ばせて、",body3:"それでも少しだけ「前より良い」。特別すぎない改良を見つけた。",comment:"世界一でも、また買えるくらい",comment2:"近い方がええんやな。",note:"続きは7月『夏にエクレアは売れるのか』へ。"}
};
var julyArchiveMap = {
 core_007:{title:"BAD007｜それ、もうエクレアちゃうやん",classification:"CORE BAD",status:(sf.core_bad_007===true?"回収済み":""),condition1:"CHOICE 01「思い切って、冷たいデザートに作り変えよう」",body1:"夏に合わせようとして、",body2:"冷たさ、軽さ、華やかさを足し続けた。",body3:"気づけばそこに残っていたのは、",body4:"「抹茶味の冷たいデザート」であって、",body5:"エクレアではなかった。",body6:"季節に合わせることと、自分たちの商品の芯を捨てることは違う。",comment:"夏に寄せすぎて、エクレア置いてきてもた……",note:"季節適応そのものではなく、商品の芯を失うほど変えすぎた失敗。"},
 july_clear:{title:"7月 CLEAR『夏でも、エクレア』",classification:"CLEAR",status:(sf.normal_ch07_clear===true?"達成済み":""),condition1:"7月の物語を最後まで進める。",body1:"季節に合わせるために、全部を別物へ変える必要はなかった。",body2:"冷たくして、少し軽くして、それでも生地とクリームは残す。",body3:"変えていいところと、残したいところ。",body4:"七月に見つけたのは、変わりながら「らしさ」を残すやり方だった。",comment:"夏仕様でも、ちゃんと“ウチらのエクレア”や",note:"続きは8月『バズれ、抹茶エクレア』へ。"}
};
var augustArchiveMap = {
 core_008:{title:"BAD008｜一夜の世界一",classification:"CORE BAD",status:(sf.core_bad_008===true?"回収済み":""),condition1:"CHOICE 01『今夜だけの“超限定”で、一気に数字を取りにいこう』",body1:"一晩だけ、数字は跳ね上がった。",body2:"行列ができ、売り切れて、",body3:"急上昇の一番上にも名前が載った。",body4:"でも翌朝、店には次へつながるものが",body5:"ほとんど残っていなかった。",body6:"一度だけ一番になることと、世界一であり続けることは違う。",comment:"一位のスクショだけ残っても、",comment2:"明日の店は開けなあかんねんな……",note:""},
 august_clear:{title:"8月 CLEAR『バズった次の日』",classification:"CLEAR",status:(sf.normal_ch08_clear===true?"達成済み":""),condition1:"8月の物語を最後まで進める。",body1:"大きな数字が悪いわけではない。",body2:"一晩でたくさんの人に届くことも、",body3:"店にとっては大きなチャンスだった。",body4:"でも本当に残したかったのは、一位の画面ではなく、",body5:"次の日にも店を開けられること。また買えること。",body6:"また来たいと思ってもらうこと。",body7:"八月に覚えたのは、バズの“その次”を作ることだった。",comment:"一晩だけやなくて、次の日も続いてたら、",comment2:"もっと強いやんな",note:""}
};
var marchArchiveMap = {
 "core_017": {
  "title": "真・BAD END 017『約束どおり』",
  "classification": "CORE BAD",
  "flag": "core_bad_017",
  "condition1": "",
  "raw_body": "一年かけて、世界一の抹茶エクレアを作った。女神との約束も守った。抹茶ちゃんは帰ることができた。けれど「三月が終わったら話す」という約束だけは、果たされなかった。帰る道があることと、本人が帰りたいことは同じではない。",
  "raw_comment": "「……あんたに、聞いてほしいことがあってん」",
  "body1": "一年かけて、世界一の抹茶エクレアを作った。女神との約束も守った。抹",
  "body2": "茶ちゃんは帰ることができた。けれど「三月が終わったら話す」という約",
  "body3": "束だけは、果たされなかった。帰る道があることと、本人が帰りたいこと",
  "body4": "は同じではない。",
  "comment": "「……あんたに、聞いてほしいことがあってん」",
  "comment2": ""
 },
 "mini_m12": {
  "title": "M12｜優勝スピーチ三時間",
  "classification": "MINI BAD",
  "flag": "mini_bad_m12",
  "condition1": "",
  "raw_body": "優勝後の挨拶を練習したら、一年の思い出を語りきれず三時間。肝心の出品準備が止まってしまった。",
  "raw_comment": "「思い出、いっぱいやな……でも大会前に話しきるもんちゃうわ！」",
  "body1": "優勝後の挨拶を練習したら、一年の思い出を語りきれず三時間。肝心の出",
  "body2": "品準備が止まってしまった。",
  "comment": "「思い出、いっぱいやな……でも大会前に話しきるもんちゃうわ！」",
  "comment2": ""
 },
 "mini_m13": {
  "title": "M13｜世界一、先に印刷",
  "classification": "MINI BAD",
  "flag": "mini_bad_m13",
  "condition1": "",
  "raw_body": "優勝後の帯紙を大量に刷った。でも、まだ世界一とは決まっていない。先に必要なのは、称号ではなく出品する一個だった。",
  "raw_comment": "「世界一って、印刷したらなれるもんちゃうな……」",
  "body1": "優勝後の帯紙を大量に刷った。でも、まだ世界一とは決まっていない。先",
  "body2": "に必要なのは、称号ではなく出品する一個だった。",
  "comment": "「世界一って、印刷したらなれるもんちゃうな……」",
  "comment2": ""
 },
 "march_end_01": {
  "title": "END『帰るべき場所』",
  "classification": "通常END",
  "flag": "march_end_01_seen",
  "condition1": "",
  "raw_body": "心配するあまり、帰る方が幸せだと結論を伝えた。相手の未来を思ったことは本当でも、その未来を自分が決めてしまった。",
  "raw_comment": "",
  "body1": "心配するあまり、帰る方が幸せだと結論を伝えた。相手の未来を思ったこ",
  "body2": "とは本当でも、その未来を自分が決めてしまった。",
  "comment": "",
  "comment2": ""
 },
 "march_end_02": {
  "title": "END『あなたの答え』",
  "classification": "通常END",
  "flag": "march_end_02_seen",
  "condition1": "",
  "raw_body": "一緒にいたいという願いは、素直に伝えられた。けれど今度も、抹茶ちゃん自身がどうしたいかを最後まで聞けなかった。",
  "raw_comment": "",
  "body1": "一緒にいたいという願いは、素直に伝えられた。けれど今度も、抹茶ちゃ",
  "body2": "ん自身がどうしたいかを最後まで聞けなかった。",
  "comment": "",
  "comment2": ""
 },
 "march_true": {
  "title": "TRUE END『世界一の、その次の日』",
  "classification": "TRUE END",
  "flag": "true_end_seen",
  "condition1": "",
  "raw_body": "世界一になるという約束を果たした。帰れる道もある。それでも、これからをどう生きるかは本人が決める。相手の答えを勝手に決めず、聞いて、一緒に次の日を迎えた。",
  "raw_comment": "「世界一になった次の日も、そのまた次の日も。ウチら、また作れるんやな」",
  "body1": "世界一になるという約束を果たした。帰れる道もある。それでも、これか",
  "body2": "らをどう生きるかは本人が決める。相手の答えを勝手に決めず、聞いて、",
  "body3": "一緒に次の日を迎えた。",
  "comment": "「世界一になった次の日も、そのまた次の日も。ウチら、また作れるんや",
  "comment2": "な」"
 },
 "march_clear": {
  "title": "3月 CLEAR｜世界一の抹茶エクレア",
  "classification": "月間クリア",
  "flag": "normal_ch03_clear",
  "condition1": "",
  "raw_body": "World Éclair Grand Prix、総合第1位は……Pâtisserie Komorebi。Matcha Éclair!",
  "raw_comment": "",
  "body1": "World Éclair Grand Prix、総合第1位は……",
  "body2": "Pâtisserie Komorebi。Matcha Éclair!",
  "comment": "",
  "comment2": ""
 }
};
Object.keys(marchArchiveMap).forEach(function (key) {
 var item = marchArchiveMap[key];
 item.status = sf[item.flag] === true ? (key === "march_clear" ? "達成済み" : "回収済み") : "";
 f["march_record_list_"+key] = item.status ? item.title : "？？？";
});
var februaryArchiveMap = {
 "core_016": {
  "title": "BAD016｜帰還最優先",
  "classification": "CORE BAD",
  "flag": "core_bad_016",
  "condition1": "CHOICE 01 A「帰れるように、こちらで段取りを全部決めよう」",
  "raw_body": "抹茶ちゃんのために、帰還の段取りを一人で整えようとした。けれど、帰還は本人が選べる権利であって、主人公が決める予定ではなかった。手続きや引き継ぎを急ぐうちに、二人で目指していた機会まで逃した。相手を大切にするつもりで、相手の声を後回しにしてしまった。",
  "raw_comment": "「助けようとしてくれたんは分かる。でも、ウチのことはウチにも聞いてほしかった……」",
  "body1": "抹茶ちゃんのために、帰還の段取りを一人で整えようとした。けれど、帰",
  "body2": "還は本人が選べる権利であって、主人公が決める予定ではなかった。手続",
  "body3": "きや引き継ぎを急ぐうちに、二人で目指していた機会まで逃した。相手を",
  "body4": "大切にするつもりで、相手の声を後回しにしてしまった。",
  "comment": "「助けようとしてくれたんは分かる。でも、ウチのことはウチにも聞いて",
  "comment2": "ほしかった……」"
 },
 "mini_m10": {
  "title": "M10｜厨房まるごと荷造り",
  "classification": "MINI BAD",
  "flag": "mini_bad_m10",
  "condition1": "CHOICE 00 A「必要そうなものを、全部箱に詰めておこう」",
  "raw_body": "将来のためと、厨房の道具まで全部箱に詰めた。結果、今日の仕込みに使う道具が見つからず、最初から全部開け直すことになった。",
  "raw_comment": "「先のこと考えるんもええけど、今日のエクレア作れへんかったらあかんやろ！」",
  "body1": "将来のためと、厨房の道具まで全部箱に詰めた。結果、今日の仕込みに使",
  "body2": "う道具が見つからず、最初から全部開け直すことになった。",
  "comment": "「先のこと考えるんもええけど、今日のエクレア作れへんかったらあかん",
  "comment2": "やろ！」"
 },
 "mini_m11": {
  "title": "M11｜お土産、誰の分？",
  "classification": "MINI BAD",
  "flag": "mini_bad_m11",
  "condition1": "CHOICE 00 B「帰る時のお土産を、先にたくさん用意しよう」",
  "raw_body": "帰還時のお土産を張り切って用意した。けれど、誰に何個渡すのか、相手が抹茶を好きなのかも確かめていない。大事なことを聞く前に、箱だけが増えていた。",
  "raw_comment": "「気持ちは嬉しいけど、渡す相手も分からんまま山ほど作ってどないすんねん！」",
  "body1": "帰還時のお土産を張り切って用意した。けれど、誰に何個渡すのか、相手",
  "body2": "が抹茶を好きなのかも確かめていない。大事なことを聞く前に、箱だけが",
  "body3": "増えていた。",
  "comment": "「気持ちは嬉しいけど、渡す相手も分からんまま山ほど作ってどないすん",
  "comment2": "ねん！」"
 },
 "february_clear": {
  "title": "2月 CLEAR『その日まで、ふたりで』",
  "classification": "月間クリア",
  "flag": "normal_ch02_clear",
  "condition1": "",
  "raw_body": "一年の期限が近づき、帰還の準備を先回りして進めたくなった。けれど、善意でも相手の未来を勝手に決めるべきではない。今は二人で、世界一を目指して歩く。その先に何があるかは、三月が終わってから話そうと約束した。まだ言葉にできていない問いがあることには、気づかないまま。",
  "raw_comment": "「世界一になるんも、店を続けるんも、ウチら二人で考えてきたことや。最後まで、そうしたいな」",
  "body1": "一年の期限が近づき、帰還の準備を先回りして進めたくなった。けれど、",
  "body2": "善意でも相手の未来を勝手に決めるべきではない。今は二人で、世界一を",
  "body3": "目指して歩く。その先に何があるかは、三月が終わってから話そうと約束",
  "body4": "した。まだ言葉にできていない問いがあることには、気づかないまま。",
  "comment": "「世界一になるんも、店を続けるんも、ウチら二人で考えてきたことや。",
  "comment2": "最後まで、そうしたいな」"
 }
};
Object.keys(februaryArchiveMap).forEach(function (key) {
 var item = februaryArchiveMap[key];
 item.status = sf[item.flag] === true ? (key === "february_clear" ? "達成済み" : "回収済み") : "";
 f["february_record_list_"+key] = item.status ? item.title : "？？？";
});
var januaryArchiveMap = {
 "core_015": {
  "title": "BAD015｜満点の味、ゼロの顔",
  "classification": "CORE BAD",
  "flag": "core_bad_015",
  "condition1": "CHOICE 01 A「採点表で百点になる味へ、徹底的に寄せよう」",
  "raw_body": "味を磨こうとして、五つの評価項目をひたすら最適化した。自分たちの採点表では百点になった。けれど、数字の違いばかり追っているうちに、目の前で食べる人が何を好きで、どんな顔をするのかを見なくなっていた。満点の味は作れても、笑顔までは採点できなかった。",
  "raw_comment": "「百点の紙は残った。でも、あの人らの『また食べたい』を置いてきてもうたんやな……」",
  "body1": "味を磨こうとして、五つの評価項目をひたすら最適化した。自分たちの採",
  "body2": "点表では百点になった。けれど、数字の違いばかり追っているうちに、目",
  "body3": "の前で食べる人が何を好きで、どんな顔をするのかを見なくなっていた。",
  "body4": "満点の味は作れても、笑顔までは採点できなかった。",
  "comment": "「百点の紙は残った。でも、あの人らの『また食べたい』を置いてきても",
  "comment2": "うたんやな……」"
 },
 "mini_m08": {
  "title": "M08｜試食アンケート十二枚",
  "classification": "MINI BAD",
  "flag": "mini_bad_m08",
  "condition1": "CHOICE 00 A「アンケートをもっと細かく十二枚にしよう」",
  "raw_body": "味の感想を正確に集めようと、試食アンケートを十二枚に増やした。書き終える頃にはエクレアはすっかり冷め、食べる時間より回答する時間の方が長くなっていた。",
  "raw_comment": "「お菓子食べに来た人に、宿題十二枚も出したらあかんわ……」",
  "body1": "味の感想を正確に集めようと、試食アンケートを十二枚に増やした。書き",
  "body2": "終える頃にはエクレアはすっかり冷め、食べる時間より回答する時間の方",
  "body3": "が長くなっていた。",
  "comment": "「お菓子食べに来た人に、宿題十二枚も出したらあかんわ……」",
  "comment2": ""
 },
 "mini_m09": {
  "title": "M09｜理想温度、あと0.1℃",
  "classification": "MINI BAD",
  "flag": "mini_bad_m09",
  "condition1": "CHOICE 00 B「提供温度を0.1℃刻みで完璧に合わせよう」",
  "raw_body": "エクレアを理想の温度で出そうと、0.1℃刻みの微調整を繰り返した。温度は完璧になったが、お客さんに渡すタイミングを逃してしまった。",
  "raw_comment": "「温度計は満足したかもしれへんけど、お客さんに食べてもらわななあ……」",
  "body1": "エクレアを理想の温度で出そうと、0.1℃刻みの微調整を繰り返した。",
  "body2": "温度は完璧になったが、お客さんに渡すタイミングを逃してしまった。",
  "comment": "「温度計は満足したかもしれへんけど、お客さんに食べてもらわななあ…",
  "comment2": "…」"
 },
 "january_clear": {
  "title": "1月 CLEAR『点数の外にある、おいしい』",
  "classification": "月間クリア",
  "flag": "normal_ch01_clear",
  "condition1": "",
  "raw_body": "世界一に近づくため、二人は味を点数で確かめ始めた。数字にすると変化が見え、より安定した商品を作れた。けれど、点数には「どんな時に食べたいか」「誰と食べると嬉しいか」までは書き切れなかった。数値は味を磨く道具。最後に見つめるのは、目の前で食べる人の顔だった。",
  "raw_comment": "「百点にしたいんは、紙の上やなくて、食べてくれた人の一日かもしれへんな」",
  "body1": "世界一に近づくため、二人は味を点数で確かめ始めた。数字にすると変化",
  "body2": "が見え、より安定した商品を作れた。けれど、点数には「どんな時に食べ",
  "body3": "たいか」「誰と食べると嬉しいか」までは書き切れなかった。数値は味を",
  "body4": "磨く道具。最後に見つめるのは、目の前で食べる人の顔だった。",
  "comment": "「百点にしたいんは、紙の上やなくて、食べてくれた人の一日かもしれへ",
  "comment2": "んな」"
 }
};
Object.keys(januaryArchiveMap).forEach(function (key) {
 var item = januaryArchiveMap[key];
 item.status = sf[item.flag] === true ? (key === "january_clear" ? "達成済み" : "回収済み") : "";
 f["january_record_list_"+key] = item.status ? item.title : "？？？";
});
var decemberArchiveMap = {
 "core_014": {
  "title": "BAD014｜完売、そして倒れる",
  "classification": "CORE BAD",
  "flag": "core_bad_014",
  "condition1": "CHOICE 01 A「期待を裏切れない。全部受けて、夜も作ろう」",
  "raw_body": "期待に応えようと、予定を超える注文を全部引き受けた。商品はそろった。けれど主人公は無理を重ねて倒れ、店は予定どおり開けられなくなった。全部売ることと、明日も店を続けられることは同じではない。",
  "raw_comment": "「売り切れるより、あんたがちゃんと店におる方が大事や。ウチ、一人で世界一なっても嬉しないで」",
  "body1": "期待に応えようと、予定を超える注文を全部引き受けた。商品はそろっ",
  "body2": "た。けれど主人公は無理を重ねて倒れ、店は予定どおり開けられなくなっ",
  "body3": "た。全部売ることと、明日も店を続けられることは同じではない。",
  "comment": "「売り切れるより、あんたがちゃんと店におる方が大事や。ウチ、一人で",
  "comment2": "世界一なっても嬉しないで」"
 },
 "mini_m06": {
  "title": "M06｜予約票タワー",
  "classification": "MINI BAD",
  "flag": "mini_bad_m06",
  "condition1": "CHOICE 00 A「予約票を目立つところに全部貼ろう」",
  "raw_body": "予約票を全部目立つところに貼った。目立ちすぎて、肝心の受け取り日がどこにあるのか分からなくなった。",
  "raw_comment": "「目立つことと、見つけやすいことは違うんやな……」",
  "body1": "予約票を全部目立つところに貼った。目立ちすぎて、肝心の受け取り日が",
  "body2": "どこにあるのか分からなくなった。",
  "comment": "「目立つことと、見つけやすいことは違うんやな……」",
  "comment2": ""
 },
 "mini_m07": {
  "title": "M07｜リボンの迷宮",
  "classification": "MINI BAD",
  "flag": "mini_bad_m07",
  "condition1": "CHOICE 00 B「特別感を出すため、全部の箱にリボンを何重にも結ぼう」",
  "raw_body": "特別な包装にしようとリボンを重ねた。見た目は豪華になったが、包むのも開けるのも一苦労。肝心のお菓子を用意する時間がなくなった。",
  "raw_comment": "「中身より箱に時間かけたら、何屋か分からんくなるわ……」",
  "body1": "特別な包装にしようとリボンを重ねた。見た目は豪華になったが、包むの",
  "body2": "も開けるのも一苦労。肝心のお菓子を用意する時間がなくなった。",
  "comment": "「中身より箱に時間かけたら、何屋か分からんくなるわ……」",
  "comment2": ""
 },
 "december_clear": {
  "title": "12月 CLEAR『明日も仕込みができるように』",
  "classification": "月間クリア",
  "flag": "normal_ch12_clear",
  "condition1": "",
  "raw_body": "クリスマスの注文は、予想以上に増えた。全部を引き受ければ、数字はもっと伸びたかもしれない。けれど二人は、作れる数を守り、足りない分は日を改めて相談した。完売して終わりではない。来年も同じ厨房で作るために、休むことも店の仕事なのだと知った。",
  "raw_comment": "「世界一になっても、次の日にウチらがおらへんかったら意味ないもんな。明日も作れる店にしよ！」",
  "body1": "クリスマスの注文は、予想以上に増えた。全部を引き受ければ、数字はも",
  "body2": "っと伸びたかもしれない。けれど二人は、作れる数を守り、足りない分は",
  "body3": "日を改めて相談した。完売して終わりではない。来年も同じ厨房で作るた",
  "body4": "めに、休むことも店の仕事なのだと知った。",
  "comment": "「世界一になっても、次の日にウチらがおらへんかったら意味ないもん",
  "comment2": "な。明日も作れる店にしよ！」"
 }
};
Object.keys(decemberArchiveMap).forEach(function (key) {
 var item = decemberArchiveMap[key];
 item.status = sf[item.flag] === true ? (key === "december_clear" ? "達成済み" : "回収済み") : "";
 f["december_record_list_"+key] = item.status ? item.title : "？？？";
});
var novemberArchiveMap = {
 "core_012": {
  "title": "BAD012｜神様の言うとおり",
  "classification": "CORE BAD",
  "flag": "core_bad_012",
  "condition1": "CHOICE 01 A「女神様のお言葉を、そのまま正解にしよう」",
  "body1": "女神の言葉は正しかった。けれど、そこに「考えなくていい」という意味",
  "body2": "まで付け足してしまった。",
  "body3": "お客様の声も、新しい試作も、店が前に進むための工夫も止まった。",
  "body4": "神様を信じることと、自分たちの判断を手放すことは違う。",
  "comment": "「神様が何も言わへん日にも、ウチらの店は開けなあかんねんな」",
  "comment2": ""
 },
 "core_013": {
  "title": "BAD013｜深読みしすぎ",
  "classification": "CORE BAD",
  "flag": "core_bad_013",
  "condition1": "CHOICE 01 B「この言葉には、隠された条件があるはず」",
  "body1": "世界一の条件に、隠された暗号があると思い込んだ。",
  "body2": "女神の何気ない言葉まで特別な指示に見え、まだ存在しない答えを探し続",
  "body3": "けた。",
  "body4": "その間に、今日の店と明日の仕込みが後回しになっていた。",
  "body5": "分からないことは、まず聞けばよかった。",
  "comment": "「神様の言葉、難しいんとちゃう。ウチらが勝手に難しくしてたんやな」",
  "comment2": ""
 },
 "mini_m04": {
  "title": "M04｜神様へのお供え物",
  "classification": "MINI BAD",
  "flag": "mini_bad_m04",
  "condition1": "CHOICE 00 A「まずはエクレアでご機嫌を取ろう」",
  "body1": "女神様に気持ちよく答えてもらおうと、抹茶エクレアを次々に差し出し",
  "body2": "た。",
  "body3": "おもてなしは大成功。でも、聞きたかったことは一つも聞けなかった。",
  "comment": "「喜んでもろえたんはええけど、何しに来てもろたんやっけ……」",
  "comment2": ""
 },
 "mini_m05": {
  "title": "M05｜神託FAQ・全108問",
  "classification": "MINI BAD",
  "flag": "mini_bad_m05",
  "condition1": "CHOICE 00 B「聞き漏らし防止に108問用意しよう」",
  "body1": "説明不足を防ごうと、質問を百八個も用意した。",
  "body2": "ところが肝心の条件を聞く前に、店の営業時間が始まってしまった。",
  "comment": "「質問にも優先順位があるんやな。百八個はさすがに多いわ……」",
  "comment2": ""
 },
 "november_clear": {
  "title": "11月 CLEAR『神様の言葉、ウチらの答え』",
  "classification": "月間クリア",
  "flag": "normal_ch11_clear",
  "condition1": "",
  "body1": "女神が再び店を訪れ、一年の条件について確かめた。",
  "body2": "神様の言葉だからといって、考えることをやめる必要はない。",
  "body3": "不思議な言葉だからといって、隠れた意味を探し続ける必要もない。",
  "body4": "分からないことは、聞けばいい。",
  "body5": "十一月に覚えたのは、答えを決めつける前に、問いかけることだった。",
  "comment": "「分からんまま悩むより、聞いてみた方が早いこともあるんやな」",
  "comment2": ""
 }
};
Object.keys(novemberArchiveMap).forEach(function (key) {
 var item = novemberArchiveMap[key];
 item.status = sf[item.flag] === true ? (key === "november_clear" ? "達成済み" : "回収済み") : "";
 f["november_record_list_"+key] = item.status ? item.title : "？？？";
});
var octoberArchiveMap = {
 "core_010": {
  "title": "BAD010｜世界には売れた。店から消えた。",
  "classification": "CORE BAD",
  "flag": "core_bad_010",
  "condition1": "CHOICE 01「海外で売れる形に、全部作り変えよう」",
  "body1": "海外の企画では売れた。数字も残った。",
  "body2": "けれど、売れやすさを優先して商品を変え、仕事を増やし続けた結果、",
  "body3": "Komorebiのショーケースから、いつもの抹茶エクレアが消えた。",
  "body4": "「世界に届ける」と「自分たちの店をなくす」は同じではなかった。",
  "comment": "「遠くで売れたんは嬉しい。でも、ここに来た人に出せへんかったら、何",
  "comment2": "を届けたんやろ……」"
 },
 "core_011": {
  "title": "BAD011｜伝わらなければ届かない",
  "classification": "CORE BAD",
  "flag": "core_bad_011",
  "condition1": "CHOICE 01「本物なら、説明しなくても伝わるはず」",
  "body1": "味は変えなかった。店も、いつもどおりだった。",
  "body2": "しかし、初めて知る人のための説明も、必要な情報も用意しなかった。",
  "body3": "手に取ってもらう前に、話は終わった。",
  "body4": "いいものでも、届かなければ知ってもらえない。",
  "comment": "「好きなもんほど、相手も知ってる気になってまうんやな……」",
  "comment2": ""
 },
 "october_clear": {
  "title": "10月 CLEAR『海の向こうへ、いつもの味』",
  "classification": "月間クリア",
  "flag": "normal_ch10_clear",
  "body1": "初めて、海の向こうの人へKomorebiの抹茶エクレアを説明した。",
  "body2": "知っている人には当たり前の味も、初めての人には、言葉も案内も必要だ",
  "body3": "った。",
  "body4": "伝え方は変えた。けれど、毎日店で作る味は変えなかった。",
  "body5": "十月に覚えたのは、遠くへ届けるためにも、帰ってこられる店を残すこと",
  "body6": "だった。",
  "comment": "「世界って遠いけど、まずは目の前の一人からなんやな」",
  "comment2": ""
 }
};
Object.keys(octoberArchiveMap).forEach(function (key) {
 var item = octoberArchiveMap[key];
 item.status = sf[item.flag] === true ? (key === "october_clear" ? "達成済み" : "回収済み") : "";
 f["october_record_list_"+key] = item.status ? item.title : "？？？";
});
var septemberArchiveMap = {
 core_009:{title:"BAD009｜勝ったけど負けた",classification:"CORE BAD",status:(sf.core_bad_009===true?"回収済み":""),condition1:"CHOICE 01「久世さんより売ることを最優先にしよう」",body1:"催事の数字では勝った。",body2:"売上も、完売の早さも、隣の店より上だった。",body3:"でもそのために、値段を崩し、店の仕込みを止め、",body4:"「何のために催事へ出たのか」を見失った。",body5:"相手に勝つことと、",body6:"自分たちの目的を達成することは違う。",comment:"勝ったはずやのに、ゴールから遠ざかってたら",comment2:"意味ないわな……"},
 september_clear:{title:"9月 CLEAR『店の外でも、ウチらの店』",classification:"CLEAR",status:(sf.normal_ch09_clear===true?"達成済み":""),body1:"初めて、店の外で他の店と並んだ。",body2:"数字も、行列も、売上も、",body3:"比べようと思えばいくらでも比べられた。",body4:"でも催事で持ち帰りたかったのは、勝敗ではなかった。",body5:"店を知ってくれる人。次に店へ来てくれる人。",body6:"そして、自分たちが何を届けたいのかという答え。",body7:"九月に覚えたのは、外へ出ても、",body8:"自分たちの目的を見失わないことだった。",comment:"勝つんもええけど、ウチらの店を好きになって",comment2:"もらう方が、もっと強いかもしれへんな"}
};
f.september_record_list_core_009 = sf.core_bad_009 === true ? septemberArchiveMap.core_009.title : "？？？";
f.september_record_list_clear = sf.normal_ch09_clear === true ? septemberArchiveMap.september_clear.title : "？？？";
f.august_record_list_core_008 = sf.core_bad_008 === true ? augustArchiveMap.core_008.title : "？？？";
f.august_record_list_clear = sf.normal_ch08_clear === true ? augustArchiveMap.august_clear.title : "？？？";
f.july_record_list_core_007 = sf.core_bad_007 === true ? julyArchiveMap.core_007.title : "？？？";
f.july_record_list_clear = sf.normal_ch07_clear === true ? julyArchiveMap.july_clear.title : "？？？";
f.april_record_list_core_005 = sf.core_bad_005 === true ? juneArchiveMap.core_005.title : "？？？";
f.april_record_list_core_006 = sf.core_bad_006 === true ? juneArchiveMap.core_006.title : "？？？";
f.april_record_list_june_clear = sf.normal_ch06_clear === true ? juneArchiveMap.june_clear.title : "？？？";
f.april_record_list_core_001 = (sf.core_bad_001 === true ? archiveMap.core_001.title : "？？？");
f.april_record_list_core_002 = (sf.core_bad_002 === true ? archiveMap.core_002.title : "？？？");
f.april_record_list_mini_m01 = (sf.mini_bad_m01 === true ? archiveMap.mini_m01.title : "？？？");
f.april_record_list_mini_m02 = (sf.mini_bad_m02 === true ? archiveMap.mini_m02.title : "？？？");
f.april_record_list_mini_m03 = (sf.mini_bad_m03 === true ? archiveMap.mini_m03.title : "？？？");
f.april_record_list_clear = (sf.normal_ch04_clear === true ? archiveMap.clear.title : "？？？");
f.april_record_list_core_003 = (sf.core_bad_003 === true ? mayArchiveMap.core_003.title : "？？？");
f.april_record_list_core_004 = (sf.core_bad_004 === true ? mayArchiveMap.core_004.title : "？？？");
f.april_record_list_may_clear = (sf.normal_ch05_clear === true ? mayArchiveMap.may_clear.title : "？？？");
f.april_record_detail_body3 = ""; f.april_record_detail_body4 = ""; f.april_record_detail_body5 = ""; f.april_record_detail_body6 = ""; f.april_record_detail_body7 = ""; f.april_record_detail_body8 = ""; f.april_record_detail_comment2 = ""; f.april_record_is_may_clear = false; f.april_record_is_july_bad = false; f.april_record_is_august_bad = false; f.april_record_is_august_clear = false; f.april_record_is_september_bad = false; f.april_record_is_september_clear = false; f.april_record_is_october_bad = false; f.april_record_is_october_clear = false; f.april_record_is_november_bad = false; f.april_record_is_november_clear = false; f.april_record_is_december_bad = false; f.april_record_is_december_clear = false; f.april_record_is_january_bad = false; f.april_record_is_january_clear = false; f.april_record_is_february_bad = false; f.april_record_is_february_clear = false; f.april_record_is_march = false;
if (f.april_record_month == "03" && f.april_record_tab == "CG") {
 var marchCgRecords = {
 "event_01": {
  "title": "CG15_01｜Across the Same Stage",
  "kind": "イベントCG",
  "file": "cg/march/CG15_01_Across_the_Same_Stage.png",
  "flag": "cg_march_event_01",
  "caption": "「九月は催事の隣同士。三月は、同じ決勝の舞台へ。二人とも、今度は自分たちの味で勝負する。」"
 },
 "event_02": {
  "title": "CG15_02｜The Real Pâtissier",
  "kind": "イベントCG",
  "file": "cg/march/CG15_02_The_Real_Patissier.png",
  "flag": "cg_march_event_02",
  "caption": "「『手加減はしない』。久世玲が、一個のエクレアに積み上げてきた技術のすべてを注ぎ込む。」"
 },
 "event_03": {
  "title": "CG15_03｜One Bite, One World",
  "kind": "イベントCG",
  "file": "cg/march/CG15_03_One_Bite_One_World.png",
  "flag": "cg_march_event_03",
  "caption": "「十月に言葉を整えた味を、今度は世界の人がひと口。返ってきたのは、いつもの店でも聞いた『もう一つ』だった。」"
 },
 "event_04": {
  "title": "CG15_04｜The World's Best Éclair",
  "kind": "イベントCG",
  "file": "cg/march/CG15_04_The_Worlds_Best_Eclair.png",
  "flag": "cg_march_event_04",
  "caption": "「失敗を重ね、聞いて、作り直した一年。その一個が、世界一に選ばれた。」"
 },
 "event_05": {
  "title": "CG15_05｜One Last Look",
  "kind": "イベントCG",
  "file": "cg/march/CG15_05_One_Last_Look.png",
  "flag": "cg_march_event_05",
  "caption": "「世界一になった夜、抹茶ちゃんは厨房から帰っていった。『三月が終わったら話す』という約束を残して。」"
 },
 "event_06": {
  "title": "CG15_06｜The Promise Left Unspoken",
  "kind": "イベントCG",
  "file": "cg/march/CG15_06_The_Promise_Left_Unspoken.png",
  "flag": "cg_march_event_06",
  "caption": "「世界一の店は、今日も開いている。それでも、一緒に話すはずだった言葉だけが残った。」"
 },
 "event_07": {
  "title": "CG15_07｜By Your Name",
  "kind": "イベントCG",
  "file": "cg/march/CG15_07_By_Your_Name.png",
  "flag": "cg_march_event_07",
  "caption": "「世界一になったその夜、抹茶ちゃんは初めて相棒を名前で呼んだ。答えを自分の言葉で伝えるために。」"
 },
 "event_08": {
  "title": "CG15_08｜The Day After",
  "kind": "イベントCG",
  "file": "cg/march/CG15_08_The_Day_After.png",
  "flag": "cg_march_event_08",
  "caption": "「世界一の、その次の日。いつもの厨房には、いつもの仕込みと、これからも続く日常があった。」"
 },
 "mini_01": {
  "title": "SD15_01｜優勝スピーチ三時間",
  "kind": "ミニイベントCG",
  "file": "cg/march/SD15_01_MiniBad012_Three_Hour_Speech.png",
  "flag": "cg_march_mini_01",
  "caption": "「優勝後のスピーチを練習していたら三時間。思い出が多すぎて、出品準備まで進めなかった。」"
 },
 "mini_02": {
  "title": "SD15_02｜世界一、先に印刷",
  "kind": "ミニイベントCG",
  "file": "cg/march/SD15_02_MiniBad013_Print_First.png",
  "flag": "cg_march_mini_02",
  "caption": "「優勝記念の帯紙を先に刷った。けれど世界一は、まだ誰にも決めてもらっていなかった。」"
 }
};
 var marchCgRec = marchCgRecords[f.april_record_selected] || (f.april_record_cg_category === "MINI" ? marchCgRecords.mini_01 : marchCgRecords.event_01);
 var marchCgOpened = sf[marchCgRec.flag] === true;
 f.april_record_locked = !marchCgOpened; f.april_record_detail_title = marchCgOpened ? marchCgRec.title : "？？？";
 f.april_record_detail_meta = marchCgOpened ? "分類："+marchCgRec.kind+"　｜　月：3月　｜　状態：閲覧可能" : "";
 f.april_record_detail_condition1 = ""; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = ""; f.april_record_detail_body2 = "";
 f.april_record_detail_comment = marchCgOpened ? marchCgRec.caption : ""; f.april_record_detail_note = "";
 f.april_record_cg_unlocked = marchCgOpened; f.april_record_cg_file = marchCgRec.file;
 Object.keys(marchCgRecords).forEach(function (key) {
   f["march_record_list_cg_"+key] = sf[marchCgRecords[key].flag] === true ? marchCgRecords[key].title : "？？？";
 });
} else if (f.april_record_month == "03") {
 var marchRec = marchArchiveMap[f.april_record_selected] || (f.april_record_tab === "MINI" ? marchArchiveMap.mini_m12 : marchArchiveMap.core_017);
 f.april_record_locked = marchRec.status === ""; f.april_record_detail_title = f.april_record_locked ? "？？？" : marchRec.title;
 f.april_record_detail_meta = f.april_record_locked ? "" : "分類："+marchRec.classification+"　｜　月：3月　｜　状態："+marchRec.status;
 f.april_record_detail_condition1 = ""; f.april_record_detail_condition2 = "";
 for (var marchLine=1; marchLine<=8; marchLine++) f["april_record_detail_body"+marchLine] = f.april_record_locked ? "" : (marchRec["body"+marchLine] || "");
 f.april_record_detail_comment = f.april_record_locked ? "" : marchRec.comment;
 f.april_record_detail_comment2 = f.april_record_locked ? "" : marchRec.comment2;
 f.april_record_detail_note = ""; f.april_record_is_march = true;
} else if (f.april_record_month == "02" && f.april_record_tab == "CG") {
 var februaryCgRecords = {
 "event_01": {
  "title": "CG14_01｜Whose Peace of Mind?",
  "kind": "イベントCG",
  "file": "cg/february/CG14_01_Whose_Peace_of_Mind.png",
  "flag": "cg_february_event_01",
  "caption": "「“帰れるようにしておきたい”。その優しさに、抹茶ちゃんは静かに問い返した。安心するのは、誰なのか。」"
 },
 "event_02": {
  "title": "CG14_02｜The Road We Closed",
  "kind": "イベントCG",
  "file": "cg/february/CG14_02_The_Road_We_Closed.png",
  "flag": "cg_february_event_02",
  "caption": "「帰れるようにと、ひとりで段取りを整えた。その間に、二人で世界一を目指す機会を逃してしまった。」"
 },
 "event_03": {
  "title": "CG14_03｜The Invitation to the World",
  "kind": "イベントCG",
  "file": "cg/february/CG14_03_The_Invitation_to_the_World.png",
  "flag": "cg_february_event_03",
  "caption": "「いつも一つ買って帰る客が、今日は封筒を持ってきた。Komorebiの積み重ねが、世界へ続く舞台につながった。」"
 },
 "mini_01": {
  "title": "SD14_01｜厨房まるごと荷造り",
  "kind": "ミニイベントCG",
  "file": "cg/february/SD14_01_MiniBad010_Kitchen_Packing.png",
  "flag": "cg_february_mini_01",
  "caption": "「先に荷物をまとめたら、今日の仕込みに使う泡立て器まで箱の中。結局すべて開け直すことになった。」"
 },
 "mini_02": {
  "title": "SD14_02｜お土産、誰の分？",
  "kind": "ミニイベントCG",
  "file": "cg/february/SD14_02_MiniBad011_Gifts_For_Whom.png",
  "flag": "cg_february_mini_02",
  "caption": "「帰還時のお土産を張り切って準備した。でも誰に何個渡すのか、相手が抹茶を好きかさえ確かめていなかった。」"
 }
};
 var februaryCgRec = februaryCgRecords[f.april_record_selected] || (f.april_record_cg_category === "MINI" ? februaryCgRecords.mini_01 : februaryCgRecords.event_01);
 var februaryCgOpened = sf[februaryCgRec.flag] === true;
 f.april_record_locked = !februaryCgOpened; f.april_record_detail_title = februaryCgOpened ? februaryCgRec.title : "？？？";
 f.april_record_detail_meta = februaryCgOpened ? "分類："+februaryCgRec.kind+"　｜　月：2月　｜　状態：閲覧可能" : "";
 f.april_record_detail_condition1 = ""; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = ""; f.april_record_detail_body2 = "";
 f.april_record_detail_comment = februaryCgOpened ? februaryCgRec.caption : ""; f.april_record_detail_note = "";
 f.april_record_cg_unlocked = februaryCgOpened; f.april_record_cg_file = februaryCgRec.file;
 Object.keys(februaryCgRecords).forEach(function (key) {
   f["february_record_list_cg_"+key] = sf[februaryCgRecords[key].flag] === true ? februaryCgRecords[key].title : "？？？";
 });
} else if (f.april_record_month == "02") {
 var februaryRec = februaryArchiveMap[f.april_record_selected] || (f.april_record_tab === "MINI" ? februaryArchiveMap.mini_m10 : februaryArchiveMap.core_016);
 f.april_record_locked = februaryRec.status === ""; f.april_record_detail_title = f.april_record_locked ? "？？？" : februaryRec.title;
 f.april_record_detail_meta = f.april_record_locked ? "" : "分類："+februaryRec.classification+"　｜　月：2月　｜　状態："+februaryRec.status;
 f.april_record_detail_condition1 = f.april_record_locked ? "" : (februaryRec.condition1 || ""); f.april_record_detail_condition2 = "";
 for (var februaryLine=1; februaryLine<=8; februaryLine++) f["april_record_detail_body"+februaryLine] = f.april_record_locked ? "" : (februaryRec["body"+februaryLine] || "");
 f.april_record_detail_comment = f.april_record_locked ? "" : februaryRec.comment;
 f.april_record_detail_comment2 = f.april_record_locked ? "" : februaryRec.comment2;
 f.april_record_detail_note = "";
 f.april_record_is_february_bad = f.april_record_selected !== "february_clear";
 f.april_record_is_february_clear = f.april_record_selected === "february_clear";
} else if (f.april_record_month == "01" && f.april_record_tab == "CG") {
 var januaryCgRecords = {
 "event_01": {
  "title": "CG13_01｜The Five Columns",
  "kind": "イベントCG",
  "file": "cg/january/CG13_01_The_Five_Columns.png",
  "flag": "cg_january_event_01",
  "caption": "五つの欄に点数を書き込む。その横で、三好さんは“お茶と一緒に食べるのが好き”と微笑んだ。"
 },
 "event_02": {
  "title": "CG13_02｜A Perfect Score, An Empty Smile",
  "kind": "イベントCG",
  "file": "cg/january/CG13_02_A_Perfect_Score_An_Empty_Smile.png",
  "flag": "cg_january_event_02",
  "caption": "採点表では百点だった。それなのに、『また食べたい』と笑う声が遠くなっていた。"
 },
 "event_03": {
  "title": "CG13_03｜Beyond the Score",
  "kind": "イベントCG",
  "file": "cg/january/CG13_03_Beyond_the_Score.png",
  "flag": "cg_january_event_03",
  "caption": "点数の横にひとこと書く欄を作った。そこには、また食べたいと思う理由があった。"
 },
 "mini_01": {
  "title": "SD13_01｜試食アンケート十二枚",
  "kind": "ミニイベントCG",
  "file": "cg/january/SD13_01_MiniBad008_Survey_12_Pages.png",
  "flag": "cg_january_mini_01",
  "caption": "試食アンケートを十二枚に増やした。書き終える頃には、食べる時間より回答する時間の方が長くなっていた。"
 },
 "mini_02": {
  "title": "SD13_02｜理想温度、あと0.1℃",
  "kind": "ミニイベントCG",
  "file": "cg/january/SD13_02_MiniBad009_Zero_Point_One_Degree.png",
  "flag": "cg_january_mini_02",
  "caption": "0.1℃刻みで調整を続け、温度は完璧になった。けれど、お客さんに渡すタイミングを逃してしまった。"
 }
};
 var januaryCgRec = januaryCgRecords[f.april_record_selected] || (f.april_record_cg_category === "MINI" ? januaryCgRecords.mini_01 : januaryCgRecords.event_01);
 var januaryCgOpened = sf[januaryCgRec.flag] === true;
 f.april_record_locked = !januaryCgOpened; f.april_record_detail_title = januaryCgOpened ? januaryCgRec.title : "？？？";
 f.april_record_detail_meta = januaryCgOpened ? "分類："+januaryCgRec.kind+"　｜　月：1月　｜　状態：閲覧可能" : "";
 f.april_record_detail_condition1 = ""; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = ""; f.april_record_detail_body2 = "";
 f.april_record_detail_comment = januaryCgOpened ? januaryCgRec.caption : ""; f.april_record_detail_note = "";
 f.april_record_cg_unlocked = januaryCgOpened; f.april_record_cg_file = januaryCgRec.file;
 Object.keys(januaryCgRecords).forEach(function (key) {
   f["january_record_list_cg_"+key] = sf[januaryCgRecords[key].flag] === true ? januaryCgRecords[key].title : "？？？";
 });
} else if (f.april_record_month == "01") {
 var januaryRec = januaryArchiveMap[f.april_record_selected] || (f.april_record_tab === "MINI" ? januaryArchiveMap.mini_m08 : januaryArchiveMap.core_015);
 f.april_record_locked = januaryRec.status === ""; f.april_record_detail_title = f.april_record_locked ? "？？？" : januaryRec.title;
 f.april_record_detail_meta = f.april_record_locked ? "" : "分類："+januaryRec.classification+"　｜　月：1月　｜　状態："+januaryRec.status;
 f.april_record_detail_condition1 = f.april_record_locked ? "" : (januaryRec.condition1 || ""); f.april_record_detail_condition2 = "";
 for (var januaryLine=1; januaryLine<=8; januaryLine++) f["april_record_detail_body"+januaryLine] = f.april_record_locked ? "" : (januaryRec["body"+januaryLine] || "");
 f.april_record_detail_comment = f.april_record_locked ? "" : januaryRec.comment;
 f.april_record_detail_comment2 = f.april_record_locked ? "" : januaryRec.comment2;
 f.april_record_detail_note = "";
 f.april_record_is_january_bad = f.april_record_selected !== "january_clear";
 f.april_record_is_january_clear = f.april_record_selected === "january_clear";
} else if (f.april_record_month == "12" && f.april_record_tab == "CG") {
 var decemberCgRecords = {
 "event_01": {
  "title": "CG12_01｜Just One More Order",
  "kind": "イベントCG",
  "file": "cg/december/CG12_01_Just_One_More_Order.png",
  "flag": "cg_december_event_01",
  "caption": "嬉しい注文が届いた。けれど“もう少しだけ頑張る”という言葉が、明日をなくしてしまうこともある。"
 },
 "event_02": {
  "title": "CG12_02｜Sold Out, Then Collapse",
  "kind": "イベントCG",
  "file": "cg/december/CG12_02_Sold_Out_Then_Collapse.png",
  "flag": "cg_december_event_02",
  "caption": "全部そろえた。けれど、その先の“明日”を置き去りにしてしまった。"
 },
 "event_03": {
  "title": "CG12_03｜The Last Customer of the Year",
  "kind": "イベントCG",
  "file": "cg/december/CG12_03_The_Last_Customer_of_the_Year.png",
  "flag": "cg_december_event_03",
  "caption": "今年最後のお客さんに、最後の二つを渡した。ちゃんと作って、ちゃんと終われた一日だった。"
 },
 "mini_01": {
  "title": "SD12_01｜予約票タワー",
  "kind": "ミニイベントCG",
  "file": "cg/december/SD12_01_MiniBad006_Reservation_Tower.png",
  "flag": "cg_december_mini_01",
  "caption": "予約票を全部目立つところに貼った。目立ちすぎて、肝心の受け取り日がどこにあるのか分からなくなった。"
 },
 "mini_02": {
  "title": "SD12_02｜リボンの迷宮",
  "kind": "ミニイベントCG",
  "file": "cg/december/SD12_02_MiniBad007_Ribbon_Maze.png",
  "flag": "cg_december_mini_02",
  "caption": "特別な包装にしようとリボンを重ねた。見た目は豪華になったが、包むのも開けるのも一苦労だった。"
 }
};
 var decemberCgRec = decemberCgRecords[f.april_record_selected] || (f.april_record_cg_category === "MINI" ? decemberCgRecords.mini_01 : decemberCgRecords.event_01);
 var decemberCgOpened = sf[decemberCgRec.flag] === true;
 f.april_record_locked = !decemberCgOpened; f.april_record_detail_title = decemberCgOpened ? decemberCgRec.title : "？？？";
 f.april_record_detail_meta = decemberCgOpened ? "分類："+decemberCgRec.kind+"　｜　月：12月　｜　状態：閲覧可能" : "";
 f.april_record_detail_condition1 = ""; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = ""; f.april_record_detail_body2 = "";
 f.april_record_detail_comment = decemberCgOpened ? decemberCgRec.caption : ""; f.april_record_detail_note = "";
 f.april_record_cg_unlocked = decemberCgOpened; f.april_record_cg_file = decemberCgRec.file;
 Object.keys(decemberCgRecords).forEach(function (key) {
   f["december_record_list_cg_"+key] = sf[decemberCgRecords[key].flag] === true ? decemberCgRecords[key].title : "？？？";
 });
} else if (f.april_record_month == "12") {
 var decemberRec = decemberArchiveMap[f.april_record_selected] || (f.april_record_tab === "MINI" ? decemberArchiveMap.mini_m06 : decemberArchiveMap.core_014);
 f.april_record_locked = decemberRec.status === ""; f.april_record_detail_title = f.april_record_locked ? "？？？" : decemberRec.title;
 f.april_record_detail_meta = f.april_record_locked ? "" : "分類："+decemberRec.classification+"　｜　月：12月　｜　状態："+decemberRec.status;
 f.april_record_detail_condition1 = f.april_record_locked ? "" : (decemberRec.condition1 || ""); f.april_record_detail_condition2 = "";
 for (var decemberLine=1; decemberLine<=8; decemberLine++) f["april_record_detail_body"+decemberLine] = f.april_record_locked ? "" : (decemberRec["body"+decemberLine] || "");
 f.april_record_detail_comment = f.april_record_locked ? "" : decemberRec.comment;
 f.april_record_detail_comment2 = f.april_record_locked ? "" : decemberRec.comment2;
 f.april_record_detail_note = "";
 f.april_record_is_december_bad = f.april_record_selected !== "december_clear";
 f.april_record_is_december_clear = f.april_record_selected === "december_clear";
} else if (f.april_record_month == "11" && f.april_record_tab == "CG") {
 var novemberCgRecords = {
 "event_01": {
  "title": "CG11_01｜She Really Came",
  "kind": "イベントCG",
  "file": "cg/november/CG11_01_She_Really_Came.png",
  "flag": "cg_november_event_01",
  "caption": "説明不足やとこぼしたその瞬間、女神様は本当に現れた。十一月は、まず「聞くこと」から始まる。"
 },
 "event_02": {
  "title": "CG11_02｜A Goddess Is Also a Customer",
  "kind": "イベントCG",
  "file": "cg/november/CG11_02_A_Goddess_Is_Also_a_Customer.png",
  "flag": "cg_november_event_02",
  "caption": "神様も、お客さんだった。抹茶エクレアをひと口食べたその声で、今の味がちゃんと届いたと分かった。"
 },
 "mini_01": {
  "title": "SD11_01｜神様へのお供え物",
  "kind": "ミニイベントCG",
  "file": "cg/november/SD11_01_MiniBad004_Offering_for_the_Goddess.png",
  "flag": "cg_november_mini_01",
  "caption": "女神様に気持ちよく答えてもらおうとして、お菓子を出しすぎた。喜んでもらえたけれど、聞きたかったことは一つも聞けなかった。"
 },
 "mini_02": {
  "title": "SD11_02｜神託FAQ・全108問",
  "kind": "ミニイベントCG",
  "file": "cg/november/SD11_02_MiniBad005_FAQ108.png",
  "flag": "cg_november_mini_02",
  "caption": "聞き漏らしを防ごうとして、質問を百八個も用意した。けれど大事なことを聞く前に、店の時間が始まってしまった。"
 }
};
 var novemberCgRec = novemberCgRecords[f.april_record_selected] || (f.april_record_cg_category === "MINI" ? novemberCgRecords.mini_01 : novemberCgRecords.event_01);
 var novemberCgOpened = sf[novemberCgRec.flag] === true;
 f.april_record_locked = !novemberCgOpened; f.april_record_detail_title = novemberCgOpened ? novemberCgRec.title : "？？？";
 f.april_record_detail_meta = novemberCgOpened ? "分類："+novemberCgRec.kind+"　｜　月：11月　｜　状態：閲覧可能" : "";
 f.april_record_detail_condition1 = ""; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = ""; f.april_record_detail_body2 = "";
 f.april_record_detail_comment = novemberCgOpened ? novemberCgRec.caption : ""; f.april_record_detail_note = "";
 f.april_record_cg_unlocked = novemberCgOpened; f.april_record_cg_file = novemberCgRec.file;
 Object.keys(novemberCgRecords).forEach(function (key) {
   f["november_record_list_cg_"+key] = sf[novemberCgRecords[key].flag] === true ? novemberCgRecords[key].title : "？？？";
 });
} else if (f.april_record_month == "11") {
 var novemberRec = novemberArchiveMap[f.april_record_selected] || (f.april_record_tab === "MINI" ? novemberArchiveMap.mini_m04 : novemberArchiveMap.core_012);
 f.april_record_locked = novemberRec.status === ""; f.april_record_detail_title = f.april_record_locked ? "？？？" : novemberRec.title;
 f.april_record_detail_meta = f.april_record_locked ? "" : "分類："+novemberRec.classification+"　｜　月：11月　｜　状態："+novemberRec.status;
 f.april_record_detail_condition1 = f.april_record_locked ? "" : (novemberRec.condition1 || ""); f.april_record_detail_condition2 = "";
 for (var novemberLine=1; novemberLine<=8; novemberLine++) f["april_record_detail_body"+novemberLine] = f.april_record_locked ? "" : (novemberRec["body"+novemberLine] || "");
 f.april_record_detail_comment = f.april_record_locked ? "" : novemberRec.comment;
 f.april_record_detail_comment2 = f.april_record_locked ? "" : novemberRec.comment2;
 f.april_record_detail_note = "";
 f.april_record_is_november_bad = f.april_record_selected !== "november_clear";
 f.april_record_is_november_clear = f.april_record_selected === "november_clear";
} else if (f.april_record_month == "10" && f.april_record_tab == "CG") {
 var octoberCgRecords = {
 "event_01": {
  "title": "CG10_01｜The Dark Emperor's Notebook",
  "kind": "イベントCG",
  "file": "cg/october/CG10_01_The_Dark_Emperors_Notebook.png",
  "flag": "cg_october_event_01",
  "caption": "秋のベンチで見つけた秘密のノート。神田ちゃんには、誰にも見せていなかった世界があった。"
 },
 "event_02": {
  "title": "CG10_02｜Words for a New World",
  "kind": "イベントCG",
  "file": "cg/october/CG10_02_Words_for_a_New_World.png",
  "flag": "cg_october_event_02",
  "caption": "味はそのまま。遠くの誰かにも伝わるように、一枚のカードへ言葉を選んだ。"
 },
 "event_03": {
  "title": "CG10_03｜A Taste Beyond the Sea",
  "kind": "イベントCG",
  "file": "cg/october/CG10_03_A_Taste_Beyond_the_Sea.png",
  "flag": "cg_october_event_03",
  "caption": "海の向こうから来た一人が、いつもの抹茶エクレアを口にする。言葉にした香りが、ようやく届いた。"
 },
 "mini_01": {
  "title": "SD10_01｜世界には売れた。店から消えた。",
  "kind": "ミニイベントCG",
  "file": "cg/october/SD10_01_Bad010_Overseas_But_Gone.png",
  "flag": "cg_october_mini_01",
  "caption": "遠くの企画では売れた。しかし、そのためにKomorebiのショーケースから、いつもの味が消えた。"
 },
 "mini_02": {
  "title": "SD10_02｜伝わらなければ届かない",
  "kind": "ミニイベントCG",
  "file": "cg/october/SD10_02_Bad011_Not_Communicated.png",
  "flag": "cg_october_mini_02",
  "caption": "いつもの味を守った。でも、必要な説明を届けなかったため、食べてもらう前に話が止まった。"
 }
};
 var octoberCgRec = octoberCgRecords[f.april_record_selected] || (f.april_record_cg_category === "MINI" ? octoberCgRecords.mini_01 : octoberCgRecords.event_01);
 var octoberCgOpened = sf[octoberCgRec.flag] === true;
 f.april_record_locked = !octoberCgOpened; f.april_record_detail_title = octoberCgOpened ? octoberCgRec.title : "？？？";
 f.april_record_detail_meta = octoberCgOpened ? "分類："+octoberCgRec.kind+"　｜　月：10月　｜　状態：閲覧可能" : "";
 f.april_record_detail_condition1 = ""; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = ""; f.april_record_detail_body2 = "";
 f.april_record_detail_comment = octoberCgOpened ? octoberCgRec.caption : ""; f.april_record_detail_note = "";
 f.april_record_cg_unlocked = octoberCgOpened; f.april_record_cg_file = octoberCgRec.file;
 Object.keys(octoberCgRecords).forEach(function (key) {
   f["october_record_list_cg_"+key] = sf[octoberCgRecords[key].flag] === true ? octoberCgRecords[key].title : "？？？";
 });
} else if (f.april_record_month == "10" && f.april_record_tab == "MINI") {
 f.april_record_locked = false; f.april_record_detail_title = "10月のMINI BAD"; f.april_record_detail_meta = "分類：MINI BAD　｜　月：10月　｜　状態：なし";
 f.april_record_detail_condition1 = "10月のシナリオにMINI BADはありません。"; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = "10月の失敗はCORE BADに記録されます。"; f.april_record_detail_body2 = "";
 f.april_record_detail_comment = ""; f.april_record_detail_note = ""; f.april_record_selected = "october_mini_none";
} else if (f.april_record_month == "10") {
 var octoberRec = octoberArchiveMap[f.april_record_selected] || octoberArchiveMap.core_010;
 f.april_record_locked = octoberRec.status === ""; f.april_record_detail_title = f.april_record_locked ? "？？？" : octoberRec.title;
 f.april_record_detail_meta = f.april_record_locked ? "" : "分類："+octoberRec.classification+"　｜　月：10月　｜　状態："+octoberRec.status;
 f.april_record_detail_condition1 = f.april_record_locked ? "" : (octoberRec.condition1 || ""); f.april_record_detail_condition2 = "";
 for (var octoberLine=1; octoberLine<=8; octoberLine++) f["april_record_detail_body"+octoberLine] = f.april_record_locked ? "" : (octoberRec["body"+octoberLine] || "");
 f.april_record_detail_comment = f.april_record_locked ? "" : octoberRec.comment;
 f.april_record_detail_comment2 = f.april_record_locked ? "" : octoberRec.comment2;
 f.april_record_detail_note = "";
 f.april_record_is_october_bad = f.april_record_selected === "core_010" || f.april_record_selected === "core_011";
 f.april_record_is_october_clear = f.april_record_selected === "october_clear";
} else if (f.april_record_month == "09" && f.april_record_tab == "CG") {
 var septemberCgRecords = {
  event_01:{title:"CG09_01｜The Professional Next Door",kind:"イベントCG",file:"cg/september/CG09_01_The_Professional_Next_Door.png",flag:"cg_september_event_01",caption:"初めての催事。その隣にいたのは、仕事のすべてが一段先を行く「本物のプロ」だった。"},
  event_02:{title:"CG09_02｜A Way Back to Komorebi",kind:"イベントCG",file:"cg/september/CG09_02_A_Way_Back_to_Komorebi.png",flag:"cg_september_event_02",caption:"催事で出会った一人の客へ、Komorebiへ続く小さなカードを手渡す。"},
  event_03:{title:"CG09_03｜What Do You Want to Sell?",kind:"イベントCG",file:"cg/september/CG09_03_What_Do_You_Want_to_Sell.png",flag:"cg_september_event_03",caption:"「あなたたちは何を売りたいの？」。久世の問いが、勝敗の向こうにある目的を思い出させる。"},
  mini_01:{title:"SD09_01｜勝ったけど負けた",kind:"ミニイベントCG",file:"cg/september/SD09_01_Bad009_Won_But_Lost.png",flag:"cg_september_mini_01",caption:"売上では勝った。完売も早かった。それでも、自分たちのゴールからは遠ざかっていた。"}
 };
 var septemberCgRec = septemberCgRecords[f.april_record_selected] || (f.april_record_cg_category == "MINI" ? septemberCgRecords.mini_01 : septemberCgRecords.event_01);
 var septemberCgOpened = sf[septemberCgRec.flag] === true;
 f.april_record_locked = !septemberCgOpened; f.april_record_detail_title = septemberCgOpened ? septemberCgRec.title : "？？？";
 f.april_record_detail_meta = septemberCgOpened ? "分類："+septemberCgRec.kind+"　｜　月：9月　｜　状態：閲覧可能" : "";
 f.april_record_detail_condition1 = ""; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = ""; f.april_record_detail_body2 = "";
 f.april_record_detail_comment = septemberCgOpened ? septemberCgRec.caption : ""; f.april_record_detail_note = "";
 f.april_record_cg_unlocked = septemberCgOpened; f.april_record_cg_file = septemberCgRec.file;
 f.september_record_list_cg_event_01 = sf.cg_september_event_01 === true ? septemberCgRecords.event_01.title : "？？？";
 f.september_record_list_cg_event_02 = sf.cg_september_event_02 === true ? septemberCgRecords.event_02.title : "？？？";
 f.september_record_list_cg_event_03 = sf.cg_september_event_03 === true ? septemberCgRecords.event_03.title : "？？？";
 f.september_record_list_cg_mini_01 = sf.cg_september_mini_01 === true ? septemberCgRecords.mini_01.title : "？？？";
} else if (f.april_record_month == "09" && f.april_record_tab == "MINI") {
 f.april_record_locked = false; f.april_record_detail_title = "9月のMINI BAD"; f.april_record_detail_meta = "分類：MINI BAD　｜　月：9月　｜　状態：なし";
 f.april_record_detail_condition1 = "9月のシナリオにMINI BADはありません。"; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = "9月の失敗はCORE BADに記録されます。"; f.april_record_detail_body2 = "";
 f.april_record_detail_comment = "失敗の形も、月ごとに違うんやな。"; f.april_record_detail_note = ""; f.april_record_selected = "september_mini_none";
} else if (f.april_record_month == "09") {
 var septemberRec = septemberArchiveMap[f.april_record_selected] || septemberArchiveMap.core_009;
 f.april_record_locked = septemberRec.status === ""; f.april_record_detail_title = f.april_record_locked ? "？？？" : septemberRec.title;
 f.april_record_detail_meta = f.april_record_locked ? "" : "分類："+septemberRec.classification+"　｜　月：9月　｜　状態："+septemberRec.status;
 f.april_record_detail_condition1 = f.april_record_locked ? "" : (septemberRec.condition1 || ""); f.april_record_detail_condition2 = "";
 for (var septemberLine=1; septemberLine<=8; septemberLine++) f["april_record_detail_body"+septemberLine] = f.april_record_locked ? "" : (septemberRec["body"+septemberLine] || "");
 f.april_record_detail_comment = f.april_record_locked ? "" : septemberRec.comment; f.april_record_detail_comment2 = f.april_record_locked ? "" : septemberRec.comment2;
 f.april_record_detail_note = "";
 f.april_record_is_september_bad = f.april_record_selected == "core_009";
 f.april_record_is_september_clear = f.april_record_selected == "september_clear";
} else if (f.april_record_month == "08" && f.april_record_tab == "CG") {
 var augustCgRecords = {
  event_01:{title:"CG08_01｜From the Post to the Shop",kind:"イベントCG",file:"cg/august/CG08_01_From_the_Post_to_the_Shop.png",flag:"cg_august_event_01",caption:"SNSの向こうにいた「一人」が店を訪れ、バズが初めて実際の来店へとつながる。"},
  event_02:{title:"CG08_02｜The Morning After the Buzz",kind:"イベントCG",file:"cg/august/CG08_02_The_Morning_After_the_Buzz.png",flag:"cg_august_event_02",caption:"派手な数字が過ぎた翌朝。それでも店は開き、いつもの一日がまた始まる。"},
  mini_01:{title:"SD08_01｜一夜の世界一",kind:"ミニイベントCG",file:"cg/august/SD08_01_Bad008_One_Night_Number_One.png",flag:"cg_august_mini_01",caption:"一晩だけ数字も客足も頂点へ。しかし熱狂の翌朝、店に残ったものはあまりにも少なかった。"}
 };
 var augustCgRec = augustCgRecords[f.april_record_selected] || (f.april_record_cg_category == "MINI" ? augustCgRecords.mini_01 : augustCgRecords.event_01);
 var augustCgOpened = sf[augustCgRec.flag] === true;
 f.april_record_locked = !augustCgOpened; f.april_record_detail_title = augustCgOpened ? augustCgRec.title : "？？？";
 f.april_record_detail_meta = augustCgOpened ? "分類："+augustCgRec.kind+"　｜　月：8月　｜　状態：閲覧可能" : "";
 f.april_record_detail_condition1 = ""; f.april_record_detail_condition2 = ""; f.april_record_detail_body1 = ""; f.april_record_detail_body2 = "";
 f.april_record_detail_comment = augustCgOpened ? augustCgRec.caption : ""; f.april_record_detail_note = ""; f.april_record_cg_unlocked = augustCgOpened; f.april_record_cg_file = augustCgRec.file;
 f.august_record_list_cg_event_01 = sf.cg_august_event_01 === true ? augustCgRecords.event_01.title : "？？？";
 f.august_record_list_cg_event_02 = sf.cg_august_event_02 === true ? augustCgRecords.event_02.title : "？？？";
 f.august_record_list_cg_mini_01 = sf.cg_august_mini_01 === true ? augustCgRecords.mini_01.title : "？？？";
} else if (f.april_record_month == "08" && f.april_record_tab == "MINI") {
 f.april_record_locked = false; f.april_record_detail_title = "8月のMINI BAD"; f.april_record_detail_meta = "分類：MINI BAD　｜　月：8月　｜　状態：なし";
 f.april_record_detail_condition1 = "8月のシナリオにMINI BADはありません。"; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = "8月の失敗はCORE BADに記録されます。"; f.april_record_detail_body2 = "";
 f.april_record_detail_comment = "失敗の形も、月ごとに違うんやな。"; f.april_record_detail_note = ""; f.april_record_selected = "august_mini_none";
} else if (f.april_record_month == "08") {
 var augustRec = augustArchiveMap[f.april_record_selected] || augustArchiveMap.core_008;
 f.april_record_locked = augustRec.status === ""; f.april_record_detail_title = f.april_record_locked ? "？？？" : augustRec.title;
 f.april_record_detail_meta = f.april_record_locked ? "" : "分類："+augustRec.classification+"　｜　月：8月　｜　状態："+augustRec.status;
 f.april_record_detail_condition1 = f.april_record_locked ? "" : augustRec.condition1; f.april_record_detail_condition2 = "";
 for (var augustLine=1; augustLine<=7; augustLine++) f["april_record_detail_body"+augustLine] = f.april_record_locked ? "" : (augustRec["body"+augustLine] || "");
 f.april_record_detail_comment = f.april_record_locked ? "" : augustRec.comment; f.april_record_detail_comment2 = f.april_record_locked ? "" : augustRec.comment2;
 f.april_record_detail_note = "";
 f.april_record_is_august_bad = f.april_record_selected == "core_008";
 f.april_record_is_august_clear = f.april_record_selected == "august_clear";
} else if (f.april_record_month == "07" && f.april_record_tab == "CG") {
 var julyCgRecords = {
  event_01:{title:"CG07_01｜What Makes an Eclair?",kind:"イベントCG",file:"cg/july/CG07_01_What_Makes_an_Eclair.png",flag:"cg_july_event_01",caption:"三好の言葉から、抹茶ちゃんが「変えていいもの」と「残したいもの」を考える。"},
  event_02:{title:"CG07_02｜Cold, But Still an Eclair",kind:"イベントCG",file:"cg/july/CG07_02_Cold_But_Still_an_Eclair.png",flag:"cg_july_event_02",caption:"夏仕様をひと口。神田の「ちゃんとエクレアです」が、改良の答えになる。"},
  mini_01:{title:"SD07_01｜それ、もうエクレアちゃうやん",kind:"ミニイベントCG",file:"cg/july/SD07_01_Bad007_Not_an_Eclair.png",flag:"cg_july_mini_01",caption:"夏向け改造を重ねた結果、完成したのはほぼ抹茶パフェだった。"}
 };
 var julyCgRec = julyCgRecords[f.april_record_selected] || (f.april_record_cg_category == "MINI" ? julyCgRecords.mini_01 : julyCgRecords.event_01);
 var julyCgOpened = sf[julyCgRec.flag] === true;
 f.april_record_locked = !julyCgOpened; f.april_record_detail_title = julyCgOpened ? julyCgRec.title : "？？？";
 f.april_record_detail_meta = julyCgOpened ? "分類："+julyCgRec.kind+"　｜　月：7月　｜　状態：閲覧可能" : "";
 f.april_record_detail_condition1 = ""; f.april_record_detail_condition2 = ""; f.april_record_detail_body1 = ""; f.april_record_detail_body2 = ""; f.april_record_detail_body3 = "";
 f.april_record_detail_comment = julyCgOpened ? julyCgRec.caption : ""; f.april_record_detail_note = ""; f.april_record_cg_unlocked = julyCgOpened; f.april_record_cg_file = julyCgRec.file;
 f.july_record_list_cg_event_01 = sf.cg_july_event_01 === true ? julyCgRecords.event_01.title : "？？？";
 f.july_record_list_cg_event_02 = sf.cg_july_event_02 === true ? julyCgRecords.event_02.title : "？？？";
 f.july_record_list_cg_mini_01 = sf.cg_july_mini_01 === true ? julyCgRecords.mini_01.title : "？？？";
} else if (f.april_record_month == "07" && f.april_record_tab == "MINI") {
 f.april_record_locked = false; f.april_record_detail_title = "7月のMINI BAD"; f.april_record_detail_meta = "分類：MINI BAD　｜　月：7月　｜　状態：なし";
 f.april_record_detail_condition1 = "7月のシナリオにMINI BADはありません。"; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = "7月の失敗はCORE BADに記録されます。"; f.april_record_detail_body2 = ""; f.april_record_detail_body3 = "";
 f.april_record_detail_comment = "失敗の形も、月ごとに違うんやな。"; f.april_record_detail_note = ""; f.april_record_selected = "july_mini_none";
} else if (f.april_record_month == "07") {
 var julyRec = julyArchiveMap[f.april_record_selected] || julyArchiveMap.core_007;
 f.april_record_locked = julyRec.status === ""; f.april_record_detail_title = f.april_record_locked ? "？？？" : julyRec.title;
 f.april_record_detail_meta = f.april_record_locked ? "" : "分類："+julyRec.classification+"　｜　月：7月　｜　状態："+julyRec.status;
 f.april_record_detail_condition1 = f.april_record_locked ? "" : julyRec.condition1; f.april_record_detail_condition2 = "";
 for (var julyLine=1; julyLine<=6; julyLine++) f["april_record_detail_body"+julyLine] = f.april_record_locked ? "" : (julyRec["body"+julyLine] || "");
 f.april_record_detail_comment = f.april_record_locked ? "" : julyRec.comment; f.april_record_detail_comment2 = "";
 f.april_record_detail_note = f.april_record_locked ? "" : julyRec.note;
 f.april_record_is_may_clear = f.april_record_selected == "july_clear";
 f.april_record_is_july_bad = f.april_record_selected == "core_007";
} else if (f.april_record_month == "06" && f.april_record_tab == "CG") {
 var juneCgRecords = {
  event_01:{title:"CG06_01｜What to Change, What to Keep",kind:"イベントCG",file:"cg/june/CG06_01_What_to_Change_What_to_Keep.png",flag:"cg_june_event_01",caption:"二人の声から、変えるものと残すものを考えた。"},
  event_02:{title:"CG06_02｜Two, Please",kind:"イベントCG",file:"cg/june/CG06_02_Two_Please.png",flag:"cg_june_event_02",caption:"友達の分も、もう一個。手の届く一個が増えた。"},
  mini_01:{title:"SD06_01｜原価率100％",kind:"ミニイベントCG",file:"cg/june/SD06_01_Bad005_Cost_100.png",flag:"cg_june_mini_01",caption:"売れたのに利益が残らない、成功の顔をした失敗。"},
  mini_02:{title:"SD06_02｜一個が遠い",kind:"ミニイベントCG",file:"cg/june/SD06_02_Bad006_Too_Far.png",flag:"cg_june_mini_02",caption:"値段が高すぎて、手を伸ばせなかった一個。"}
 };
 var juneCgRec = juneCgRecords[f.april_record_selected] || (f.april_record_cg_category == "MINI" ? juneCgRecords.mini_01 : juneCgRecords.event_01);
 var juneCgOpened = sf[juneCgRec.flag] === true;
 f.april_record_locked = !juneCgOpened; f.april_record_detail_title = juneCgOpened ? juneCgRec.title : "？？？";
 f.april_record_detail_meta = juneCgOpened ? "分類："+juneCgRec.kind+"　｜　月：6月　｜　状態：閲覧可能" : "";
 f.april_record_detail_condition1 = ""; f.april_record_detail_condition2 = ""; f.april_record_detail_body1 = ""; f.april_record_detail_body2 = ""; f.april_record_detail_body3 = "";
 f.april_record_detail_comment = juneCgOpened ? juneCgRec.caption : ""; f.april_record_detail_note = ""; f.april_record_cg_unlocked = juneCgOpened; f.april_record_cg_file = juneCgRec.file;
 f.june_record_list_cg_event_01 = sf.cg_june_event_01 === true ? juneCgRecords.event_01.title : "？？？";
 f.june_record_list_cg_event_02 = sf.cg_june_event_02 === true ? juneCgRecords.event_02.title : "？？？";
 f.june_record_list_cg_mini_01 = sf.cg_june_mini_01 === true ? juneCgRecords.mini_01.title : "？？？";
 f.june_record_list_cg_mini_02 = sf.cg_june_mini_02 === true ? juneCgRecords.mini_02.title : "？？？";
} else if (f.april_record_month == "06" && f.april_record_tab == "MINI") {
 f.april_record_locked = false; f.april_record_detail_title = "6月のMINI BAD"; f.april_record_detail_meta = "分類：MINI BAD　｜　月：6月　｜　状態：なし";
 f.april_record_detail_condition1 = "6月のシナリオにMINI BADはありません。"; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = "6月の失敗はCORE BADに記録されます。"; f.april_record_detail_body2 = ""; f.april_record_detail_body3 = "";
 f.april_record_detail_comment = "失敗の形も、月ごとに違うんやな。"; f.april_record_detail_note = ""; f.april_record_selected = "june_mini_none";
} else if (f.april_record_month == "06") {
 var juneRec = juneArchiveMap[f.april_record_selected] || juneArchiveMap.core_005;
 f.april_record_locked = juneRec.status === ""; f.april_record_detail_title = f.april_record_locked ? "？？？" : juneRec.title;
 f.april_record_detail_meta = f.april_record_locked ? "" : "分類："+juneRec.classification+"　｜　月：6月　｜　状態："+juneRec.status;
 f.april_record_detail_condition1 = f.april_record_locked ? "" : juneRec.condition1; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = f.april_record_locked ? "" : juneRec.body1; f.april_record_detail_body2 = f.april_record_locked ? "" : juneRec.body2; f.april_record_detail_body3 = f.april_record_locked ? "" : juneRec.body3;
 f.april_record_detail_comment = f.april_record_locked ? "" : juneRec.comment; f.april_record_detail_comment2 = f.april_record_locked ? "" : juneRec.comment2;
 f.april_record_detail_note = f.april_record_locked ? "" : juneRec.note; f.april_record_is_may_clear = f.april_record_selected == "june_clear";
} else if (f.april_record_month == "05" && f.april_record_tab == "CG") {
 var mayCgRecords = {
  event_01:{title:"CG01｜Why This Shop?",kind:"イベントCG",file:"cg/may/CG01_Why_This_Shop.png",flag:"cg_may_event_01",caption:"この店に来る理由を、常連さんの言葉から考えた。"},
  event_02:{title:"CG02｜See You Again",kind:"イベントCG",file:"cg/may/CG02_See_You_Again.png",flag:"cg_may_event_02",caption:"最初の「また来ます」が店に残った。"},
  mini_01:{title:"SD01｜炎上は知名度に入りますか？",kind:"ミニイベントCG",file:"cg/may/SD01_Bad003_Flame_Publicity.png",flag:"cg_may_mini_01",caption:"数字だけが伸びていく、炎上の通知。"},
  mini_02:{title:"SD02｜投稿する店",kind:"ミニイベントCG",file:"cg/may/SD02_Bad004_Posting_Shop.png",flag:"cg_may_mini_02",caption:"投稿ばかりに気を取られた厨房。"}
 };
 var mayCgRec = mayCgRecords[f.april_record_selected] || (f.april_record_cg_category == "MINI" ? mayCgRecords.mini_01 : mayCgRecords.event_01);
 var mayCgOpened = sf[mayCgRec.flag] === true;
 f.april_record_locked = !mayCgOpened; f.april_record_detail_title = mayCgOpened ? mayCgRec.title : "？？？";
 f.april_record_detail_meta = mayCgOpened ? "分類："+mayCgRec.kind+"　｜　月：5月　｜　状態：閲覧可能" : "";
 f.april_record_detail_condition1 = ""; f.april_record_detail_condition2 = ""; f.april_record_detail_body1 = ""; f.april_record_detail_body2 = ""; f.april_record_detail_body3 = "";
 f.april_record_detail_comment = mayCgOpened ? mayCgRec.caption : ""; f.april_record_detail_note = ""; f.april_record_cg_unlocked = mayCgOpened; f.april_record_cg_file = mayCgRec.file;
 f.may_record_list_cg_event_01 = sf.cg_may_event_01 === true ? mayCgRecords.event_01.title : "？？？";
 f.may_record_list_cg_event_02 = sf.cg_may_event_02 === true ? mayCgRecords.event_02.title : "？？？";
 f.may_record_list_cg_mini_01 = sf.cg_may_mini_01 === true ? mayCgRecords.mini_01.title : "？？？";
 f.may_record_list_cg_mini_02 = sf.cg_may_mini_02 === true ? mayCgRecords.mini_02.title : "？？？";
} else if (f.april_record_month == "05" && f.april_record_tab == "MINI") {
 f.april_record_locked = false; f.april_record_detail_title = "5月のMINI BAD"; f.april_record_detail_meta = "分類：MINI BAD　｜　月：5月　｜　状態：なし";
 f.april_record_detail_condition1 = "5月のシナリオにMINI BADはありません。"; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = "5月の失敗はCORE BADに記録されます。"; f.april_record_detail_body2 = ""; f.april_record_detail_body3 = "";
 f.april_record_detail_comment = "失敗の形も、月ごとに違うんやな。"; f.april_record_detail_note = ""; f.april_record_selected = "may_mini_none";
} else if (f.april_record_month == "05") {
 var mayRec = mayArchiveMap[f.april_record_selected] || mayArchiveMap.core_003;
 f.april_record_locked = mayRec.status === ""; f.april_record_detail_title = f.april_record_locked ? "？？？" : mayRec.title;
 f.april_record_detail_meta = f.april_record_locked ? "" : "分類："+mayRec.classification+"　｜　月：5月　｜　状態："+mayRec.status;
 f.april_record_detail_condition1 = f.april_record_locked ? "" : mayRec.condition1; f.april_record_detail_condition2 = f.april_record_locked ? "" : mayRec.condition2;
 f.april_record_detail_body1 = f.april_record_locked ? "" : mayRec.body1; f.april_record_detail_body2 = f.april_record_locked ? "" : mayRec.body2; f.april_record_detail_body3 = f.april_record_locked ? "" : mayRec.body3;
 f.april_record_detail_comment = f.april_record_locked ? "" : mayRec.comment; f.april_record_detail_comment2 = f.april_record_locked ? "" : (mayRec.comment2 || "");
 f.april_record_detail_note = f.april_record_locked ? "" : mayRec.note; f.april_record_is_may_clear = f.april_record_selected == "may_clear";
} else if (f.april_record_month != "04") {
 f.april_record_locked = false;
 f.april_record_detail_title = archiveMonths[f.april_record_month] + "の記録";
 f.april_record_detail_meta = "この月の記録・CGは未実装です。";
 f.april_record_detail_condition1 = "4月から8月までを収録しています。"; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = "制作が進んだ月から、ここに追加します。"; f.april_record_detail_body2 = "";
 f.april_record_detail_comment = "続きができたら、ここにも並べるな。"; f.april_record_detail_note = "選択中：" + archiveMonths[f.april_record_month];
} else if (f.april_record_tab == "CG") {
 var aprilCgRecords = {
  event_01:{title:"CG01｜厨房に現れた少女",kind:"イベントCG",file:"cg/april/CG01_A_Stranger_in_the_Kitchen.png",flag:"cg_april_event_01",caption:"厨房に落ちてきた、異世界からの出会い。"},
  event_02:{title:"CG02｜女神の条件",kind:"イベントCG",file:"cg/april/CG02_The_Goddess_Condition.png",flag:"cg_april_event_02",caption:"一年以内に世界一へ。女神が示した約束。"},
  event_03:{title:"CG03｜365日のはじまり",kind:"イベントCG",file:"cg/april/CG03_The_First_Day_of_365.png",flag:"cg_april_event_03",caption:"店の再出発を決めた、4月の終わり。"},
  mini_01:{title:"SD01｜利害一致やん！",kind:"ミニイベントCG",file:"cg/april/SD01_Rigai_Icchi_Yan.png",flag:"cg_april_mini_01",caption:"二人の目的が重なった、にぎやかな一幕。"},
  mini_02:{title:"SD02｜1000個の現実",kind:"ミニイベントCG",file:"cg/april/SD02_1000_Eclairs.png",flag:"cg_april_mini_02",caption:"勢いで作った大量のエクレア。その現実は重かった。"},
  mini_03:{title:"SD03｜慎重すぎて何も始まらない",kind:"ミニイベントCG",file:"cg/april/SD03_Cautious_Standstill.png",flag:"cg_april_mini_03",caption:"慎重に進めた結果、動けなくなった厨房。"}
 };
 var cgRec = aprilCgRecords[f.april_record_selected] || aprilCgRecords.event_01;
 var cgOpened = sf[cgRec.flag] === true;
 f.april_record_list_cg_event_01 = (sf.cg_april_event_01 === true ? aprilCgRecords.event_01.title : "？？？");
 f.april_record_list_cg_event_02 = (sf.cg_april_event_02 === true ? aprilCgRecords.event_02.title : "？？？");
 f.april_record_list_cg_event_03 = (sf.cg_april_event_03 === true ? aprilCgRecords.event_03.title : "？？？");
 f.april_record_list_cg_mini_01 = (sf.cg_april_mini_01 === true ? aprilCgRecords.mini_01.title : "？？？");
 f.april_record_list_cg_mini_02 = (sf.cg_april_mini_02 === true ? aprilCgRecords.mini_02.title : "？？？");
 f.april_record_list_cg_mini_03 = (sf.cg_april_mini_03 === true ? aprilCgRecords.mini_03.title : "？？？");
 f.april_record_locked = !cgOpened;
 f.april_record_detail_title = (cgOpened ? cgRec.title : "？？？");
 f.april_record_detail_meta = (cgOpened ? "分類：" + cgRec.kind + "　｜　月：4月　｜　状態：閲覧可能" : "");
 f.april_record_detail_condition1 = ""; f.april_record_detail_condition2 = "";
 f.april_record_detail_body1 = ""; f.april_record_detail_body2 = "";
 f.april_record_detail_comment = (cgOpened ? cgRec.caption : ""); f.april_record_detail_note = "";
 f.april_record_cg_unlocked = cgOpened;
 f.april_record_cg_file = cgRec.file;
} else {
 var rec = archiveMap[f.april_record_selected] || archiveMap.core_001;
 f.april_record_locked = (rec.status === "");
 f.april_record_detail_title=(f.april_record_locked ? "？？？" : rec.title);
 f.april_record_detail_meta=(f.april_record_locked ? "" : "分類："+rec.classification+"　｜　月：4月　｜　状態："+rec.status);
 f.april_record_detail_condition1=(f.april_record_locked ? "" : rec.condition1); f.april_record_detail_condition2=(f.april_record_locked ? "" : rec.condition2);
 f.april_record_detail_body1=(f.april_record_locked ? "" : rec.body1); f.april_record_detail_body2=(f.april_record_locked ? "" : rec.body2);
 f.april_record_detail_comment=(f.april_record_locked ? "" : rec.comment); f.april_record_detail_note=(f.april_record_locked ? "" : rec.note);
}[endscript]
[ptext layer="1" name="archive_text" text=&f.april_record_heading x="110" y="171" size="23" bold="true" color="0x305332" edge="" width="480"]
[if exp="f.april_record_month != '04' && f.april_record_month != '05' && f.april_record_month != '06' && f.april_record_month != '07' && f.april_record_month != '08' && f.april_record_month != '09' && f.april_record_month != '10' && f.april_record_month != '11' && f.april_record_month != '12' && f.april_record_month != '01' && f.april_record_month != '02' && f.april_record_month != '03'"]
[ptext layer="1" name="archive_text" text="この月の記録は未実装です" x="78" y="229" size="19" bold="true" color="0x6C542F" edge="" width="500"]
[elsif exp="f.april_record_month == '03'"]
[if exp="f.april_record_tab == 'CORE'"]
[if exp="f.april_record_selected == 'core_017'"]
[glink text=&f.march_record_list_core_017 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_017" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_core_017 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_017" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'march_clear'"]
[glink text=&f.march_record_list_march_clear color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_march_clear" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_march_clear color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_march_clear" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'march_end_01'"]
[glink text=&f.march_record_list_march_end_01 color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="44" size="16" bold="true" target="*records_select_march_end_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_march_end_01 color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="44" size="16" bold="true" target="*records_select_march_end_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'march_end_02'"]
[glink text=&f.march_record_list_march_end_02 color="green" font_color="0x3B2A1B" x="78" y="374" width="520" height="44" size="16" bold="true" target="*records_select_march_end_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_march_end_02 color="green" font_color="0x3B2A1B" x="78" y="374" width="520" height="44" size="16" bold="true" target="*records_select_march_end_02" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'march_true'"]
[glink text=&f.march_record_list_march_true color="green" font_color="0x3B2A1B" x="78" y="424" width="520" height="44" size="16" bold="true" target="*records_select_march_true" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_march_true color="green" font_color="0x3B2A1B" x="78" y="424" width="520" height="44" size="16" bold="true" target="*records_select_march_true" name="archive_list_item"]
[endif]
[elsif exp="f.april_record_tab == 'MINI'"]
[if exp="f.april_record_selected == 'mini_m12'"]
[glink text=&f.march_record_list_mini_m12 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_mini_m12" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_mini_m12 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_mini_m12" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_m13'"]
[glink text=&f.march_record_list_mini_m13 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_mini_m13" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_mini_m13 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_mini_m13" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_cg_category == 'EVENT'"]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category archive_selected"]
[else]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category archive_selected"]
[else]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[if exp="f.april_record_selected == 'mini_01'"]
[glink text=&f.march_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_mini_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_mini_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_02'"]
[glink text=&f.march_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="16" bold="true" target="*records_select_cg_mini_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="16" bold="true" target="*records_select_cg_mini_02" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_selected == 'event_01'"]
[glink text=&f.march_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="282" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="282" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_02'"]
[glink text=&f.march_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_02" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_03'"]
[glink text=&f.march_record_list_cg_event_03 color="green" font_color="0x3B2A1B" x="78" y="366" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_03" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_cg_event_03 color="green" font_color="0x3B2A1B" x="78" y="366" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_03" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_04'"]
[glink text=&f.march_record_list_cg_event_04 color="green" font_color="0x3B2A1B" x="78" y="408" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_04" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_cg_event_04 color="green" font_color="0x3B2A1B" x="78" y="408" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_04" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_05'"]
[glink text=&f.march_record_list_cg_event_05 color="green" font_color="0x3B2A1B" x="78" y="450" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_05" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_cg_event_05 color="green" font_color="0x3B2A1B" x="78" y="450" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_05" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_06'"]
[glink text=&f.march_record_list_cg_event_06 color="green" font_color="0x3B2A1B" x="78" y="492" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_06" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_cg_event_06 color="green" font_color="0x3B2A1B" x="78" y="492" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_06" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_07'"]
[glink text=&f.march_record_list_cg_event_07 color="green" font_color="0x3B2A1B" x="78" y="534" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_07" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_cg_event_07 color="green" font_color="0x3B2A1B" x="78" y="534" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_07" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_08'"]
[glink text=&f.march_record_list_cg_event_08 color="green" font_color="0x3B2A1B" x="78" y="576" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_08" name="archive_list_item archive_selected"]
[else]
[glink text=&f.march_record_list_cg_event_08 color="green" font_color="0x3B2A1B" x="78" y="576" width="520" height="36" size="14" bold="true" target="*records_select_cg_event_08" name="archive_list_item"]
[endif]
[endif]
[endif]
[elsif exp="f.april_record_month == '02'"]
[if exp="f.april_record_tab == 'CORE'"]
[if exp="f.april_record_selected == 'core_016'"]
[glink text=&f.february_record_list_core_016 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_016" name="archive_list_item archive_selected"]
[else]
[glink text=&f.february_record_list_core_016 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_016" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'february_clear'"]
[glink text=&f.february_record_list_february_clear color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_february_clear" name="archive_list_item archive_selected"]
[else]
[glink text=&f.february_record_list_february_clear color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_february_clear" name="archive_list_item"]
[endif]
[elsif exp="f.april_record_tab == 'MINI'"]
[if exp="f.april_record_selected == 'mini_m10'"]
[glink text=&f.february_record_list_mini_m10 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_mini_m10" name="archive_list_item archive_selected"]
[else]
[glink text=&f.february_record_list_mini_m10 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_mini_m10" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_m11'"]
[glink text=&f.february_record_list_mini_m11 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_mini_m11" name="archive_list_item archive_selected"]
[else]
[glink text=&f.february_record_list_mini_m11 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_mini_m11" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_cg_category == 'EVENT'"]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category archive_selected"]
[else]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category archive_selected"]
[else]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[if exp="f.april_record_selected == 'mini_01'"]
[glink text=&f.february_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.february_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_02'"]
[glink text=&f.february_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.february_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_02" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_selected == 'event_01'"]
[glink text=&f.february_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.february_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_02'"]
[glink text=&f.february_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.february_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_02" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_03'"]
[glink text=&f.february_record_list_cg_event_03 color="green" font_color="0x3B2A1B" x="78" y="400" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_03" name="archive_list_item archive_selected"]
[else]
[glink text=&f.february_record_list_cg_event_03 color="green" font_color="0x3B2A1B" x="78" y="400" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_03" name="archive_list_item"]
[endif]
[endif]
[endif]
[elsif exp="f.april_record_month == '01'"]
[if exp="f.april_record_tab == 'CORE'"]
[if exp="f.april_record_selected == 'core_015'"]
[glink text=&f.january_record_list_core_015 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_015" name="archive_list_item archive_selected"]
[else]
[glink text=&f.january_record_list_core_015 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_015" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'january_clear'"]
[glink text=&f.january_record_list_january_clear color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_january_clear" name="archive_list_item archive_selected"]
[else]
[glink text=&f.january_record_list_january_clear color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_january_clear" name="archive_list_item"]
[endif]
[elsif exp="f.april_record_tab == 'MINI'"]
[if exp="f.april_record_selected == 'mini_m08'"]
[glink text=&f.january_record_list_mini_m08 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_mini_m08" name="archive_list_item archive_selected"]
[else]
[glink text=&f.january_record_list_mini_m08 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_mini_m08" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_m09'"]
[glink text=&f.january_record_list_mini_m09 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_mini_m09" name="archive_list_item archive_selected"]
[else]
[glink text=&f.january_record_list_mini_m09 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_mini_m09" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_cg_category == 'EVENT'"]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category archive_selected"]
[else]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category archive_selected"]
[else]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[if exp="f.april_record_selected == 'mini_01'"]
[glink text=&f.january_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.january_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_02'"]
[glink text=&f.january_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.january_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_02" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_selected == 'event_01'"]
[glink text=&f.january_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.january_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_02'"]
[glink text=&f.january_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.january_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_02" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_03'"]
[glink text=&f.january_record_list_cg_event_03 color="green" font_color="0x3B2A1B" x="78" y="400" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_03" name="archive_list_item archive_selected"]
[else]
[glink text=&f.january_record_list_cg_event_03 color="green" font_color="0x3B2A1B" x="78" y="400" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_03" name="archive_list_item"]
[endif]
[endif]
[endif]
[elsif exp="f.april_record_month == '12'"]
[if exp="f.april_record_tab == 'CORE'"]
[if exp="f.april_record_selected == 'core_014'"]
[glink text=&f.december_record_list_core_014 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_014" name="archive_list_item archive_selected"]
[else]
[glink text=&f.december_record_list_core_014 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_014" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'december_clear'"]
[glink text=&f.december_record_list_december_clear color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_december_clear" name="archive_list_item archive_selected"]
[else]
[glink text=&f.december_record_list_december_clear color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_december_clear" name="archive_list_item"]
[endif]
[elsif exp="f.april_record_tab == 'MINI'"]
[if exp="f.april_record_selected == 'mini_m06'"]
[glink text=&f.december_record_list_mini_m06 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_mini_m06" name="archive_list_item archive_selected"]
[else]
[glink text=&f.december_record_list_mini_m06 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_mini_m06" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_m07'"]
[glink text=&f.december_record_list_mini_m07 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_mini_m07" name="archive_list_item archive_selected"]
[else]
[glink text=&f.december_record_list_mini_m07 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_mini_m07" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_cg_category == 'EVENT'"]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category archive_selected"]
[else]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category archive_selected"]
[else]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[if exp="f.april_record_selected == 'mini_01'"]
[glink text=&f.december_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.december_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_02'"]
[glink text=&f.december_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.december_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_02" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_selected == 'event_01'"]
[glink text=&f.december_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.december_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_02'"]
[glink text=&f.december_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.december_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_02" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_03'"]
[glink text=&f.december_record_list_cg_event_03 color="green" font_color="0x3B2A1B" x="78" y="400" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_03" name="archive_list_item archive_selected"]
[else]
[glink text=&f.december_record_list_cg_event_03 color="green" font_color="0x3B2A1B" x="78" y="400" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_03" name="archive_list_item"]
[endif]
[endif]
[endif]
[elsif exp="f.april_record_month == '11'"]
[if exp="f.april_record_tab == 'CORE'"]
[if exp="f.april_record_selected == 'core_012'"]
[glink text=&f.november_record_list_core_012 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_012" name="archive_list_item archive_selected"]
[else]
[glink text=&f.november_record_list_core_012 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_012" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'core_013'"]
[glink text=&f.november_record_list_core_013 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_core_013" name="archive_list_item archive_selected"]
[else]
[glink text=&f.november_record_list_core_013 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_core_013" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'november_clear'"]
[glink text=&f.november_record_list_november_clear color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="44" size="16" bold="true" target="*records_select_november_clear" name="archive_list_item archive_selected"]
[else]
[glink text=&f.november_record_list_november_clear color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="44" size="16" bold="true" target="*records_select_november_clear" name="archive_list_item"]
[endif]
[elsif exp="f.april_record_tab == 'MINI'"]
[if exp="f.april_record_selected == 'mini_m04'"]
[glink text=&f.november_record_list_mini_m04 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_mini_m04" name="archive_list_item archive_selected"]
[else]
[glink text=&f.november_record_list_mini_m04 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_mini_m04" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_m05'"]
[glink text=&f.november_record_list_mini_m05 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_mini_m05" name="archive_list_item archive_selected"]
[else]
[glink text=&f.november_record_list_mini_m05 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_mini_m05" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_cg_category == 'EVENT'"]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category archive_selected"]
[else]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category archive_selected"]
[else]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[if exp="f.april_record_selected == 'mini_01'"]
[glink text=&f.november_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.november_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_02'"]
[glink text=&f.november_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.november_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_02" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_selected == 'event_01'"]
[glink text=&f.november_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.november_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_02'"]
[glink text=&f.november_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.november_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_02" name="archive_list_item"]
[endif]
[endif]
[endif]
[elsif exp="f.april_record_month == '10'"]
[if exp="f.april_record_tab == 'CORE'"]
[if exp="f.april_record_selected == 'core_010'"]
[glink text=&f.october_record_list_core_010 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_010" name="archive_list_item archive_selected"]
[else]
[glink text=&f.october_record_list_core_010 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_010" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'core_011'"]
[glink text=&f.october_record_list_core_011 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_core_011" name="archive_list_item archive_selected"]
[else]
[glink text=&f.october_record_list_core_011 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_core_011" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'october_clear'"]
[glink text=&f.october_record_list_october_clear color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="44" size="16" bold="true" target="*records_select_october_clear" name="archive_list_item archive_selected"]
[else]
[glink text=&f.october_record_list_october_clear color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="44" size="16" bold="true" target="*records_select_october_clear" name="archive_list_item"]
[endif]
[elsif exp="f.april_record_tab == 'MINI'"]
[ptext layer="1" name="archive_text" text="10月にMINI BADはありません。" x="88" y="228" size="18" bold="true" color="0x6C542F" edge="" width="490"]
[else]
[if exp="f.april_record_cg_category == 'EVENT'"]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category archive_selected"]
[else]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category archive_selected"]
[else]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[if exp="f.april_record_selected == 'mini_01'"]
[glink text=&f.october_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.october_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_02'"]
[glink text=&f.october_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.october_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_mini_02" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_selected == 'event_01'"]
[glink text=&f.october_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.october_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_02'"]
[glink text=&f.october_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.october_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_02" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_03'"]
[glink text=&f.october_record_list_cg_event_03 color="green" font_color="0x3B2A1B" x="78" y="400" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_03" name="archive_list_item archive_selected"]
[else]
[glink text=&f.october_record_list_cg_event_03 color="green" font_color="0x3B2A1B" x="78" y="400" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_03" name="archive_list_item"]
[endif]
[endif]
[endif]
[elsif exp="f.april_record_month == '09'"]
[if exp="f.april_record_tab == 'CORE'"]
[if exp="f.april_record_selected == 'core_009'"]
[glink text=&f.september_record_list_core_009 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_009" name="archive_list_item archive_selected"]
[else]
[glink text=&f.september_record_list_core_009 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_009" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'september_clear'"]
[glink text=&f.september_record_list_clear color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_september_clear" name="archive_list_item archive_selected"]
[else]
[glink text=&f.september_record_list_clear color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_september_clear" name="archive_list_item"]
[endif]
[elsif exp="f.april_record_tab == 'MINI'"]
[ptext layer="1" name="archive_text" text="9月にMINI BADはありません。" x="88" y="228" size="18" bold="true" color="0x6C542F" edge="" width="490"]
[else]
[if exp="f.april_record_cg_category == 'EVENT'"]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category archive_selected"]
[else]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category archive_selected"]
[else]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[if exp="f.april_record_selected == 'mini_01'"]
[glink text=&f.september_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_mini_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.september_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_mini_01" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_selected == 'event_01'"]
[glink text=&f.september_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.september_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_02'"]
[glink text=&f.september_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.september_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_02" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_03'"]
[glink text=&f.september_record_list_cg_event_03 color="green" font_color="0x3B2A1B" x="78" y="400" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_03" name="archive_list_item archive_selected"]
[else]
[glink text=&f.september_record_list_cg_event_03 color="green" font_color="0x3B2A1B" x="78" y="400" width="520" height="44" size="15" bold="true" target="*records_select_cg_event_03" name="archive_list_item"]
[endif]
[endif]
[endif]
[elsif exp="f.april_record_month == '08'"]
[if exp="f.april_record_tab == 'CORE'"]
[if exp="f.april_record_selected == 'core_008'"]
[glink text=&f.august_record_list_core_008 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_008" name="archive_list_item archive_selected"]
[else]
[glink text=&f.august_record_list_core_008 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_008" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'august_clear'"]
[glink text=&f.august_record_list_clear color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_august_clear" name="archive_list_item archive_selected"]
[else]
[glink text=&f.august_record_list_clear color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_august_clear" name="archive_list_item"]
[endif]
[elsif exp="f.april_record_tab == 'MINI'"]
[ptext layer="1" name="archive_text" text="8月にMINI BADはありません。" x="88" y="228" size="18" bold="true" color="0x6C542F" edge="" width="490"]
[else]
[if exp="f.april_record_cg_category == 'EVENT'"]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category archive_selected"]
[else]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category archive_selected"]
[else]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[if exp="f.april_record_selected == 'mini_01'"]
[glink text=&f.august_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_mini_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.august_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_mini_01" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_selected == 'event_01'"]
[glink text=&f.august_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_event_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.august_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_event_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_02'"]
[glink text=&f.august_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="16" bold="true" target="*records_select_cg_event_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.august_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="16" bold="true" target="*records_select_cg_event_02" name="archive_list_item"]
[endif]
[endif]
[endif]
[elsif exp="f.april_record_month == '07'"]
[if exp="f.april_record_tab == 'CORE'"]
[if exp="f.april_record_selected == 'core_007'"]
[glink text=&f.july_record_list_core_007 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_007" name="archive_list_item archive_selected"]
[else]
[glink text=&f.july_record_list_core_007 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_007" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'july_clear'"]
[glink text=&f.july_record_list_clear color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_july_clear" name="archive_list_item archive_selected"]
[else]
[glink text=&f.july_record_list_clear color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_july_clear" name="archive_list_item"]
[endif]
[elsif exp="f.april_record_tab == 'MINI'"]
[ptext layer="1" name="archive_text" text="7月にMINI BADはありません。" x="88" y="228" size="18" bold="true" color="0x6C542F" edge="" width="490"]
[else]
[if exp="f.april_record_cg_category == 'EVENT'"]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category archive_selected"]
[else]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category archive_selected"]
[else]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[if exp="f.april_record_selected == 'mini_01'"]
[glink text=&f.july_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_mini_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.july_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_mini_01" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_selected == 'event_01'"]
[glink text=&f.july_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_event_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.july_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_event_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_02'"]
[glink text=&f.july_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="16" bold="true" target="*records_select_cg_event_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.july_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="16" bold="true" target="*records_select_cg_event_02" name="archive_list_item"]
[endif]
[endif]
[endif]
[elsif exp="f.april_record_month == '06'"]
[if exp="f.april_record_tab == 'CORE'"]
[if exp="f.april_record_selected == 'core_005'"]
[glink text=&f.april_record_list_core_005 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_005" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_core_005 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_005" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'core_006'"]
[glink text=&f.april_record_list_core_006 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_core_006" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_core_006 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_core_006" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'june_clear'"]
[glink text=&f.april_record_list_june_clear color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="44" size="16" bold="true" target="*records_select_june_clear" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_june_clear color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="44" size="16" bold="true" target="*records_select_june_clear" name="archive_list_item"]
[endif]
[elsif exp="f.april_record_tab == 'MINI'"]
[ptext layer="1" name="archive_text" text="6月にMINI BADはありません。" x="88" y="228" size="18" bold="true" color="0x6C542F" edge="" width="490"]
[else]
[if exp="f.april_record_cg_category == 'EVENT'"]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category archive_selected"]
[else]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category archive_selected"]
[else]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[if exp="f.april_record_selected == 'mini_01'"]
[glink text=&f.june_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_mini_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.june_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_mini_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_02'"]
[glink text=&f.june_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="16" bold="true" target="*records_select_cg_mini_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.june_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="16" bold="true" target="*records_select_cg_mini_02" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_selected == 'event_01'"]
[glink text=&f.june_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_event_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.june_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="44" size="16" bold="true" target="*records_select_cg_event_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_02'"]
[glink text=&f.june_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="16" bold="true" target="*records_select_cg_event_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.june_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="44" size="16" bold="true" target="*records_select_cg_event_02" name="archive_list_item"]
[endif]
[endif]
[endif]
[elsif exp="f.april_record_month == '05'"]
[if exp="f.april_record_tab == 'CORE'"]
[if exp="f.april_record_selected == 'core_003'"]
[glink text=&f.april_record_list_core_003 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_003" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_core_003 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="16" bold="true" target="*records_select_core_003" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'core_004'"]
[glink text=&f.april_record_list_core_004 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_core_004" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_core_004 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_core_004" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'may_clear'"]
[glink text=&f.april_record_list_may_clear color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="44" size="16" bold="true" target="*records_select_may_clear" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_may_clear color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="44" size="16" bold="true" target="*records_select_may_clear" name="archive_list_item"]
[endif]
[elsif exp="f.april_record_tab == 'MINI'"]
[ptext layer="1" name="archive_text" text="5月にMINI BADはありません。" x="88" y="228" size="18" bold="true" color="0x6C542F" edge="" width="490"]
[else]
[if exp="f.april_record_cg_category == 'EVENT'"]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category archive_selected"]
[else]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category archive_selected"]
[else]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[if exp="f.april_record_selected == 'mini_01'"]
[glink text=&f.may_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="48" size="15" bold="true" target="*records_select_cg_mini_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.may_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="48" size="15" bold="true" target="*records_select_cg_mini_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_02'"]
[glink text=&f.may_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="48" size="15" bold="true" target="*records_select_cg_mini_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.may_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="48" size="15" bold="true" target="*records_select_cg_mini_02" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_selected == 'event_01'"]
[glink text=&f.may_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="48" size="15" bold="true" target="*records_select_cg_event_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.may_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="48" size="15" bold="true" target="*records_select_cg_event_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_02'"]
[glink text=&f.may_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="48" size="15" bold="true" target="*records_select_cg_event_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.may_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="48" size="15" bold="true" target="*records_select_cg_event_02" name="archive_list_item"]
[endif]
[endif]
[endif]
[else]
[if exp="f.april_record_tab == 'CORE'"]
[if exp="f.april_record_selected == 'core_001'"]
[glink text=&f.april_record_list_core_001 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="17" bold="true" target="*records_select_core_001" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_core_001 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="17" bold="true" target="*records_select_core_001" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'core_002'"]
[glink text=&f.april_record_list_core_002 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_core_002" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_core_002 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="16" bold="true" target="*records_select_core_002" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'clear'"]
[glink text=&f.april_record_list_clear color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="44" size="17" bold="true" target="*records_select_clear" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_clear color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="44" size="17" bold="true" target="*records_select_clear" name="archive_list_item"]
[endif]
[elsif exp="f.april_record_tab == 'MINI'"]
[if exp="f.april_record_selected == 'mini_m01'"]
[glink text=&f.april_record_list_mini_m01 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="17" bold="true" target="*records_select_mini_m01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_mini_m01 color="green" font_color="0x3B2A1B" x="78" y="224" width="520" height="44" size="17" bold="true" target="*records_select_mini_m01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_m02'"]
[glink text=&f.april_record_list_mini_m02 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="17" bold="true" target="*records_select_mini_m02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_mini_m02 color="green" font_color="0x3B2A1B" x="78" y="274" width="520" height="44" size="17" bold="true" target="*records_select_mini_m02" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_m03'"]
[glink text=&f.april_record_list_mini_m03 color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="44" size="17" bold="true" target="*records_select_mini_m03" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_mini_m03 color="green" font_color="0x3B2A1B" x="78" y="324" width="520" height="44" size="17" bold="true" target="*records_select_mini_m03" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'clear'"]
[glink text=&f.april_record_list_clear color="green" font_color="0x3B2A1B" x="78" y="374" width="520" height="44" size="17" bold="true" target="*records_select_clear" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_clear color="green" font_color="0x3B2A1B" x="78" y="374" width="520" height="44" size="17" bold="true" target="*records_select_clear" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_cg_category == 'EVENT'"]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category archive_selected"]
[else]
[glink text="イベントCG" color="green" font_color="0x3B2A1B" x="78" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_event" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category archive_selected"]
[else]
[glink text="ミニイベントCG" color="green" font_color="0x3B2A1B" x="348" y="224" width="250" height="44" size="16" bold="true" target="*records_cg_mini" name="archive_cg_category"]
[endif]
[if exp="f.april_record_cg_category == 'MINI'"]
[if exp="f.april_record_selected == 'mini_01'"]
[glink text=&f.april_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="48" size="16" bold="true" target="*records_select_cg_mini_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_cg_mini_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="48" size="16" bold="true" target="*records_select_cg_mini_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_02'"]
[glink text=&f.april_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="48" size="16" bold="true" target="*records_select_cg_mini_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_cg_mini_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="48" size="16" bold="true" target="*records_select_cg_mini_02" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'mini_03'"]
[glink text=&f.april_record_list_cg_mini_03 color="green" font_color="0x3B2A1B" x="78" y="400" width="520" height="48" size="15" bold="true" target="*records_select_cg_mini_03" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_cg_mini_03 color="green" font_color="0x3B2A1B" x="78" y="400" width="520" height="48" size="15" bold="true" target="*records_select_cg_mini_03" name="archive_list_item"]
[endif]
[else]
[if exp="f.april_record_selected == 'event_01'"]
[glink text=&f.april_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="48" size="16" bold="true" target="*records_select_cg_event_01" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_cg_event_01 color="green" font_color="0x3B2A1B" x="78" y="290" width="520" height="48" size="16" bold="true" target="*records_select_cg_event_01" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_02'"]
[glink text=&f.april_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="48" size="16" bold="true" target="*records_select_cg_event_02" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_cg_event_02 color="green" font_color="0x3B2A1B" x="78" y="345" width="520" height="48" size="16" bold="true" target="*records_select_cg_event_02" name="archive_list_item"]
[endif]
[if exp="f.april_record_selected == 'event_03'"]
[glink text=&f.april_record_list_cg_event_03 color="green" font_color="0x3B2A1B" x="78" y="400" width="520" height="48" size="16" bold="true" target="*records_select_cg_event_03" name="archive_list_item archive_selected"]
[else]
[glink text=&f.april_record_list_cg_event_03 color="green" font_color="0x3B2A1B" x="78" y="400" width="520" height="48" size="16" bold="true" target="*records_select_cg_event_03" name="archive_list_item"]
[endif]
[endif]
[endif]
[endif]
[if exp="(f.april_record_month == '04' || f.april_record_month == '05' || f.april_record_month == '06' || f.april_record_month == '07' || f.april_record_month == '08' || f.april_record_month == '09' || f.april_record_month == '10' || f.april_record_month == '11' || f.april_record_month == '12' || f.april_record_month == '01' || f.april_record_month == '02' || f.april_record_month == '03') && f.april_record_tab == 'CG'"]
[if exp="f.april_record_locked == true"]
[ptext layer="1" name="archive_text" text="？？？" x="700" y="172" size="20" bold="true" color="0x305332" edge="" width="520"]
[ptext layer="1" name="archive_text" text="このページには、まだ表示できる内容がありません。" x="700" y="250" size="17" bold="true" color="0x3B2A1B" edge="" width="500"]
[else]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_title x="700" y="172" size="20" bold="true" color="0x305332" edge="" width="520"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_meta x="700" y="209" size="13" bold="true" color="0x3B2A1B" edge="" width="520"]
[image layer="1" name="archive_cg_image" folder="bgimage" storage=&f.april_record_cg_file x="700" y="252" width="512" height="288" visible="true"]
[button storage="system_common.ks" target="*records_cg_expand" graphic=&f.april_record_cg_file folder="bgimage" x="700" y="252" width="512" height="288" fix="false" name="archive_cg_expand_button" hint="クリックで大きく表示"]
[if exp="f.april_record_month == '03'"]
[iscript]
$(".archive_cg_image, .archive_cg_expand_button").css("object-fit", "contain");
[endscript]
[endif]
[if exp="f.april_record_month == '02'"]
[iscript]
$(".archive_cg_image, .archive_cg_expand_button").css("object-fit", "contain");
[endscript]
[endif]
[if exp="f.april_record_month == '01'"]
[iscript]
$(".archive_cg_image, .archive_cg_expand_button").css("object-fit", "contain");
[endscript]
[endif]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="555" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[endif]
[else]
[if exp="f.april_record_locked == true"]
[ptext layer="1" name="archive_text" text="？？？" x="700" y="172" size="20" bold="true" color="0x305332" edge="" width="500"]
[ptext layer="1" name="archive_text" text="この記録は、まだ見つかっていません。" x="700" y="250" size="17" bold="true" color="0x3B2A1B" edge="" width="500"]
[else]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_title x="700" y="172" size="20" bold="true" color="0x305332" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_meta x="700" y="209" size="13" bold="true" color="0x3B2A1B" edge="" width="510"]
[if exp="f.april_record_is_march == true"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="278" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="304" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="330" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="356" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="382" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="408" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body7 x="700" y="434" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body8 x="700" y="460" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[if exp="f.april_record_detail_comment != ''"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="511" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="539" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="565" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[endif]
[elsif exp="f.april_record_is_february_bad == true"]
[ptext layer="1" name="archive_text" text="到達条件" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_condition1 x="700" y="275" size="13" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="310" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="337" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="360" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="383" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="406" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="429" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="452" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body7 x="700" y="475" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body8 x="700" y="498" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="535" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="561" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="585" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[elsif exp="f.april_record_is_february_clear == true"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="278" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="304" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="330" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="356" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="382" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="408" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body7 x="700" y="434" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body8 x="700" y="460" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="511" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="539" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="565" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[elsif exp="f.april_record_is_january_bad == true"]
[ptext layer="1" name="archive_text" text="到達条件" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_condition1 x="700" y="275" size="13" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="310" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="337" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="360" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="383" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="406" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="429" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="452" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body7 x="700" y="475" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body8 x="700" y="498" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="535" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="561" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="585" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[elsif exp="f.april_record_is_january_clear == true"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="278" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="304" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="330" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="356" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="382" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="408" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body7 x="700" y="434" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body8 x="700" y="460" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="511" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="539" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="565" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[elsif exp="f.april_record_is_december_bad == true"]
[ptext layer="1" name="archive_text" text="到達条件" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_condition1 x="700" y="275" size="13" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="310" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="337" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="360" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="383" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="406" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="429" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="452" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body7 x="700" y="475" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body8 x="700" y="498" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="535" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="561" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="585" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[elsif exp="f.april_record_is_december_clear == true"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="278" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="304" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="330" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="356" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="382" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="408" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body7 x="700" y="434" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body8 x="700" y="460" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="511" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="539" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="565" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[elsif exp="f.april_record_is_november_bad == true"]
[ptext layer="1" name="archive_text" text="到達条件" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_condition1 x="700" y="275" size="13" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="310" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="337" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="360" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="383" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="406" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="429" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="452" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body7 x="700" y="475" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body8 x="700" y="498" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="535" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="561" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="585" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[elsif exp="f.april_record_is_november_clear == true"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="278" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="304" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="330" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="356" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="382" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="408" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body7 x="700" y="434" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body8 x="700" y="460" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="511" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="539" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="565" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[elsif exp="f.april_record_is_october_bad == true"]
[ptext layer="1" name="archive_text" text="到達条件" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_condition1 x="700" y="275" size="13" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="310" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="337" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="360" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="383" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="406" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="429" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="452" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body7 x="700" y="475" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body8 x="700" y="498" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="535" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="561" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="585" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[elsif exp="f.april_record_is_october_clear == true"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="278" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="304" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="330" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="356" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="382" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="408" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body7 x="700" y="434" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body8 x="700" y="460" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="511" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="539" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="565" size="15" bold="true" color="0x3B2A1B" edge="" width="500"]
[elsif exp="f.april_record_is_september_bad == true"]
[ptext layer="1" name="archive_text" text="到達条件" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_condition1 x="700" y="275" size="13" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="318" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="344" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="368" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="392" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="416" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="440" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="464" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="500" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="528" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="552" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[elsif exp="f.april_record_is_september_clear == true"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="278" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="304" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="330" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="356" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="382" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="408" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body7 x="700" y="434" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body8 x="700" y="460" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="502" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="529" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="553" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[elsif exp="f.april_record_is_august_bad == true"]
[ptext layer="1" name="archive_text" text="到達条件" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_condition1 x="700" y="275" size="13" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="318" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="344" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="366" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="388" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="410" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="432" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="454" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="493" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="519" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="541" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[elsif exp="f.april_record_is_august_clear == true"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="278" size="15" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="306" size="15" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="334" size="15" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="362" size="15" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="390" size="15" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="418" size="15" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body7 x="700" y="446" size="15" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="492" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="520" size="15" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="543" size="15" bold="true" color="0x3B2A1B" edge="" width="510"]
[elsif exp="f.april_record_is_july_bad == true"]
[ptext layer="1" name="archive_text" text="到達条件" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_condition1 x="700" y="275" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="318" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="344" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="366" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="388" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="410" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body5 x="700" y="432" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body6 x="700" y="454" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="493" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="519" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text="備考" x="700" y="556" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_note x="700" y="582" size="13" bold="true" color="0x3B2A1B" edge="" width="510"]
[else]
[if exp="f.april_record_month == '07' && f.april_record_selected == 'july_clear'"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="278" size="15" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="320" size="15" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="362" size="15" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body4 x="700" y="404" size="15" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="475" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="501" size="15" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text="備考" x="700" y="548" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_note x="700" y="574" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[else]
[if exp="f.april_record_is_may_clear == true"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="278" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="322" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="366" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="423" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="449" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="473" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text="備考" x="700" y="515" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_note x="700" y="541" size="13" bold="true" color="0x3B2A1B" edge="" width="510"]
[else]
[ptext layer="1" name="archive_text" text="到達条件" x="700" y="250" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_condition1 x="700" y="275" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_condition2 x="700" y="297" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[ptext layer="1" name="archive_text" text="記録" x="700" y="338" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body1 x="700" y="363" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body2 x="700" y="385" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_body3 x="700" y="407" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text="抹茶ちゃんのひとこと" x="700" y="445" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="470" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment2 x="700" y="492" size="14" bold="true" color="0x3B2A1B" edge="" width="510"]
[ptext layer="1" name="archive_text" text="備考" x="700" y="527" size="15" bold="true" color="0x70551D" edge="" width="460"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_note x="700" y="552" size="13" bold="true" color="0x3B2A1B" edge="" width="510"]
[endif]
[endif]
[endif]
[endif]
[endif]
[clearfix name="retired_archive_debug"]
[clearfix name="retired_archive_debug"]
[clearfix name="retired_archive_debug"]
[clearfix name="retired_archive_debug"]
[clearfix name="retired_archive_debug"]
[glink text="全記録リセット" color="green" font_color="0x3B2A1B" x="760" y="655" width="160" height="38" size="13" bold="true" target="*records_reset_all_confirm" name="archive_action"]
[clearfix name="retired_archive_debug"]
[glink text="戻る" color="green" font_color="0xFFF8E4" x="1125" y="655" width="90" height="38" size="15" bold="true" target="*records_back" name="archive_action"]
[s]


*records_cg_expand
[clearstack stack="if"]
[cm]
[layermode name="cg_fullscreen_dim" color="0x000000" opacity="170" mode="normal" time="180" wait="true"]
[button storage="system_common.ks" target="*records_cg_fullscreen_close" graphic=&f.april_record_cg_file folder="bgimage" x="50" y="28" width="1180" height="664" fix="false" name="cg_fullscreen_image" hint="クリックで閉じる"]
[if exp="f.april_record_month == '03'"]
[iscript]
$(".cg_fullscreen_image").css("object-fit", "contain");
[endscript]
[endif]
[if exp="f.april_record_month == '02'"]
[iscript]
$(".cg_fullscreen_image").css("object-fit", "contain");
[endscript]
[endif]
[if exp="f.april_record_month == '01'"]
[iscript]
$(".cg_fullscreen_image").css("object-fit", "contain");
[endscript]
[endif]
[s]

*records_cg_fullscreen_close
[clearstack stack="if"]
[cm]
[free_layermode name="cg_fullscreen_dim" time="180" wait="true"]
[jump storage="system_common.ks" target="*records_display"]

*records_reset_all_confirm
[clearstack stack="if"]
[clearfix]
[free layer="1" name="archive_text"]
[ptext layer="1" name="archive_text" text="全月のCORE BAD・MINI BAD・CLEAR・CG記録を消去します。ゲーム設定とセーブデータは残ります。実行しますか？" x="130" y="270" size="22" bold="true" color="0x3B2A1B" edge="" width="1020"]
[glink text="全記録をリセット" color="green" font_color="0x3B2A1B" x="350" y="365" width="260" height="60" size="20" bold="true" target="*records_reset_all_apply" name="archive_action"]
[glink text="キャンセル" color="green" font_color="0x3B2A1B" x="670" y="365" width="240" height="60" size="20" bold="true" target="*records_display" name="archive_action"]
[s]

; DEBUG ONLY: remove the month-specific reset UI and labels before release.
*records_reset_month_confirm
[clearstack stack="if"]
[clearfix]
[free layer="1" name="archive_text"]
[ptext layer="1" name="archive_text" text="選択中の月だけ記録を消去します（DEBUG用）。未実装月は変化しません。実行しますか？" x="150" y="270" size="22" bold="true" color="0x3B2A1B" edge="" width="980"]
[glink text="選択月をリセット" color="green" font_color="0x3B2A1B" x="350" y="365" width="260" height="60" size="20" bold="true" target="*records_reset_month_apply" name="archive_action"]
[glink text="キャンセル" color="green" font_color="0x3B2A1B" x="670" y="365" width="240" height="60" size="20" bold="true" target="*records_display" name="archive_action"]
[s]

*records_reset_all_apply
[clearstack stack="if"]
[iscript]
Object.keys(sf).forEach(function (key) {
  /* Keep TyranoBuilder's cg_view/cg_id state objects intact; clear only this game's collected CG flags. */
  if (/^(core_bad_|mini_bad_|normal_ch\d+_clear$|cg_(april|may|june|july|august|september|october|november|december|january|february|march)_|march_end_0[12]_seen$|true_end_seen$)/.test(key)) sf[key] = false;
});
[endscript]
[jump target="*records_display"]

*records_reset_month_apply
[clearstack stack="if"]
[iscript]
/* DEBUG ONLY: add each month’s persistent record keys here as that month is implemented. */
var monthlyRecordKeys = {
  "04": [
    "core_bad_001", "core_bad_002",
    "mini_bad_m01", "mini_bad_m02", "mini_bad_m03",
    "normal_ch04_clear",
    "cg_april_event_01", "cg_april_event_02", "cg_april_event_03",
    "cg_april_mini_01", "cg_april_mini_02", "cg_april_mini_03"
  ],
  "05": [
    "core_bad_003", "core_bad_004", "normal_ch05_clear",
    "cg_may_event_01", "cg_may_event_02",
    "cg_may_mini_01", "cg_may_mini_02"
  ],
  "06": [
    "core_bad_005", "core_bad_006", "normal_ch06_clear",
    "cg_june_event_01", "cg_june_event_02",
    "cg_june_mini_01", "cg_june_mini_02"
  ],
  "07": [
    "core_bad_007", "normal_ch07_clear",
    "cg_july_event_01", "cg_july_event_02", "cg_july_mini_01"
  ],
  "08": [
    "core_bad_008", "normal_ch08_clear",
    "cg_august_event_01", "cg_august_event_02", "cg_august_mini_01"
  ],
  "09": [
    "core_bad_009", "normal_ch09_clear",
    "cg_september_event_01", "cg_september_event_02", "cg_september_event_03", "cg_september_mini_01"
  ],
  "10": [
    "core_bad_010", "core_bad_011", "normal_ch10_clear",
    "cg_october_event_01", "cg_october_event_02", "cg_october_event_03", "cg_october_mini_01", "cg_october_mini_02"
  ],
  "11": [
    "core_bad_012", "core_bad_013", "mini_bad_m04", "mini_bad_m05", "normal_ch11_clear",
    "cg_november_event_01", "cg_november_event_02", "cg_november_mini_01", "cg_november_mini_02"
  ],
  "12": [
    "core_bad_014", "mini_bad_m06", "mini_bad_m07", "normal_ch12_clear",
    "cg_december_event_01", "cg_december_event_02", "cg_december_event_03", "cg_december_mini_01", "cg_december_mini_02"
  ],
  "01": [
    "core_bad_015", "mini_bad_m08", "mini_bad_m09", "normal_ch01_clear",
    "cg_january_event_01", "cg_january_event_02", "cg_january_event_03", "cg_january_mini_01", "cg_january_mini_02"
  ],
  "02": [
    "core_bad_016", "mini_bad_m10", "mini_bad_m11", "normal_ch02_clear",
    "cg_february_event_01", "cg_february_event_02", "cg_february_event_03", "cg_february_mini_01", "cg_february_mini_02"
  ],
  "03": ["core_bad_017", "mini_bad_m12", "mini_bad_m13", "normal_ch03_clear", "march_end_01_seen", "march_end_02_seen", "true_end_seen", "cg_march_event_01", "cg_march_event_02", "cg_march_event_03", "cg_march_event_04", "cg_march_event_05", "cg_march_event_06", "cg_march_event_07", "cg_march_event_08", "cg_march_mini_01", "cg_march_mini_02"]

};
var selectedMonthKeys = monthlyRecordKeys[f.april_record_month] || [];
selectedMonthKeys.forEach(function (key) { sf[key] = false; });
[endscript]
[jump target="*records_display"]

*records_back
[clearstack stack="if"]
[clearfix]
[free layer="1" name="archive_text"]
[free layer="1" name="archive_spread"]
[free layer="1" name="archive_cg_image"]
[eval exp="f.april_record_screen_open = false"]
[layopt layer="1" visible="true"]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true"]
[resetfont]
[hidemenubutton]
[if exp="f.april_records_return != 'title'"]
[restore_april_quick_menu]
[endif]
[if exp="f.april_records_return == 'bad'"]
[if exp="f.april_bad.kind == 'CORE'"]
[jump target="*show_core_bad"]
[else]
[jump target="*show_mini_bad"]
[endif]
[elsif exp="f.april_records_return == 'march_end'"]
[jump storage="n03_march.ks" target="*march_ending_menu"]
[elsif exp="f.april_records_return == 'clear'"]
[if exp="f.current_clear_month == '02'"]
[jump storage="n02_february.ks" target="*february_clear_menu"]
[elsif exp="f.current_clear_month == '01'"]
[jump storage="n01_january.ks" target="*january_clear_menu"]
[elsif exp="f.current_clear_month == '12'"]
[jump storage="n12_december.ks" target="*december_clear_menu"]
[elsif exp="f.current_clear_month == '11'"]
[jump storage="n11_november.ks" target="*november_clear_menu"]
[elsif exp="f.current_clear_month == '10'"]
[jump storage="n10_october.ks" target="*october_clear_menu"]
[elsif exp="f.current_clear_month == '09'"]
[jump storage="n09_september.ks" target="*september_clear_menu"]
[elsif exp="f.current_clear_month == '08'"]
[jump storage="n08_august.ks" target="*august_clear_menu"]
[elsif exp="f.current_clear_month == '07'"]
[jump storage="n07_july.ks" target="*july_clear_menu"]
[elsif exp="f.current_clear_month == '06'"]
[jump storage="n06_june.ks" target="*june_clear_menu"]
[elsif exp="f.current_clear_month == '05'"]
[jump storage="n05_may.ks" target="*may_clear_menu"]
[else]
[jump target="*april_clear"]
[endif]
[else]
[jump storage="title_screen.ks" target="*title"]
[endif]


*april_clear
[iscript]
sf.cg_april_event_03 = true;
f.current_clear_month = "04";
[endscript]
[xchgbgm storage="06_One_Year_One_Eclair.mp3" time="1200"]
[chara_hide name="抹茶エクレア"]
[skipstop]
[bg storage="cg/april/CG03_The_First_Day_of_365.png" time="700"]
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true"]
#
[font color="0x305332" bold="true"]
4月「異世界人、厨房に落ちる」 CLEAR
[font color="0x3B2A1B" bold="true"]
[r]
5月「まず客を呼べ」へ続きます。
[resetfont]
[glink text="タイトルへ" color="green" font_color="0x3B2A1B" x="675" y="150" width="400" height="85" size="23" storage="title_screen.ks" target="*title" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="記録" color="green" font_color="0x3B2A1B" x="675" y="245" width="400" height="85" size="23" bold="true" target="*records_from_clear" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="5月へ" color="green" font_color="0x3B2A1B" x="675" y="340" width="400" height="85" size="23" bold="true" storage="op_movie.ks" target="*op_after_april" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[s]




*records_from_march_end
[clearstack stack="if"]
[eval exp="f.april_record_screen_open = false; f.april_records_return = 'march_end'; f.april_record_month = '03'; f.april_record_tab = 'CORE'; f.april_record_selected = f.current_march_end || 'core_017'"]
[jump target="*records_display"]

; Development-only: this deliberately preserves CORE017/CGs/TRUE/saves and all other sf.
*march_debug_reset_confirm
[clearstack stack="if"]
[if exp="window.MarchEnding.ENABLE_MARCH_ED_DEBUG_RESET !== true"]
[jump target="*records_display"]
[endif]
[cm]
[free layer="1" name="archive_text"]
[ptext layer="1" name="archive_text" text="1周目ED到達フラグだけを解除します。失敗の記録・CG・セーブデータは削除しません。続けますか？" x="150" y="270" size="22" bold="true" color="0x3B2A1B" edge="" width="980"]
[glink text="解除する" color="green" font_color="0x3B2A1B" x="350" y="365" width="260" height="60" size="20" bold="true" target="*march_debug_reset_apply" name="archive_action"]
[glink text="キャンセル" color="green" font_color="0x3B2A1B" x="670" y="365" width="240" height="60" size="20" bold="true" target="*records_display" name="archive_action"]
[s]

*march_debug_reset_apply
[clearstack stack="if"]
[iscript]
window.MarchEnding.resetFirstEndingFlag();
[endscript]
[jump target="*records_display"]
