﻿-- bind
---- curor move
------ vim like
hs.hotkey.bind({ "ctrl" }, "h", nil, function() hs.eventtap.keyStroke({}, "left") end,
    function() hs.eventtap.keyStroke({}, "left") end)
hs.hotkey.bind({ "ctrl" }, "j", nil, function() hs.eventtap.keyStroke({}, "down") end,
    function() hs.eventtap.keyStroke({}, "down") end)
hs.hotkey.bind({ "ctrl" }, "k", nil, function() hs.eventtap.keyStroke({}, "up") end,
    function() hs.eventtap.keyStroke({}, "up") end)
hs.hotkey.bind({ "ctrl" }, "l", nil, function() hs.eventtap.keyStroke({}, "right") end,
    function() hs.eventtap.keyStroke({}, "right") end)
------ ctrl + left (move to begin of the word)
hs.hotkey.bind({ "cmd" }, "left", nil, function() hs.eventtap.keyStroke({ "option" }, "left") end,
    function() hs.eventtap.keyStroke({ "option" }, "left") end)
hs.hotkey.bind({ "cmd", "ctrl" }, "h", nil, function() hs.eventtap.keyStroke({ "option" }, "left") end,
    function() hs.eventtap.keyStroke({ "option" }, "left") end)
------ ctrl + shift + left (move to begin of the word with selection)
hs.hotkey.bind({ "cmd", "shift" }, "left", nil, function() hs.eventtap.keyStroke({ "option", "shift" }, "left") end,
    function() hs.eventtap.keyStroke({ "option", "shift" }, "left") end)
hs.hotkey.bind({ "cmd", "ctrl", "shift" }, "h", nil, function() hs.eventtap.keyStroke({ "option", "shift" }, "left") end,
    function() hs.eventtap.keyStroke({ "option", "shift" }, "left") end)
------ ctrl + right (move to end of the word)
hs.hotkey.bind({ "cmd" }, "right", nil, function() hs.eventtap.keyStroke({ "option" }, "right") end,
    function() hs.eventtap.keyStroke({ "option" }, "right") end)
hs.hotkey.bind({ "cmd", "ctrl" }, "l", nil, function() hs.eventtap.keyStroke({ "option" }, "right") end,
    function() hs.eventtap.keyStroke({ "option" }, "right") end)
------ ctrl + shift + right (move to end of the word with selection)
hs.hotkey.bind({ "cmd", "shift" }, "right", nil, function() hs.eventtap.keyStroke({ "option", "shift" }, "right") end,
    function() hs.eventtap.keyStroke({ "option", "shift" }, "right") end)
hs.hotkey.bind({ "cmd", "ctrl", "shift" }, "l", nil, function() hs.eventtap.keyStroke({ "option", "shift" }, "right") end,
    function() hs.eventtap.keyStroke({ "option", "shift" }, "right") end)
------ redo
hs.hotkey.bind({ "cmd" }, "y", nil, function() hs.eventtap.keyStroke({ "cmd", "shift" }, "z") end)
------ quit
hs.hotkey.bind({ "option" }, "f4", nil, function() hs.eventtap.keyStroke({ "cmd" }, "q") end)