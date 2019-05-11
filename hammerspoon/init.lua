
-- Paste-Jacking Prevention
hs.hotkey.bind(
    {"cmd", "alt"},
    "V",
    function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end
    )

