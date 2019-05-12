
-- Paste-Jacking Prevention
hs.hotkey.bind(
    {"cmd", "shift"},
    "V",
    function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end
    )

