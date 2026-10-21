# 2月実装報告

実装日：2026-10-16。基準：`FEBRUARY_CODEX_LUNA_IMPLEMENTATION_PACK_v1.zip`、採用済みシナリオv2、CG指示v2。現行1月版（CORE015のCGタイミング追加修正を含む）への差分追加です。

実装前ファイルをゲーム外 `.tmp-february/baseline/web` / `live` に保存し、`baseline-hashes.json` へSHA256を記録。ユーザーのセーブを読込・消去・書換していません。同梱TyranoScriptの `tyrano.plugin.kag.version` は両ゲームとも520。Builder実行ファイルのFileVersionとpackage.jsonは1.0.0（メタデータ値。製品の画面表示バージョンは未確認）。

実装・ソース検査まで完了。従来のユーザー指定に従い、実機操作・通しプレイ・試聴・実SAVE/LOADは行っていません。下記の静的検査を実機PASSとして扱わず、[TEST_EVIDENCE.md](TEST_EVIDENCE.md) の受入項目をユーザー確認へ引き継ぎます。

## 本編・演出

- 1月CLEAR「2月へ」→FEBRUARY扉→SCENE01〜07→2月CLEAR『その日まで、ふたりで』。
- 会話457件を話者・順序・本文込みで正本と照合。大会名など2箇所のMarkdown強調記号 `**` は表示文字に含めず、既存太字で内容を保持。大会名は `World Éclair Grand Prix`。新しい会話・地の文・帰還意思の結論は追加していません。
- CHOICE00 A→M10『厨房まるごと荷造り』、B→M11『お土産、誰の分？』、C→正解会話→SCENE03。MINIはCHOICE00へ再挑戦。CHOICE01 A→CORE016『帰還最優先』、B→正解会話→SCENE05。COREはCHOICE01へ再挑戦。いずれも初回正解可、既読BADは共通短縮文で戻ります。
- MINI011は改訂版の台詞・記録・専用SD14_02を使用。宛先・人数・好みを聞かず箱だけ増やす失敗。旧冷蔵／長距離輸送の版は今回のコード・登録・素材に使っていません。SD14_02を目視し、宛名のないラベル付きギフト箱の画像と確認。
- SD14_01は「今日のクリーム、何で混ぜるん？」直前、SD14_02は「……誰に？」直前。既存の中央上部ウインドウ形式、幅640・枠660×380を使用。表示前にプリロードを待ち、共通BAD結果前に画像と枠を消去。
- CG14_01はSCENE04の「安心するん、誰？」直前から問いの終わりまで。フェードで厨房＋抹茶へ戻してからCHOICE01を表示し、CGを選択肢の下へ残しません。
- CORE016は「“せっかく”？」後にBAD曲へ。数日後の厨房へ700msフェード。応募締切を逃した「……締め切り、昨日だった」直前に700ms暗転からCG14_02へ。最後の「せめて、ウチの話も聞いてほしかった」後、曲900msフェードアウトと暗転で余韻を作り、共通BAD画面までにCGを消去。再挑戦時は夕方相当の厨房と通常曲を復元。
- SCENE03の神田、SCENE05の藤代に入店ベル→SHOW、退店ベル→HIDE。計4回、既存ドアベルを再利用。入替え時・時間経過はフェードし、三好・久世・女神の立ち絵は登場させません。
- CG14_03は藤代が仕事の身分を明かした後、封筒を提示する「国際エクレアコンペティションの、国内推薦の話です」直前から来店会話の終わりまで。CG解放をこの地点まで行わず、未回収はタイトル・caption・サムネイルを伏せます。終了時に必要な立ち絵を黒画面の下で戻し、退店ベル→藤代HIDE。
- 通常曲はSCENE01〜06とMINIで継続。SCENE07冒頭にOne Year, One Eclairへ穏やかに変更し、CLEARで再始動せず継続。新規曲やMeasured Grace／本物のパティシエ／Matcha Has Arrivedは使用しません。
- 帰還は今月起きず、本人の帰る／残る意思は未確定。「三月終わってから話す」を原文のまま保持。3月の大会・結末を追加していません。2月末はタイトル・記録の2ボタンで待機。

