# 分岐と戻り先・リプレイ法

```text
FEBRUARY CLEAR
   → EYECATCH MARCH → SCENE01 → SCENE02 CHOICE00
   ├ A → MINI BAD012 → CHOICE00
   ├ B → MINI BAD013 → CHOICE00
   └ C → SCENE03 → SCENE04 → SCENE05 → SCENE06 CHOICE01
                                    ├ A → REVIEW(9月) → CHOICE01
                                    ├ B → REVIEW(1月) → CHOICE01
                                    └ C → SCENE07 → 08 → 09 世界一確定 → 10
                                                                 ├ sf.true_bad_seen false → 11A → ED動画 → 12A → 真BAD017 → タイトル
                                                                 └ sf.true_bad_seen true → 11B FINAL
                                                                                  ├ ① 帰るべき場所
                                                                                  ├ ② あなたの答え
                                                                                  └ ③ TRUE → fin → タイトル
```

- MINI BAD012／013は**任意回収**。9月の「BAD必須ロック」は3月に適用しない。既読時は共通短縮処理。2周目も同じ。
- CHOICE01 A/Bは通常CORE BADではなく短い振り返り。**新規CORE BAD採番禁止**。CHOICE01へ復帰。Cは初回から選べる。
- 世界大会優勝は分岐で変動せず、**本編の共通事実**。
- 初回にFINALの三択は出さない。通常のムービー経由で真BADを初体験させる。
- 再挑戦開始ボタンは4月初めからの正規ルート。既存スタートの導線へ戻す。`sf.true_bad_seen`を維持。
- 4月INSIGHTを未閲覧でもロード等で3月へ進めば三択は解除。唯一の判定は `sf.true_bad_seen`。
- 番号固定：MINI 012『優勝スピーチ三時間』、013『世界一、先に印刷』、真BAD CORE 017『約束どおり』。
- 既存記録画面の編集による履歴・ギャラリー解放を **CG表示と別に結びつける**。早期解放禁止。
