return {
  {
    -- https://github.com/vim-scripts/YankRing.vim
    'vim-scripts/YankRing.vim',
    lazy = true,
    cmd = { 'YRShow' },
    keys = { '<LEADER>p', '<C-p>', '<C-n>' },
    init = function()
      vim.g.yankring_history_dir = os.getenv('XDG_STATE_HOME') .. '/yankring'
      vim.keymap.set('n', '<LEADER>p', '<CMD>YRShow<CR>')
    end,
  },
}
