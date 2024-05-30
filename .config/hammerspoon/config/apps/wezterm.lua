-- only work in Wezterm
local weztermBinding = {
  -- clear lines (ctrl + l)
  hs.hotkey.bind({ "cmd" }, "l", nil, function()
    hs.eventtap.keyStroke({ "ctrl" }, "l")
  end),
  -- fzf (ctrl + r)
  hs.hotkey.bind({ "cmd" }, "r", nil, function()
    hs.eventtap.keyStroke({ "ctrl" }, "r")
  end),
}
hs.window.filter
  .new("Wezterm")
  :subscribe(hs.window.filter.windowFocused, function()
    require("helper.util").EnableAll(weztermBinding)
  end)
  :subscribe(hs.window.filter.windowUnfocused, function()
    require("helper.util").DisableAll(weztermBinding)
  end)
