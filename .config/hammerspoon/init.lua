-- for HHKB

-- open applications
function openApp(appName)
    return function()
        hs.application.launchOrFocus(appName)
    end
end

-- open applications list
-- ctrl + shift + escape (Activity Monitor)
hs.hotkey.bind({"cmd", "shift"}, "escape", openApp("Activity Monitor"))

-- option + escape (Lanuchpad)
hs.hotkey.bind({"alt"}, "escape", openApp("Launchpad"))

-- ctrl + up (Mission Control)
hs.hotkey.bind({"ctrl"}, "up", openApp("Mission Control"))

-- ctrl + shift + t (Text Editor)
hs.hotkey.bind({"cmd", "shift"}, "t", openApp("CotEditor"))

-- ctrl + e (new Finder Window)
hs.hotkey.bind({"ctrl"}, "e", openApp("Finder"))

-- ctrl + c (iTerm)
hs.hotkey.bind({"ctrl"}, "c", openApp("iTerm"))

-- ctrl + i (System Settings)
hs.hotkey.bind({"ctrl"}, "i", openApp("System Preferences"))

-- ctrl + i (System Settings)
hs.hotkey.bind({"ctrl"}, "p", openApp("MemoryPurge"))





-- shortcuts
-- ctrl + y (redo)
hs.hotkey.bind({"cmd"}, "y", nil, function() hs.eventtap.keyStroke({"cmd", "shift"}, "z") end)

-- alt + f4 (quit)
hs.hotkey.bind({"option"}, "f4", nil, function() hs.eventtap.keyStroke({"cmd"}, "q") end)





-- curor move
-- ctrl + left (move to begin of the word)
hs.hotkey.bind({"cmd"}, "left", nil, function() hs.eventtap.keyStroke({"option"}, "left") end)

-- ctrl + shift + left (move to begin of the word with selection)
hs.hotkey.bind({"cmd", "shift"}, "left", nil, function() hs.eventtap.keyStroke({"option", "shift"}, "left") end)

-- ctrl + right (move to end of the word)
hs.hotkey.bind({"cmd"}, "right", nil, function() hs.eventtap.keyStroke({"option"}, "right") end)

-- ctrl + shift + right (move to end of the word with selection)
hs.hotkey.bind({"cmd", "shift"}, "right", nil, function() hs.eventtap.keyStroke({"option", "shift"}, "right") end)
 




--move window
-- cmd + alt + left (move window to left)
hs.hotkey.bind({"ctrl", "option"}, "left",  function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h

    win:setFrame(f)
end)

-- cmd + alt + right (move window to right)
hs.hotkey.bind({"ctrl", "option"}, "right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h

    win:setFrame(f)
end)

-- cmd + alt + up (maximize window)
hs.hotkey.bind({"ctrl", "option"}, "up", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h

    win:setFrame(f)
end)

-- cmd + alt + down (minimize window)
hs.hotkey.bind({"ctrl", "option"}, "down", function() hs.eventtap.keyStroke({"cmd"}, "m") end)

-- alt + m (minimize window)
hs.hotkey.bind({"option"}, "m", nil, function() hs.eventtap.keyStroke({"cmd"}, "m") end)

-- alt + home (hide windows except active window)
hs.hotkey.bind({"option"}, "home", nil, function() hs.eventtap.keyStroke({"cmd", "option"}, "h") end)





-- work in specific app
local function disableAll(keySet)
    for k, v in pairs(keySet) do v:disable() end
end

local function enableAll(keySet)
    for k, v in pairs(keySet) do v:enable() end
end





--only work in FInder
local FinderBinding = {
    -- open file (cmd + return)
    hs.hotkey.bind({"cmd"}, "return", nil, function() hs.eventtap.keyStroke({"cmd"}, "o") end),

    -- rename (f2)
    hs.hotkey.bind({}, "f2", nil, function() hs.eventtap.keyStroke({}, "return") end),

    -- move to folder includes current directory (alt + up) 
    hs.hotkey.bind({"option"}, "up", nil, function() hs.eventtap.keyStroke({"cmd"}, "up") end)
}

hs.window.filter.new('Finder')
    :subscribe(hs.window.filter.windowFocused, function() enableAll(FinderBinding) end)
    :subscribe(hs.window.filter.windowUnfocused, function() disableAll(FinderBinding) end)





--only work in Safari
local SafariBinding = {
    -- show source(f12)
    hs.hotkey.bind({}, "f12", nil, function() hs.eventtap.keyStroke({"option", "cmd"}, "u") end)
}

hs.window.filter.new('Safari')
    :subscribe(hs.window.filter.windowFocused, function() enableAll(SafariBinding) end)
    :subscribe(hs.window.filter.windowUnfocused, function() disableAll(SafariBinding) end)





--only work in iTerm2
local iTerm2Binding = {
    -- clear buffer
    hs.hotkey.bind({"cmd"}, "l", nil, function() hs.eventtap.keyStroke({"cmd"}, "k") end)
}

hs.window.filter.new('iTerm2')
    :subscribe(hs.window.filter.windowFocused, function() enableAll(iTerm2Binding) end)
    :subscribe(hs.window.filter.windowUnfocused, function() disableAll(iTerm2Binding) end)