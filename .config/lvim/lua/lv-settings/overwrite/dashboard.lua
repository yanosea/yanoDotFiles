-- dashboard
-- define buttons
lvim.builtin.alpha.dashboard.section.buttons.entries = {}
local buttons = {
  { "f", "󰈞  Find File", "<CMD>Telescope find_files<CR>" },
  { "n", "  New File", "<CMD>ene!<CR>" },
  { "p", "  Projects ", "<CMD>Telescope projects<CR>" },
  { "r", "  Recent Files", ":Telescope oldfiles <CR>" },
  { "t", "󰊄  Find Text", "<CMD>Telescope live_grep<CR>" },
  { "c", "  Configuration", "<CMD>edit /home/yanosea/.config/lvim/config.lua <CR>" },
  { "U", "󰏗  Update LunarVim", "<CMD>LvimUpdate<CR>" },
  { "T", "󰔱  Sync Tree-Sitter Parser", "<CMD>TSUpdateSync<CR>" },
  { "L", "󰒲  Plugins", "<CMD>Lazy<CR>" },
  { "M", "󱌣  Mason Lsp", "<CMD>Mason<CR>" },
  { "q", "󰅖  Quit", "<CMD>quit<CR>" },
}
for i, btn in ipairs(buttons) do
  lvim.builtin.alpha.dashboard.section.buttons.entries[i] = btn
end
