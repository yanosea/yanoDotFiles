lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  "andymass/vim-matchup",
  event = { "BufRead", "BufEnter" },
  init = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
})
