;==============================
; タイトル画面
;==============================

*circle_intro
[eval exp="f.circle_logo_seen = true"]
[clearfix]
[cm]
[tb_clear_images]
[hidemenubutton]
[tb_hide_message_window]
[bg storage="logo_white_bg.png" time="1"]
[image layer="1" name="circle_intro_logo" folder="image" storage="title/circle_logo_selected_option3.png" x="295" y="15" width="690" height="690" visible="true" time="1200"]
[wait time="2000"]
[freeimage layer="1" time="900"]
[jump target="*title"]
[s]

*title
[if exp="f.circle_logo_seen != true"]
[eval exp="f.circle_logo_seen = true"]
[jump target="*circle_intro"]
[endif]
[clearfix]
[cm]
[tb_clear_images]
[freeimage layer="1"]
[hidemenubutton]
[tb_hide_message_window]
[tb_keyconfig flag=0]
[iscript]
if (!window.__september_legacy_august_save_hook) {
  window.__september_legacy_august_save_hook = true;
  TG.on("load-start", function () {
    var checks = 0;
    var repairOldAugustMenu = function () {
      checks++;
      var kag = TYRANO.kag;
      var index = kag.ftag.current_order_index;
      var tag = kag.ftag.array_tag && kag.ftag.array_tag[index];
      var oldClearMenu = kag.stat.current_scenario === "n08_august.ks" &&
        kag.stat.f && kag.stat.f.current_clear_month === "08" &&
        tag && tag.name === "glink" && tag.pm && tag.pm.text === "9月へ" &&
        document.body.innerText.indexOf("8月 CLEAR『バズった次の日』") >= 0 &&
        document.body.innerText.indexOf("9月へ") < 0;
      if (oldClearMenu) {
        kag.ftag.startTag("jump", { storage: "n08_august.ks", target: "*august_clear_menu" });
      } else if (checks < 20) {
        setTimeout(repairOldAugustMenu, 150);
      }
    };
    setTimeout(repairOldAugustMenu, 150);
  });
}
var titleCharas = TG.stat.charas || {};
if (TG.chara && TG.chara.getCharaContainer) {
  TG.chara.getCharaContainer().stop(true, true).remove();
}
Object.keys(titleCharas).forEach(function (name) {
  var chara = titleCharas[name];
  if (chara) {
    chara.is_show = "false";
    if (TG.chara && TG.chara.stopFrameAnimation) TG.chara.stopFrameAnimation(chara);
  }
});
[endscript]
[bg storage="title_normal_bg.png" time="800"]
[image layer="1" name="title_logo_main" folder="image" storage="april_ui/v3/title/title_logo_main.png" x="30" y="20" width="622" height="200" visible="true"]
[glink color="black" text="" graphic="april_ui/v3/title/title_start_normal.png" enterimg="april_ui/v3/title/title_start_hover.png" x="95" y="240" width="300" height="84" target="*start" name="april_title_button"]
[glink color="black" text="" graphic="april_ui/v3/title/title_continue_normal.png" enterimg="april_ui/v3/title/title_continue_hover.png" x="95" y="332" width="300" height="84" target="*load" name="april_title_button"]
[glink color="black" text="" graphic="april_ui/v4/title/records_matched_normal.svg" enterimg="april_ui/v4/title/records_matched_hover.svg" x="95" y="424" width="300" height="84" target="*title_records" name="april_title_button"]
[glink color="black" text="" graphic="april_ui/v3/title/title_config_normal.png" enterimg="april_ui/v3/title/title_config_hover.png" x="95" y="516" width="300" height="84" target="*title_config" name="april_title_button"]
[glink color="black" text="" graphic="april_ui/v3/title/title_exit_normal.png" enterimg="april_ui/v3/title/title_exit_hover.png" x="95" y="608" width="300" height="84" target="*title_exit" name="april_title_button"]
[xchgbgm storage="01_The_First_Day_of_365.mp3" time="1000"]
[s]

*title_records
[jump storage="system_common.ks" target="*records"]
[s]

*title_config
[freeimage layer="1"]
[cm]
[sleepgame storage="config.ks"]
[jump target="*title"]
[s]

*title_exit
[if exp="(typeof process != 'undefined' && process.versions && process.versions.nw) || (typeof navigator != 'undefined' && navigator.app && navigator.app.exitApp)"]
[close]
[else]
[dialog type="alert" text="ブラウザ版では画面を自動で閉じられません。タブやブラウザを閉じて終了してください。"]
[endif]
[jump target="*title"]
[s]

*start
[freeimage layer="1"]
[cm]
[hidemenubutton]
[tb_keyconfig flag=1]
[jump storage="system_common.ks" target="*new_game"]
[s]

*load
[freeimage layer="1"]
[cm]
[showload]
[jump target="*title"]
[s]
