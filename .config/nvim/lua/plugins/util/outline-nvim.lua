return {
  {
    -- https://github.com/hedyhil/symbols-outline.nvim
    "hedyhil/symbols-outline.nvim",
    lazy = true,
    keys = { "<LEADER>o" },
    cmd = { "SymbolsOutline" },
    init = function()
      require("symbols-outline").setup({})
      vim.keymap.set('n', "<LEADER>o", "<CMD>SymbolsOutline<CR>")
    end,
  },
}
