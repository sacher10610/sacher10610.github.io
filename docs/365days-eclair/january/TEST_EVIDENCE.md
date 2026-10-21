# 1月テスト証跡・確認引き継ぎ

実施日：2026-10-14。実機確認はユーザー担当。ウチはアプリを操作せず、実セーブの読込・作成・リセットをしていません。

## 実施済み：ソース・独立JavaScript

- Static PASS: 16 scenarios, 588 JavaScript checks, 469 file references.
- Original six PNG hashes/dimensions PASS; corrected CG13_01 (1) preserved. Four existing audio hashes matched at baseline; no new audio copies.
- 387 exact dialogue pages, fixed choice text, initial correct route, BAD return labels, five CG skip stops, month-end BGM and unchanged December narrative/telephone/collapse revision PASS.
- Record VM PASS: four records/five CGs masked/unlocked, exact texts, 144 earlier-month states unchanged, monthly/all reset.
- Legacy August–December CLEAR repair callbacks PASS in isolated JS; actual SAVE/LOAD remains untested.
- Source-state simulation PASS: direct correct route, all three first/known BADs, repeated retries, normal/month-end music state, CG cleanup, bells before SHOW/HIDE, guest separation, runtime registration guards. This is not an engine preview.

ゲーム外の `.tmp-january/verify_january.cjs`、本フォルダ `static-evidence.json` に検査内容と結果を保存。ソース状態シミュレーションは初回正解、3BAD初回＋既読＋連続リトライ、既存キャラ登録済み経路を検査。実Tyranoのプレビューではありません。

## 実機受入（ユーザー確認）

| ID | 操作・確認内容 | 結果 |
|---|---|---|
| E01 | 通常タイトル新規→12月CLEAR→1月、月扉・ジングル1回・前月BGM停止 | 未実施 |
| E02 | 旧12月CLEARセーブ→1月、月末の記録→戻る→1月、クイックメニュー維持 | 未実施 |
| E03 | SCENE02 三好→神田→藤代の入退店・CG13_01、人物の二重表示なし | 未実施 |
| E04 | MINI008 初回→SD13_01→記録→戻る→CHOICE00、既読短縮 | 未実施 |
| E05 | MINI009 初回→SD13_02→記録→戻る→CHOICE00、コメントの4行以内表示・既読短縮 | 未実施 |
| E06 | CORE015 初回→BAD曲→CG13_02→記録→戻る→CHOICE01、通常曲復帰・既読短縮 | 未実施 |
| E07 | BAD未回収でCHOICE00 C→CHOICE01 B→SCENE04→05→06→CLEAR | 未実施 |
| E08 | SCENE04 神田→三好・CG13_03終了、SCENE06冒頭から月末曲→CLEAR継続 | 未実施 |
| E09 | 1月のCORE/MINI/CGタブ、未回収非表示、画像クリック拡大→閉じる→戻る、残像・文字色・6UIボタン | 未実施 |
| E10 | SCENE02/MINI/CHOICE00/CHOICE01/CORE/SCENE06 SAVE→LOAD、客・CG・音の復元 | 未実施 |
| E11 | CONFIG・BACKLOG・SAVE→戻る、タイトル→新規開始、文字色・フリーズの回帰 | 未実施 |
| E12 | 全記録・DEBUG単月リセット。実データを消すので必要な場合のみユーザー操作 | 未実施 |
| E13 | 12月の電話追加・CG前暗転・フェード・選択肢修正、過去月の主要経路 | 未実施 |

最短の本筋：12月CLEAR「1月へ」→CHOICE00 C「点数も、食べた時の言葉も残そう」→CHOICE01 B「点数は参考にして、食べる人の反応も確かめよう」→1月CLEAR。

## 後始末

- first.ks、Config、4月単体プレビュー対策、future登録の既存内容を保持。
- 新規月は通常接続のみ。仮ジャンプ・Reload・検証用入口・仮フラグ・テストSAVEなし。
- 同梱参照立ち絵・背景を正式素材へ上書きせず、既存4音源も重複配置しない。
- 未実装の2月へ飛ばない。
- 実機受入は未実施・ユーザーへ引き継ぎ。
