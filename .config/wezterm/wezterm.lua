local wezterm = require 'wezterm'
local act = wezterm.action

-- keymaps
local keybinds = {
  -- clipboard
  { key = 'c', mods = 'SHIFT|CTRL',        action = act.CopyTo 'Clipboard' },
  { key = 'v', mods = 'SHIFT|CTRL',        action = act.PasteFrom 'Clipboard' },
  -- tab
  { key = 't', mods = 'SHIFT|CTRL',        action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'LEADER|SHIFT|CTRL', action = act.CloseCurrentTab { confirm = true } },
  { key = 'k', mods = 'SHIFT|CTRL',        action = act.ActivateTabRelative(-1) },
  { key = 'j', mods = 'SHIFT|CTRL',        action = act.ActivateTabRelative(1) },
  {
    key = 'e',
    mods = 'LEADER|SHIFT|CTRL',
    action = act.PromptInputLine {
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  { key = '1', mods = 'LEADER|SHIFT|CTRL', action = act.ActivateTab(0) },
  { key = '2', mods = 'LEADER|SHIFT|CTRL', action = act.ActivateTab(1) },
  { key = '3', mods = 'LEADER|SHIFT|CTRL', action = act.ActivateTab(2) },
  { key = '4', mods = 'LEADER|SHIFT|CTRL', action = act.ActivateTab(3) },
  { key = '5', mods = 'LEADER|SHIFT|CTRL', action = act.ActivateTab(4) },
  { key = '6', mods = 'LEADER|SHIFT|CTRL', action = act.ActivateTab(5) },
  { key = '7', mods = 'LEADER|SHIFT|CTRL', action = act.ActivateTab(6) },
  { key = '8', mods = 'LEADER|SHIFT|CTRL', action = act.ActivateTab(7) },
  { key = '9', mods = 'LEADER|SHIFT|CTRL', action = act.ActivateTab(8) },
  -- pane
  { key = 'h', mods = 'LEADER|SHIFT|CTRL', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'v', mods = 'LEADER|SHIFT|CTRL', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'h', mods = 'LEADER|SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'LEADER|SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'LEADER|SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'LEADER|SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },
  {
    key = 'r',
    mods = 'LEADER|SHIFT|CTRL',
    action = act.ActivateKeyTable {
      name = 'resize_pane',
      one_shot = false,
    },
  },
  -- copy mode
  { key = 'c',     mods = 'LEADER|SHIFT|CTRL', action = wezterm.action.ActivateCopyMode },
  { key = 'Enter', mods = 'LEADER|SHIFT|CTRL', action = 'QuickSelect' },
  { key = '/',     mods = 'LEADER|SHIFT|CTRL', action = act.Search('CurrentSelectionOrEmptyString') },
}

local key_tables = {
  resize_pane = {
    { key = 'h',      action = wezterm.action.AdjustPaneSize { 'Left', 1 } },
    { key = 'j',      action = wezterm.action.AdjustPaneSize { 'Down', 1 } },
    { key = 'k',      action = wezterm.action.AdjustPaneSize { 'Up', 1 } },
    { key = 'l',      action = wezterm.action.AdjustPaneSize { 'Right', 1 } },
    { key = 'Enter',  action = 'PopKeyTable' },
    { key = 'Escape', action = 'PopKeyTable' },
  },
}

-- hyperlink
local hyperlink_rules = {
  {
    regex = [[\bhttps?://\S+\b]],
    format = '$0',
  },
  {
    regex = [[\bfile://\S+\b]],
    format = '$0',
  },
}

-- os
local default_prog
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  default_prog = { 'wsl.exe', '~', '-d', 'Arch' }
elseif wezterm.target_triple == 'aarch64-apple-darwin' then
  default_prog = { '' }
end

return {
  -- os
  default_prog = default_prog,
  -- colorscheme
  color_scheme = 'iceberg-dark',
  -- font
  font = wezterm.font_with_fallback({
    { family = 'GohuFont Nerd Font',  weight = 'Medium' },
    { family = 'PlemolJP Console NF', weight = 'Medium' },
  }),
  font_size = 10.5,
  -- cursor
  default_cursor_style = 'BlinkingBlock',
  cursor_blink_rate = 1000,
  -- keys
  disable_default_key_bindings = true,
  leader = { key = 'Space', mods = 'SHIFT|CTRL', timeout_milliseconds = 1000 },
  keys = keybinds,
  key_tables = key_tables,
  -- preferences
  use_ime = true,
  tab_bar_at_bottom = true,
  window_background_opacity = 0.8,
  window_decorations = 'RESIZE',
  use_fancy_tab_bar = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  check_for_updates = true,
  scrollback_lines = 3500,
  hyperlink_rules = hyperlink_rules,
  term = 'xterm-256color',
}
