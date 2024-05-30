-- activity monitor
hs.hotkey.bind({ "cmd", "shift" }, "escape", require("helper.util").OpenApp("Activity Monitor"))
-- lanuchpad
hs.hotkey.bind({}, "ctrl", require("helper.util").OpenApp("Launchpad"))
-- new finder window
hs.hotkey.bind({ "ctrl" }, "e", require("helper.util").OpenApp("Finder"))
-- system settings
hs.hotkey.bind({ "ctrl" }, "i", require("helper.util").OpenApp("System Preferences"))
