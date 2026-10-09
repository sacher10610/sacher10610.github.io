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
失敗の記録に登録しました。[r]
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
 f.april_record_selected = /^00[1-9]$/.test(badId) ? "core_" + badId : "core_001";
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
f.april_record_selected = f.april_record_month === "09" ? "september_clear" : (f.april_record_month === "08" ? "august_clear" : (f.april_record_month === "07" ? "july_clear" : (f.april_record_month === "06" ? "june_clear" : (f.april_record_month === "05" ? "may_clear" : "clear"))));
[endscript]
[jump target="*records_display"]

*records_tab_core
[clearstack stack="if"]
[eval exp="f.april_record_tab = 'CORE'"]
[eval exp="f.april_record_selected = (f.april_record_month == '09' ? 'core_009' : (f.april_record_month == '08' ? 'core_008' : (f.april_record_month == '07' ? 'core_007' : (f.april_record_month == '06' ? 'core_005' : (f.april_record_month == '05' ? 'core_003' : 'core_001')))))"]
[jump target="*records_display"]
*records_tab_mini
[clearstack stack="if"]
[eval exp="f.april_record_tab = 'MINI'"]
[eval exp="f.april_record_selected = (f.april_record_month == '09' ? 'september_mini_none' : (f.april_record_month == '08' ? 'august_mini_none' : (f.april_record_month == '07' ? 'july_mini_none' : (f.april_record_month == '06' ? 'june_mini_none' : (f.april_record_month == '05' ? 'may_mini_none' : 'mini_m01')))))"]
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
if (f.april_record_tab === "CORE") f.april_record_selected = f.april_record_month === "09" ? "core_009" : (f.april_record_month === "08" ? "core_008" : (f.april_record_month === "07" ? "core_007" : (f.april_record_month === "06" ? "core_005" : (f.april_record_month === "05" ? "core_003" : "core_001"))));
else if (f.april_record_tab === "MINI") f.april_record_selected = f.april_record_month === "09" ? "september_mini_none" : (f.april_record_month === "08" ? "august_mini_none" : (f.april_record_month === "07" ? "july_mini_none" : (f.april_record_month === "06" ? "june_mini_none" : (f.april_record_month === "05" ? "may_mini_none" : "mini_m01"))));
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
f.april_record_detail_body3 = ""; f.april_record_detail_body4 = ""; f.april_record_detail_body5 = ""; f.april_record_detail_body6 = ""; f.april_record_detail_body7 = ""; f.april_record_detail_body8 = ""; f.april_record_detail_comment2 = ""; f.april_record_is_may_clear = false; f.april_record_is_july_bad = false; f.april_record_is_august_bad = false; f.april_record_is_august_clear = false; f.april_record_is_september_bad = false; f.april_record_is_september_clear = false;
if (f.april_record_month == "09" && f.april_record_tab == "CG") {
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
[if exp="f.april_record_month != '04' && f.april_record_month != '05' && f.april_record_month != '06' && f.april_record_month != '07' && f.april_record_month != '08' && f.april_record_month != '09'"]
[ptext layer="1" name="archive_text" text="この月の記録は未実装です" x="78" y="229" size="19" bold="true" color="0x6C542F" edge="" width="500"]
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
[if exp="(f.april_record_month == '04' || f.april_record_month == '05' || f.april_record_month == '06' || f.april_record_month == '07' || f.april_record_month == '08' || f.april_record_month == '09') && f.april_record_tab == 'CG'"]
[if exp="f.april_record_locked == true"]
[ptext layer="1" name="archive_text" text="？？？" x="700" y="172" size="20" bold="true" color="0x305332" edge="" width="520"]
[ptext layer="1" name="archive_text" text="このページには、まだ表示できる内容がありません。" x="700" y="250" size="17" bold="true" color="0x3B2A1B" edge="" width="500"]
[else]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_title x="700" y="172" size="20" bold="true" color="0x305332" edge="" width="520"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_meta x="700" y="209" size="13" bold="true" color="0x3B2A1B" edge="" width="520"]
[image layer="1" name="archive_cg_image" folder="bgimage" storage=&f.april_record_cg_file x="700" y="252" width="512" height="288" visible="true"]
[button storage="system_common.ks" target="*records_cg_expand" graphic=&f.april_record_cg_file folder="bgimage" x="700" y="252" width="512" height="288" fix="false" name="archive_cg_expand_button" hint="クリックで大きく表示"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_comment x="700" y="555" size="14" bold="true" color="0x3B2A1B" edge="" width="500"]
[endif]
[else]
[if exp="f.april_record_locked == true"]
[ptext layer="1" name="archive_text" text="？？？" x="700" y="172" size="20" bold="true" color="0x305332" edge="" width="500"]
[ptext layer="1" name="archive_text" text="この記録は、まだ見つかっていません。" x="700" y="250" size="17" bold="true" color="0x3B2A1B" edge="" width="500"]
[else]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_title x="700" y="172" size="20" bold="true" color="0x305332" edge="" width="500"]
[ptext layer="1" name="archive_text" text=&f.april_record_detail_meta x="700" y="209" size="13" bold="true" color="0x3B2A1B" edge="" width="510"]
[if exp="f.april_record_is_september_bad == true"]
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
[glink text="全記録リセット" color="green" font_color="0x3B2A1B" x="760" y="655" width="160" height="38" size="13" bold="true" target="*records_reset_all_confirm" name="archive_action"]
[glink text="【DEBUG】単月リセット" color="green" font_color="0x3B2A1B" x="930" y="655" width="180" height="38" size="12" bold="true" target="*records_reset_month_confirm" name="archive_action"]
[glink text="戻る" color="green" font_color="0xFFF8E4" x="1125" y="655" width="90" height="38" size="15" bold="true" target="*records_back" name="archive_action"]
[s]


*records_cg_expand
[clearstack stack="if"]
[cm]
[layermode name="cg_fullscreen_dim" color="0x000000" opacity="170" mode="normal" time="180" wait="true"]
[button storage="system_common.ks" target="*records_cg_fullscreen_close" graphic=&f.april_record_cg_file folder="bgimage" x="50" y="28" width="1180" height="664" fix="false" name="cg_fullscreen_image" hint="クリックで閉じる"]
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
  if (/^(core_bad_|mini_bad_|normal_ch\d+_clear$|cg_(april|may|june|july|august|september)_)/.test(key)) sf[key] = false;
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
  ]
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
[elsif exp="f.april_records_return == 'clear'"]
[if exp="f.current_clear_month == '09'"]
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



