# 3月・最終章 実装報告

実装日：2026-10-20。基準：`MARCH_CODEX_LUNA_FINAL_IMPLEMENTATION_PACK_v1.zip` の `docs/00_README_FIRST.md` → `01_LATEST_DECISIONS_OVERRIDE.md` →本文v4・演出・素材・試験仕様。資料全27章を確認。旧資料の「初回動画未納品」「TRUEスタッフロール」は採用せず、最新確定を優先しました。

2026-10-21の追加仕様変更：現在のトゥルー系分岐は、初回ED到達記録に加え、専用ボタンで開始した周回のフラグが必要です。「はじめから」は通常周回。詳細・セーブ互換性は [RETRY_RUN_SPEC_CHANGE.md](RETRY_RUN_SPEC_CHANGE.md) を優先してください。

TyranoBuilder作業版とブラウザ版へ実装。従来のユーザー指定に従い、ゲーム画面の操作・実機通しプレイ・試聴・ユーザーSAVE/LOADは実行していません。以下のPASSはソース／隔離したJavaScript検査であり、実機確認済みを意味しません。

## 実装した流れ

- 2月末の「3月へ」→MARCH扉→SCENE01〜10→初回／再挑戦後の分岐。本編557台詞を正本と照合。4月INSIGHTの16台詞も逐語採用。Markdownの強調記号だけを取り除き、既存の太字で表示。
- CHOICE00：MINI012『優勝スピーチ三時間』／MINI013『世界一、先に印刷』／正解。MINIは既読短縮と共通リトライを利用。CHOICE01のA/Bは短い振り返り会話で同じ選択へ戻り、BADを追加しません。どちらの正解も初回から選択可能。
- 実機報告後の追加修正：冒頭の主人公「まずは、まだなってないから」を「まだなってないから」へ変更。久世の4回の登場では現行画像を明示し、共通登録では古いセーブのdefault表情も現行画像へ更新。詳細は [KUZE_FIX_REPORT.md](KUZE_FIX_REPORT.md)。
- 会場背景3枚、本CG8枚、SD2枚、月扉、fin画像は提出原本を無加工で使用。主人公の通常立ち絵は表示しません。三好・神田の入退店に既存ベル、女神の登場に4月と同じ転移SE。各CG直前でスキップ停止、通常会話へ戻る時にCG／SD枠を整理。
- 久世再会はMeasured Grace、決勝曲は「じゃあ、本気で勝ちにいくわ」直後。結果発表前に無音、世界一確定からOne Year, One Eclair。夜の厨房と最終選択まで曲を再始動せず継続。大会結果は全ルートで本物。
- 初回：11A→CG15_05→音声入り仮ED動画→無音12A→CG15_06→真BAD017カード。動画視聴時ではなく、カード構築後に `sf.core_bad_017` と `sf.true_bad_seen` を保存。
- 真BAD後のタイトルに「もう一度、あの日から」。既存の名前入力・4月からの開始手順へ接続。4月初期選択にINSIGHT追加。最終選択の解放条件は `sf.true_bad_seen === true` だけです。INSIGHT回収や他BAD回収数を追加条件にしていません。
- 再挑戦後：帰った方がいい→通常END1、残ってほしい→通常END2、本人が決めればいい→TRUE。通常ENDをCORE BADへ採番しません。各終了画面から記録へ移動して戻れます。通常ENDには最後の選択肢への再挑戦も用意。
- TRUE：選択直後に前曲を180msで終え、専用曲を先頭からノンループ再生。84台詞を実再生位置に同期して自動表示。各ページの最低読了時間も確保。名前初呼びと後の呼びかけ2箇所に既存入力名を安全に展開、空欄はユウ。
- 固定最終文を最低6.5秒表示→提出fin画像へフェード。`カード表示済み && 完全表示後1500ms以上 && 音楽の実endイベント` の全条件成立後、クリック／タップ／Enter／Space／コントローラAの新規押下1回でタイトルへ。曲が終わっても自動で戻りません。スタッフロール・案内文の追加なし。

## ED再生と復帰

`data/others/march_ending.js` に専用タグを追加。全ゲームの通常送りを書き換えるのではなく、動画／TRUE再生中だけ入力を捕捉し、SKIP/AUTO・キー操作・セーブUIを無効化。タイトル／エラー復帰／ロード開始で音源、動画、カード、タイマー、リスナー、押しっぱなしキー状態、文字速度、操作設定を戻します。ユーザー音量は保持。BGM無効時は無音の音声トランスポートで実完奏を判定します。

