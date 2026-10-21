# 実装イメージの疑似コード（コピー＆ペースト実行用ではない）

**注意：** 現行TyranoBuilder／TyranoScriptの実装方式をCodexが調査し、正しいタグ・JS文法・マクロ・引数へ落とし込む。ラベル・関数・保存APIを想像だけで決めない。

```text
# 3月 SCENE10 分岐
if persistent.true_bad_seen == true:
    go SCENE11B
else:
    go SCENE11A

# 1周目
SCENE11A:
    display CG15_05 and scene dialogue
    stop/fade normal BGM
    playVideo('march_first_ending.mp4', embeddedAudio=true, once=true)
    await actualVideoEnded()     # do NOT use 227s timer
    unload video, stop sound
    go SCENE12A

SCENE12A:
    BGM = silence
    show CG15_06 and scene dialogue
    show 真BAD017 card
    persistent.true_bad_seen = true
    persist via existing system mechanism
    return title, title shows retry entry

# 2周目TRUE
FINAL_3:
    fade out One Year One Eclair
    start BGM 366日目のレシピ, once, from zero
    inputGuard = true, prevent skip/click/auto-pause
    play TRUE scenario timed to music position
    show CG15_07 at first player-name dialogue
    ...
    show CG15_08 and fixed final sentence
    hide dialogue HUD and show ENDCARD_TRUE_01_FIN
    waitElapsed = after 1.5sec from card display
    musicEnded = actual music event completed
    await waitElapsed AND musicEnded
    enable single confirm (click / Enter / controller / tap)
    await confirmation
    inputGuard = false; unsubscribe event handlers; save true end; return title

# records debug button (TEMPORARY)
RECORDS_DEBUG_RESET:
    if confirmFromUser():
        persistent.true_bad_seen = false
        persistSystemData()
        updateUI()
        # no records, galleries, other flags deleted
```

**タイムライン設計：** 曲の時間を固定的な1行あたり秒数へ分割して収めるのは危険。音声の現在再生位置を見ながら、文章量・読了時間・CG表示を実機で調整する。最後はカードを表示して曲終了を待てるので、**全台詞が収まれば数秒の余韻は最後に吸収可能**。
