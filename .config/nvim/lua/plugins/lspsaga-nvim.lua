return {
  {
    -- https://github.com/nvimdev/lspsaga.nvim
    'glepnir/lspsaga.nvim',
    lazy = true,
    event = { 'BufReadPre', 'LspAttach' },
    config = function()
      require('lspsaga').setup({})
    end,
  },
}
