return {
  {
    -- https://github.com/hedyhli/outline.nvim
    'hedyhli/outline.nvim',
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>ol", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    init = function()
      require("outline").setup({})
    end,
  },
}
