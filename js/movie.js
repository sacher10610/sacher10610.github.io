(() => {
  "use strict";

  // 分類 → 動画。分類名や動画はここだけ編集すれば追加できます。
  // src / poster は assets/movies/<分類ID>/ 以下を推奨します。
  const movieCategories = [
    {
      id: "best-place",
      label: "喫茶ベストプレイス",
      movies: [
        {
          id: "makoto-and-fps",
          src: "/assets/movies/best-place/makoto-and-fps.mp4",
          title: "マコトとFPS"
        }
      ]
    },
    { id: "a106-steam-labo", label: "A106 Steam LABO", movies: [] },
    {
      id: "zannenin-series",
      label: "残念院さんシリーズ",
      movies: [
        { id: "zannet-chiruko-01", src: "/assets/movies/zannenin-series/zannet-chiruko-01.mp4", title: "ザンネットちるこ1" },
        { id: "zannet-chiruko-02", src: "/assets/movies/zannenin-series/zannet-chiruko-02.mp4", title: "ザンネットちるこ2" },
        { id: "zannet-chiruko-03", src: "/assets/movies/zannenin-series/zannet-chiruko-03.mp4", title: "ザンネットちるこ3" },
        { id: "zannet-chiruko-04", src: "/assets/movies/zannenin-series/zannet-chiruko-04.mp4", title: "ザンネットちるこ4" },
        { id: "zannet-chiruko-05", src: "/assets/movies/zannenin-series/zannet-chiruko-05.mp4", title: "ザンネットちるこ5" },
        { id: "zannet-chiruko-06", src: "/assets/movies/zannenin-series/zannet-chiruko-06.mp4?v=20260918-2", title: "ザンネットちるこ6" },
        { id: "zannet-chiruko-07", src: "/assets/movies/zannenin-series/zannet-chiruko-07.mp4", title: "ザンネットちるこ7" },
        { id: "zannet-chiruko-08", src: "/assets/movies/zannenin-series/zannet-chiruko-08.mp4", title: "ザンネットちるこ8" },
        { id: "stand-ability", src: "/assets/movies/zannenin-series/stand-ability.mp4", title: "スタンド能力？" },
        { id: "chill-recipe-01", src: "/assets/movies/zannenin-series/chill-recipe-01.mp4", title: "チルレシピその1" },
        { id: "midnight-beef-bowl-complete", src: "/assets/movies/zannenin-series/midnight-beef-bowl-complete.mp4", title: "深夜の牛めし完全版" },
        { id: "morning-greeting-03", src: "/assets/movies/zannenin-series/morning-greeting-03.mp4", title: "朝の挨拶3" },
        { id: "zannenin-speech-short", src: "/assets/movies/zannenin-series/zannenin-speech-short.mp4", title: "忙しい人のための残念院さんの演説" }
      ]
    },
    { id: "matcha-eclair", label: "抹茶エクレア", movies: [] },
    { id: "surokasumari", label: "スロカスマリ＠今日も負け？", movies: [] },
    { id: "other", label: "その他", movies: [] }
  ];

  const elements = {
    categories: document.querySelector("#category-list"),
    categoryCount: document.querySelector("#movie-category-count"),
    films: document.querySelector("#film-list"),
    caption: document.querySelector("#movie-caption"),
    title: document.querySelector("#movie-current-title"),
    path: document.querySelector("#movie-path"),
    index: document.querySelector("#movie-index"),
    count: document.querySelector("#movie-count"),
    state: document.querySelector("#movie-state"),
    video: document.querySelector("#movie-video"),
    viewport: document.querySelector("#movie-viewport"),
    placeholder: document.querySelector("#movie-placeholder"),
    placeholderMessage: document.querySelector("#movie-placeholder-message"),
    progress: document.querySelector("#movie-progress"),
    currentTime: document.querySelector("#movie-current-time"),
    duration: document.querySelector("#movie-duration"),
    previous: document.querySelector("#movie-previous"),
    play: document.querySelector("#movie-play"),
    next: document.querySelector("#movie-next"),
    mode: document.querySelector("#movie-mode"),
    volume: document.querySelector("#movie-volume"),
    volumeValue: document.querySelector("#movie-volume-value"),
    fullscreen: document.querySelector("#movie-fullscreen"),
    notice: document.querySelector("#movie-notice")
  };

  const categories = movieCategories.map((category) => ({
    id: String(category.id),
    label: String(category.label),
    movies: (category.movies || []).filter((movie) => typeof movie?.src === "string" && movie.src.trim())
  }));

  let categoryIndex = -1;
  let movieIndex = -1;
  let playMode = "sequential";
  const thumbnailCache = new WeakMap();

  function currentCategory() {
    return categories[categoryIndex];
  }

  function currentMovies() {
    return currentCategory()?.movies || [];
  }

  function movieTitle(movie) {
    return typeof movie?.title === "string" && movie.title.trim() ? movie.title.trim() : "No Title";
  }

  function movieThumbnail(movie) {
    return typeof movie?.poster === "string" && movie.poster.trim()
      ? movie.poster.trim()
      : thumbnailCache.get(movie) || "";
  }

  function formatTime(seconds) {
    if (!Number.isFinite(seconds) || seconds < 0) return "00:00";
    const whole = Math.floor(seconds);
    const minutes = Math.floor(whole / 60);
    const secondsPart = String(whole % 60).padStart(2, "0");
    if (minutes < 60) return `${String(minutes).padStart(2, "0")}:${secondsPart}`;
    return `${String(Math.floor(minutes / 60)).padStart(2, "0")}:${String(minutes % 60).padStart(2, "0")}:${secondsPart}`;
  }

  function createEmptyMessage(message) {
    const note = document.createElement("p");
    note.className = "movie-library__empty";
    note.textContent = message;
    return note;
  }

  function createLibraryButton(number, label, pressed, onClick, ariaLabel) {
    const button = document.createElement("button");
    const index = document.createElement("span");
    const name = document.createElement("span");

    button.type = "button";
    button.setAttribute("aria-pressed", String(pressed));
    button.setAttribute("aria-label", ariaLabel || label);
    index.className = "movie-library__index";
    index.textContent = String(number).padStart(2, "0");
    name.textContent = label;
    button.append(index, name);
    button.addEventListener("click", onClick);
    return button;
  }

  function renderCategories() {
    elements.categories.replaceChildren();
    if (!categories.length) {
      elements.categories.append(createEmptyMessage("NO CATEGORIES"));
      return;
    }

    categories.forEach((category, index) => {
      elements.categories.append(createLibraryButton(
        index + 1,
        category.label,
        index === categoryIndex,
        () => selectCategory(index),
        `分類 ${category.label}`
      ));
    });
  }

  function renderFilms() {
    elements.films.replaceChildren();
    const movies = currentMovies();
    if (!movies.length) {
      elements.films.append(createEmptyMessage("NO MOVIES IN THIS CATEGORY"));
      return;
    }

    movies.forEach((movie, index) => {
      const button = document.createElement("button");
      const thumbnail = document.createElement("span");
      const copy = document.createElement("span");
      const number = document.createElement("span");
      const title = document.createElement("span");

      button.type = "button";
      button.className = "movie-library__film";
      button.setAttribute("aria-pressed", String(index === movieIndex));
      button.setAttribute("aria-label", `動画 ${index + 1}: ${movieTitle(movie)}を選択して再生`);
      thumbnail.className = "movie-library__thumb";
      copy.className = "movie-library__film-copy";
      number.className = "movie-library__film-number";
      title.className = "movie-library__film-title";
      number.textContent = `${String(index + 1).padStart(2, "0")} / FILM`;
      title.textContent = movieTitle(movie);
      copy.append(number, title);
      button.append(thumbnail, copy);
      setThumbnail(thumbnail, movieThumbnail(movie));
      button.addEventListener("click", () => selectMovie(index, true));
      elements.films.append(button);
    });
  }

  function setThumbnail(container, src) {
    container.replaceChildren();
    if (!src) return;

    const image = document.createElement("img");
    image.src = src;
    image.alt = "";
    image.loading = "lazy";
    image.decoding = "async";
    image.addEventListener("error", () => image.remove(), { once: true });
    container.append(image);
  }

  function captureCurrentThumbnail() {
    const movie = currentMovies()[movieIndex];
    const video = elements.video;
    if (!movie || movie.poster || thumbnailCache.has(movie) || !video.videoWidth || !video.videoHeight) return;

    try {
      const canvas = document.createElement("canvas");
      const scale = Math.min(1, 320 / video.videoWidth, 180 / video.videoHeight);
      canvas.width = Math.max(1, Math.round(video.videoWidth * scale));
      canvas.height = Math.max(1, Math.round(video.videoHeight * scale));
      canvas.getContext("2d").drawImage(video, 0, 0, canvas.width, canvas.height);
      const thumbnail = canvas.toDataURL("image/webp", 0.8);
      thumbnailCache.set(movie, thumbnail);
      video.poster = thumbnail;
      const button = elements.films.querySelectorAll("button")[movieIndex];
      const container = button?.querySelector(".movie-library__thumb");
      if (container) setThumbnail(container, thumbnail);
    } catch {
      // 動画の提供元がCanvas描画を許可しない場合も再生は継続します。
    }
  }

  function updateFilmSelection() {
    elements.films.querySelectorAll("button").forEach((button, index) => {
      button.setAttribute("aria-pressed", String(index === movieIndex));
    });
  }

  function updateControls() {
    const count = currentMovies().length;
    const available = movieIndex >= 0 && movieIndex < count;
    elements.play.disabled = !available;
    elements.progress.disabled = !available;
    elements.fullscreen.disabled = !available;
    elements.previous.disabled = count < 2;
    elements.next.disabled = count < 2;
    elements.mode.disabled = count < 2;
  }

  function updatePath() {
    elements.path.textContent = currentCategory()?.label || "VISUAL ARCHIVE";
    const count = currentMovies().length;
    elements.index.textContent = `${String(Math.max(0, movieIndex + 1)).padStart(2, "0")} / ${String(count).padStart(2, "0")}`;
  }

  function setNotice(message) {
    elements.notice.textContent = message;
  }

  function resetTimeline() {
    elements.progress.value = "0";
    elements.currentTime.textContent = "00:00";
    elements.duration.textContent = "00:00";
    elements.progress.setAttribute("aria-valuetext", "00:00 / 00:00");
  }

  function resetVideo() {
    elements.video.pause();
    elements.video.removeAttribute("src");
    elements.video.removeAttribute("poster");
    elements.video.load();
    elements.video.hidden = true;
    elements.caption.hidden = true;
    elements.play.textContent = "PLAY";
    elements.play.setAttribute("aria-label", "再生");
    resetTimeline();
  }

  function setViewportRatio(value) {
    const match = /^(\d+)\s*\/\s*(\d+)$/.exec(String(value || ""));
    const ratio = match && Number(match[2]) ? Number(match[1]) / Number(match[2]) : 16 / 9;
    elements.viewport.classList.toggle("is-portrait", ratio < 0.8);
  }

  function selectMovie(index, shouldPlay = false) {
    const movies = currentMovies();
    if (index < 0 || index >= movies.length) return;

    resetVideo();
    movieIndex = index;
    const movie = movies[index];
    setViewportRatio(movie.ratio);
    elements.video.src = movie.src.trim();
    const thumbnail = movieThumbnail(movie);
    if (thumbnail) elements.video.poster = thumbnail;
    elements.video.setAttribute("aria-label", `映像: ${movieTitle(movie)}`);
    elements.title.textContent = movieTitle(movie);
    elements.caption.hidden = false;
    elements.video.hidden = false;
    elements.placeholder.hidden = true;
    elements.video.load();
    elements.state.textContent = "READY";
    setNotice("READY TO PLAY");
    updatePath();
    updateFilmSelection();
    updateControls();
    if (shouldPlay) playCurrent();
  }

  function selectCategory(index) {
    if (index < 0 || index >= categories.length) return;
    resetVideo();
    categoryIndex = index;
    movieIndex = -1;
    renderCategories();
    renderFilms();

    if (currentMovies().length) {
      selectMovie(0);
    } else {
      elements.placeholder.hidden = false;
      elements.placeholderMessage.textContent = "NO MOVIE REGISTERED";
      elements.viewport.classList.remove("is-portrait");
      elements.state.textContent = "STANDBY";
      setNotice("ADD MOVIES TO START");
      updatePath();
      updateControls();
    }
  }

  async function playCurrent() {
    if (movieIndex < 0) return;
    try {
      await elements.video.play();
    } catch {
      setNotice("PLAYBACK REQUIRES USER ACTION");
    }
  }

  function nextIndex() {
    const count = currentMovies().length;
    if (count < 2) return movieIndex;
    if (playMode === "sequential") return (movieIndex + 1) % count;
    let next = movieIndex;
    while (next === movieIndex) next = Math.floor(Math.random() * count);
    return next;
  }

  function updateTimeline() {
    const duration = Number.isFinite(elements.video.duration) ? elements.video.duration : 0;
    const current = Number.isFinite(elements.video.currentTime) ? elements.video.currentTime : 0;
    elements.progress.value = duration ? String(Math.round((current / duration) * 1000)) : "0";
    elements.currentTime.textContent = formatTime(current);
    elements.duration.textContent = formatTime(duration);
    elements.progress.setAttribute("aria-valuetext", `${formatTime(current)} / ${formatTime(duration)}`);
  }

  async function enterFullscreen() {
    if (movieIndex < 0) return;
    try {
      if (document.fullscreenElement) {
        await document.exitFullscreen();
      } else if (elements.viewport.requestFullscreen) {
        await elements.viewport.requestFullscreen();
      } else if (elements.video.webkitEnterFullscreen) {
        elements.video.webkitEnterFullscreen();
      }
    } catch {
      setNotice("FULLSCREEN UNAVAILABLE");
    }
  }

  elements.video.addEventListener("play", () => {
    elements.play.textContent = "PAUSE";
    elements.play.setAttribute("aria-label", "一時停止");
    elements.state.textContent = "PLAYING";
    setNotice("VIDEO PLAYBACK");
  });

  elements.video.addEventListener("pause", () => {
    if (movieIndex < 0 || elements.video.ended) return;
    elements.play.textContent = "PLAY";
    elements.play.setAttribute("aria-label", "再生");
    elements.state.textContent = "PAUSED";
  });

  elements.video.addEventListener("loadedmetadata", () => {
    if (elements.video.videoWidth && elements.video.videoHeight) {
      setViewportRatio(`${elements.video.videoWidth} / ${elements.video.videoHeight}`);
    }
    updateTimeline();
  });

  elements.video.addEventListener("loadeddata", captureCurrentThumbnail);

  elements.video.addEventListener("timeupdate", updateTimeline);
  elements.video.addEventListener("durationchange", updateTimeline);
  elements.video.addEventListener("error", () => {
    if (movieIndex < 0) return;
    elements.video.hidden = true;
    elements.placeholder.hidden = false;
    elements.placeholderMessage.textContent = "VIDEO UNAVAILABLE";
    elements.state.textContent = "ERROR";
    setNotice("CHECK VIDEO FILE");
  });

  elements.video.addEventListener("ended", () => {
    if (currentMovies().length > 1) {
      selectMovie(nextIndex(), true);
    } else {
      elements.play.textContent = "PLAY";
      elements.play.setAttribute("aria-label", "再生");
      elements.state.textContent = "ENDED";
    }
  });

  elements.play.addEventListener("click", () => {
    if (elements.video.paused) playCurrent();
    else elements.video.pause();
  });

  elements.previous.addEventListener("click", () => {
    const count = currentMovies().length;
    if (count > 1) selectMovie((movieIndex - 1 + count) % count, true);
  });

  elements.next.addEventListener("click", () => {
    if (currentMovies().length > 1) selectMovie(nextIndex(), true);
  });

  elements.mode.addEventListener("click", () => {
    playMode = playMode === "sequential" ? "random" : "sequential";
    const random = playMode === "random";
    elements.mode.textContent = random ? "RANDOM" : "SEQUENTIAL";
    elements.mode.setAttribute("aria-pressed", String(random));
    setNotice(random ? "RANDOM PLAY" : "SEQUENTIAL PLAY");
  });

  elements.progress.addEventListener("input", () => {
    if (!Number.isFinite(elements.video.duration)) return;
    elements.video.currentTime = (Number(elements.progress.value) / 1000) * elements.video.duration;
  });

  elements.volume.addEventListener("input", () => {
    const value = Number(elements.volume.value);
    elements.video.volume = value / 100;
    elements.volumeValue.value = String(value);
    elements.volumeValue.textContent = String(value);
  });

  elements.fullscreen.addEventListener("click", enterFullscreen);

  elements.video.volume = Number(elements.volume.value) / 100;
  const total = categories.reduce((count, category) => count + category.movies.length, 0);
  elements.categoryCount.textContent = `${String(categories.length).padStart(2, "0")} CATEGORIES`;
  elements.count.textContent = `${String(total).padStart(3, "0")} FILMS`;

  if (categories.length) {
    selectCategory(0);
  } else {
    renderCategories();
    renderFilms();
    updateControls();
  }
})();