## 変更ファイル

作業版：`C:/Program Files (x86)/Steam/steamapps/common/TyranoBuilder/myproject/365days_eclair`。

ブラウザ版：`C:/Users/user/Documents/sacher10610.github.io/games/365days-eclair`。

| 両ゲームルートからのパス | 新規／変更と影響 |
|---|---|
| `data/scenario/n02_february.ks` | 新規。本編・分岐・CG／BGM演出・CLEAR |
| `data/scenario/n01_january.ks` | 末尾に「2月へ」ボタン1行のみ追加。最新CORE015のウェイト・CGタイミングを保持 |
| `data/scenario/system_common.ks` | 2月の記録・CG・選択ラベル・戻り先・リセット。2月MINIの4行対策 |
| `data/scenario/title_screen.ks` | 既存の旧CLEARメニュー補修へ1月を追加 |
| `data/bgimage/cg/february/CG14_01_Whose_Peace_of_Mind.png` | 原本PNGをそのまま新規追加 |
| `data/bgimage/cg/february/CG14_02_The_Road_We_Closed.png` | 原本PNGをそのまま新規追加 |
| `data/bgimage/cg/february/CG14_03_The_Invitation_to_the_World.png` | 原本PNGをそのまま新規追加 |
| `data/bgimage/cg/february/SD14_01_MiniBad010_Kitchen_Packing.png` | 原本PNGをそのまま新規追加 |
| `data/bgimage/cg/february/SD14_02_MiniBad011_Gifts_For_Whom.png` | 原本PNGをそのまま新規追加 |
| `data/bgimage/eyecatch/EYECATCH_01_02_FEBRUARY.png` | 原本PNGをそのまま新規追加 |

ブラウザ版のみ `index.html` の説明を2月までに更新。作業版のみ `APRIL_EXISTING_VARIABLE_MAP.md` に2月の台帳追記。ソースの実差分は [source-changes.patch](source-changes.patch)、画像の対応・ハッシュは [ASSET_INSTALLATION_MAP.csv](ASSET_INSTALLATION_MAP.csv)。報告・検査コード・一時バックアップはゲーム外に保管。

`first.ks`、`Config.tjs`、共通メッセージ配置・CSS、futureキャラ登録ファイル、4〜12月のシナリオ、OP、既存音源・画像は変更していません。両ゲームで以前から違う起動ファイルも各々の内容を保持。新規起動経路・Reload・仮回収フラグ・テストSAVEは追加しません。今回は未コミット・未プッシュ。

## 実キーと共通処理

月キーは `02`、シナリオは `n02_february.ks`。素材番号 `CG14_*` / `SD14_*` を月番号・章フラグに置換せず保持。

| 意味 | 実キー／設定時点 |
|---|---|
| CORE016既読 | `sf.core_bad_016`、共通 `register_core_bad id="016"` |
| MINI010既読 | `sf.mini_bad_m10`、共通 `register_mini_bad id="m10"` |
| MINI011既読 | `sf.mini_bad_m11`、共通 `register_mini_bad id="m11"` |
| 2月CLEAR | `sf.normal_ch02_clear`、CLEAR到達 |
| CG14_01/02/03解放 | `sf.cg_february_event_01/02/03`、それぞれの表示時 |
| SD14_01/02解放 | `sf.cg_february_mini_01/02`、それぞれの表示時 |

全9フラグが未使用と確認。既存の `f.chapter`、`f.scene`、`f.current_clear_month`、`f.april_bad` を再利用し、別名の永続ループ変数・重複CGフラグを作っていません。未定義は未回収として扱います。記録は既存ノートUIのCORE/MINI/CGへ追加し、全リセット・DEBUG2月単月リセットに9フラグを追加。内部のcg_view/cg_idオブジェクトは保持。

