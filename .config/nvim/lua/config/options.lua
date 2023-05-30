-- preferences
local set_opt = {
  -- language
  helplang = 'ja',
  -- character code
  encoding = 'utf-8',
  fileencoding = 'utf-8',
  -- backup file
  backup = false,
  -- swap file
  swapfile = false,
  -- line number
  number = true,
  -- cursor position
  ruler = true,
  -- highlight current line
  signcolumn = 'yes',
  cursorline = true,
  -- invisible character
  list = true,
  listchars = { tab = '>>', trail = '-', nbsp = '+' },
  -- status line
  laststatus = 3,
  -- GUI setting
  guifont = { 'GohuFont Nerd Font', 'PlemolJP Console NF' },
  guifontwide = { 'GohuFont Nerd Font', 'PlemolJP Console NF' },
  termguicolors = true,
  mouse = '',
  -- highlight search
  hlsearch = true,
  -- search
  ignorecase = true,
  smartcase = true,
  incsearch = true,
  -- command history
  history = 1000,
  -- complement
  wildmenu = true,
  completeopt = 'menu,noinsert',
  -- indent
  autoindent = true,
  smartindent = true,
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
  -- window split
  splitbelow = false,
  splitright = false,
  -- shell
  shell = os.getenv('SHELL'),
  -- syntax highlight
  syntax = 'enable',
}

local append_opt = {
  -- intro
  shortmess = 'I',
  -- clipboaed
  clipboard = 'unnamedplus',
  -- GUI setting
  guicursor = 'i:block,a:-blinkwait175-blinkoff150-blinkon175',
}

-- lsp
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    format = function(diagnostic)
      return string.format('%s (%s: %s)', diagnostic.message, diagnostic.source, diagnostic.code)
    end,
  },
})

-- ignore auto format
vim.api.nvim_create_user_command('W', 'noautocmd w', {})
vim.api.nvim_create_user_command('Wq', 'noautocmd wq', {})

-- set preferences
for k, v in pairs(set_opt) do
  vim.opt[k] = v
end

for k, v in pairs(append_opt) do
  vim.opt[k]:append(v)
end

-- other
-- search
vim.cmd([[set nowrapscan]])
