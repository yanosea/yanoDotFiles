lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  "tpope/vim-sleuth",
  event = { "BufRead", "BufEnter" },
})
