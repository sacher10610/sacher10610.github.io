/* March endings. Only movie/TRUE playback owns these temporary listeners/locks.
 * Release: development reset is disabled; existing save data is preserved.
 */
(function (root) {
  "use strict";
  if (root.MarchEnding) return;
  var ENABLE_MARCH_ED_DEBUG_RESET = false;
  var kag = root.TYRANO.kag;
  var active = null;
  var events = ["pointerdown", "pointerup", "touchstart", "touchend", "click", "dblclick", "keydown", "keyup", "keyhold", "contextmenu", "wheel"];
  var now = function () { return Date.now(); };
  function canLeave(state, time) {
    return !!(state && state.cardVisible && state.musicEnded && !state.failed && !state.consumed && time - state.cardShownAt >= 1500);
  }
  function playerName(value) {
    return Array.from(String(value || "").trim().replace(/[<>\[\]\r\n]/g, "")).slice(0, 12).join("") || "ユウ";
  }
  function stopEvent(e) { e.preventDefault(); e.stopImmediatePropagation(); }
  function next() { kag.cancelStrongStop(); kag.cancelWeakStop(); kag.ftag.nextOrder(); }
  function blankStage() {
    // Remove the old CG before removing a full-screen media overlay (prevents a flash).
    if (!kag.layer || !kag.layer.getLayer) return;
    ["fore", "back"].forEach(function (page) {
      kag.layer.getLayer("base",page).css({"background-image":"none","background-color":"#000","background-size":"","background-position":"","background-repeat":""});
    });
  }
  function add(state, object, type, fn) {
    object.addEventListener(type, fn, { capture: true, passive: false });
    state.listeners.push(function () { object.removeEventListener(type, fn, true); });
  }
  function timer(state, fn, ms) {
    var id = root.setTimeout(function () { if (active === state) fn(); }, ms);
    state.timers.push(id);
    return id;
  }
  function overlay(state, title, message, options) {
    if (state.errorPanel) state.errorPanel.remove();
    var panel = root.document.createElement("div");
    panel.className = "march-media-recovery";
    panel.style.cssText = "position:fixed;inset:0;z-index:2147483646;background:#10170feF;display:flex;align-items:center;justify-content:center;font-family:sans-serif;color:#3b2a1b";
    var box = root.document.createElement("div");
    box.style.cssText = "background:#fff8e4;border:2px solid #a68b45;border-radius:14px;padding:24px;max-width:580px;margin:20px;line-height:1.7";
    var heading = root.document.createElement("strong"); heading.textContent = title; box.appendChild(heading);
    var text = root.document.createElement("p"); text.textContent = message; box.appendChild(text);
    options.forEach(function (option) {
      var button = root.document.createElement("button"); button.textContent = option.text;
      button.style.cssText = "background:#305332;color:#fff8e4;border:1px solid #b99a48;border-radius:8px;padding:12px 18px;margin:8px;font-size:16px;cursor:pointer";
      button.addEventListener("click", function (e) { e.preventDefault(); e.stopPropagation(); option.run(); });
      box.appendChild(button);
    });
    panel.appendChild(box); root.document.body.appendChild(panel); state.errorPanel = panel;
  }
  function muteOwnedAudio(state) {
    if (state.audio) { state.audio.stop(); }
  }
  function clearHeldInput() {
    var input = kag.key_mouse;
    if (!input) return;
    var keys = input.keyboard && input.keyboard.key_state_map;
    if (keys) Object.keys(keys).forEach(function (key) {
      keys[key].pressed = false; keys[key].hold_frame = 0;
      root.clearTimeout(keys[key].timer_id);
    });
    input.is_holding_skip = false; input.is_swipe = false;
  }
  function cleanup() {
    var state = active;
    if (!state) return;
    active = null;
    state.timers.forEach(root.clearTimeout);
    state.listeners.forEach(function (remove) { remove(); });
    if (state.fadingAudio) {
      state.fadingAudio.off("fade",state.onFade);
      state.fadingAudio.stop(); state.fadingAudio.unload();
    }
    if (state.audio) {
      state.audioHandlers.forEach(function (pair) { state.audio.off(pair[0], pair[1]); });
      state.audio.stop();
      if (kag.tmp.map_bgm["0"] === state.audio) {
        delete kag.tmp.map_bgm["0"];
        kag.stat.current_bgm = ""; kag.stat.current_bgm_vol = "";
        kag.tmp.is_bgm_play = false;
      }
      state.audio.unload();
    }
    if (!kag.tmp.map_bgm["0"]) {
      kag.stat.current_bgm = ""; kag.stat.current_bgm_vol = "";
      kag.tmp.is_bgm_play = false;
    }
    if (state.video) {
      state.video.pause(); state.video.removeAttribute("src"); state.video.load(); state.video.remove();
    }
    if (state.card) state.card.remove();
    if (state.errorPanel) state.errorPanel.remove();
    kag.setSkip = state.oldSetSkip; kag.setAuto = state.oldSetAuto;
    kag.stat.enable_keyconfig = state.oldKeyconfig;
    kag.stat.ch_speed = state.oldSpeed;
    kag.stat.is_skip = false; kag.stat.is_auto = false;
    kag.stat.is_wait = false;
    clearHeldInput();
    kag.cancelStrongStop(); kag.cancelWeakStop();
  }
  function preventTrailingInput() {
    var until = now() + 450;
    var block = function (e) { if (now() < until) stopEvent(e); };
    ["click", "dblclick", "touchend", "keyup"].forEach(function (type) { root.document.addEventListener(type, block, true); });
    root.setTimeout(function () {
      ["click", "dblclick", "touchend", "keyup"].forEach(function (type) { root.document.removeEventListener(type, block, true); });
    }, 500);
  }
  function begin(kind) {
    cleanup();
    kag.setSkip(false); kag.setAuto(false);
    clearHeldInput();
    var state = {
      kind: kind, listeners: [], timers: [], audioHandlers: [], musicEnded: false,
      cardVisible: false, consumed: false, failed: false,
      oldKeyconfig: kag.stat.enable_keyconfig, oldSpeed: kag.stat.ch_speed,
      oldSetSkip: kag.setSkip, oldSetAuto: kag.setAuto
    };
    active = state;
    kag.stat.enable_keyconfig = false; kag.stat.ch_speed = "10";
    kag.setSkip = function (value) { if (!value) return state.oldSetSkip.call(kag, false); };
    kag.setAuto = function (value) { if (!value) return state.oldSetAuto.call(kag, false); };
    events.forEach(function (type) {
      add(state, root.document, type, function (e) {
        if (state.errorPanel && state.errorPanel.contains(e.target)) return;
        var confirm = type === "click" || type === "touchend" ||
          (type === "keydown" && !e.repeat && (e.key === "Enter" || e.key === " " || e.code === "NumpadEnter"));
        stopEvent(e);
        if (confirm && canLeave(state, now())) finishTrue(state);
      });
    });
    return state;
  }
  function failTrue(state, reason) {
    if (active !== state || state.failed) return;
    state.failed = true; muteOwnedAudio(state);
    kag.stronglyStop(); kag.weaklyStop();
    root.console.error("[March TRUE audio]", reason);
    overlay(state, "エンディング音声を再生できませんでした", "再生をやり直すか、最後の選択肢へ戻れます。", [
      {text:"最初から再生し直す",run:function () { cleanup(); kag.ftag.startTag("jump", {storage:"n03_march.ks",target:"*true_end_retry"}); }},
      {text:"最後の選択肢へ戻る",run:function () { cleanup(); kag.ftag.startTag("jump", {storage:"n03_march.ks",target:"*final_choice"}); }}
    ]);
  }
  function trueBegin() {
    if (kag.variable.sf.true_bad_seen !== true || kag.stat.f.march_retry_run !== true) {
      cleanup(); kag.ftag.startTag("jump", {storage:"n03_march.ks",target:"*scene_03_11a"}); return;
    }
    // The FINAL button is a user gesture; initialize Tyrano's audio before locking input.
    if (kag.readyAudio) kag.readyAudio();
    var state = begin("true");
    kag.stronglyStop(); kag.weaklyStop();
    var oldAudio = kag.tmp.map_bgm["0"];
    function startAudio() {
      if (active !== state || state.audioBegun) return;
      state.audioBegun = true;
      if (state.fadingAudio) {
        state.fadingAudio.off("fade",state.onFade);
        state.fadingAudio.stop(); state.fadingAudio.unload(); state.fadingAudio = null;
      }
      var enabled = kag.stat.play_bgm;
      // Even with BGM disabled we need a silent transport and its real end event.
      if (enabled === false) kag.stat.play_bgm = true;
      kag.ftag.startTag("playbgm", {storage:"16_Recipe_for_Day_366.mp3",loop:"false",stop:"true",can_ignore:"false",buf:"0",volume:enabled === false ? "0" : ""});
      kag.stat.play_bgm = enabled;
      state.audio = kag.tmp.map_bgm["0"];
      if (!state.audio) { failTrue(state, "audio object unavailable"); return; }
      function listen(type, fn) { state.audio.on(type, fn); state.audioHandlers.push([type,fn]); }
      listen("end", function () { if (active === state) state.musicEnded = true; });
      listen("loaderror", function (id, error) { failTrue(state, error); });
      listen("playerror", function (id, error) { failTrue(state, error); });
      var started = false;
      function start() {
        if (active !== state || started || state.failed) return;
        started = true; state.lastProgressAt = now(); state.lastSeek = 0; next();
        watchProgress(state);
      }
      listen("play", start);
      if (state.audio.playing()) start();
      timer(state, function () { if (!started) failTrue(state,"audio start timed out"); },20000);
    }
    // A short fade completes before the TRUE transport starts: never two music tracks.
    if (oldAudio && oldAudio.playing() && oldAudio.volume() > 0) {
      state.fadingAudio = oldAudio; state.onFade = startAudio;
      oldAudio.once("fade",startAudio);
      kag.ftag.startTag("stopbgm",{stop:"true",fadeout:"true",time:"180"});
      timer(state,startAudio,220);
    } else {
      kag.ftag.startTag("stopbgm",{stop:"true"}); startAudio();
    }
  }
  function watchProgress(state) {
    if (state.failed || state.musicEnded || active !== state) return;
    var pos = Number(state.audio.seek()) || 0;
    if (pos > state.lastSeek) { state.lastProgressAt = now(); state.lastSeek = pos; }
    if (!root.document.hidden && now() - state.lastProgressAt > 25000) { failTrue(state,"audio playback stalled"); return; }
    if (root.document.hidden) state.lastProgressAt = now();
    timer(state,function () { watchProgress(state); },500);
  }
  function trueWait(pm) {
    var state = active;
    if (!state || state.kind !== "true") {
      cleanup(); kag.ftag.startTag("jump",{storage:"n03_march.ks",target:"*final_choice"}); return;
    }
    kag.stronglyStop(); kag.weaklyStop();
    var earliest = now() + Number(pm.minimum || 1000);
    function poll() {
      if (state.failed) return;
      var position = Number(state.audio.seek()) || 0;
      if (now() >= earliest && (state.musicEnded || position >= Number(pm.at))) next();
      else timer(state,poll,80);
    }
    poll();
  }
  function trueCard() {
    var state = active;
    if (!state || state.kind !== "true") { kag.ftag.startTag("jump",{storage:"n03_march.ks",target:"*final_choice"}); return; }
    kag.stronglyStop(); kag.weaklyStop();
    var card = root.document.createElement("div");
    card.style.cssText = "position:fixed;inset:0;z-index:199999;background:#000;opacity:0;transition:opacity 900ms;display:flex;align-items:center;justify-content:center";
    var img = root.document.createElement("img");
    img.alt = ""; img.draggable = false;
    img.style.cssText = "width:100%;height:100%;object-fit:contain;pointer-events:none";
    state.card = card; card.appendChild(img); root.document.body.appendChild(card);
    img.onload = function () {
      if (active !== state) return;
      if (card.getBoundingClientRect) card.getBoundingClientRect();
      card.style.opacity = "1";
      // Wait until the fade has completed before measuring the card's minimum hold.
      timer(state,function () { state.cardVisible = true; state.cardShownAt = now(); },900);
    };
    img.onerror = function () { failTrue(state,"fin image unavailable"); };
    img.src = "./data/image/ending/ENDCARD_TRUE_01_FIN.png";
    // A held controller button must be released before it can confirm the card.
    var previous = true;
    function controller() {
      var pads = root.navigator.getGamepads ? root.navigator.getGamepads() : [];
      var pressed = Array.prototype.some.call(pads,function (pad) { return pad && pad.buttons[0] && pad.buttons[0].pressed; });
      if (pressed && !previous && canLeave(state,now())) { finishTrue(state); return; }
      previous = pressed; timer(state,controller,100);
    }
    controller();
  }
  function finishTrue(state) {
    if (active !== state || !canLeave(state,now())) return;
    state.consumed = true;
    kag.variable.sf.true_end_seen = true; kag.saveSystemVariable();
    blankStage(); cleanup(); preventTrailingInput(); next();
  }
  function movie(pm) {
    var state = begin("movie");
    kag.stronglyStop(); kag.weaklyStop();
    kag.ftag.startTag("stopbgm",{stop:"true"});
    var video = root.document.createElement("video"); state.video = video;
    video.style.cssText = "position:fixed;inset:0;width:100%;height:100%;background:#000;object-fit:contain;z-index:199999";
    video.playsInline = true; video.setAttribute("playsinline", ""); video.preload = "auto";
    video.controls = false; video.loop = false;
    video.volume = kag.stat.play_bgm === false ? 0 : Math.max(0,Math.min(1,Number(kag.config.defaultBgmVolume || 0)/100));
    var done = false;
    function complete() { if (active !== state || done) return; done = true; blankStage(); cleanup(); preventTrailingInput(); next(); }
    function error(reason) {
      if (active !== state || state.failed || done) return;
      state.failed = true; video.pause(); root.console.error("[March first movie]", reason);
      overlay(state,"エンディング動画を再生できませんでした", "動画の読み込みを再試行できます。再生が難しい場合も、このあとの物語へ進めます。",[
        {text:"再生をやり直す",run:function () { cleanup(); movie(pm); }},
        {text:"後日談へ進む",run:complete}
      ]);
    }
    add(state,video,"ended",complete);
    add(state,video,"error",function () { error(video.error ? video.error.code : "video error"); });
    var lastTime = 0, lastProgressAt = now();
    function watch() {
      if (state.failed || done) return;
      if (video.currentTime > lastTime) { lastTime = video.currentTime; lastProgressAt = now(); }
      if (root.document.hidden) lastProgressAt = now();
      if (!root.document.hidden && now() - lastProgressAt > 25000) { error("video playback stalled"); return; }
      timer(state,watch,500);
    }
    video.src = "./data/video/"+pm.storage; root.document.body.appendChild(video);
    var play = video.play();
    if (play && play.catch) play.catch(error);
    watch();
  }
  function installTag(name,defaults,start) { kag.ftag.master_tag[name] = {kag:kag,pm:defaults,start:start}; }
  installTag("march_true_begin",{},trueBegin);
  installTag("march_true_wait",{at:"0",minimum:"1000"},trueWait);
  installTag("march_true_card",{},trueCard);
  installTag("march_movie",{storage:"march_first_ending.mp4"},movie);
  if (kag.on) {
    kag.on("load-start.march-ending",cleanup,{system:true});
    kag.on("load-complete.march-ending",function () {
      // load-complete is emitted inside make.ks's return, before the saved file is restored.
      if (kag.stat.f.scene !== "03_true") return;
      var attempts = 0;
      function recover() {
        if (kag.stat.f.scene !== "03_true") return;
        if (kag.stat.current_scenario === "n03_march.ks") {
          cleanup(); kag.ftag.startTag("jump",{storage:"n03_march.ks",target:"*final_choice"});
        } else if (++attempts < 40) root.setTimeout(recover,50);
      }
      root.setTimeout(recover,0);
    },{system:true});
  }
  root.MarchEnding = {
    ENABLE_MARCH_ED_DEBUG_RESET: ENABLE_MARCH_ED_DEBUG_RESET,
    cleanup: cleanup, canLeave: canLeave, playerName: playerName,
    resetFirstEndingFlag: function () {
      if (!root.MarchEnding.ENABLE_MARCH_ED_DEBUG_RESET) return false;
      kag.variable.sf.true_bad_seen = false; kag.saveSystemVariable(); return true;
    }
  };
})(window);
