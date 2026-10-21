# 11月実装報告

日付：2026-10-12。基準：`NOVEMBER_CODEX_LUNA_IMPLEMENTATION_PACK_v1.zip`。

第8章・11月「女神様、説明不足です」を既存10月版への追加として実装しました。TyranoBuilder作業版とリポジトリ内ブラウザ版の両方へ反映済みです。10月の藤代さんへの挨拶を「いらっしゃいませ。」にした直近の修正も保持しています。

## 実装範囲

- 10月CLEAR「11月へ」→NOVEMBERアイキャッチ→SCENE01〜05→11月CLEAR。
- 確定v3本文293件を転記・照合。SCENE02の削除対象「えーと……」は追加せず、MINI BAD005の「ええと……」は保持。
- CHOICE00はM04・M05・CHOICE01へ進む3択。MINI BAD後はCHOICE00へ戻ります。
- 追加指定により、CHOICE00のCからCHOICE01の間に主人公・抹茶・女神の会話を1ページずつ、計3ページ挿入。CORE再挑戦は直接CHOICE01へ戻ります。
- CHOICE01はCORE012・CORE013・正解SCENE03へ進む3択。CORE BAD後はCHOICE01へ戻ります。
- どちらの正解も初回から選択可能。既読BADは「その結末は、もう知っている。」と題名を表示して該当選択肢へ戻します。
- イベントCG2枚とMINI BAD用SDCG2枚を表示・回収・ギャラリー登録。各CG表示時にスキップを停止します。CORE012/013に専用CGは追加しません。
- CG11_01は女神の「お呼びでしょうか？」で表示し、SCENE02の近況報告へ戻る際に消去。CG11_02はSCENE03の試食で表示し、女神の退店挨拶前に店内・立ち絵へ戻します。
- 選択肢は画面中央のx310、y150/245/340、高さ85。SDCGは既存のウインドウ表示を再利用。
- 11月のCORE/MINI/CLEAR記録、未回収マスク、CGクリック拡大・閉じる、呼出元へ戻る、全記録・単月リセットに対応。
- 12月への未実装ジャンプは追加しません。11月末はタイトル・記録の2ボタンです。

## 変更ファイル

ゲームルートは作業版 `C:/Program Files (x86)/Steam/steamapps/common/TyranoBuilder/myproject/365days_eclair`、ブラウザ版 `C:/Users/user/Documents/sacher10610.github.io/games/365days-eclair`。

| ゲームルートからのパス | 種別・理由 |
|---|---|
| `data/scenario/n11_november.ks` | 新規。本編・分岐・女神登録・演出・CLEAR |
| `data/scenario/n10_october.ks` | 変更。末尾に「11月へ」の1行を追加 |
| `data/scenario/system_common.ks` | 変更。11月の記録・CG・選択ラベル・戻り先・リセットを追加 |
| `data/scenario/title_screen.ks` | 変更。更新前10月CLEARのSAVEから次月メニューを再構築する既存補修処理を拡張 |
| `data/bgimage/cg/november/CG11_01_She_Really_Came.png` | 新規。同梱原本の女神登場CG |
| `data/bgimage/cg/november/CG11_02_A_Goddess_Is_Also_a_Customer.png` | 新規。同梱原本の試食CG |
| `data/bgimage/cg/november/SD11_01_MiniBad004_Offering_for_the_Goddess.png` | 新規。同梱原本のM04用SDCG |
| `data/bgimage/cg/november/SD11_02_MiniBad005_FAQ108.png` | 新規。同梱原本のM05用SDCG |
| `data/bgimage/eyecatch/EYECATCH_10_11_NOVEMBER.png` | 新規。同梱原本のアイキャッチ。ギャラリー対象外 |

ブラウザ版の `index.html` は説明文を「11月編まで」に更新。作業プロジェクトの既存 `APRIL_EXISTING_VARIABLE_MAP.md` に11月のフラグと登録入口を追記。リポジトリの本報告書と [TEST_EVIDENCE.md](TEST_EVIDENCE.md) を保存しています。

`first.ks`、`Config.tjs`、共通文字レイアウト、`system/future_character_define.ks`、4〜9月シナリオは変更していません。元ファイルはゲーム外の `.tmp-november/baseline` に保存しました。

## 実変数

