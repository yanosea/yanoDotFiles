-- keymaps
-- remap space as leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- normal
-- hide highlight search
vim.keymap.set('n', '<ESC>', '<CMD>nohlsearch<CR>', { desc = 'hide highlight' })

-- line
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'gk', 'k')

-- buffer
vim.keymap.set('n', '<C-k>', '<CMD>bprevious<CR>', { desc = 'move previous buffer' })
vim.keymap.set('n', '<C-j>', '<CMD>bnext<CR>', { desc = 'move next buffer' })
vim.keymap.set('n', '<C-t>', '<CMD>enew<CR>', { desc = 'new empty buffer' })
vim.keymap.set('n', '<C-c>', '<CMD>bd<CR>', { desc = 'close buffer' })
