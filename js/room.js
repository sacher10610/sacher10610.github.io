(() => {
  "use strict";

  const KEEP_ROOM_STATE_DURING_SESSION = false;
  const FALLBACK_ROOM_SRC = "/assets/images/room-main.webp";
  const SESSION_STORAGE_KEY = "sacher10610:room-state";
  const FORCE_STATE_QUERY_PARAMETER = "room";

  // Optional hotspot overrides use: { illustration: { x, y, width, height, line } }
  // Weights are relative and do not need to total 100.
  const roomStates = [
    {
      id: "game",
      weight: 25,
      enabled: true,
      src: "/assets/images/room-game.webp",
      hotspots: {}
    },
    {
      id: "bookshelf",
      weight: 15,
      enabled: true,
      src: "/assets/images/room-bookshelf.webp",
      hotspots: {
        characters: { x: "47.5%", y: "11%", width: "8%", height: "13%" }
      }
    },
    {
      id: "phone",
      weight: 15,
      enabled: true,
      src: "/assets/images/room-phone.webp",
      hotspots: {}
    },
    {
      id: "drink",
      weight: 10,
      enabled: true,
      src: "/assets/images/room-drink.webp",
      hotspots: {}
    },
    {
      id: "plush",
      weight: 10,
      enabled: true,
      src: "/assets/images/room-plush.webp",
      hotspots: {
        characters: { x: "42%", y: "25%", width: "11%", height: "16%" }
      }
    },
    {
      id: "sleep",
      weight: 10,
      enabled: true,
      src: "/assets/images/room-sleep.webp",
      hotspots: {}
    },
    {
      id: "vr",
      weight: 15,
      enabled: true,
      src: "/assets/images/room-vr.webp",
      hotspots: {
        characters: { x: "47.5%", y: "11%", width: "8%", height: "13%" }
      }
    }
  ];

  function getEligibleStates() {
    return roomStates.filter((state) => {
      return state.enabled !== false
        && Number.isFinite(state.weight)
        && state.weight > 0
        && typeof state.src === "string"
        && state.src.length > 0;
    });
  }

  function chooseWeightedState(states) {
    const totalWeight = states.reduce((total, state) => total + state.weight, 0);
    let cursor = Math.random() * totalWeight;

    for (const state of states) {
      cursor -= state.weight;
      if (cursor < 0) return state;
    }

    return states.at(-1);
  }

  function readForcedState(states) {
    const requestedId = new URLSearchParams(window.location.search)
      .get(FORCE_STATE_QUERY_PARAMETER)
      ?.trim()
      .toLowerCase();

    if (!requestedId) return null;
    return states.find((state) => state.id === requestedId) ?? null;
  }

  function readSessionState(states) {
    if (!KEEP_ROOM_STATE_DURING_SESSION) return null;

    try {
      const savedId = sessionStorage.getItem(SESSION_STORAGE_KEY);
      return states.find((state) => state.id === savedId) ?? null;
    } catch {
      return null;
    }
  }

  function saveSessionState(state) {
    if (!KEEP_ROOM_STATE_DURING_SESSION) return;

    try {
      sessionStorage.setItem(SESSION_STORAGE_KEY, state.id);
    } catch {
      // Random selection still works when storage is unavailable.
    }
  }

  async function sourceExists(src) {
    try {
      const response = await fetch(src, { method: "HEAD", cache: "no-store" });
      return response.ok;
    } catch {
      return false;
    }
  }

  function applyHotspotCoordinates(state) {
    const propertyMap = {
      x: "--x",
      y: "--y",
      width: "--w",
      height: "--h",
      line: "--line"
    };

    for (const [hotspotId, coordinates] of Object.entries(state.hotspots ?? {})) {
      const hotspot = document.querySelector(`[data-hotspot="${hotspotId}"]`);
      if (!hotspot || !coordinates) continue;

      for (const [name, value] of Object.entries(coordinates)) {
        const property = propertyMap[name];
        if (property && value != null) hotspot.style.setProperty(property, value);
      }
    }
  }

  function displayBackground(image, src, sourceType) {
    image.classList.remove("is-loaded");
    image.dataset.source = sourceType;

    image.addEventListener("load", () => {
      requestAnimationFrame(() => image.classList.add("is-loaded"));
    }, { once: true });

    image.addEventListener("error", () => {
      if (image.dataset.source === "selected") {
        displayBackground(image, FALLBACK_ROOM_SRC, "fallback");
      } else {
        image.dataset.source = "unavailable";
      }
    }, { once: true });

    image.src = src;
  }

  function announceRoomState(stateId, sourceType) {
    document.dispatchEvent(new CustomEvent("roomstatechange", {
      detail: { stateId, sourceType }
    }));
  }

  async function initRoomBackground() {
    const background = document.querySelector(".room__background");
    if (!background) return;

    const eligibleStates = getEligibleStates();
    if (eligibleStates.length === 0) {
      displayBackground(background, FALLBACK_ROOM_SRC, "fallback");
      announceRoomState("fallback", "fallback");
      return;
    }

    const state = readForcedState(eligibleStates)
      ?? readSessionState(eligibleStates)
      ?? chooseWeightedState(eligibleStates);

    if (!state) {
      displayBackground(background, FALLBACK_ROOM_SRC, "fallback");
      announceRoomState("fallback", "fallback");
      return;
    }

    saveSessionState(state);
    background.dataset.state = state.id;
    document.documentElement.dataset.roomState = state.id;

    const selectedSourceExists = await sourceExists(state.src);
    if (selectedSourceExists) {
      applyHotspotCoordinates(state);
      displayBackground(background, state.src, "selected");
      announceRoomState(state.id, "selected");
    } else {
      displayBackground(background, FALLBACK_ROOM_SRC, "fallback");
      announceRoomState(state.id, "fallback");
    }
  }

  initRoomBackground();
})();
