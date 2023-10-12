-- bind
hs.hotkey.bind({ "ctrl" }, "h", nil, function() hs.eventtap.keyStroke({}, "left") end)
hs.hotkey.bind({ "ctrl" }, "j", nil, function() hs.eventtap.keyStroke({}, "down") end)
hs.hotkey.bind({ "ctrl" }, "k", nil, function() hs.eventtap.keyStroke({}, "up") end)
hs.hotkey.bind({ "ctrl" }, "l", nil, function() hs.eventtap.keyStroke({}, "right") end)

-- open applications
function openApp(appName)
    return function()
        hs.application.launchOrFocus(appName)
    end
end

-- open applications
-- Activity Monitor
hs.hotkey.bind({ "cmd", "shift" }, "escape", openApp("Activity Monitor"))

-- Lanuchpad
hs.hotkey.bind({}, "ctrl", openApp("Launchpad"))

-- new Finder Window
hs.hotkey.bind({ "ctrl" }, "e", openApp("Finder"))

-- System Settings
hs.hotkey.bind({ "ctrl" }, "i", openApp("System Preferences"))

-- shortcuts
-- redo
hs.hotkey.bind({ "cmd" }, "y", nil, function() hs.eventtap.keyStroke({ "cmd", "shift" }, "z") end)

-- quit
hs.hotkey.bind({ "option" }, "f4", nil, function() hs.eventtap.keyStroke({ "cmd" }, "q") end)

-- curor move
-- ctrl + left (move to begin of the word)
hs.hotkey.bind({ "cmd" }, "left", nil, function() hs.eventtap.keyStroke({ "option" }, "left") end)

-- ctrl + shift + left (move to begin of the word with selection)
hs.hotkey.bind({ "cmd", "shift" }, "left", nil, function() hs.eventtap.keyStroke({ "option", "shift" }, "left") end)

-- ctrl + right (move to end of the word)
hs.hotkey.bind({ "cmd" }, "right", nil, function() hs.eventtap.keyStroke({ "option" }, "right") end)

-- ctrl + shift + right (move to end of the word with selection)
hs.hotkey.bind({ "cmd", "shift" }, "right", nil, function() hs.eventtap.keyStroke({ "option", "shift" }, "right") end)

-- work in specific app
local function disableAll(keySet)
    for k, v in pairs(keySet) do v:disable() end
end

local function enableAll(keySet)
    for k, v in pairs(keySet) do v:enable() end
end

--only work in FInder
local finderBinding = {
    -- open file (cmd + return)
    hs.hotkey.bind({ "cmd" }, "return", nil, function() hs.eventtap.keyStroke({ "cmd" }, "o") end),

    -- rename (f2)
    hs.hotkey.bind({}, "f2", nil, function() hs.eventtap.keyStroke({}, "return") end),

    -- move to folder includes current directory (alt + up)
    hs.hotkey.bind({ "option" }, "up", nil, function() hs.eventtap.keyStroke({ "cmd" }, "up") end)
}

hs.window.filter.new('Finder')
    :subscribe(hs.window.filter.windowFocused, function() enableAll(finderBinding) end)
    :subscribe(hs.window.filter.windowUnfocused, function() disableAll(finderBinding) end)

--only work in Safari
local safariBinding = {
    -- show source(f12)
    hs.hotkey.bind({}, "f12", nil, function() hs.eventtap.keyStroke({ "option", "cmd" }, "u") end)
}

hs.window.filter.new('Safari')
    :subscribe(hs.window.filter.windowFocused, function() enableAll(safariBinding) end)
    :subscribe(hs.window.filter.windowUnfocused, function() disableAll(safariBinding) end)
