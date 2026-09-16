# MUSIC assets

Place published audio, video, and cover files in this directory, then register
each item in `js/music.js` inside the `tracks` array.

Recommended formats:

- Audio: `.mp3`, `.m4a`, `.ogg`, `.wav`
- Video: `.webm` or `.mp4`
- Artwork: `.webp` or `.avif`

Example:

```js
{
  id: "track-id",
  src: "/assets/music/track-id.mp3",
  title: "Track Title",
  artist: "Artist Name",
  artwork: "/assets/music/track-id.webp",
  kind: "audio",
  ratio: "1 / 1"
}
```

For video, set `kind` to `video` and use `ratio: "16 / 9"` or
`ratio: "9 / 16"`. If `title` is omitted, the player derives it from the
artwork filename first and then from the media filename. If `artist` is
omitted, it displays `UNKNOWN ARTIST`.
