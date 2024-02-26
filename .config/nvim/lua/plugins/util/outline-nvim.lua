return {
  {
    -- https://github.com/hedyhli/outline.nvim
    "hedyhli/outline.nvim",
    lazy = true,
    keys = { "<LEADER>o" },
    cmd = { "SymbolsOutline" },
    init = function()
      require("outline").setup({})
      vim.keymap.set('n', "<LEADER>o", "<CMD>SymbolsOutline<CR>")
    end,
  },
}
