# 3月アセットの公式マッピング

## 大会の新規背景（16:9、画像原本は1672×941）
| ID | パック内パス | 場面 |
|---|---|---|
| BG15_01 | `assets/bg/BG15_01_At_the_Worlds_Door.png` | SCENE04：大会エントランス |
| BG15_02 | `assets/bg/BG15_02_Before_the_Finals.png` | SCENE05〜06：控室、久世再会・準備 |
| BG15_03 | `assets/bg/BG15_03_World_Eclair_Grand_Prix.png` | SCENE07〜09：決勝会場・試食・表彰（同一施設） |

## 本CG（すべて実画像を採用、描き直し禁止）
| ID | パック内ファイル（`assets/cg/event/`以下） | 登場 |
|---|---|---|
| CG15_01 | `CG15_01_Across_the_Same_Stage.png` | SCENE05：抹茶×久世再会 |
| CG15_02 | `CG15_02_The_Real_Patissier.png` | SCENE07：久世の本気・曲『本物のパティシエ』開始 |
| CG15_03 | `CG15_03_One_Bite_One_World.png` | SCENE08：一般試食・審査 |
| CG15_04 | `CG15_04_The_Worlds_Best_Eclair.png` | SCENE09：総合1位 |
| CG15_05 | `CG15_05_One_Last_Look.png` | SCENE11A：1周目帰還直前 |
| CG15_06 | `CG15_06_The_Promise_Left_Unspoken.png` | SCENE12A：無音の真BAD |
| CG15_07 | `CG15_07_By_Your_Name.png` | TRUE：名前初呼び |
| CG15_08 | `CG15_08_The_Day_After.png` | TRUE：4月1日朝 |

## SD・月間・ロゴ
| ID | パス | 登場 |
|---|---|---|
| SD15_01 | `assets/cg/mini/SD15_01_MiniBad012_Three_Hour_Speech.png` | MINI BAD012 |
| SD15_02 | `assets/cg/mini/SD15_02_MiniBad013_Print_First.png` | MINI BAD013 |
| EYECATCH | `assets/eyecatch/EYECATCH_02_03_MARCH.png` | 2月CLEAR→3月開始。ギャラリー非登録 |
| ENDCARD_TRUE_01 | `assets/ui/ENDCARD_TRUE_01_FIN.png` | TRUE固定文直後。全画面ロゴカード、追加テキスト禁止 |

## 動画（暫定）
`assets/video/march_first_ending_temp.mp4`：1280×720、30fps H.264、AAC音声内蔵、実尺227.133秒。**1周目専用**。固定のゲーム内参照先へコピーし、正式版を同じパスへ差し替え可能にする。音声入りのためMP3別再生禁止。

## BGM（パック内 `assets/audio/bgm/`）
- `Morning Mise en Place.mp3`：通常
- `Measured Grace.mp3`：久世の入場／SCENE05
- `本物のパティシエ.mp3`：SCENE07、久世「じゃあ、本気で勝ちにいくわ」直後
- `One Year, One Eclair.mp3`：SCENE09優勝後〜夜の厨房／TRUE最終選択前
- `Flour on the Floor.mp3`：既存共通BAD曲との互換用（新規COREの通常BADはなし）
- `366日目のレシピ.mp3`：TRUE最終選択③から全編連続
- `eyecatch_may_to_june_jingle.wav`：既存月間共通ジングル
- `assets/audio/reference_only/二人で歩んだ軌跡(レシピ).mp3`：映像音声の参照。**ゲーム側では暫定MP4と二重再生しない**。

**既存立ち絵やKomorebi背景はゲームプロジェクト内の現行実装から再使用。** 新しい主人公通常立ち絵を作らない。画像の実配置先は既存の `data/bgimage` / `data/fgimage` / `data/image` などを調査して決める。原本は上記同梱構造で保全する。
