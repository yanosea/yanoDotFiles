lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  "zbirenbaum/copilot-cmp",
  dependencies = { "zbirenbaum/copilot.lua" },
  event = "InsertEnter",
  config = function()
    vim.defer_fn(function()
      require("copilot").setup()
      require("copilot_cmp").setup()
    end, 100)
  end,
})
