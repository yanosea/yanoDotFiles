return {
  {
    -- https://github.com/matsui54/denops-popup-preview.vim
    'matsui54/denops-popup-preview.vim',
    -- https://github.com/vim-denops/denops.vim
    dependencies = { 'vim-denops/denops.vim' },
    config = function()
      vim.g.popup_preview_config = {
        border = false,
        supportUltisnips = false,
        supportInfo = true,
        delay = 60,
      }

      vim.fn['popup_preview#enable']()
    end,
  },
}