MINIは共通 `show_mini_bad`、COREは `show_core_bad` をcall。共通retryのreturn後に背景と人物を整理し元の選択肢へ。記録から戻る場合は2月CLEAR／BADの元メニューとクイックUIを既存処理で復元。過去のセーブ形式を変更していません。

## キャラ・表示・素材

| キャラ | 使用する既存storage / face | 定義の実行入口 |
|---|---|---|
| 抹茶エクレア | `apr_matcha_normal.png` / `default`、落ち着いた場面は `apr_matcha_quiet.png` / `quiet` | アイキャッチ入口・SCENE01入口から `system/future_character_define.ks` をcall |
| 神田姫花 | `kanda_normal.png` / `default` | 同上 |
| 藤代誠 | `fujishiro_normal.png` / `default` | 同上 |

現行future定義の `[if]` は `TYRANO.kag.stat.charas` を参照。未登録時のみchara_new、その後face登録→show/modを行います。登録済み／未登録の両方をソース状態シミュレーションで確認し、二度callしても重複newしないことを検査。実際の旧SAVEや途中LOADのキャラ状態は未確認です。主人公通常spriteは追加・表示せず、SD主人公は同梱画像の中だけです。

背景は既存朝厨房・昼厨房・午後店内・夜厨房・夜店内を再利用。夕方厨房には前月同様 `apr_kitchen_day.png` を使い、新しい背景を生成していません。原本6PNGは1672×941/RGBA、manifestのSHA256と一致。画像を再圧縮・再生成・非等倍変形しません。CG・月扉はcontain、SDは幅のみ指定、2月ギャラリー画像はobject-fit:contain。通常背景へ戻す際にCG用fit指定を解除。

会話は既存の太字28・文字色・行間を保持。最長台詞55文字は自然改行で表示。中央選択肢はx310/幅660/高さ85/太字21、3択y150/245/340・2択y195/290。浮いた質問・LEARNED表示はありません。CLEAR本文は内容を変えず改ページ。

2月MINIのコメントは37文字。1月で導入した4行対策を2月へも適用し、結果画面の「失敗の記録に登録しました」の通知行を省きます。番号・題名・確定コメント・実登録・ボタンは保持。過去月の表示は変更しません。

3MP3と共通WAVは既存実体とハッシュ一致したため再コピーなし。CSV/JSONのmanifest10件一致、MP3ヘッダとWAVメタデータを検査。再生・試聴は未実施。1月曲を1000msで停止開始→700ms暗転＋300ms待機後にジングルを1回、3100ms待機＋400ms暗転で停止。通常曲・BAD曲・月末曲は既存xchgbgm方式を使用。

## 検査結果

- Static PASS: 17 scenarios, 678 JavaScript checks, 513 file references.
- Original six PNG hashes/dimensions PASS; adopted SD14_02 blank-label gifts version preserved. Four existing audio hashes matched at baseline; no new audio copies.
- 457 exact dialogue pages (Markdown emphasis retained as bold, not literal stars), exact choices, three BAD/retry paths, five CG skip stops, CG14_03 after identity reveal, scene07 month-end BGM, unchanged January CG02 timing PASS.
- Record VM PASS: four records/five CGs masked/unlocked, exact texts, 160 earlier-month states unchanged, monthly/all reset.
- Legacy August–January CLEAR repair callbacks PASS in isolated JS; actual SAVE/LOAD remains untested.
- Source-state simulation PASS: direct correct route, all three first/known BADs, repeated retries, normal/month-end music state, CG cleanup, bells before SHOW/HIDE, guest separation, runtime registration guards. This is not an engine preview.

これらはソース・独立JavaScript・ソース状態シミュレーションの結果です。実Tyranoの表示・音・SAVE/LOAD・画面往復の保証ではありません。実機受入はユーザー担当として引き継ぎます。

実装補助の月別パッチ作成中、前月テンプレートに残った月キー・接続先の不一致をassertとレビューで検出し、ステージ内で修正しました。製品ファイルへ反映する前に全経路のソース検査を通過。実機不具合を確認・修正したとする報告ではありません。
