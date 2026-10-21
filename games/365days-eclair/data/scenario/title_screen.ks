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
[if exp="!window.MarchEnding"]
[loadjs storage="march_ending.js"]
[endif]
[iscript]
window.MarchEnding.cleanup();
[endscript]
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
      var oldSeptemberMenu = kag.stat.current_scenario === "n09_september.ks" &&
        kag.stat.f && kag.stat.f.current_clear_month === "09" &&
        tag && tag.name === "glink" && tag.pm && tag.pm.text === "10月へ" &&
        document.body.innerText.indexOf("9月 CLEAR『店の外でも、ウチらの店』") >= 0 &&
        document.body.innerText.indexOf("10月へ") < 0;
      var oldOctoberMenu = kag.stat.current_scenario === "n10_october.ks" &&
        kag.stat.f && kag.stat.f.current_clear_month === "10" &&
        tag && tag.name === "glink" && tag.pm && tag.pm.text === "11月へ" &&
        document.body.innerText.indexOf("10月 CLEAR『海の向こうへ、いつもの味』") >= 0 &&
        document.body.innerText.indexOf("11月へ") < 0;
      var oldNovemberMenu = kag.stat.current_scenario === "n11_november.ks" &&
        kag.stat.f && kag.stat.f.current_clear_month === "11" &&
        tag && tag.name === "glink" && tag.pm && tag.pm.text === "12月へ" &&
        document.body.innerText.indexOf("11月 CLEAR『神様の言葉、ウチらの答え』") >= 0 &&
        document.body.innerText.indexOf("12月へ") < 0;
      var oldDecemberMenu = kag.stat.current_scenario === "n12_december.ks" &&
        kag.stat.f && kag.stat.f.current_clear_month === "12" &&
        tag && tag.name === "glink" && tag.pm && tag.pm.text === "1月へ" &&
        document.body.innerText.indexOf("12月 CLEAR『明日も仕込みができるように』") >= 0 &&
        document.body.innerText.indexOf("1月へ") < 0;
      var oldJanuaryMenu = kag.stat.current_scenario === "n01_january.ks" &&
        kag.stat.f && kag.stat.f.current_clear_month === "01" &&
        tag && tag.name === "glink" && tag.pm && tag.pm.text === "2月へ" &&
        document.body.innerText.indexOf("1月 CLEAR『点数の外にある、おいしい』") >= 0 &&
        document.body.innerText.indexOf("2月へ") < 0;
      var oldFebruaryMenu = kag.stat.current_scenario === "n02_february.ks" &&
        kag.stat.f && kag.stat.f.current_clear_month === "02" &&
        tag && tag.name === "glink" && tag.pm && tag.pm.text === "3月へ" &&
        document.body.innerText.indexOf("2月 CLEAR『その日まで、ふたりで』") >= 0 &&
        document.body.innerText.indexOf("3月へ") < 0;
      if (oldClearMenu || oldSeptemberMenu || oldOctoberMenu || oldNovemberMenu || oldDecemberMenu || oldJanuaryMenu || oldFebruaryMenu) {
        kag.ftag.startTag("jump", {
          storage: oldFebruaryMenu ? "n02_february.ks" : (oldJanuaryMenu ? "n01_january.ks" : (oldDecemberMenu ? "n12_december.ks" : (oldNovemberMenu ? "n11_november.ks" : (oldOctoberMenu ? "n10_october.ks" : (oldSeptemberMenu ? "n09_september.ks" : "n08_august.ks"))))),
          target: oldFebruaryMenu ? "*february_clear_menu" : (oldJanuaryMenu ? "*january_clear_menu" : (oldDecemberMenu ? "*december_clear_menu" : (oldNovemberMenu ? "*november_clear_menu" : (oldOctoberMenu ? "*october_clear_menu" : (oldSeptemberMenu ? "*september_clear_menu" : "*august_clear_menu")))))
        });
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
[if exp="sf.true_bad_seen === true"]
[glink text="" color="black" x="700" y="430" width="470" height="132" target="*march_restart" graphic="april_ui/v5/title/title_retry_normal.svg" enterimg="april_ui/v5/title/title_retry_hover.svg" name="april_title_button"]
[endif]
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
[eval exp="f.march_retry_run = false"]
[freeimage layer="1"]
[cm]
[hidemenubutton]
[tb_keyconfig flag=1]
[jump storage="system_common.ks" target="*new_game"]

*load
[freeimage layer="1"]
[cm]
[showload]
[jump target="*title"]
[s]

*march_restart
[clearstack stack="if"]
[if exp="sf.true_bad_seen !== true"]
[jump target="*title"]
[endif]
[eval exp="f.march_retry_run = true"]
[freeimage layer="1"]
[cm]
[hidemenubutton]
[tb_keyconfig flag=1]
[jump storage="system_common.ks" target="*new_game"]
