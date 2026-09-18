# MOVIE アーカイブ

動画は「分類 → 動画」の1階層で管理します。分類は「喫茶ベストプレイス」「A106 Steam LABO」「残念院さんシリーズ」「抹茶エクレア」「スロカスマリ＠今日も負け？」「その他」です。例：

```text
assets/movies/
  best-place/
    example-film.mp4
    example-film.webp  # 任意のポスター画像
```

公開ページへの登録は `js/movie.js` 冒頭の `movieCategories` 配列で行います。該当する分類の `movies` に動画を追加してください。分類名は `label` で変更でき、新しい分類も配列へ追加できます。

```js
{
  id: "example-film",
  src: "/assets/movies/best-place/example-film.mp4",
  poster: "/assets/movies/best-place/example-film.webp",
  ratio: "9 / 16",
  title: "Example Film"
}
```

`src` だけで登録できます。`title` が空欄・未指定なら画面には `No Title` と表示します。`poster` と `ratio` は任意で、縦横は動画のメタデータからも自動判定します。

`poster` がなければ、選択された動画の最初のフレームからブラウザ内で小さなサムネイルを自動作成し、一覧へ表示します。これは閲覧中だけのプレビューで、画像ファイルとしては保存されません。全動画を先読みしないため、未選択の動画はサムネイル未生成のままです。公開時から安定したサムネイルを表示したい場合は、動画追加時に1フレームをWebPへ書き出し、`poster` に指定してください。冒頭が黒画面の動画も、この方法なら見せたい場面を選べます。

初期状態では動画ファイルを登録していないため、壊れた動画を読み込みません。選択された1本だけが読み込まれます。
