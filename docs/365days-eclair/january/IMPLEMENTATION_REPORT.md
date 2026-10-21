# 1月実装報告

実装日：2026-10-14。基準は `JANUARY_CODEX_LUNA_IMPLEMENTATION_PACK_v1.zip` と編集直前の12月追加修正版。編集前ファイルはゲーム外 `.tmp-january/baseline/live` / `web` に保管し、`baseline-hashes.json` にSHA256を記録しています。

第10章・1月『満点の味、ゼロの顔』の実装・ソース検査を完了。実機操作・試聴・SAVE/LOADは、ユーザーの従来指定に従い行っていません。パックの実機受入項目はユーザー確認へ引き継ぎます。

## 実装範囲

- 12月CLEAR「1月へ」→JANUARYアイキャッチ→SCENE01〜06→1月CLEAR『点数の外にある、おいしい』。
- 採用済みシナリオの会話387件を話者と順序を含め原文照合。主人公の通常立ち絵は表示せず、採点表を店内独自研究用として扱う原文を維持。藤代の正体・2月以降の展開・暗黒皇帝ネタは追加していません。
- CHOICE00 A→M08『試食アンケート十二枚』、B→M09『理想温度、あと0.1℃』、C→正解会話→SCENE03。MINI再挑戦はCHOICE00へ。
- CHOICE01 A→CORE015『満点の味、ゼロの顔』、B→正解会話→SCENE04。CORE再挑戦はCHOICE01へ。両方の正解は初回から選択可能。BAD既読時は既存短縮文で戻ります。
- CG13_01は三好の「十八かしら。でもね」から退店直前まで。CG13_03は神田の作業後に食べたい話から退店直前まで。両CGの表示時に立ち絵を消し、終了時に必要な客だけをフェードの下で復元してから退店ベル→HIDE。
- ユーザー追加指定によりCG13_02は表示を後ろへ移動。三好との最後の会話にある抹茶「……」後、スキップを止めて700ms待機→三好退店ベル・HIDE→650ms暗転で時間経過→CG13_02→主人公「今日の試食、どうだった？」。以後の会話中はCGを維持し、「食べてくれる人の顔、見んようになってたんやな」の後にフェードで店内へ戻して共通BAD画面へ。台詞・BGM・分岐は変更なし。
- SD13_01は三好の「全部書いたら、エクレアが冷めてしまいそう」直前。SD13_02は閉店間際へフェード後の「……お客さん、帰ってもうた」直前。既存640px幅ウインドウ形式を使用し、BAD結果前に画像・枠を消去。
- 本CG3枚・SD2枚は表示時に別々に解放し、全5枚でスキップ停止。JANUARYはギャラリーに登録しません。
- SCENE02の三好→神田→藤代、SCENE04の神田→三好を別々に入退店。時間経過の前はフェード。ドアベルは計13回（SCENE02 6、MINI008 1、CORE015 2、SCENE04 4）。
- 通常はMorning Mise en Placeを継続。CORE015は最初の選択後の会話4件から数日後へ進む時にFlour on the Floorへ変更し、再挑戦時は通常曲へ復帰。SCENE06冒頭からOne Year, One Eclairを流し、CLEARで再起動せず継続。
- 1月のCORE/MINI/CLEAR記録、CG一覧・拡大、未回収のネタバレ防止、戻り先、全記録／単月リセットを既存方式に追加。
- 1月CLEARはタイトル・記録の2ボタンで待機。未実装の2月へ飛ぶボタンはありません。

## 変更ファイル

TyranoBuilder作業版：`C:/Program Files (x86)/Steam/steamapps/common/TyranoBuilder/myproject/365days_eclair`。

ブラウザ版：`C:/Users/user/Documents/sacher10610.github.io/games/365days-eclair`。

| 両ゲームルートからのパス | 内容 |
|---|---|
| `data/scenario/n01_january.ks` | 新規。本編・分岐・演出・1月CLEAR |
| `data/scenario/n12_december.ks` | 月末へ「1月へ」ボタン1行のみ追加。電話・倒れるCG演出・修正済み選択肢を保持 |
| `data/scenario/system_common.ks` | 1月の記録・CG・選択ラベル・リセット・戻り、1月MINIの表示行数対策 |
| `data/scenario/title_screen.ks` | 既存の旧CLEAR補修へ12月を追加。旧12月月末セーブに新ボタンがない場合の再描画 |
| `data/bgimage/cg/january/CG13_01_The_Five_Columns.png` | 同梱の原本PNGを無改変で追加 |
| `data/bgimage/cg/january/CG13_02_A_Perfect_Score_An_Empty_Smile.png` | 同梱の原本PNGを無改変で追加 |
| `data/bgimage/cg/january/CG13_03_Beyond_the_Score.png` | 同梱の原本PNGを無改変で追加 |
| `data/bgimage/cg/january/SD13_01_MiniBad008_Survey_12_Pages.png` | 同梱の原本PNGを無改変で追加 |
| `data/bgimage/cg/january/SD13_02_MiniBad009_Zero_Point_One_Degree.png` | 同梱の原本PNGを無改変で追加 |
| `data/bgimage/eyecatch/EYECATCH_12_01_JANUARY.png` | 同梱の原本PNGを無改変で追加 |

ブラウザ版だけ `index.html` の説明を1月までに更新。作業版だけ `APRIL_EXISTING_VARIABLE_MAP.md` に1月追記。ゲーム外の本フォルダに報告・証跡・素材対応表を保存。