初回動画はHTML5 videoの実`ended`で12Aへ進み、秒数固定の終了タイマーを使いません。AAC音声だけを使用し、参考MP3をゲームへコピー／再生していません。再生失敗・停止時は再試行／後日談への安全な復帰を表示し、動画を見たという別フラグは立てません。TRUEの音声失敗時は最初から再試行／最後の選択へ復帰。再試行時は夜の厨房と人物から復元します。

SCENE10と最終選択前に既存autosave方式の復帰地点を設置。TRUE中はセーブ用UIとキー操作を遮断。異常な途中状態が読込された場合も最終選択から再開する処理を追加。実際のブラウザ／Builderでのセーブ・ロードは未確認です。

## 記録とデバッグ

既存ノートUIに3月の7記録（真BAD017、MINI2、世界一達成、通常END2、TRUE）とCG10件を追加。未回収は見出し・本文・caption・画像を伏せ、実表示したCGだけを解放。BG・月扉・finはギャラリーに入れません。CG8件が下部操作と重ならないよう3月だけ索引行を小さく配置。

世界一達成に専用「記録文」が資料中で指定されていないため、新しいあらすじは作らず、確定済みの司会の総合第1位発表をそのまま記録へ使用。他6記録の本文・ひとこと、および10captionは原文一致。

`DEBUG｜1周目EDフラグ解除` は記録の左下へ仮設。確認の「解除する」で `sf.true_bad_seen=false` だけを既存 `saveSystemVariable()` で保存。キャンセルは不変更。CORE017、TRUE到達、CG、他月記録、主人公名、セーブは消去しません。記録から戻っても真BADフラグを勝手に再登録しないようにしました。

**2026-10-21、ユーザーの確認完了・削除指定により、記録画面の「1周目EDフラグ解除」「単月リセット」とEDフラグの状態表示を撤去。`ENABLE_MARCH_ED_DEBUG_RESET = false` に変更済みです。** 全記録リセットとその確認・消去処理は変更していません。旧セーブの復帰位置を保つため、撤去部分は画面を変えない名前付きclearfixで同じコマンド数を維持し、旧内部ラベルも保持しています。ブラウザ版・TyranoBuilder版に反映し、差し替え済み動画は変更していません。

全記録リセット／DEBUG3月単月リセットへ3月17記録・CGフラグを追加。再挑戦解放用 `true_bad_seen` は通常の記録リセット対象に含めず、専用ボタンでのみ解除。エンジン内部cg_view/cg_idやSAVEを初期化しません。

## 素材とファイル

両ゲームの基準：1280×720、同梱TyranoScript 5.20（version520）。新規画像15枚は1672×941（背景・finはRGB、CG等はRGBA）。既存素材5音源のハッシュを照合して再利用。新規音源は決勝曲・TRUE曲のみ。原本manifest60件すべてSHA256／サイズ一致。

初回動画：H.264、1280×720、30fps、AAC、227.133333秒。**後日差し替える仮版**で、設置先は固定 `data/video/march_first_ending.mp4`。両ゲームの同じファイルを新動画へ置換できます。

楽曲の仕様尺はTRUE273.240秒／決勝202.512秒。今回のffprobe表示は273.200／202.480秒で、同梱記載と32〜40msの差があります。どちらの数値も終了条件へ固定せず、実プレイヤーのseek/endで制御します。音源そのものは再圧縮・加工していません。

作業版：`C:/Program Files (x86)/Steam/steamapps/common/TyranoBuilder/myproject/365days_eclair`

ブラウザ版：`C:/Users/user/Documents/sacher10610.github.io/games/365days-eclair`

| 主なファイル | 内容 |
|---|---|
| `data/scenario/n03_march.ks` | 新規最終章、本編・分岐・CG・終了画面 |
| `data/others/march_ending.js` | 新規ED制御、実完奏・入力・エラー・復帰処理 |
| `data/scenario/n02_february.ks` | 末尾「3月へ」ボタンのみ追加 |
| `data/scenario/n04_april.ks` | 再挑戦時のINSIGHT追加。初回の既存選択を保持 |
| `data/scenario/system_common.ks` | 3月記録／ギャラリー／戻り先／リセット／仮デバッグ |
| `data/scenario/title_screen.ks` | 再挑戦ボタン、ED制御の解放、旧2月末SAVEメニュー補修 |
| `data/scenario/system/future_character_define.ks` | 既登録の久世のdefault表情も現行画像へ更新 |
| `data/image/april_ui/v5/title/title_retry_normal.svg` / `title_retry_hover.svg` | 緑・金・花のモチーフ、細枠と2段の文言で構成した再挑戦ボタン |
| `index.html`（ブラウザ版のみ） | 説明を全12章へ更新 |
| `APRIL_EXISTING_VARIABLE_MAP.md`（作業版のみ） | 3月の実キーを追記 |

