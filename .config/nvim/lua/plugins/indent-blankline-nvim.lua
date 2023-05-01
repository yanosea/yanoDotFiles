return {
  {
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    'lukas-reineke/indent-blankline.nvim',
    lazy = false,
    init = function()
      vim.opt.list = true
      vim.opt.listchars:append ''
      vim.opt.listchars:append 'space:⋅'
      require('indent_blankline').setup {
        show_end_of_line = true,
        space_char_blankline = ' ',
        filetype_exclude = { 'dashboard' },
      }
    end,
  },
}
