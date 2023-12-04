return {
  {
    -- https://github.com/voldikss/vim-floaterm
    "voldikss/vim-floaterm",
    lazy = true,
    keys = { "<LEADER>t" },
    cmd = { "FloatermNew", "FloatermToggle", "FloatermSend" },
    config = function()
      vim.g.floaterm_title = "  ($1/$2) "
      vim.g.floaterm_opener = "tabe"
      vim.api.nvim_set_hl(0, "FloatermBorder", { link = "Normal" })
      vim.keymap.set('n', "<LEADER>t", "<CMD>FloatermToggle<CR>")
    end,
  },
}
