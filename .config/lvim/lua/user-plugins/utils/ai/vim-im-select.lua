lvim.plugins = lvim.plugins or {}
local osName = os.getenv("OS")
if osName == "Darwin" then
  table.insert(lvim.plugins, {
    "yoshida-m-3/vim-im-select",
  })
end
