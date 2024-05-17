lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  "hedyhli/outline.nvim",
  cmd = { "Outline", },
  init = function()
    require("outline").setup({})
    vim.keymap.set('n', "<LEADER>o", "<CMD>Outline<CR>", { silent = true, desc = "Outline" })
  end,
})