| 永続フラグ | 登録タイミング |
|---|---|
| `sf.core_bad_012` | CORE012終端で既存 `register_core_bad` |
| `sf.core_bad_013` | CORE013終端で既存 `register_core_bad` |
| `sf.mini_bad_m04` | M04終端で既存 `register_mini_bad` |
| `sf.mini_bad_m05` | M05終端で既存 `register_mini_bad` |
| `sf.normal_ch11_clear` | 11月CLEAR到達 |
| `sf.cg_november_event_01` | CG11_01表示 |
| `sf.cg_november_event_02` | CG11_02表示 |
| `sf.cg_november_mini_01` | SD11_01表示 |
| `sf.cg_november_mini_02` | SD11_02表示 |

仮IDの `mini_bad_004/005`、`november_clear` を別の永続フラグとして増やさず、4月以来の `m01〜m03`、`normal_chXX_clear` に合わせました。M04/M05およびCORE012/013の衝突はありません。旧SAVEの未定義キーは未回収として扱います。新規開始で回収記録を初期化しません。

進行状態は既存の `f.chapter`（11）、`f.scene`、`f.current_clear_month`（CLEAR時11）、`f.april_bad` を使用。表示用には `f.november_record_list_*` と `f.april_record_is_november_bad/clear` を追加。新しい `tf`、マクロ、return stackは追加していません。

## キャラクター登録の照合

| 対象 | 既存storage・face | 定義・追加入口 |
|---|---|---|
| 抹茶エクレア | `apr_matcha_normal.png` / `default`、`apr_matcha_quiet.png` / `quiet` | 既存 `system/future_character_define.ks` の未登録判定を再利用 |
| 女神 | `apr_goddess.png` / `default` | 通常起動は既存 `prologue.ks`。11月入口の `*november_character_define` でも未登録時だけ定義 |

アイキャッチ入口・SCENE01入口の両方から登録を呼び、旧SAVEや単体プレビューでも表示前に定義する構造にしています。判定は `TYRANO.kag.stat.charas` を使い、古いTG条件を再導入していません。登録処理自体では立ち絵を表示せず、女神のサプライズを保ちます。

通常開始・旧SAVE・途中LOADでの実画面表示は未確認です。ソース上の登録順序の照合を実行時確認の代わりにはしていません。

## 音

| 区間 | 既存ファイル |
|---|---|
| 通常会話・MINI・選択肢（女神初登場のCG区間を除く） | `data/bgm/05_Morning_Mise_en_Place.mp3` |
| 女神初登場〜最初の暗転 | `data/bgm/03_A_Goddess_Forgot_to_Explain.mp3` |
| 女神初登場のSE | `data/sound/se_matcha_teleport_land.wav`（4月と同じ、音量70・ループなし） |
| CORE012/013の女神退場後〜結果 | `data/bgm/02_Flour_on_the_Floor.mp3` |
| CORE再挑戦 | `data/bgm/05_Morning_Mise_en_Place.mp3` に復帰 |
| SCENE05冒頭〜CLEAR | `data/bgm/06_One_Year_One_Eclair.mp3` |
| NOVEMBER | `data/sound/SE_EYECATCH_05_06_Jingle.wav` |

10月末の月末曲は暗転開始前にフェードアウトを開始し、700msの暗転完了後にアイキャッチへ進みます。同梱エンジンの `stopbgm` はフェード完了を待たないため、この順序で前月曲とジングルの重なりを避けます。MINIでは通常曲を継続し、再挑戦で同じ曲を重ねて再始動しません。曲変更は既存の `xchgbgm` を使用します。追加指定により女神の初登場では既存の女神専用曲と4月の登場SEを再利用し、最初の暗転中に通常曲へ戻します。同梱音源4件は既存実体とSHA256が一致したため追加コピーしていません。新規音源、不要なドアベルは追加していません。

## 検査結果・引き継ぎ

静的検査：14シナリオ、JavaScript420件、ファイル参照363件が合格。確定本文293件と追加会話3件、女神登場BGM/SE・暗転中の通常曲復帰、素材ハッシュ、分岐、スキップ停止、記録本文・マスク、リセット、旧月記録98状態、旧CLEARメニュー補修の独立JavaScript検査も合格しています。

ユーザーの「実機確認は自分で行う」という指定を継続し、アプリ・ブラウザの画面操作は行っていません。SAVE/LOAD、画面・音の実機受入試験はユーザーへ引き継ぎます。未確認項目は [TEST_EVIDENCE.md](TEST_EVIDENCE.md) に明記しました。

今回の11月分は未コミット・未プッシュです。
