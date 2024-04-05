return {
  {
    -- https://github.com/ptzz/lf.vim
    "ptzz/lf.vim",
    lazy = true,
    keys = { "<LEADER>f" },
    dependencies = {
      -- https://github.com/voldikss/vim-floaterm
      "voldikss/vim-floaterm",
    },
    init = function()
      vim.g.NERDTreeHijackNetrw = 0
      vim.g.lf_replace_netrw = 1
    end,
  },
}
