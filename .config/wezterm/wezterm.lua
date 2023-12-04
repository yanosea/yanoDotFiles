local wezterm = require "wezterm"
local act = wezterm.action
-- util
function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end
-- os, font
local default_domain
local wsl_domains = wezterm.default_wsl_domains()
local default_prog
local font_size
local ctrl_key
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  default_domain = "WSL:Arch"

  for _, domain in ipairs(wsl_domains) do
    domain.default_cwd = "~"
  end

  default_prog = { "wsl.exe" }
  font_size = 10.5
  ctrl_key = "CTRL"
elseif wezterm.target_triple == "aarch64-apple-darwin" then
  default_domain = "local"
  font_size = 14
  ctrl_key = "CMD"
end
-- tab bar left
wezterm.on("format-tab-title", function(tab, tabs)
  local TAB_BAR_BG = "#2E3440"
  local ACTIVE_TAB_BG = "#88C0D0"
  local ACTIVE_TAB_FG = "#ffffff"
  local NORMAL_TAB_BG = "#4C566A"
  local NORMAL_TAB_FG = "#ffffff"
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

  local left_space = ''

  if not is_first then
    left_space = " "
  end

  local divider = ""
  local tab_next = tabs[tab.tab_id + 2]
  if not tab.is_active and not is_last and not tab_next.is_active then
    divider = ""
  end

  return {
    { Background = { Color = leading_bg } }, { Foreground = { Color = leading_fg } },
    { Text = '' },
    { Background = { Color = background } }, { Foreground = { Color = foreground } },
    { Text = left_space .. tab.tab_index + 1 .. ": " .. tab.active_pane.title .. " " },
    { Background = { Color = trailing_bg } }, { Foreground = { Color = trailing_fg } },
    { Text = '' },
    { Background = { Color = NORMAL_TAB_BG } }, { Foreground = { Color = NORMAL_TAB_FG } },
    { Text = divider }
  }
end)
-- tab bar right
wezterm.on("update-right-status", function(window)
  window:set_right_status(
    wezterm.format({
      { Foreground = { Color = "#5E81AC" } },
      { Background = { Color = "#2E3440" } },
      { Text = '' },
      { Foreground = { Color = "#ffffff" } },
      { Background = { Color = "#5E81AC" } },
      { Text = ' ' .. basename(wezterm.home_dir) .. " " },
      { Foreground = { Color = "#81A1C1" } },
      { Background = { Color = "#5E81AC" } },
      { Text = '' },
      { Foreground = { Color = "#ffffff" } },
      { Background = { Color = "#81A1C1" } },
      { Text = ' ' .. wezterm.hostname() .. " " },
      { Foreground = { Color = "#88C0D0" } },
      { Background = { Color = "#81A1C1" } },
      { Text = '' },
      { Foreground = { Color = "#ffffff" } },
      { Background = { Color = "#88C0D0" } },
      { Text = ' ' .. wezterm.strftime(" %Y/%m/%d %I:%M:%S") .. " " },
    })
  );
end);

return {
  -- os
  wsl_domains = wsl_domains,
  default_domain = default_domain,
  default_prog = default_prog,
  -- colorscheme
  color_scheme = "iceberg-dark",
  colors = {
    tab_bar = {
      background = "#2E3440",
      active_tab = {
        bg_color = "#88C0D0",
        fg_color = "#ffffff",
      },
      inactive_tab = {
        bg_color = "#434C5E",
        fg_color = "#ffffff",
      },
    },
  },
  -- style
  window_background_opacity = 0.8,
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
  -- font
  font = wezterm.font_with_fallback({
    { family = "GohuFont Nerd Font",  weight = "Medium" },
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
    { key = 'c', mods = "SHIFT|" .. ctrl_key,        action = act.CopyTo "Clipboard" },
    { key = 'v', mods = "SHIFT|" .. ctrl_key,        action = act.PasteFrom "Clipboard" },
    -- tab
    { key = 't', mods = "SHIFT|" .. ctrl_key,        action = act.SpawnTab "DefaultDomain" },
    { key = 'w', mods = "LEADER|SHIFT|" .. ctrl_key, action = act.CloseCurrentTab { confirm = true } },
    { key = 'k', mods = "SHIFT|" .. ctrl_key,        action = act.ActivateTabRelative(-1) },
    { key = 'j', mods = "SHIFT|" .. ctrl_key,        action = act.ActivateTabRelative(1) },
    { key = '1', mods = "LEADER",                    action = act.ActivateTab(0) },
    { key = '2', mods = "LEADER",                    action = act.ActivateTab(1) },
    { key = '3', mods = "LEADER",                    action = act.ActivateTab(2) },
    { key = '4', mods = "LEADER",                    action = act.ActivateTab(3) },
    { key = '5', mods = "LEADER",                    action = act.ActivateTab(4) },
    { key = '6', mods = "LEADER",                    action = act.ActivateTab(5) },
    { key = '7', mods = "LEADER",                    action = act.ActivateTab(6) },
    { key = '8', mods = "LEADER",                    action = act.ActivateTab(7) },
    { key = '9', mods = "LEADER",                    action = act.ActivateTab(8) },
    -- pane
    { key = 'v', mods = "LEADER|SHIFT|" .. ctrl_key, action = act.SplitHorizontal { domain = "DefaultDomain" } },
    { key = 's', mods = "LEADER|SHIFT|" .. ctrl_key, action = act.SplitVertical { domain = "DefaultDomain" } },
    { key = 'h', mods = "LEADER|SHIFT|" .. ctrl_key, action = act.ActivatePaneDirection "Left" },
    { key = 'l', mods = "LEADER|SHIFT|" .. ctrl_key, action = act.ActivatePaneDirection "Right" },
    { key = 'k', mods = "LEADER|SHIFT|" .. ctrl_key, action = act.ActivatePaneDirection "Up" },
    { key = 'j', mods = "LEADER|SHIFT|" .. ctrl_key, action = act.ActivatePaneDirection "Down" },
    { key = 'r', mods = "LEADER|SHIFT|" .. ctrl_key, action = act.ActivateKeyTable {  name = "resize_pane", one_shot = false, },
    },
    -- copy sode
    { key = 'c',     mods = "LEADER|SHIFT|" .. ctrl_key, action = wezterm.action.ActivateCopyMode },
    { key = "Enter", mods = "LEADER|SHIFT|" .. ctrl_key, action = "QuickSelect" },
    { key = '?',     mods = "LEADER|SHIFT|" .. ctrl_key, action = act.Search("CurrentSelectionOrEmptyString") },
    { key = 'd',     mods = "LEADER|SHIFT|" .. ctrl_key, action = wezterm.action.ShowDebugOverlay },
    -- key binding
    { key = "l", mods = ctrl_key, action = act.Multiple { act.ClearScrollback "ScrollbackAndViewport",act.SendKey { key = 'l', mods = "CTRL" }, }, },
  },
  key_tables = {
    resize_pane = {
      { key = 'h',      action = wezterm.action.AdjustPaneSize { "Left", 1 } },
      { key = 'j',      action = wezterm.action.AdjustPaneSize { "Down", 1 } },
      { key = 'k',      action = wezterm.action.AdjustPaneSize { "Up", 1 } },
      { key = 'l',      action = wezterm.action.AdjustPaneSize { "Right", 1 } },
      { key = "Enter",  action = "PopKeyTable" },
      { key = "Escape", action = "PopKeyTable" },
    },
  },
  -- preferences
  use_ime = true,
  check_for_updates = true,
  scrollback_lines = 3500,
  term = "xterm-256color",
}
