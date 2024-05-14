-- dashboard
lvim.builtin.alpha.dashboard.section.buttons.entries = {}
local buttons = {
  { "f", "󰈞  Find File", "<CMD>Telescope find_files<CR>" },
  { "n", "  New File", "<CMD>ene!<CR>" },
  { "p", "  Projects ", "<CMD>Telescope projects<CR>" },
  { "r", "  Recent files", ":Telescope oldfiles <CR>" },
  { "t", "󰊄  Find Text", "<CMD>Telescope live_grep<CR>" },
  { "c", "  Configuration", "<CMD>edit /home/yanosea/.config/lvim/config.lua <CR>" },
  { "u", "󰏗  Update LunarVim", "<CMD>LvimUpdate<CR>" },
  { "s", "󰚰  Sync Core Plugins", "<CMD>LvimSyncCorePlugins<CR>" },
  { "q", "󰅖  Quit", "<CMD>quit<CR>" }
}
for i, btn in ipairs(buttons) do
  lvim.builtin.alpha.dashboard.section.buttons.entries[i] = btn
end
