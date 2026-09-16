(() => {
  "use strict";

  // Add published media here. A missing title is inferred from the artwork
  // filename first, then from the media filename. A missing artist becomes
  // "UNKNOWN ARTIST". Supported media: MP3/WAV/OGG/M4A and MP4/WebM.
  const tracks = [
    {
      id: "zannetto-chiruko-theme",
      src: "/assets/music/zannetto-chiruko-theme.mp3",
      title: "ザンネットちるこのテーマ",
      artist: "雑葉（ざつは）",
      artwork: "/assets/music/zannetto-chiruko-theme.webp",
      kind: "audio",
      ratio: "1 / 1"
    },
    {
      id: "blue-bookmark",
      src: "/assets/music/blue-bookmark.mp4",
      title: "blue bookmark",
      artist: "雑葉（ざつは）",
      artwork: "",
      kind: "video",
      ratio: "16 / 9"
    },
    {
      id: "broken-gears",
      src: "/assets/music/broken-gears.mp4",
      title: "壊れた歯車の隙間から",
      artist: "雑葉（ざつは）",
      artwork: "",
      kind: "video",
      ratio: "16 / 9"
    },
    {
      id: "kyoso-power",
      src: "/assets/music/kyoso-power.mp4",
      title: "KYOSO-POWER",
      artist: "雑葉（ざつは）",
      artwork: "",
      kind: "video",
      ratio: "9 / 16"
    },
    // {
    //   id: "example-audio",
    //   src: "/assets/music/example-track.mp3",
    //   title: "Example Title",
    //   artist: "SACHER10610",
    //   artwork: "/assets/music/example-cover.webp",
    //   kind: "audio",
    //   ratio: "1 / 1"
    // },
    // {
    //   id: "example-video",
    //   src: "/assets/music/example-video.webm",
    //   title: "Example Movie",
    //   artist: "SACHER10610",
    //   artwork: "",
    //   kind: "video",
    //   ratio: "16 / 9"
    // }
  ];

  const visualizerStyles = [
    { id: "bars", name: "SPECTRUM / BARS" },
    { id: "mirror", name: "SPECTRUM / MIRROR" },
    { id: "wave", name: "SPECTRUM / WAVE" },
    { id: "orbit", name: "SPECTRUM / ORBIT" }
  ];

  const videoPattern = /\.(?:mp4|webm|mov|m4v)(?:[?#].*)?$/i;
  const reducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)");

  const elements = {
    audio: document.querySelector("#track-audio"),
    video: document.querySelector("#track-video"),
    artwork: document.querySelector("#track-artwork"),
    placeholder: document.querySelector("#media-placeholder"),
    viewport: document.querySelector("#media-viewport"),
    canvas: document.querySelector("#spectrum"),
    spectrumName: document.querySelector("#spectrum-name"),
    visualizerButton: document.querySelector("#visualizer-button"),
    playerState: document.querySelector("#player-state"),
    trackIndex: document.querySelector("#track-index"),
    trackTitle: document.querySelector("#track-title"),
    trackArtist: document.querySelector("#track-artist"),
    trackList: document.querySelector("#track-list"),
    progress: document.querySelector("#track-progress"),
    currentTime: document.querySelector("#current-time"),
    duration: document.querySelector("#duration"),
    previous: document.querySelector("#previous-button"),
    play: document.querySelector("#play-button"),
    playLabel: document.querySelector("#play-label"),
    next: document.querySelector("#next-button"),
    playMode: document.querySelector("#play-mode-button"),
    playModeLabel: document.querySelector("#play-mode-label"),
    volume: document.querySelector("#volume"),
    volumeValue: document.querySelector("#volume-value"),
    notice: document.querySelector("#media-notice"),
    kind: document.querySelector("#media-kind"),
    count: document.querySelector("#track-count")
  };

  const ctx = elements.canvas?.getContext("2d");
  const mediaSources = new WeakMap();
  let audioContext = null;
  let analyser = null;
  let frequencyData = null;
  let currentIndex = 0;
  let playMode = "sequential";
  let currentVisualizer = Math.floor(Math.random() * visualizerStyles.length);
  let animationFrame = 0;
  let activeMedia = elements.audio;

  function titleFromPath(value) {
    if (!value || typeof value !== "string") return "";

    try {
      const pathname = new URL(value, window.location.origin).pathname;
      const filename = decodeURIComponent(pathname.split("/").pop() || "");
      return filename
        .replace(/\.[^.]+$/, "")
        .replace(/[-_]+/g, " ")
        .replace(/\s+/g, " ")
        .trim();
    } catch {
      return "";
    }
  }

  function normalizeTrack(track, index) {
    const src = typeof track?.src === "string" ? track.src.trim() : "";
    const artwork = typeof track?.artwork === "string" ? track.artwork.trim() : "";
    const inferredTitle = titleFromPath(artwork) || titleFromPath(src) || `TRACK ${String(index + 1).padStart(2, "0")}`;
    const kind = track?.kind === "video" || (track?.kind !== "audio" && videoPattern.test(src)) ? "video" : "audio";

    return {
      id: String(track?.id || `track-${index + 1}`),
      src,
      title: String(track?.title || inferredTitle).trim(),
      artist: String(track?.artist || "UNKNOWN ARTIST").trim(),
      artwork,
      kind,
      ratio: String(track?.ratio || (kind === "video" ? "16 / 9" : "1 / 1"))
    };
  }

  const playlist = tracks.map(normalizeTrack).filter((track) => track.src);

  function formatTime(seconds) {
    if (!Number.isFinite(seconds) || seconds < 0) return "00:00";
    const minutes = Math.floor(seconds / 60);
    const remaining = Math.floor(seconds % 60);
    return `${String(minutes).padStart(2, "0")}:${String(remaining).padStart(2, "0")}`;
  }

  function getActiveMedia() {
    return playlist[currentIndex]?.kind === "video" ? elements.video : elements.audio;
  }

  function setNotice(message) {
    elements.notice.textContent = message;
  }

  function setPlayingState(isPlaying) {
    elements.playLabel.textContent = isPlaying ? "PAUSE" : "PLAY";
    elements.play.setAttribute("aria-label", isPlaying ? "一時停止" : "再生");
    elements.playerState.textContent = isPlaying ? "PLAYING" : "PAUSED";
  }

  function setViewportRatio(track) {
    elements.viewport.classList.remove("is-landscape", "is-portrait");
    const parts = track.ratio.split("/").map(Number);
    const ratio = parts.length === 2 && parts[1] ? parts[0] / parts[1] : 1;
    elements.viewport.style.setProperty("--media-ratio", track.ratio);
    if (ratio > 1.25) elements.viewport.classList.add("is-landscape");
    if (ratio < 0.8) elements.viewport.classList.add("is-portrait");
  }

  function showArtwork(track) {
    elements.video.hidden = true;
    elements.video.removeAttribute("src");
    elements.video.removeAttribute("poster");
    elements.video.load();

    if (track.artwork) {
      elements.artwork.alt = `${track.title} — ${track.artist} のジャケット`;
      elements.artwork.hidden = false;
      elements.placeholder.hidden = true;
      elements.artwork.src = track.artwork;
    } else {
      elements.artwork.hidden = true;
      elements.artwork.removeAttribute("src");
      elements.placeholder.hidden = false;
    }
  }

  function showVideo(track) {
    elements.artwork.hidden = true;
    elements.artwork.removeAttribute("src");
    elements.placeholder.hidden = Boolean(track.artwork);
    elements.video.poster = track.artwork;
    elements.video.src = track.src;
    elements.video.hidden = false;
    elements.video.load();
  }

  function stopMedia() {
    elements.audio.pause();
    elements.video.pause();
    setPlayingState(false);
  }

  function loadTrack(index, shouldPlay = false) {
    if (!playlist.length) return;

    stopMedia();
    currentIndex = Math.max(0, Math.min(index, playlist.length - 1));
    const track = playlist[currentIndex];
    setViewportRatio(track);

    elements.trackIndex.textContent = `${String(currentIndex + 1).padStart(2, "0")} / ${String(playlist.length).padStart(2, "0")}`;
    elements.trackTitle.textContent = track.title;
    elements.trackArtist.textContent = track.artist;
    elements.trackList.value = String(currentIndex);
    elements.kind.textContent = track.kind === "video" ? `VIDEO / ${track.ratio}` : "AUDIO / COVER";
    elements.progress.value = "0";
    elements.currentTime.textContent = "00:00";
    elements.duration.textContent = "00:00";

    if (track.kind === "video") {
      elements.audio.removeAttribute("src");
      elements.audio.load();
      showVideo(track);
    } else {
      showArtwork(track);
      elements.audio.src = track.src;
      elements.audio.load();
    }

    activeMedia = getActiveMedia();
    chooseVisualizer();
    setNotice("READY");
    if (shouldPlay) playCurrent();
  }

  function chooseNextIndex() {
    if (playlist.length < 2) return 0;
    if (playMode === "sequential") return (currentIndex + 1) % playlist.length;

    let nextIndex = currentIndex;
    while (nextIndex === currentIndex) {
      nextIndex = Math.floor(Math.random() * playlist.length);
    }
    return nextIndex;
  }

  async function ensureAnalyser(media) {
    const AudioContextClass = window.AudioContext || window.webkitAudioContext;
    if (!AudioContextClass) return;

    try {
      if (!audioContext) {
        audioContext = new AudioContextClass();
        analyser = audioContext.createAnalyser();
        analyser.fftSize = 128;
        analyser.smoothingTimeConstant = 0.76;
        frequencyData = new Uint8Array(analyser.frequencyBinCount);
        analyser.connect(audioContext.destination);
      }

      if (!mediaSources.has(media)) {
        const source = audioContext.createMediaElementSource(media);
        source.connect(analyser);
        mediaSources.set(media, source);
      }

      if (audioContext.state === "suspended") await audioContext.resume();
    } catch {
      // The decorative analyser remains active if Web Audio is unavailable.
    }
  }

  async function playCurrent() {
    if (!playlist.length) return;
    activeMedia = getActiveMedia();
    await ensureAnalyser(activeMedia);

    try {
      await activeMedia.play();
      setNotice(playlist[currentIndex].kind === "video" ? "VIDEO PLAYBACK" : "AUDIO PLAYBACK");
    } catch {
      setNotice("PLAYBACK REQUIRES USER ACTION");
    }
  }

  function togglePlayback() {
    if (!playlist.length) return;
    activeMedia = getActiveMedia();
    if (activeMedia.paused) playCurrent();
    else activeMedia.pause();
  }

  function updateTimeline(event) {
    const media = event.currentTarget;
    if (media !== getActiveMedia()) return;
    const duration = Number.isFinite(media.duration) ? media.duration : 0;
    const current = Number.isFinite(media.currentTime) ? media.currentTime : 0;
    elements.progress.value = duration ? String(Math.round((current / duration) * 1000)) : "0";
    elements.currentTime.textContent = formatTime(current);
    elements.duration.textContent = formatTime(duration);
    elements.progress.setAttribute("aria-valuetext", `${formatTime(current)} / ${formatTime(duration)}`);
  }

  function onMediaError() {
    setPlayingState(false);
    elements.playerState.textContent = "ERROR";
    setNotice("MEDIA UNAVAILABLE");
  }

  function resizeCanvas() {
    if (!ctx) return;
    const rect = elements.canvas.getBoundingClientRect();
    const density = Math.min(window.devicePixelRatio || 1, 2);
    const width = Math.max(1, Math.round(rect.width * density));
    const height = Math.max(1, Math.round(rect.height * density));
    if (elements.canvas.width === width && elements.canvas.height === height) return;
    elements.canvas.width = width;
    elements.canvas.height = height;
  }

  function sampleLevel(index, count, time) {
    if (analyser && frequencyData && activeMedia && !activeMedia.paused) {
      analyser.getByteFrequencyData(frequencyData);
      const dataIndex = Math.min(frequencyData.length - 1, Math.floor((index / count) * frequencyData.length));
      return frequencyData[dataIndex] / 255;
    }

    const slow = Math.sin(time * 0.00065 + index * 0.78) * 0.5 + 0.5;
    const fast = Math.sin(time * 0.0015 + index * 1.91) * 0.5 + 0.5;
    return 0.12 + (slow * 0.18) + (fast * 0.08);
  }

  function drawBars(width, height, time, mirror = false) {
    const count = Math.max(18, Math.floor(width / 18));
    const gap = Math.max(2, width * 0.004);
    const barWidth = Math.max(1, (width - (gap * (count - 1))) / count);
    const baseline = mirror ? height / 2 : height;

    for (let index = 0; index < count; index += 1) {
      const level = sampleLevel(index, count, time);
      const barHeight = Math.max(2, level * (mirror ? height * 0.42 : height * 0.82));
      const x = index * (barWidth + gap);
      const alpha = 0.28 + level * 0.68;
      ctx.fillStyle = index % 7 === 0 ? `rgba(181, 154, 100, ${alpha * 0.55})` : `rgba(66, 105, 200, ${alpha})`;
      if (mirror) {
        ctx.fillRect(x, baseline - barHeight, barWidth, barHeight);
        ctx.fillRect(x, baseline + 2, barWidth, barHeight);
      } else {
        ctx.fillRect(x, baseline - barHeight, barWidth, barHeight);
      }
    }
  }

  function drawWave(width, height, time) {
    const lines = 3;
    for (let line = 0; line < lines; line += 1) {
      ctx.beginPath();
      for (let point = 0; point <= 80; point += 1) {
        const x = (point / 80) * width;
        const level = sampleLevel(point, 80, time + line * 180);
        const y = (height * (0.38 + line * 0.16)) + Math.sin(point * 0.34 + time * 0.001 + line) * level * height * 0.22;
        if (point === 0) ctx.moveTo(x, y);
        else ctx.lineTo(x, y);
      }
      ctx.strokeStyle = line === 1 ? "rgba(181, 154, 100, 0.34)" : `rgba(66, 105, 200, ${0.72 - line * 0.18})`;
      ctx.lineWidth = Math.max(1, width / 700);
      ctx.stroke();
    }
  }

  function drawOrbit(width, height, time) {
    const centerX = width / 2;
    const centerY = height * 0.72;
    const count = 30;
    for (let index = 0; index < count; index += 1) {
      const level = sampleLevel(index, count, time);
      const angle = (index / count) * Math.PI * 2 + time * 0.00008;
      const radius = Math.min(width, height * 2) * (0.15 + level * 0.25);
      const x = centerX + Math.cos(angle) * radius;
      const y = centerY + Math.sin(angle) * radius * 0.32;
      const size = 1 + level * 4;
      ctx.fillStyle = index % 6 === 0 ? "rgba(181, 154, 100, 0.62)" : "rgba(66, 105, 200, 0.7)";
      ctx.fillRect(x, y, size, size);
    }
  }

  function renderSpectrum(time = 0) {
    if (!ctx) return;
    resizeCanvas();
    const width = elements.canvas.width;
    const height = elements.canvas.height;
    ctx.clearRect(0, 0, width, height);

    const style = visualizerStyles[currentVisualizer].id;
    if (style === "bars") drawBars(width, height, time, false);
    if (style === "mirror") drawBars(width, height, time, true);
    if (style === "wave") drawWave(width, height, time);
    if (style === "orbit") drawOrbit(width, height, time);

    if (!reducedMotion.matches) animationFrame = requestAnimationFrame(renderSpectrum);
  }

  function updateVisualizerLabel() {
    const visualizer = visualizerStyles[currentVisualizer];
    elements.spectrumName.textContent = visualizer.name;
    elements.visualizerButton.textContent = `VISUAL ${String(currentVisualizer + 1).padStart(2, "0")}`;
  }

  function chooseVisualizer() {
    currentVisualizer = Math.floor(Math.random() * visualizerStyles.length);
    updateVisualizerLabel();
    if (reducedMotion.matches) renderSpectrum(0);
  }

  function nextVisualizer() {
    currentVisualizer = (currentVisualizer + 1) % visualizerStyles.length;
    updateVisualizerLabel();
    if (reducedMotion.matches) renderSpectrum(0);
  }

  function buildTrackList() {
    elements.trackList.replaceChildren();
    elements.count.textContent = `${String(playlist.length).padStart(3, "0")} TRACKS`;

    if (!playlist.length) {
      const option = new Option("NO MEDIA REGISTERED", "");
      elements.trackList.add(option);
      elements.trackList.disabled = true;
      return;
    }

    playlist.forEach((track, index) => {
      elements.trackList.add(new Option(`${String(index + 1).padStart(2, "0")} / ${track.title}`, String(index)));
    });
  }

  function initializePlaylist() {
    buildTrackList();
    updateVisualizerLabel();
    elements.audio.volume = Number(elements.volume.value) / 100;
    elements.video.volume = Number(elements.volume.value) / 100;

    if (!playlist.length) {
      elements.viewport.classList.remove("is-landscape", "is-portrait");
      elements.placeholder.hidden = false;
      elements.play.disabled = true;
      elements.previous.disabled = true;
      elements.next.disabled = true;
      elements.playMode.disabled = true;
      elements.progress.disabled = true;
      elements.playerState.textContent = "STANDBY";
      setNotice("ADD MEDIA TO START");
    } else {
      elements.play.disabled = false;
      elements.previous.disabled = playlist.length < 2;
      elements.next.disabled = playlist.length < 2;
      elements.playMode.disabled = playlist.length < 2;
      elements.progress.disabled = false;
      loadTrack(Math.floor(Math.random() * playlist.length));
    }

    cancelAnimationFrame(animationFrame);
    renderSpectrum(0);
  }

  elements.artwork.addEventListener("error", () => {
    elements.artwork.hidden = true;
    elements.placeholder.hidden = false;
    setNotice("NO ARTWORK / MEDIA READY");
  });

  [elements.audio, elements.video].forEach((media) => {
    media.addEventListener("play", () => {
      activeMedia = media;
      if (media === elements.video) elements.placeholder.hidden = true;
      ensureAnalyser(media);
      setPlayingState(true);
    });
    media.addEventListener("pause", () => {
      if (media === getActiveMedia() && !media.ended) setPlayingState(false);
    });
    media.addEventListener("timeupdate", updateTimeline);
    media.addEventListener("loadedmetadata", updateTimeline);
    media.addEventListener("error", onMediaError);
    media.addEventListener("ended", () => loadTrack(chooseNextIndex(), true));
  });

  elements.trackList.addEventListener("change", () => loadTrack(Number(elements.trackList.value), true));
  elements.play.addEventListener("click", togglePlayback);
  elements.previous.addEventListener("click", () => loadTrack((currentIndex - 1 + playlist.length) % playlist.length, true));
  elements.next.addEventListener("click", () => loadTrack(chooseNextIndex(), true));

  elements.playMode.addEventListener("click", () => {
    playMode = playMode === "sequential" ? "shuffle" : "sequential";
    const isShuffle = playMode === "shuffle";
    elements.playMode.setAttribute("aria-pressed", String(isShuffle));
    elements.playModeLabel.textContent = isShuffle ? "RANDOM" : "SEQUENTIAL";
    setNotice(isShuffle ? "RANDOM PLAY" : "SEQUENTIAL PLAY");
  });

  elements.progress.addEventListener("input", () => {
    const media = getActiveMedia();
    if (!Number.isFinite(media.duration)) return;
    media.currentTime = (Number(elements.progress.value) / 1000) * media.duration;
  });

  elements.volume.addEventListener("input", () => {
    const value = Number(elements.volume.value);
    elements.volumeValue.value = String(value);
    elements.volumeValue.textContent = String(value);
    elements.audio.volume = value / 100;
    elements.video.volume = value / 100;
  });

  elements.visualizerButton.addEventListener("click", nextVisualizer);
  window.addEventListener("resize", resizeCanvas, { passive: true });
  reducedMotion.addEventListener("change", () => {
    cancelAnimationFrame(animationFrame);
    renderSpectrum(0);
  });

  initializePlaylist();
})();
