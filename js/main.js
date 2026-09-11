(() => {
  "use strict";

  const room = document.querySelector(".room");
  const hotspots = [...document.querySelectorAll(".hotspot")];
  const canHover = window.matchMedia("(hover: hover) and (pointer: fine)");
  const debugMode = new URLSearchParams(window.location.search).get("debug") === "1";

  if (!room || hotspots.length === 0) return;

  let pointer = { x: -1000, y: -1000 };
  let frame = 0;

  function syncActiveState() {
    const active = hotspots.some((hotspot) => {
      return hotspot.classList.contains("is-near")
        || hotspot.matches(":hover")
        || hotspot === document.activeElement;
    });

    document.body.classList.toggle("is-hotspot-active", active);
  }

  function setNearestHotspot(nearest) {
    for (const hotspot of hotspots) {
      hotspot.classList.toggle("is-near", hotspot === nearest);
    }
    syncActiveState();
  }

  function updateNearestHotspot() {
    frame = 0;
    let nearest = null;
    let nearestDistance = 112;

    for (const hotspot of hotspots) {
      const rect = hotspot.getBoundingClientRect();
      const edgeX = Math.max(rect.left - pointer.x, 0, pointer.x - rect.right);
      const edgeY = Math.max(rect.top - pointer.y, 0, pointer.y - rect.bottom);
      const distance = Math.hypot(edgeX, edgeY);

      if (distance < nearestDistance) {
        nearest = hotspot;
        nearestDistance = distance;
      }
    }

    setNearestHotspot(nearest);
  }

  function coordinateValue(hotspot, property) {
    return hotspot.style.getPropertyValue(property).trim() || "—";
  }

  function refreshDebugLabels() {
    if (!debugMode) return;

    for (const hotspot of hotspots) {
      let label = hotspot.querySelector(".hotspot__debug");
      if (!label) {
        label = document.createElement("span");
        label.className = "hotspot__debug";
        label.setAttribute("aria-hidden", "true");
        hotspot.append(label);
      }

      const name = hotspot.dataset.hotspot?.toUpperCase() ?? "HOTSPOT";
      const x = coordinateValue(hotspot, "--x");
      const y = coordinateValue(hotspot, "--y");
      const width = coordinateValue(hotspot, "--w");
      const height = coordinateValue(hotspot, "--h");
      label.textContent = `${name}  x:${x}  y:${y}  w:${width}  h:${height}`;
    }
  }

  if (debugMode) {
    document.documentElement.classList.add("is-hotspot-debug");
    refreshDebugLabels();
    document.addEventListener("roomstatechange", refreshDebugLabels);
  }

  if (canHover.matches) {
    room.addEventListener("pointermove", (event) => {
      if (event.pointerType && event.pointerType !== "mouse") return;
      pointer = { x: event.clientX, y: event.clientY };
      if (!frame) frame = requestAnimationFrame(updateNearestHotspot);
    });

    room.addEventListener("pointerleave", () => setNearestHotspot(null));
  }

  for (const hotspot of hotspots) {
    hotspot.addEventListener("focus", syncActiveState);
    hotspot.addEventListener("blur", () => requestAnimationFrame(syncActiveState));

    hotspot.addEventListener("keydown", (event) => {
      if (event.key === " " || event.key === "Spacebar") {
        event.preventDefault();
        hotspot.click();
      }
    });
  }

  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape" && document.activeElement instanceof HTMLElement) {
      document.activeElement.blur();
      setNearestHotspot(null);
    }
  });
})();