`first.ks`、`Config.tjs`、共通メッセージ配置・CSS、futureキャラ登録ファイル、4〜11月のシナリオ、OP、既存画像・音源は変更していません。以前から異なる両ゲームの起動ファイルも各々の状態を保持。

## 永続IDと既存処理

月は既存カレンダーに合わせ `01`、シナリオは `n01_january.ks`。画像ID `CG13_*` / `SD13_*` の13は素材番号として保持し、月フラグを13にしていません。

| 論理ID | 実キー／登録 |
|---|---|
| CORE_BAD_015_SEEN | `sf.core_bad_015`／`register_core_bad id="015"` |
| MINI_BAD_008_SEEN | `sf.mini_bad_m08`／`register_mini_bad id="m08"` |
| MINI_BAD_009_SEEN | `sf.mini_bad_m09`／`register_mini_bad id="m09"` |
| JANUARY_CLEAR | `sf.normal_ch01_clear`／CLEAR到達 |
| CG13_01/02/03_SEEN | `sf.cg_january_event_01/02/03`／表示時 |
| SD13_01/02_SEEN | `sf.cg_january_mini_01/02`／表示時 |

既存IDの重複なし。旧セーブで未定義の値は未回収として扱い、新規開始で過去の回収履歴を消しません。`f.chapter`、`f.scene`、`f.current_clear_month`、`f.april_bad` を再利用。BADの登録と画面遷移を分離し、共通 `show_mini_bad` / `show_core_bad` をcall、共通retryのreturn後に元の選択肢へ復帰。新しい永続ループ変数や別名のCGフラグは作っていません。

## キャラ登録・文字レイアウト・比率

| キャラ | 既存storage / face | 入口 |
|---|---|---|
| 抹茶エクレア | `apr_matcha_normal.png` / `default`、落ち着いた場面は `apr_matcha_quiet.png` / `quiet` | `*eyecatch_12_01` と `*scene_01_01` から既存future定義をcall |
| 三好文子 | `apr_fumiko.png` / `default` | 同上 |
| 神田姫花 | `kanda_normal.png` / `default` | 同上 |
| 藤代誠 | `fujishiro_normal.png` / `default` | 同上 |

現在のfuture定義は `TYRANO.kag.stat.charas` で未登録時のみchara_newを実行し、旧TG条件はありません。ソース状態シミュレーションで未登録／登録済みの両方を通し、二度callしても重複chara_newしないことを確認。未登録の可能性がある女神のHIDEだけ条件付きにし、1月へ登場させていません。実セーブのキャラ登録状態の確認は未実施です。

選択肢は中央x310・幅660・高さ85・太字21。CHOICE00はy150/245/340、CHOICE01はy195/290。質問見出し・LEARNED表示は追加していません。会話は標準28、最大46文字の台詞は自然改行で表示。CLEAR記録本文は内容を変えずページ分割。

MINI009のコメントは35文字あり、既存の固定3行と合わせると5行になる可能性があります。1月MINIだけ「失敗の記録に登録しました」の通知行を省き、番号・題名・確定コメントと操作ボタンを表示。既存月の表示、1月のコメント原文、実際の登録処理は保持。字を縮めず4行以内に収めるための局所対応です。

原本6PNGは1672×941/RGBAでSHA256一致。CG13_01は後添付 `(1).png` 採用版（ハッシュ先頭 `a92ec694`）。CG・月扉はcontain、SDは幅のみ指定し縦横比を維持。ギャラリーの1月画像にもobject-fit:containを適用。原本再圧縮・画素変更・新規生成なし。通常背景へ戻る際にCG用fit指定を解除し、過去月へ残しません。

新しい背景切替は黒画面の下で1msの待機付きbgを使い、画像プリロードが終わってから進行。SD画像は表示直前に既存preloadを待ちます。新規プリロード基盤は作っていません。

## 検査結果と限界

- Static PASS: 16 scenarios, 588 JavaScript checks, 469 file references.
- Original six PNG hashes/dimensions PASS; corrected CG13_01 (1) preserved. Four existing audio hashes matched at baseline; no new audio copies.
- 387 exact dialogue pages, fixed choice text, initial correct route, BAD return labels, five CG skip stops, month-end BGM and unchanged December narrative/telephone/collapse revision PASS.
- Record VM PASS: four records/five CGs masked/unlocked, exact texts, 144 earlier-month states unchanged, monthly/all reset.
- Legacy August–December CLEAR repair callbacks PASS in isolated JS; actual SAVE/LOAD remains untested.
- Source-state simulation PASS: direct correct route, all three first/known BADs, repeated retries, normal/month-end music state, CG cleanup, bells before SHOW/HIDE, guest separation, runtime registration guards. This is not an engine preview.

これらはソース検査・独立JavaScript・ソースの状態シミュレーションです。Tyranoエンジンを動かした実機確認の代わりにはしていません。画面表示、音の重なり・聴こえ方、SAVE/LOAD、CONFIG・記録・ギャラリーの実際の往復は [TEST_EVIDENCE.md](TEST_EVIDENCE.md) のユーザー確認項目へ引き継ぎます。

実機で発生した不具合の報告はありません（今回、実機を操作していません）。検証用起動経路・仮回収フラグ・テスト用SAVEは作成していません。今回は未コミット・未プッシュです。
