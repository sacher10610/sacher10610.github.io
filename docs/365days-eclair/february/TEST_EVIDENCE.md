# 2月テスト証跡・ユーザー確認への引き継ぎ

実施日：2026-10-16。実機動作確認はユーザー担当。ウチはアプリを操作せず、ユーザーのSAVE/LOAD・記録リセット・試聴を実施していません。

## 実施済み：ソース・独立JavaScript

- Static PASS: 17 scenarios, 678 JavaScript checks, 513 file references.
- Original six PNG hashes/dimensions PASS; adopted SD14_02 blank-label gifts version preserved. Four existing audio hashes matched at baseline; no new audio copies.
- 457 exact dialogue pages (Markdown emphasis retained as bold, not literal stars), exact choices, three BAD/retry paths, five CG skip stops, CG14_03 after identity reveal, scene07 month-end BGM, unchanged January CG02 timing PASS.
- Record VM PASS: four records/five CGs masked/unlocked, exact texts, 160 earlier-month states unchanged, monthly/all reset.
- Legacy August–January CLEAR repair callbacks PASS in isolated JS; actual SAVE/LOAD remains untested.
- Source-state simulation PASS: direct correct route, all three first/known BADs, repeated retries, normal/month-end music state, CG cleanup, bells before SHOW/HIDE, guest separation, runtime registration guards. This is not an engine preview.

全10件のCSV/JSON・SHA256一致、PNG寸法/RGBA、既存音源との同一性、MP3ヘッダ／WAVメタデータを照合。SD14_02は空白ラベルのギフト箱と目視確認。

ゲーム外 `.tmp-february/verify_february.cjs` と本フォルダ `static-evidence.json` に検査内容を保存。ソースシミュレーションは初回正解、3BAD初回＋既読＋連続リトライ、キャラ未登録／登録済み経路を実行。実Tyranoプレビューとは区別します。

## 実機受入（すべて未実施・ユーザー確認）

| ID | 操作・確認内容 | 状況 |
|---|---|---|
| E01 | 通常タイトル新規→1月CLEAR→2月、前月音停止・FEBRUARY・ジングル1回 | 未実施 |
| E02 | 旧1月CLEARセーブ→2月、1月記録→戻る→2月、6クイックUI維持 | 未実施 |
| E03 | SCENE01〜07全文、SCENE03神田・SCENE05藤代の入退店ベルと立ち絵 | 未実施 |
| E04 | MINI010初回→SD14_01→記録→戻る→CHOICE00、既読短縮 | 未実施 |
| E05 | MINI011改訂版→SD14_02→記録→戻る→CHOICE00、既読短縮・コメント収まり | 未実施 |
| E06 | CORE016初回→BAD曲→CG14_02→曲フェードアウト→記録→CHOICE01・通常曲復帰、既読短縮 | 未実施 |
| E07 | BAD未回収でCHOICE00 C→CHOICE01 B→CLEAR、交互・連続リトライ | 未実施 |
| E08 | CG14_01がCHOICE01前に消える、CG14_03は身分公開・封筒提示後まで未解放 | 未実施 |
| E09 | CORE/MINI/CG記録、未回収伏せ表示、画像クリック拡大→閉じる→戻る、残像・文字色・6UIボタン | 未実施 |
| E10 | SCENE02/CHOICE00/SCENE04/CHOICE01/SCENE05/SCENE07 SAVE→LOAD、人物・CG・音復元 | 未実施 |
| E11 | CONFIG・BACKLOG・SAVE→戻る、タイトル→新規開始、旧フリーズ回帰 | 未実施 |
| E12 | SCENE07冒頭からOne Year, One Eclair、CLEARまで継続、3月未実装で安全待機 | 未実施 |
| E13 | 全記録／DEBUG2月単月リセット（実データを消すので必要な場合のみユーザー操作） | 未実施 |
| E14 | 1月CORE015の追加ウェイト・CGタイミングと、過去月主要経路 | 未実施 |

最短の本筋：1月CLEAR「2月へ」→CHOICE00 C「箱より先に、仕事と予定を整理しよう」→CHOICE01 B「帰る話は先に決めず、三月の目標を二人で進めよう」→2月CLEAR。

## 後始末

- 起動・Config・4月単体プレビュー対策・futureキャラ登録・既存CSSを保持。
- テスト用ジャンプ・Reload・仮フラグ・仮素材・テストSAVEなし。
- reference_onlyを正式素材へ上書きせず、既存4音源も重複配置なし。
- 旧冷蔵版・3月結末・未実装3月への遷移なし。
- 実機受入は未実施としてユーザーへ引き継ぎ。
