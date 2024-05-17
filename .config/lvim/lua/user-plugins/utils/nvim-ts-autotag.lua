lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  "windwp/nvim-ts-autotag",
  event = { "BufRead", "BufEnter" },
  init = function() end,
})
