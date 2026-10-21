# 10月実装報告

実装日：2026-10-12。基準：`OCTOBER_CODEX_LUNA_IMPLEMENTATION_PACK_v1.zip`。

10月「世界一ってなんや？」を、TyranoBuilderの作業プロジェクトとリポジトリ内のブラウザ版に反映しました。9月CLEARの「10月へ」から、OCTOBERアイキャッチ、本編SCENE 01〜08、BAD010/011、10月CLEARへ進みます。

## ユーザー指定による仕様の優先

- 月末SCENE 08からCLEARまでは、従来どおり `06_One_Year_One_Eclair.mp3` を使用します。パックの「CLEAR専用BGMなし」より、作業中に受けた月末曲の指定を優先しました。
- 選択肢の上に質問文を独立表示しません。本文の問いかけから中央の選択肢へ進みます。
- 最後の追加画面操作はユーザーの指定で停止しました。TyranoBuilder本体のプレビュー確認はユーザーが行います。

## 変更ファイル

以下はゲームルートからのパスです。ゲームルートは作業版が `C:/Program Files (x86)/Steam/steamapps/common/TyranoBuilder/myproject/365days_eclair`、ブラウザ版が `C:/Users/user/Documents/sacher10610.github.io/games/365days-eclair` です。

| ファイル | 変更内容 |
|---|---|
| `data/scenario/n10_october.ks` | 新規。本編312件の確定本文、演出、分岐、再挑戦、CG停止、CLEAR |
| `data/scenario/n09_september.ks` | CLEARメニューに「10月へ」を追加 |
| `data/scenario/system_common.ks` | 10月のBAD/CLEAR/CG一覧・詳細・戻り先・全リセット・単月リセット |
| `data/scenario/title_screen.ks` | 更新前の9月CLEARセーブを読み込んだ際、新しい次月ボタンを再構築 |
| `data/bgimage/BG10_01_Autumn_Errand.png` | 同梱の街角背景 |
| `data/bgimage/BG10_02_The_Quiet_Bench.png` | 同梱のベンチ背景 |
| `data/bgimage/cg/october/CG10_01_The_Dark_Emperors_Notebook.png` | 同梱イベントCG |
| `data/bgimage/cg/october/CG10_02_Words_for_a_New_World.png` | 同梱イベントCG |
| `data/bgimage/cg/october/CG10_03_A_Taste_Beyond_the_Sea.png` | 同梱イベントCG |
| `data/bgimage/cg/october/SD10_01_Bad010_Overseas_But_Gone.png` | 同梱ミニイベントCG |
| `data/bgimage/cg/october/SD10_02_Bad011_Not_Communicated.png` | 同梱ミニイベントCG |
| `data/bgimage/eyecatch/EYECATCH_09_10_OCTOBER.png` | 同梱アイキャッチ |

ブラウザ版の `index.html` は説明文を「10月編まで」に更新。報告書と既存変数台帳への10月追記も保存しています。新規画像生成・音源の重複配置・エンジンの書き換えはありません。

## 入口と表示

- 9月CLEARメニュー → `n10_october.ks:*eyecatch_09_10` → `*scene_10_01`。
- 選択肢は `*choice_10_01`。A/BがBAD010/011、Cが正解です。Cは初回から選択可能です。
- BAD画面は既存の登録・表示・call/return処理を使用し、再挑戦で10月の選択肢へ戻ります。回収済みBADは「その結末は、もう知っている。」を表示して選択へ戻ります。
- 抹茶ちゃんは `apr_matcha_normal.png`、神田ちゃんは `kanda_normal.png`、藤代さんは `fujishiro_normal.png`。既存の安全な `system/future_character_define.ks` を再利用し、夏衣装を持ち越しません。
- 全5枚のCG表示時にスキップを停止。SDCGは640×360、座標320/100のウインドウ表示で、メッセージ欄の上に置きます。
- 記録にはイベントCG3枚とミニイベントCG2枚のみ追加。背景とアイキャッチは登録しません。未回収の題名・詳細・画像は伏せます。
- 10月CLEARは `*october_clear` / `*october_clear_menu`。11月への入口は追加していません。

## BGM・SE

| 用途 | 既存ファイル |
|---|---|
| 通常 | `data/bgm/05_Morning_Mise_en_Place.mp3` |
| BAD010/011 | `data/bgm/02_Flour_on_the_Floor.mp3` |
| SCENE 01街角のみ | `data/bgm/04_Matcha_Has_Arrived.mp3` |
| 月末SCENE 08〜CLEAR | `data/bgm/06_One_Year_One_Eclair.mp3` |
| アイキャッチ | `data/sound/SE_EYECATCH_05_06_Jingle.wav` |
| 来退店 | `data/sound/se_shop_door_chime.wav` |
| SCENE 03メール | `data/sound/se_phone_notify.wav` |

街角の専用曲はSCENE 02で通常曲へ戻します。同じ通常曲が続く場面では再スタートせず、変更箇所は既存の `xchgbgm` で切り替えます。ドアベルはSCENE 06来店、SCENE 07の藤代さん来退店、BAD010退店で再利用します。

## 永続フラグ

| フラグ | 登録されるタイミング |
|---|---|
| `sf.core_bad_010` | BAD010終了時の共通登録処理 |
| `sf.core_bad_011` | BAD011終了時の共通登録処理 |
| `sf.normal_ch10_clear` | 10月CLEAR到達 |
| `sf.cg_october_event_01` | CG10_01表示 |
| `sf.cg_october_event_02` | CG10_02表示 |
| `sf.cg_october_event_03` | CG10_03表示 |
| `sf.cg_october_mini_01` | SD10_01表示 |
| `sf.cg_october_mini_02` | SD10_02表示 |

未定義は未回収として扱い、新規開始で回収記録を消しません。既存の `f.chapter`、`f.scene`、`f.current_clear_month`、`f.april_bad` と記録表示用変数を使用し、別名の進行フラグを作っていません。全リセットと10月単月リセットの両方に上記8件を追加しました。

## 確認結果と残件

詳細は [TEST_EVIDENCE.md](TEST_EVIDENCE.md) に記録しました。ソース検査と独立したChrome環境でのTyranoエンジン確認は合格。10月の正解ルート、両BAD、再挑戦、CG停止、記録往復、SAVE/LOAD、旧9月セーブからの接続を確認しています。

TyranoBuilder本体プレビュー、スマートフォン、音を聴いての最終演出確認は未実施です。ユーザーによる実機確認待ちであり、確認済みとは扱いません。4月から9月まで全本文を読み進める通しプレイも実施していません。

今回の10月分は未コミット・未プッシュです。
