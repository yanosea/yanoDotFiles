return {
  {
    -- https://github.com/ptzz/lf.vim
    'ptzz/lf.vim',
    lazy = false,
    dependencies = {
      -- https://github.com/voldikss/vim-floaterm
      'voldikss/vim-floaterm',
    },
    config = function()
      vim.keymap.set('n', '<C-E>', '<CMD>Lf<CR>')
    end,
  },
}
