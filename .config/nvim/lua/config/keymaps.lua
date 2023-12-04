-- keymaps
-- remap space as leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- normal
-- hide highlight search
vim.keymap.set('n', "<ESC>", "<CMD>nohlsearch<CR>", { desc = "Hide highlight" })
-- line
vim.keymap.set('n', 'j', "gj")
vim.keymap.set('n', 'k', "gk")
vim.keymap.set('n', "gj", 'j')
vim.keymap.set('n', "gk", 'k')
-- buffer
vim.keymap.set('n', "<C-k>", "<CMD>bprevious<CR>", { desc = "Move previous buffer" })
vim.keymap.set('n', "<C-j>", "<CMD>bnext<CR>", { desc = "Move next buffer" })
vim.keymap.set('n', "<C-t>", "<CMD>enew<CR>", { desc = "New empty buffer" })
vim.keymap.set('n', "<C-c>", "<CMD>bd<CR>", { desc = "Close buffer" })
-- visual
vim.keymap.set('v', "<C-p>", "\"0p<CR>", { desc = "Paste in a row" })
