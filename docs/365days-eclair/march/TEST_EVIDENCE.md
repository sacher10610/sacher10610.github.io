# 3月テスト証跡

2026-10-20。**ゲームの実機確認は未実施。以下のソース検査を実機PASSと混同しない。**

## 実施済み

- Static PASS: 18 scenarios, 831 JavaScript checks, 600 references.
- Bundled TyranoScript parser PASS: all 18 scenarios, no syntax warnings or unmatched if/endif.
- 557 March spoken lines retained by generator; 84 timed TRUE pages + final narration; 16 April INSIGHT lines, ten CG triggers, actual-ended movie, first/second ending gates, normal-END distinction PASS.
- March seven records/ten CG masked/unlocked, exact captions/record prose; 176 earlier-month record states unchanged; monthly/all resets PASS.
- Runtime VM PASS: actual audio-end+1500ms gates, no auto return/repeat input, one-shot playback, text wait/read floor, muted transport, input/skip lock restoration, errors/stalls, movie ended/error recovery, debug-only reset persistence/toggle, load cleanup/restart. No actual UI/audio playback performed.

- ソース状態走査による初回・各分岐・TRUE、人物登録、CG掃除、月末曲の継続：PASS。
- ffprobeによる動画・音声のメタデータ、manifest全60ファイル、素材コピー後のハッシュ：照合。

## 雑葉さんの確認項目（当初の確認用一覧）

- [ ] 2月末「3月へ」→MARCH扉→本編。選択肢の中央位置、4行以内の収まり。
- [ ] MINI012/013、振り返り2分岐、リトライ・既読短縮。
- [ ] 三好・神田の入退店、久世・藤代・女神の表示、ベル／転移SE。
- [ ] CG15_01〜04でSKIP停止。決勝曲開始と世界一発表後のOne Year。
- [ ] 初回11A→仮動画→無音12A→真BADカードの順。動画途中では再挑戦未解放。
- [ ] 記録→戻るでCGプレビュー・文字色・クイックUIが残留／消失しない。
- [ ] タイトル「もう一度、あの日から」→名前入力→4月INSIGHT。既存4月ルートも正常。
- [ ] 真BAD後のSCENE10以前SAVEから最終3択が開く。INSIGHT未読でも開く。
- [ ] 通常END1/2ではTRUE曲／finを使用せず、記録と最終選択復帰が動く。
- [ ] TRUE84台詞と固定最終文が読める。初名前呼び／翌朝CGの順、曲の再始動・二重再生なし。
- [ ] TRUE中のクリック・Enter・SKIP/AUTO・セーブ操作が進行を壊さない。
- [ ] finの早い入力は無効、完奏＋表示後ウェイト後の新しい入力で一度だけタイトル。自動復帰なし。
- [ ] タイトル復帰後に通常開始／設定／記録／ロードが操作できる。
- [ ] デバッグ解除のキャンセルは不変更。実行・再起動後もOFF、他記録・CG・TRUE・SAVEは保持。
- [ ] デバッグOFF後にSCENE10以前から読込→初回動画へ再分岐。
- [ ] 実SAVE/LOADの安全な復帰、BGM音量0、別ウインドウへの移動／復帰。
- [ ] スマホ／公開ブラウザで動画・音声再生とfin入力。

元の詳細チェックリスト： [spec/20_TEST_CHECKLIST.md](spec/20_TEST_CHECKLIST.md)。

## 2026-10-21 DEBUG UI撤去

ユーザーより「バグもなさそう」と確認結果を受領し、単月リセット・1周目EDフラグ解除ボタンを撤去。下記はソース／隔離VMでの確認で、ゲーム画面は操作していません。上記のデバッグ解除操作2項目は撤去済みのため対象外です。

- 記録画面下部のボタンは「全記録リセット」「戻る」の2つのみ。EDフラグの状態表示も撤去。
- 実エンジンのパーサーで、共通シナリオの全コマンド数・全ラベル位置・行位置が変更前と同じことを確認。
- 名前付きclearfixは撤去済みDEBUG用の名前だけを対象とし、他のUIを消さないことを実エンジン処理で確認。
- 全記録リセットの確認・消去処理、記録から戻る処理は変更前と完全一致。
- 18シナリオ、829件のJavaScript検査、600参照、176通りの既存記録状態検査が成功。DEBUG解除は初期状態で無効・保存データの変更なし。
- 両プロジェクトの動画ファイルはそれぞれ変更前のSHA256と一致。ユーザーが手動差し替えした作業版の動画を保持。
