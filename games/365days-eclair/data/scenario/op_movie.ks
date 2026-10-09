; 4月CLEARと5月冒頭の間に流すオープニング。
; 初回は最後まで再生し、2回目以降はクリック／タップでスキップ可能。
*op_after_april
[skipstop]
[clearstack stack="if"]
[cm]
[clearfix]
[hidemenubutton]
[tb_hide_message_window]
; 動画の下に4月CLEARのCGを残さず、5月冒頭と同じ背景にしておく。
[bg storage="apr_shop_morning.png" time="1"]
[stopbgm fadeout="true" time="500"]
[stopse]
[wait time="550"]

; 同梱エンジンの movie タグには再生エラー処理がないため、読み込み失敗時だけ5月へ進める。
[iscript]
f.op_movie_fallback = false;
f.op_movie_watchdog = true;
(function () {
  var started = Date.now();
  var timer = setInterval(function () {
    if (!f.op_movie_watchdog) {
      clearInterval(timer);
      return;
    }
    var video = document.getElementById("bgmovie");
    if ((video && video.error) || (!video && Date.now() - started > 6000)) {
      f.op_movie_fallback = true;
      f.op_movie_watchdog = false;
      clearInterval(timer);
      if (video) {
        video.pause();
        video.remove();
      }
      TYRANO.kag.ftag.nextOrder();
    }
  }, 400);
})();
[endscript]

[if exp="sf.op_movie_seen === true"]
[movie storage="op_recipe_tomorrow.mp4" skip="true"]
[else]
[movie storage="op_recipe_tomorrow.mp4" skip="false"]
[endif]

[eval exp="f.op_movie_watchdog = false; if (!f.op_movie_fallback) sf.op_movie_seen = true"]
[call storage="system_common.ks"]
[restore_april_quick_menu]
[jump storage="n05_may.ks" target="*scene_05_01"]
