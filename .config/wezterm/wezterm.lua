local wezterm = require("wezterm")
local act = wezterm.action
-- util
function Basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end
-- os, font
local default_domain
local wsl_domains = wezterm.default_wsl_domains()
local default_prog
local font_size
local ctrl_key
local target = wezterm.target_triple:lower()
if string.find(target, "windows") then
  -- default_domain = "WSL:Arch"
  -- for _, domain in ipairs(wsl_domains) do
  --   domain.default_cwd = "~"
  -- end
  default_prog = { "pwsh.exe", "-NoLogo" }
  default_domain = "local"
  font_size = 10.5
  ctrl_key = "CTRL"
elseif string.find(target, "darwin") then
  default_domain = "local"
  font_size = 14
  ctrl_key = "SUPER"
elseif string.find(target, "linux") then
  default_domain = "local"
  font_size = 14
  ctrl_key = "CTRL"
end
-- style
local background_opacity = 0.8
-- tab bar left
wezterm.on("format-tab-title", function(tab, tabs)
  local TAB_BAR_BG = "#1f2335"
  local ACTIVE_TAB_BG = "#7aa2f7"
  local ACTIVE_TAB_FG = "#000000"
  local NORMAL_TAB_BG = "#3b4261"
  local NORMAL_TAB_FG = "#7aa2f7"
  local background = NORMAL_TAB_BG
  local foreground = NORMAL_TAB_FG
  local is_first = tab.tab_id == tabs[1].tab_id
  local is_last = tab.tab_id == tabs[#tabs].tab_id

  if tab.is_active then
    background = ACTIVE_TAB_BG
    foreground = ACTIVE_TAB_FG
  end

  local leading_fg = NORMAL_TAB_FG
  local leading_bg = background
  local trailing_fg = background
  local trailing_bg = NORMAL_TAB_BG

  if is_first and tab.is_active then
    leading_fg = ACTIVE_TAB_BG
  else
    leading_fg = NORMAL_TAB_BG
  end

  if is_last then
    trailing_bg = TAB_BAR_BG
  else
    trailing_bg = NORMAL_TAB_BG
  end

  local left_space = ""

  if not is_first then
    left_space = " "
  end

  local divider = ""
  local tab_next = tabs[tab.tab_id + 2]
  if not tab.is_active and not is_last and not tab_next.is_active then
    divider = ""
  end

  local limit_length = 30
  local title_length = #tab.active_pane.title
  local suffix = " ..."
  local active_pane_title = tab.active_pane.title

  if title_length > limit_length then
    active_pane_title = string.sub(active_pane_title, 1, limit_length) .. suffix
  end

  return {
    { Background = { Color = leading_bg } },
    { Foreground = { Color = leading_fg } },
    { Text = "" },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = left_space .. tab.tab_index + 1 .. " : " .. active_pane_title .. " " },
    { Background = { Color = trailing_bg } },
    { Foreground = { Color = trailing_fg } },
    { Text = "" },
    { Background = { Color = NORMAL_TAB_BG } },
    { Foreground = { Color = NORMAL_TAB_FG } },
    { Text = divider },
  }
end)
-- tab bar right
wezterm.on("update-right-status", function(window)
  window:set_right_status(wezterm.format({
    { Foreground = { Color = "#a9b1d6" } },
    { Background = { Color = "#1f2335" } },
    { Text = "" },
    { Foreground = { Color = "#a9b1d6" } },
    { Background = { Color = "#1f2335" } },
    { Text = " " .. Basename(wezterm.home_dir) .. " " },
    { Foreground = { Color = "#3b4261" } },
    { Background = { Color = "#1f2335" } },
    { Text = "" },
    { Foreground = { Color = "#7aa2f7" } },
    { Background = { Color = "#3b4261" } },
    { Text = " " .. wezterm.hostname() .. " " },
    { Foreground = { Color = "#7aa2f7" } },
    { Background = { Color = "#3b4261" } },
    { Text = "" },
    { Foreground = { Color = "#000000" } },
    { Background = { Color = "#7aa2f7" } },
    { Text = " " .. wezterm.strftime(" %Y/%m/%d %I:%M:%S") .. " " },
  }))
end)
-- toggle window opacity
wezterm.on("toggle-opacity", function(window)
  local overrides = window:get_config_overrides() or {}
  if overrides.window_background_opacity == background_opacity then
    overrides.window_background_opacity = 1.0
  else
    overrides.window_background_opacity = background_opacity
  end
  window:set_config_overrides(overrides)
end)

