# 12月実装報告

施工日：2026-10-13。基準：`DECEMBER_CODEX_LUNA_IMPLEMENTATION_PACK_v1.zip`。11月完成版への増分実装です。

第9章「完売、そして倒れる」の実装と静的検査を完了。実機操作は、従来のユーザー指定に従って行っていません。パックにある実機受入項目はユーザー確認へ引き継ぎます。

## 実装範囲

- 11月CLEAR「12月へ」→DECEMBERアイキャッチ→SCENE01〜06→12月CLEAR。
- 採用済みv2の会話363ページを原文照合。ユーザー追加依頼の会話2ページと地の文2ページを追記。三好の「それじゃ、私が今年の最後のお客さんかしら」も保持。
- CHOICE00：A→M06『予約票タワー』、B→M07『リボンの迷宮』、C→整理の会話→SCENE03。MINI再挑戦はCHOICE00へ。
- CHOICE01：A→CORE014『完売、そして倒れる』、B→正解会話→SCENE05。CORE再挑戦はCHOICE01へ。初回から正解を選べます。
- 本CG3枚、ミニイベントCG2枚を表示時に解放。全5枚でスキップ停止。CG12_01は選択肢前、CG12_02はBAD結果前、CG12_03は三好退店前に消去し、背景・人物を復帰。
- ミニCGは640×360、x320/y100の既存ウインドウ形式。原画の背景登録や新規生成はありません。
- SCENE03の三好→神田、SCENE05の三好の入退店に既存ドアベル計6回。小声の会話5件は本文を変えず少し小さく表示。主人公に秘密を聞かせる追加台詞はありません。
- CHOICE00は中央x310・y150/245/340、CHOICE01はx310・y195/290、いずれも高さ85。浮いた質問見出しは追加していません。
- CORE/MINI/CLEAR記録、未回収のネタバレ防止、CG一覧と拡大・閉じる、戻り先、全記録／デバッグ単月リセットに12月を追加。
- 12月末はタイトル・記録の2ボタン。未実装の1月へは飛びません。

## 変更ファイル

作業版：`C:/Program Files (x86)/Steam/steamapps/common/TyranoBuilder/myproject/365days_eclair`。

ブラウザ版：`C:/Users/user/Documents/sacher10610.github.io/games/365days-eclair`。

| 両ゲームルートからのパス | 変更 |
|---|---|
| `data/scenario/n12_december.ks` | 新規。本編・分岐・演出・CLEAR |
| `data/scenario/n11_november.ks` | 「12月へ」ボタン1行のみ追加。女神SE/BGM・選択肢間の会話も保持 |
| `data/scenario/system_common.ks` | 12月記録・CG・選択ラベル・戻り・リセット |
| `data/scenario/title_screen.ks` | 旧11月CLEARセーブの次月ボタン補修を既存処理へ追加 |
| `data/bgimage/cg/december/CG12_01_Just_One_More_Order.png` | 原本そのまま追加 |
| `data/bgimage/cg/december/CG12_02_Sold_Out_Then_Collapse.png` | 採用済み右手修正版を追加 |
| `data/bgimage/cg/december/CG12_03_The_Last_Customer_of_the_Year.png` | 原本そのまま追加 |
| `data/bgimage/cg/december/SD12_01_MiniBad006_Reservation_Tower.png` | 原本そのまま追加 |
| `data/bgimage/cg/december/SD12_02_MiniBad007_Ribbon_Maze.png` | 原本そのまま追加 |
| `data/bgimage/eyecatch/EYECATCH_11_12_DECEMBER.png` | 原本そのまま追加。CG集には登録しない |

ブラウザ版だけ `index.html` の説明を12月までに更新。作業版の `APRIL_EXISTING_VARIABLE_MAP.md` に12月の台帳を追記。報告書・検査結果・素材対応表はゲーム外の本フォルダへ保存。

`first.ks`、`Config.tjs`、共通文字レイアウト・CSS、`system/future_character_define.ks`、4〜10月シナリオ、OP、既存画像・音源は変更していません。作業版とブラウザ版で以前から異なる起動ファイルも、それぞれの内容を保持します。

## 実体対応

| 永続キー | 登録タイミング |
|---|---|
| `sf.core_bad_014` | 共通 `register_core_bad id="014"` |
| `sf.mini_bad_m06` | 共通 `register_mini_bad id="m06"` |
| `sf.mini_bad_m07` | 共通 `register_mini_bad id="m07"` |
| `sf.normal_ch12_clear` | 12月CLEAR到達 |
| `sf.cg_december_event_01` | CG12_01表示 |
| `sf.cg_december_event_02` | CG12_02表示 |
| `sf.cg_december_event_03` | CG12_03表示 |
| `sf.cg_december_mini_01` | SD12_01表示 |
| `sf.cg_december_mini_02` | SD12_02表示 |

