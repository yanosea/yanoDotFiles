lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  "arcticicestudio/nord-vim",
  init = function()
    lvim.colorscheme = "nord"
  end
})
