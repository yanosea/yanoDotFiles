-- yanosea nvim initialize
-- fast loader
if vim.loader then vim.loader.enable() end

-- general
require('base')

-- preferences
require('config.options')

-- keymaps
require('config.keymaps')

-- auto commands
require('config.autocmds')

-- plugins
require('config.lazy')