既存IDとの衝突なし。旧セーブの未定義フラグは未回収として扱います。新規開始時に永続記録を消しません。進行には既存の `f.chapter`、`f.scene`、`f.current_clear_month`、`f.april_bad` を使い、新しい別名の永続記録やマクロを作っていません。

| キャラ | 使用storage / face | 定義入口 |
|---|---|---|
| 抹茶エクレア | `apr_matcha_normal.png` / `default`、落ち着いた表情は既存 `quiet` | アイキャッチ入口・SCENE01入口から既存future登録をcall |
| 三好文子 | `apr_fumiko.png` / `default` | 同上。未登録時だけchara_new |
| 神田姫花 | `kanda_normal.png` / `default` | 同上。未登録時だけchara_new |

登録判定が現在の `TYRANO.kag.stat.charas` を使うことを確認。壊れた旧TG条件を再導入していません。同梱エンジンの `chara_hide` は未登録キャラを参照すると失敗するため、12月に登場しない女神の消去だけ登録済み判定を付けています。通常起動・旧セーブ・途中LOADでの実表示は未確認です。

## 背景と音

背景は既存の朝厨房・昼厨房・夜厨房、午前店内・昼店内・夜店内を再利用。夕方厨房には既存 `apr_kitchen_day.png`、クリスマス昼には既存 `apr_shop_day.png` を用い、新規背景・立ち絵は作成していません。

| 区間 | 音源 |
|---|---|
| 通常会話・選択肢・MINI・SCENE05 | `05_Morning_Mise_en_Place.mp3` |
| CORE014の閉店後〜BAD結果 | `02_Flour_on_the_Floor.mp3` |
| CORE再挑戦 | 通常曲へ復帰 |
| SCENE06冒頭〜CLEAR | `06_One_Year_One_Eclair.mp3` |
| 月間アイキャッチ | `SE_EYECATCH_05_06_Jingle.wav` |
| 三好・神田の入退店 | `se_shop_door_chime.wav`、音量65・ループなし |

前月曲は1000msで停止開始→700ms暗転→300ms待機で停止時間を確保してからジングル。曲切替には既存 `xchgbgm` を使用。MINI再挑戦とCLEAR表示で同じ曲を再始動しません。同梱4音源は既存実体とSHA256が一致したため重複配置していません。

## 検査と引き継ぎ

15シナリオ、JavaScript488件、ファイル参照411件の静的検査に合格。採用済み363件＋追加2件の台詞、原本6画像、分岐・戻り・CG消去・スキップ停止・ベル・BGM切替を照合。記録処理を独立JavaScript環境で実行し、12月の本文・コメント・caption・未回収マスク・リセットと、4〜11月の112状態の維持を確認しました。

旧8〜11月CLEARの補修コールバックも独立JavaScriptで確認。実際のセーブファイルをLOADして確認した結果ではありません。

実機での画面・音・SAVE/LOAD・UI往復は未確認です。[TEST_EVIDENCE.md](TEST_EVIDENCE.md) を引き継ぎます。テスト専用入口・Reload・仮回収フラグはゲームへ追加していません。今回は未コミット・未プッシュです。

## ユーザー確認後の場面調整（2026-10-13）

- SCENE04「最初からそう言い！」後に固定電話の着信を追加。「電話だ。ちょっと出てくる」→店舗側で受話器を取る地の文→500msフェードで厨房に戻る→抹茶「なんやったん？」→既存「……注文の相談」へ接続。店舗側へ移る際は抹茶の立ち絵を消し、戻る際に元の位置・表情で復帰。BGMは継続。
- 新規オリジナルSE `data/sound/se_shop_telephone_ring.wav` を作成。固定電話らしい二音の呼出音を2回、3.8秒／44.1kHz／16bit／モノラル。音量65、単発、SEバッファ1。応答時に明示停止するためループ・音残りを作らない。外部録音素材なし。
- CORE014のCG12_02直前に120ms暗転＋180ms保持、黒画面の下でCGへ切替後220msで表示。「なあ！　聞こえる！？」後はCGを900msで黒へフェードアウトしてから次の場面へ。既存のCG解放とスキップ停止は保持。
- CHOICE00の2つ目を「特別感を出すため、リボンを何重にも結ぼう」、3つ目を「受け取り日ごとに一覧にしよう」に変更。位置と分岐先は維持。
- この追加調整のゲーム変更は `data/scenario/n12_december.ks` と上記SEの2ファイル。両ゲーム版へ同一内容を反映。
- 更新後の静的検査は15シナリオ／JavaScript488件／ファイル参照411件に合格。追加場面の順序・SE停止・暗転とCGの接続・選択肢を照合。WAVの形式・長さ・無クリッピング・先頭末尾の無音を検査。試聴および実機操作は未実施、ユーザー確認。
