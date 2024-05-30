-- only work in Safari
local safariBinding = {
  -- show source(f12)
  hs.hotkey.bind({}, "f12", nil, function()
    hs.eventtap.keyStroke({ "option", "cmd" }, "u")
  end),
}
hs.window.filter
  .new("Safari")
  :subscribe(hs.window.filter.windowFocused, function()
    require("helper.util").EnableAll(safariBinding)
  end)
  :subscribe(hs.window.filter.windowUnfocused, function()
    require("helper.util").DisableAll(safariBinding)
  end)