18追加素材の全パスとSHA256は [ASSET_INSTALLATION_MAP.csv](ASSET_INSTALLATION_MAP.csv)。ソースの実差分は [source-changes.patch](source-changes.patch)。原本シナリオ／仕様とmanifestは [spec](spec) に保存。バックアップと検査用コードはゲーム外 `.tmp-march/` にあります。

`first.ks`、Config.tjs、共通メッセージ配置・CSS、5月〜1月、OP、既存画像・音源は変更していません。両ゲームの元から異なる起動ファイルも個別に保持。コミット・プッシュは行っていません。

## 検査結果と残る確認

- Static PASS: 18 scenarios, 831 JavaScript checks, 600 references.
- Bundled TyranoScript parser PASS: all 18 scenarios, no syntax warnings or unmatched if/endif.
- 557 March spoken lines retained by generator; 84 timed TRUE pages + final narration; 16 April INSIGHT lines, ten CG triggers, actual-ended movie, first/second ending gates, normal-END distinction PASS.
- March seven records/ten CG masked/unlocked, exact captions/record prose; 176 earlier-month record states unchanged; monthly/all resets PASS.
- Runtime VM PASS: actual audio-end+1500ms gates, no auto return/repeat input, one-shot playback, text wait/read floor, muted transport, input/skip lock restoration, errors/stalls, movie ended/error recovery, debug-only reset persistence/toggle, load cleanup/restart. No actual UI/audio playback performed.

- 追加のソース状態走査：初回、デバッグ解除後の再初回、MINI2種／既読短縮、REVIEW2種、通常END2種、TRUE、名前展開、人物登録、CGの残留防止、One Yearの継続を確認。
- 分岐先・素材参照と同梱パーサーの構文検査を実施。ユーザーのセーブを使用した検査はなし。
- **実機未確認**：2月→3月から全ED、音楽同期の読みやすさ、画面・行末・人物位置、ブラウザの音声／動画の自動再生可否、実SAVE/LOAD、スマホ、記録拡大と戻り。

ユーザー確認は [TEST_EVIDENCE.md](TEST_EVIDENCE.md) と [spec/20_TEST_CHECKLIST.md](spec/20_TEST_CHECKLIST.md) を使用。現時点で既知のソース検査エラーはありません。仮動画の将来差し替え、正式公開前のデバッグ解除無効化、実機受入確認が残ります。


追加修正後の反映照合：両ゲーム各28ファイルの現在のハッシュを照合。久世修正の2ファイルも両版で一致。実機動作の確認は未実施。詳細は [KUZE_FIX_REPORT.md](KUZE_FIX_REPORT.md)。


## 2026-10-21 再挑戦ボタンの調整

「もう一度、あの日から」を、細い金枠・控えめな茶葉と花・2段の文字組みのSVGへ変更。通常は緑、hover時はアイボリー。既存の位置・寸法・sf.true_bad_seenによる解放条件・遷移先を保持。4月の追加選択から表示上の「INSIGHT｜」のみ削除。両ゲームの3ファイルを照合。通常／hoverの静止画像を470×132で描画して確認し、SVG構文・18シナリオの検査もPASS。ゲーム画面操作は未実施。

![再挑戦ボタン](retry-button-preview.png)


2026-10-21 位置調整：再挑戦ボタンを右側の中段（x700/y430、470×132）へ移動。右下のサークル名・クレジットの領域から離し、既存のボタン・解放条件・遷移先は保持。両版のタイトルファイルをバイト照合。


2026-10-21 初回ED前のフェード調整：最後の「抹茶ちゃんも」の後、セリフ欄・クイックUIを消し、CG15_05とBGMを3000msで黒／無音へフェード。黒画面の下でCGを解放し、暗転を解除して150msの間を取り、動画へ直接接続。空の厨房を挟んで見せる従来の切り替えを除去。両版へ反映・照合。章のタグ数と全ラベルのインデックスを維持。ソース検査PASS、実機は未確認。
