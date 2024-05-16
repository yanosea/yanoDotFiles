-- colorschemes
lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  -- additional colorschemes
  "arcticicestudio/nord-vim",
})
-- default colorscheme
lvim.colorscheme = "nord"
-- change colorscheme keymap
vim.keymap.set('n', "<C-C>n", "<CMD>colorscheme nord<CR>", { silent = true, desc = "Toggle colorscheme Nord" })
vim.keymap.set('n', "<C-C>l", "<CMD>colorscheme lunar<CR>", { silent = true, desc = "Toggle colorscheme Lunar" })
vim.keymap.set('n', "<C-C>t", "<CMD>colorscheme tokyonight<CR>", { silent = true, desc = "Toggle colorscheme TokyoNight" })
