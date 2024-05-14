-- keymaps
-- hide highlight search
vim.keymap.set('n', "<ESC>", "<CMD>nohlsearch<CR>", { silent = true, desc = "No Highlight" })
-- line
vim.keymap.set('n', 'j', "gj")
vim.keymap.set('n', 'k', "gk")
vim.keymap.set('n', "gj", 'j')
vim.keymap.set('n', "gk", 'k')
