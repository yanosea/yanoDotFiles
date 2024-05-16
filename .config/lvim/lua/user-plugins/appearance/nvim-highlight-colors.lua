lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  "brenoprata10/nvim-highlight-colors",
  event = "VimEnter",
  init = function()
    require("nvim-highlight-colors").setup({
      render = "background",
      enable_named_colors = true,
      enable_tailwind = true,
    })
  end
})
