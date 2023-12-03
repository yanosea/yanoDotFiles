return {
  {
    -- https://github.com/simrat39/symbols-outline.nvim
    "simrat39/symbols-outline.nvim",
    lazy = true,
    keys = {
      { "<leader>ol", "<cmd>SymbolsOutline<CR>", desc = "Toggle outline" },
    },
    cmd = { "Outline", "OutlineOpen" },
    init = function()
      require("symbols-outline").setup({})
    end,
  },
}
