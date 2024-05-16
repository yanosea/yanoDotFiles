lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  "skanehira/denops-translate.vim",
  dependencies = { "vim-denops/denops.vim"},
  event = "VimEnter"
})
