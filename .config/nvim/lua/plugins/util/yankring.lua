return {
  {
    -- https://github.com/vim-scripts/YankRing.vim
    "vim-scripts/YankRing.vim",
    lazy = true,
    keys = { "<LEADER>h", "<C-p>", "<C-n>"},
    cmd = { "YRShow" },
    init = function()
      vim.g.yankring_history_dir = os.getenv("XDG_STATE_HOME") .. "/yankring"
      vim.keymap.set('n', "<LEADER>h", "<CMD>YRShow<CR>")
    end,
  },
}
