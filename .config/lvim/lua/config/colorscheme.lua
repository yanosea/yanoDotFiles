-- colorschemes
lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  -- additional colorschemes
  "arcticicestudio/nord-vim",
  "neanias/everforest-nvim",
})
-- default colorscheme
lvim.colorscheme = "tokyonight"
-- change colorscheme keymap
-- <C-c>f everforest
vim.keymap.set(
  "n",
  "<C-C>f",
  "<CMD>colorscheme everforest<CR>",
  { silent = true, desc = "Toggle colorscheme Everforest" }
)
-- <C-c>n nord
vim.keymap.set("n", "<C-C>n", "<CMD>colorscheme nord<CR>", { silent = true, desc = "Toggle colorscheme Nord" })
-- <C-c>l lunar
vim.keymap.set("n", "<C-C>l", "<CMD>colorscheme lunar<CR>", { silent = true, desc = "Toggle colorscheme Lunar" })
-- <C-c>t tokyonight
vim.keymap.set(
  "n",
  "<C-C>t",
  "<CMD>colorscheme tokyonight<CR>",
  { silent = true, desc = "Toggle colorscheme TokyoNight" }
)