return {
  -- os
  wsl_domains = wsl_domains,
  default_domain = default_domain,
  default_prog = default_prog,
  -- colorscheme
  color_scheme = "tokyonight",
  colors = {
    tab_bar = {
      background = "#1f2335",
      active_tab = {
        bg_color = "#7aa2f7",
        fg_color = "#000000",
      },
      inactive_tab = {
        bg_color = "#3b4261",
        fg_color = "#7aa2f7",
      },
    },
  },
  -- style
  window_background_opacity = background_opacity,
  window_decorations = "RESIZE",
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  show_new_tab_button_in_tab_bar = false,
  tab_max_width = 52,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  hyperlink_rules = {
    {
      regex = [[\bhttps?://\S+\b]],
      format = "$0",
    },
    {
      regex = [[\bfile://\S+\b]],
      format = "$0",
    },
  },
  adjust_window_size_when_changing_font_size = false,
  -- font
  font = wezterm.font_with_fallback({
    { family = "GohuFont Nerd Font", weight = "Medium" },
    { family = "X12Y16PxMaruMonica Nerd Font", weight = "Medium" },
    { family = "PlemolJP Console NF", weight = "Medium" },
  }),
  font_size = font_size,
  -- cursor
  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 1000,
  -- keys
  disable_default_key_bindings = true,
  leader = { key = "Space", mods = "SHIFT|" .. ctrl_key, timeout_milliseconds = 1000 },
  keys = {
    -- clipboard
    { key = "c", mods = "SHIFT|" .. ctrl_key, action = act.CopyTo("Clipboard") },
    { key = "v", mods = "SHIFT|" .. ctrl_key, action = act.PasteFrom("Clipboard") },
    -- tab
    { key = "t", mods = "SHIFT|" .. ctrl_key, action = act.SpawnTab("DefaultDomain") },
    { key = "w", mods = "SHIFT|" .. ctrl_key, action = act.CloseCurrentTab({ confirm = true }) },
    { key = "k", mods = "SHIFT|" .. ctrl_key, action = act.ActivateTabRelative(-1) },
    { key = "j", mods = "SHIFT|" .. ctrl_key, action = act.ActivateTabRelative(1) },
    { key = "1", mods = "LEADER", action = act.ActivateTab(0) },
    { key = "2", mods = "LEADER", action = act.ActivateTab(1) },
    { key = "3", mods = "LEADER", action = act.ActivateTab(2) },
    { key = "4", mods = "LEADER", action = act.ActivateTab(3) },
    { key = "5", mods = "LEADER", action = act.ActivateTab(4) },
    { key = "6", mods = "LEADER", action = act.ActivateTab(5) },
    { key = "7", mods = "LEADER", action = act.ActivateTab(6) },
    { key = "8", mods = "LEADER", action = act.ActivateTab(7) },
    { key = "9", mods = "LEADER", action = act.ActivateTab(8) },
    -- pane
    {
      key = "v",
      mods = "LEADER|SHIFT|" .. ctrl_key,
      action = act.SplitHorizontal({ domain = "DefaultDomain" }),
    },
    {
      key = "s",
      mods = "LEADER|SHIFT|" .. ctrl_key,
      action = act.SplitVertical({ domain = "DefaultDomain" }),
    },
    { key = "h", mods = "LEADER|SHIFT|" .. ctrl_key, action = act.ActivatePaneDirection("Left") },
    { key = "l", mods = "LEADER|SHIFT|" .. ctrl_key, action = act.ActivatePaneDirection("Right") },
    { key = "k", mods = "LEADER|SHIFT|" .. ctrl_key, action = act.ActivatePaneDirection("Up") },
    { key = "j", mods = "LEADER|SHIFT|" .. ctrl_key, action = act.ActivatePaneDirection("Down") },
    {
      key = "r",
      mods = "LEADER|SHIFT|" .. ctrl_key,
      action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
    },
    -- copy sode
    { key = "c", mods = "LEADER|SHIFT|" .. ctrl_key, action = act.ActivateCopyMode },
    { key = "Enter", mods = "LEADER|SHIFT|" .. ctrl_key, action = "QuickSelect" },
    { key = "?", mods = "LEADER|SHIFT|" .. ctrl_key, action = act.Search("CurrentSelectionOrEmptyString") },
    { key = "d", mods = "LEADER|SHIFT|" .. ctrl_key, action = act.ShowDebugOverlay },
    -- key binding
    { key = "u", mods = "SHIFT|" .. ctrl_key, action = wezterm.action.IncreaseFontSize },
    { key = "m", mods = "SHIFT|" .. ctrl_key, action = wezterm.action.DecreaseFontSize },
    { key = "b", mods = "SHIFT|" .. ctrl_key, action = wezterm.action.EmitEvent("toggle-opacity") },
  },
  key_tables = {
    resize_pane = {
      { key = "h", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
      { key = "j", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
      { key = "k", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
      { key = "l", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
      { key = "Enter", action = "PopKeyTable" },
      { key = "Escape", action = "PopKeyTable" },
    },
  },
  -- preferences
  use_ime = true,
  check_for_updates = true,
  scrollback_lines = 3500,
  term = "xterm-256color",
  enable_wayland = false,
}
