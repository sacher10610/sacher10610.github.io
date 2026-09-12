(() => {
  "use strict";

  // Add or replace works here. Only src, title, and size are required.
  // Leave src empty to use the quiet CSS layout placeholder.
  const illustrations = [
    {
      src: "/assets/illustrations/illustration-001.webp",
      title: "A Letter in Static",
      size: "large",
      ratio: "4 / 5",
      year: "2026",
      category: "CHARACTER",
      description: ""
    },
    {
      src: "/assets/illustrations/illustration-002.webp",
      title: "The Apple Key",
      size: "medium",
      ratio: "4 / 5",
      year: "2026",
      category: "FANTASY",
      description: ""
    },
    {
      src: "/assets/illustrations/illustration-003.webp",
      title: "Lunar Descent",
      size: "large",
      ratio: "4 / 5",
      year: "2026",
      category: "GEOMETRY",
      description: ""
    },
    {
      src: "/assets/illustrations/illustration-004.webp",
      title: "Eclair Orbit",
      size: "medium",
      ratio: "4 / 5",
      year: "2026",
      category: "FANTASY",
      description: ""
    },
    {
      src: "/assets/illustrations/illustration-005.webp",
      title: "Still Water Reverie",
      size: "small",
      ratio: "4 / 5",
      year: "2026",
      category: "GEOMETRY",
      description: ""
    },
    {
      src: "/assets/illustrations/illustration-006.webp",
      title: "Afterglow by the Lake",
      size: "medium",
      ratio: "4 / 5",
      year: "2026",
      category: "FANTASY",
      description: ""
    },
    {
      src: "/assets/illustrations/illustration-007.webp",
      title: "Alice in the Kingdom of Holograms",
      size: "large",
      ratio: "4 / 5",
      year: "2026",
      category: "FANTASY",
      description: ""
    },
    {
      src: "/assets/illustrations/illustration-008.webp",
      title: "Tea Beyond the Looking Glass",
      alt: "白と青のドレスを着た少女が城を望むティールームで伏せている",
      size: "large",
      ratio: "1122 / 1402",
      year: "2026",
      category: "FANTASY",
      description: ""
    },
    {
      src: "/assets/illustrations/illustration-009.webp",
      title: "Evening Courier",
      alt: "雨の石畳の路地で翼のある少女が洗濯籠を抱えて振り返る",
      size: "medium",
      ratio: "2151 / 2688",
      year: "2026",
      category: "FANTASY",
      description: ""
    },
    {
      src: "/assets/illustrations/illustration-010.webp",
      title: "Clockwork Nocturne",
      alt: "青く発光する時計都市を背にしたスチームパンク衣装の少女",
      size: "large",
      ratio: "1122 / 1402",
      year: "2026",
      category: "FANTASY",
      description: ""
    },
    {
      src: "/assets/illustrations/illustration-011.webp",
      title: "Mending the Rain",
      alt: "雨の街を望む窓辺で翼のある少女が布を縫っている",
      size: "medium",
      ratio: "1122 / 1402",
      year: "2026",
      category: "CHARACTER",
      description: ""
    },
    {
      src: "/assets/illustrations/illustration-012.webp",
      title: "Above the Chimney Sea",
      alt: "煙突の街を見下ろす屋上に翼のある少女が立つ",
      size: "large",
      ratio: "1122 / 1402",
      year: "2026",
      category: "FANTASY",
      description: ""
    },
    {
      src: "/assets/illustrations/illustration-013.webp",
      title: "Tea Between Chapters",
      alt: "光の差す図書カフェで読書する少女と給仕するメイド",
      size: "medium",
      ratio: "1122 / 1402",
      year: "2026",
      category: "CHARACTER",
      description: ""
    },
    {
      src: "/assets/illustrations/illustration-014.webp",
      title: "Sovereign",
      alt: "濃紺とオフホワイトで構成された少女のSOVEREIGNポスター",
      size: "small",
      ratio: "1122 / 1402",
      year: "2026",
      category: "POSTER",
      description: ""
    },
    {
      src: "/assets/illustrations/illustration-015.webp",
      title: "The Architecture of Forgotten Light",
      alt: "蔦に覆われた幾何学的な遺跡を少女と小さな妖精が歩く",
      size: "large",
      ratio: "1122 / 1402",
      year: "2026",
      category: "GEOMETRY",
      description: ""
    },
    {
      src: "/assets/illustrations/illustration-016.webp",
      title: "Prismatic Spellline",
      alt: "青紫の光の軌跡をまといステージを駆ける魔女",
      size: "medium",
      ratio: "1122 / 1402",
      year: "2026",
      category: "FANTASY",
      description: ""
    }
  ];

  const FEATURED_COUNT = 5;
  const FEATURED_SESSION_KEY = "sacher10610:illustration-featured";
  const featuredGallery = document.querySelector(".gallery--featured");
  const fullGallery = document.querySelector(".gallery--full");
  const featuredView = document.querySelector(".gallery-view--featured");
  const fullView = document.querySelector(".gallery-view--full");
  const viewAllButtons = [...document.querySelectorAll(".gallery-view__all")];
  const featuredButton = document.querySelector(".gallery-view__featured");
  const galleryTotals = document.querySelectorAll(".gallery-total");
  const filters = document.querySelector(".gallery-filters");
  const lightbox = document.querySelector(".lightbox");
  const lightboxMedia = document.querySelector(".lightbox__media");
  const lightboxTitle = document.querySelector("#lightbox-title");
  const lightboxDetails = document.querySelector(".lightbox__details");
  const lightboxCounter = document.querySelector(".lightbox__counter");
  const closeButton = document.querySelector(".lightbox__close");
  const previousButton = document.querySelector(".lightbox__previous");
  const nextButton = document.querySelector(".lightbox__next");
  const zoomOutButton = document.querySelector(".lightbox__zoom-out");
  const zoomInButton = document.querySelector(".lightbox__zoom-in");
  const zoomResetButton = document.querySelector(".lightbox__zoom-reset");
  const zoomLevel = document.querySelector(".lightbox__zoom-level");
  const lightboxStage = document.querySelector(".lightbox__stage");
  const allowedSizes = new Set(["large", "medium", "small"]);
  const MIN_ZOOM = 1;
  const MAX_ZOOM = 4;
  const BUTTON_ZOOM_STEP = 0.25;

  if (
    !featuredGallery || !fullGallery || !featuredView || !fullView
    || viewAllButtons.length === 0 || !featuredButton || !filters
    || !lightbox || !lightboxMedia || !lightboxStage
    || !zoomOutButton || !zoomInButton || !zoomResetButton || !zoomLevel
  ) return;

  let activeCategory = "ALL";
  let currentLightboxScope = "featured";
  let currentIllustrationIndex = 0;
  let lastFocusedElement = null;
  let lastViewAllButton = viewAllButtons[0];
  let fullGalleryRendered = false;
  let zoomScale = MIN_ZOOM;
  let panX = 0;
  let panY = 0;
  let gesture = null;
  const activePointers = new Map();

  function normaliseWork(work) {
    return {
      ...work,
      src: typeof work.src === "string" ? work.src.trim() : "",
      title: typeof work.title === "string" && work.title.trim()
        ? work.title.trim()
        : "UNTITLED",
      size: allowedSizes.has(work.size) ? work.size : "medium",
      ratio: typeof work.ratio === "string" && work.ratio.trim()
        ? work.ratio.trim()
        : "4 / 5"
    };
  }

  const works = illustrations.map(normaliseWork);

  function workKey(work, index) {
    return work.src || `${work.title}::${index}`;
  }

  function shuffledIndexes(indexes) {
    const shuffled = [...indexes];

    for (let index = shuffled.length - 1; index > 0; index -= 1) {
      const swapIndex = Math.floor(Math.random() * (index + 1));
      [shuffled[index], shuffled[swapIndex]] = [shuffled[swapIndex], shuffled[index]];
    }

    return shuffled;
  }

  function saveFeaturedIndexes(indexes) {
    try {
      const keys = indexes.map((index) => workKey(works[index], index));
      sessionStorage.setItem(FEATURED_SESSION_KEY, JSON.stringify(keys));
    } catch {
      // A fresh random selection is still available when storage is disabled.
    }
  }

  function chooseFeaturedIndexes() {
    const targetCount = Math.min(FEATURED_COUNT, works.length);
    if (targetCount === 0) return [];
    if (works.length <= FEATURED_COUNT) return works.map((_, index) => index);

    const indexesByKey = new Map(
      works.map((work, index) => [workKey(work, index), index])
    );
    let savedIndexes = [];

    try {
      const savedKeys = JSON.parse(sessionStorage.getItem(FEATURED_SESSION_KEY) || "[]");
      if (Array.isArray(savedKeys)) {
        savedIndexes = savedKeys
          .map((key) => indexesByKey.get(key))
          .filter((index) => Number.isInteger(index));
        savedIndexes = [...new Set(savedIndexes)].slice(0, targetCount);
      }
    } catch {
      savedIndexes = [];
    }

    const selected = new Set(savedIndexes);
    const remaining = works
      .map((_, index) => index)
      .filter((index) => !selected.has(index));
    const featuredIndexes = [
      ...savedIndexes,
      ...shuffledIndexes(remaining).slice(0, targetCount - savedIndexes.length)
    ];

    saveFeaturedIndexes(featuredIndexes);
    return featuredIndexes;
  }

  const featuredIndexes = chooseFeaturedIndexes();

  function createPlaceholder(index, title, ratio = "4 / 5") {
    const placeholder = document.createElement("div");
    placeholder.className = "work__placeholder";
    placeholder.dataset.sample = String((index % 6) + 1);
    placeholder.style.setProperty("--ratio", ratio);
    placeholder.setAttribute("role", "img");
    placeholder.setAttribute("aria-label", `${title} レイアウト確認用プレースホルダー`);
    placeholder.append(document.createElement("span"));
    placeholder.append(document.createElement("span"));
    placeholder.append(document.createElement("span"));
    return placeholder;
  }

  function createImage(work, priorityIndex, onError) {
    const image = document.createElement("img");
    image.className = "work__image";
    image.src = work.src;
    image.alt = work.alt || work.title;
    image.decoding = "async";
    image.loading = priorityIndex < 2 ? "eager" : "lazy";
    image.fetchPriority = priorityIndex === 0 ? "high" : "auto";
    image.addEventListener("error", onError, { once: true });
    return image;
  }

  function workDetails(work) {
    return [work.category, work.year].filter(Boolean).join(" / ");
  }

  function createWork(work, index, options = {}) {
    const { scope = "featured", displayIndex = index, compact = false } = options;
    const article = document.createElement("article");
    article.className = `gallery__work gallery__work--${work.size}`;
    article.dataset.index = String(index);
    if (work.category) article.dataset.category = work.category;

    const trigger = document.createElement("button");
    trigger.className = "work__trigger";
    trigger.type = "button";
    trigger.setAttribute("aria-label", `${work.title}を拡大表示`);

    const media = document.createElement("div");
    media.className = "work__media";
    media.style.setProperty("--ratio", work.ratio);

    const placeholder = createPlaceholder(index, work.title, work.ratio);
    if (work.src) {
      placeholder.hidden = true;
      const priorityIndex = scope === "featured" ? displayIndex : Number.MAX_SAFE_INTEGER;
      const image = createImage(work, priorityIndex, () => {
        image.hidden = true;
        placeholder.hidden = false;
      });
      media.append(image, placeholder);
    } else {
      media.append(placeholder);
    }

    const caption = document.createElement("div");
    caption.className = "work__caption";

    const title = document.createElement("h2");
    title.className = "work__title";
    title.textContent = work.title;
    caption.append(title);

    const detailsText = workDetails(work);
    if (detailsText && !compact) {
      const details = document.createElement("p");
      details.className = "work__details";
      details.textContent = detailsText;
      caption.append(details);
    }

    trigger.append(media);
    article.append(trigger, caption);

    if (work.description && !compact) {
      const description = document.createElement("p");
      description.className = "work__description";
      description.textContent = work.description;
      article.append(description);
    }

    trigger.addEventListener("click", () => openLightbox(index, trigger, scope));
    return article;
  }

  function renderFeaturedGallery() {
    const fragment = document.createDocumentFragment();
    featuredIndexes.forEach((index, displayIndex) => {
      fragment.append(createWork(works[index], index, { scope: "featured", displayIndex }));
    });
    featuredGallery.replaceChildren(fragment);
  }

  function renderFullGallery() {
    if (fullGalleryRendered) return;

    const fragment = document.createDocumentFragment();
    works.forEach((work, index) => {
      fragment.append(createWork(work, index, { scope: "full", compact: true }));
    });
    fullGallery.replaceChildren(fragment);
    fullGalleryRendered = true;
  }

  function categoryNames() {
    return [...new Set(works.map((work) => work.category).filter(Boolean))];
  }

  function applyCategory(category) {
    activeCategory = category;

    for (const workElement of fullGallery.querySelectorAll(".gallery__work")) {
      workElement.hidden = category !== "ALL"
        && workElement.dataset.category !== category;
    }

    for (const filter of filters.querySelectorAll(".gallery-filter")) {
      filter.setAttribute("aria-pressed", String(filter.dataset.category === category));
    }
  }

  function renderFilters() {
    filters.replaceChildren();
    const categories = categoryNames();
    if (categories.length < 2) return;

    for (const category of ["ALL", ...categories]) {
      const button = document.createElement("button");
      button.className = "gallery-filter";
      button.type = "button";
      button.dataset.category = category;
      button.textContent = category;
      button.setAttribute("aria-pressed", String(category === "ALL"));
      button.addEventListener("click", () => applyCategory(category));
      filters.append(button);
    }
  }

  function visibleIndexes() {
    const activeGallery = currentLightboxScope === "full" ? fullGallery : featuredGallery;
    return [...activeGallery.querySelectorAll(".gallery__work:not([hidden])")]
      .map((element) => Number(element.dataset.index));
  }

  function updateGalleryTotals() {
    const label = `${String(works.length).padStart(3, "0")} WORKS`;
    galleryTotals.forEach((element) => {
      element.textContent = label;
    });
  }

  function showFullGallery(event) {
    if (event?.currentTarget instanceof HTMLElement) {
      lastViewAllButton = event.currentTarget;
    }
    renderFullGallery();
    renderFilters();
    applyCategory("ALL");
    featuredView.hidden = true;
    fullView.hidden = false;
    fullView.scrollIntoView({ block: "start" });
    featuredButton.focus({ preventScroll: true });
  }

  function showFeaturedGallery() {
    fullView.hidden = true;
    featuredView.hidden = false;
    featuredView.scrollIntoView({ block: "start" });
    lastViewAllButton.focus({ preventScroll: true });
  }

  function clamp(value, minimum, maximum) {
    return Math.min(Math.max(value, minimum), maximum);
  }

  function clampPan() {
    if (zoomScale <= MIN_ZOOM) {
      panX = 0;
      panY = 0;
      return;
    }

    const scaledWidth = lightboxMedia.offsetWidth * zoomScale;
    const scaledHeight = lightboxMedia.offsetHeight * zoomScale;
    const maxPanX = Math.max(0, (scaledWidth - lightboxStage.clientWidth) / 2);
    const maxPanY = Math.max(0, (scaledHeight - lightboxStage.clientHeight) / 2);
    panX = clamp(panX, -maxPanX, maxPanX);
    panY = clamp(panY, -maxPanY, maxPanY);
  }

  function applyZoom(animate = true) {
    if (!animate) lightboxMedia.classList.add("is-adjusting");

    lightboxMedia.style.setProperty("--zoom-scale", zoomScale.toFixed(3));
    lightboxMedia.style.setProperty("--pan-x", `${panX.toFixed(2)}px`);
    lightboxMedia.style.setProperty("--pan-y", `${panY.toFixed(2)}px`);
    lightboxMedia.classList.toggle("is-zoomed", zoomScale > MIN_ZOOM);
    zoomLevel.textContent = `${Math.round(zoomScale * 100)}%`;
    zoomOutButton.disabled = zoomScale <= MIN_ZOOM;
    zoomInButton.disabled = zoomScale >= MAX_ZOOM;
    zoomResetButton.disabled = zoomScale <= MIN_ZOOM && panX === 0 && panY === 0;

    if (!animate) {
      requestAnimationFrame(() => lightboxMedia.classList.remove("is-adjusting"));
    }
  }

  function setZoom(nextScale, animate = true) {
    zoomScale = clamp(nextScale, MIN_ZOOM, MAX_ZOOM);
    if (zoomScale === MIN_ZOOM) {
      panX = 0;
      panY = 0;
    } else {
      clampPan();
    }
    applyZoom(animate);
  }

  function zoomBy(amount) {
    setZoom(zoomScale + amount);
  }

  function resetZoom(animate = true) {
    activePointers.clear();
    gesture = null;
    lightboxMedia.classList.remove("is-dragging", "is-gesturing");
    panX = 0;
    panY = 0;
    setZoom(MIN_ZOOM, animate);
  }

  function pointerDistance(first, second) {
    return Math.hypot(second.x - first.x, second.y - first.y);
  }

  function pointerMidpoint(first, second) {
    return {
      x: (first.x + second.x) / 2,
      y: (first.y + second.y) / 2
    };
  }

  function beginPinch() {
    const [first, second] = [...activePointers.values()];
    if (!first || !second) return;

    gesture = {
      type: "pinch",
      distance: Math.max(pointerDistance(first, second), 1),
      midpoint: pointerMidpoint(first, second),
      scale: zoomScale,
      panX,
      panY
    };
    lightboxMedia.classList.remove("is-dragging");
    lightboxMedia.classList.add("is-gesturing");
  }

  function beginDrag(pointer) {
    gesture = {
      type: "drag",
      pointerId: pointer.pointerId,
      x: pointer.x,
      y: pointer.y,
      panX,
      panY
    };
    lightboxMedia.classList.remove("is-gesturing");
    lightboxMedia.classList.add("is-dragging");
  }

  function fillLightboxMedia(work, index) {
    lightboxMedia.replaceChildren();

    if (!work.src) {
      lightboxMedia.append(createPlaceholder(index, work.title, work.ratio));
      return;
    }

    const image = document.createElement("img");
    image.src = work.src;
    image.alt = work.alt || work.title;
    image.decoding = "async";
    image.addEventListener("load", () => {
      clampPan();
      applyZoom(false);
    }, { once: true });
    image.addEventListener("error", () => {
      lightboxMedia.replaceChildren(createPlaceholder(index, work.title, work.ratio));
    }, { once: true });
    lightboxMedia.append(image);
  }

  function updateLightbox() {
    const work = works[currentIllustrationIndex];
    if (!work) return;

    const indexes = visibleIndexes();
    const position = indexes.indexOf(currentIllustrationIndex);
    fillLightboxMedia(work, currentIllustrationIndex);
    lightboxTitle.textContent = work.title;
    lightboxDetails.textContent = workDetails(work);
    lightboxCounter.textContent = `${position + 1} / ${indexes.length}`;

    const hasMultipleWorks = indexes.length > 1;
    previousButton.disabled = !hasMultipleWorks;
    nextButton.disabled = !hasMultipleWorks;
  }

  function openLightbox(index, trigger, scope = "featured") {
    currentIllustrationIndex = index;
    currentLightboxScope = scope;
    lastFocusedElement = trigger;
    resetZoom(false);
    updateLightbox();
    document.body.classList.add("is-lightbox-open");

    if (typeof lightbox.showModal === "function") {
      lightbox.showModal();
    } else {
      lightbox.setAttribute("open", "");
    }

    closeButton.focus();
  }

  function closeLightbox() {
    if (!lightbox.hasAttribute("open")) return;

    resetZoom(false);

    if (typeof lightbox.close === "function") {
      lightbox.close();
    } else {
      lightbox.removeAttribute("open");
    }

    document.body.classList.remove("is-lightbox-open");
    lastFocusedElement?.focus();
  }

  function moveLightbox(direction) {
    const indexes = visibleIndexes();
    if (indexes.length < 2) return;

    const position = indexes.indexOf(currentIllustrationIndex);
    const nextPosition = (position + direction + indexes.length) % indexes.length;
    currentIllustrationIndex = indexes[nextPosition];
    resetZoom(false);
    updateLightbox();
  }

  function trapLightboxFocus(event) {
    if (event.key !== "Tab") return;

    const focusable = [...lightbox.querySelectorAll("button:not(:disabled)")];
    if (focusable.length === 0) return;

    const first = focusable[0];
    const last = focusable.at(-1);
    if (event.shiftKey && document.activeElement === first) {
      event.preventDefault();
      last.focus();
    } else if (!event.shiftKey && document.activeElement === last) {
      event.preventDefault();
      first.focus();
    }
  }

  closeButton.addEventListener("click", closeLightbox);
  viewAllButtons.forEach((button) => button.addEventListener("click", showFullGallery));
  featuredButton.addEventListener("click", showFeaturedGallery);
  previousButton.addEventListener("click", () => moveLightbox(-1));
  nextButton.addEventListener("click", () => moveLightbox(1));
  zoomOutButton.addEventListener("click", () => zoomBy(-BUTTON_ZOOM_STEP));
  zoomInButton.addEventListener("click", () => zoomBy(BUTTON_ZOOM_STEP));
  zoomResetButton.addEventListener("click", () => resetZoom());

  lightboxMedia.addEventListener("wheel", (event) => {
    event.preventDefault();
    const amount = clamp(-event.deltaY * 0.002, -0.35, 0.35);
    zoomBy(amount);
  }, { passive: false });

  lightboxMedia.addEventListener("dblclick", (event) => {
    event.preventDefault();
    if (zoomScale >= 2) {
      resetZoom();
    } else {
      setZoom(2);
    }
  });

  lightboxMedia.addEventListener("pointerdown", (event) => {
    if (event.pointerType === "mouse" && event.button !== 0) return;

    const pointer = { pointerId: event.pointerId, x: event.clientX, y: event.clientY };
    activePointers.set(event.pointerId, pointer);
    lightboxMedia.setPointerCapture(event.pointerId);

    if (activePointers.size === 2) {
      event.preventDefault();
      beginPinch();
    } else if (zoomScale > MIN_ZOOM) {
      event.preventDefault();
      beginDrag(pointer);
    }
  });

  lightboxMedia.addEventListener("pointermove", (event) => {
    if (!activePointers.has(event.pointerId)) return;

    const pointer = { pointerId: event.pointerId, x: event.clientX, y: event.clientY };
    activePointers.set(event.pointerId, pointer);

    if (activePointers.size >= 2) {
      const [first, second] = [...activePointers.values()];
      if (gesture?.type !== "pinch") beginPinch();
      if (gesture?.type !== "pinch") return;

      const midpoint = pointerMidpoint(first, second);
      panX = gesture.panX + midpoint.x - gesture.midpoint.x;
      panY = gesture.panY + midpoint.y - gesture.midpoint.y;
      setZoom(gesture.scale * (pointerDistance(first, second) / gesture.distance), false);
      event.preventDefault();
      return;
    }

    if (gesture?.type === "drag" && gesture.pointerId === event.pointerId && zoomScale > MIN_ZOOM) {
      panX = gesture.panX + event.clientX - gesture.x;
      panY = gesture.panY + event.clientY - gesture.y;
      clampPan();
      applyZoom(false);
      event.preventDefault();
    }
  });

  function endPointer(event) {
    activePointers.delete(event.pointerId);

    if (activePointers.size === 1 && zoomScale > MIN_ZOOM) {
      const remainingPointer = [...activePointers.values()][0];
      beginDrag(remainingPointer);
    } else {
      gesture = null;
      lightboxMedia.classList.remove("is-dragging", "is-gesturing");
    }

    if (lightboxMedia.hasPointerCapture(event.pointerId)) {
      lightboxMedia.releasePointerCapture(event.pointerId);
    }
  }

  lightboxMedia.addEventListener("pointerup", endPointer);
  lightboxMedia.addEventListener("pointercancel", endPointer);

  lightbox.addEventListener("cancel", (event) => {
    event.preventDefault();
    closeLightbox();
  });

  lightbox.addEventListener("click", (event) => {
    if (!(event.target instanceof Element)) return;
    if (event.target.closest(".lightbox__media, .lightbox__footer, .lightbox__close")) return;
    closeLightbox();
  });

  lightbox.addEventListener("keydown", (event) => {
    if (event.key === "ArrowLeft") {
      event.preventDefault();
      moveLightbox(-1);
    } else if (event.key === "ArrowRight") {
      event.preventDefault();
      moveLightbox(1);
    } else if (event.key === "Escape") {
      event.preventDefault();
      closeLightbox();
    } else if (event.key === "+" || event.key === "=") {
      event.preventDefault();
      zoomBy(BUTTON_ZOOM_STEP);
    } else if (event.key === "-" || event.key === "_") {
      event.preventDefault();
      zoomBy(-BUTTON_ZOOM_STEP);
    } else if (event.key === "0") {
      event.preventDefault();
      resetZoom();
    } else {
      trapLightboxFocus(event);
    }
  });

  lightbox.addEventListener("close", () => {
    document.body.classList.remove("is-lightbox-open");
  });

  window.addEventListener("resize", () => {
    if (!lightbox.hasAttribute("open") || zoomScale <= MIN_ZOOM) return;
    clampPan();
    applyZoom(false);
  });

  renderFeaturedGallery();
  updateGalleryTotals();
  applyZoom(false);
})();
