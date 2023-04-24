local wezterm = require 'wezterm'
local act = wezterm.action

-- Keymaps
local keybinds = {
    { key = 'c', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
    { key = 'v', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
    { key = 't', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
    {
        key = 'r',
        mods = 'ALT',
        action = act.ActivateKeyTable {
            name = 'resize_pane',
            one_shot = false,
        },
    },
    { key = 'Enter', mods = 'ALT',  action = 'QuickSelect' },
    { key = '/',     mods = 'ALT',  action = act.Search('CurrentSelectionOrEmptyString') },
    { key = 'L',     mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
}

-- Hyperlink
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

return {
    -- ColorScheme
    color_scheme = 'iceberg-dark',
    -- Font
    font = wezterm.font_with_fallback({
        { family = "GohuFont Nerd Font",  weight = "Medium" },
        { family = "PlemolJP Console NF", weight = "Medium" },
    }),
    font_size = 10.5,
    -- Cursor
    default_cursor_style = "BlinkingBlock",
    cursor_blink_rate = 1000,
    -- Keys
    disable_default_key_bindings = true,
    keys = keybinds,
    -- WSL
    default_prog = { "wsl.exe", "~", "-d", "Arch" },
    -- Prefferences
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
    term = "xterm-256color",
}
