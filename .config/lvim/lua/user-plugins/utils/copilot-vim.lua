lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  "github/copilot.vim",
  init = function()
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-a><TAB>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    vim.keymap.set("i", "<C-a>n", "<Plug>(copilot-next)")
    vim.keymap.set("i", "<C-a>b", "<Plug>(copilot-previous)")
    vim.keymap.set("i", "<C-a>d", "<Plug>(copilot-dismiss)")
    vim.keymap.set("i", "<C-a><Space>", "<Plug>(copilot-suggest)")
  end,
})
