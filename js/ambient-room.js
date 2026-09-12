(() => {
  "use strict";

  const SESSION_STORAGE_KEY = "sacher10610:ambient-room";
  const FALLBACK_ROOM_SRC = "/assets/images/room-main.webp";
  const ROOM_SOURCE_PATTERN = /^\/assets\/images\/room-[a-z0-9-]+\.webp$/i;

  function normaliseSource(value) {
    if (typeof value !== "string" || !value.trim()) return FALLBACK_ROOM_SRC;

    try {
      const url = new URL(value, window.location.origin);
      if (url.origin !== window.location.origin) return FALLBACK_ROOM_SRC;
      return ROOM_SOURCE_PATTERN.test(url.pathname) ? url.pathname : FALLBACK_ROOM_SRC;
    } catch {
      return FALLBACK_ROOM_SRC;
    }
  }

  function readAmbientRoom() {
    try {
      const saved = JSON.parse(sessionStorage.getItem(SESSION_STORAGE_KEY) || "null");
      return {
        stateId: typeof saved?.stateId === "string" ? saved.stateId : "fallback",
        src: normaliseSource(saved?.src)
      };
    } catch {
      return { stateId: "fallback", src: FALLBACK_ROOM_SRC };
    }
  }

  function initAmbientRoom() {
    const selectedRoom = readAmbientRoom();
    const layer = document.createElement("div");
    const image = document.createElement("img");

    layer.className = "ambient-room";
    layer.dataset.roomState = selectedRoom.stateId;
    layer.setAttribute("aria-hidden", "true");

    image.className = "ambient-room__image";
    image.alt = "";
    image.width = 1920;
    image.height = 1080;
    image.decoding = "async";
    image.fetchPriority = "low";

    image.addEventListener("load", () => {
      requestAnimationFrame(() => image.classList.add("is-loaded"));
    }, { once: true });

    image.addEventListener("error", () => {
      if (image.src.endsWith(FALLBACK_ROOM_SRC)) return;
      image.src = FALLBACK_ROOM_SRC;
      layer.dataset.roomState = "fallback";
    });

    layer.append(image);
    document.body.prepend(layer);
    image.src = selectedRoom.src;
  }

  initAmbientRoom();
})();
