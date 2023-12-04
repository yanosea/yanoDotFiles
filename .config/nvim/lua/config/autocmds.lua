-- auto commands
vim.cmd("autocmd!")
-- get autogroup
local augroup = vim.api.nvim_create_augroup
-- create autocommand
local autocmd = vim.api.nvim_create_autocmd
-- remove Whitespace on save
autocmd("BufWritePre", {
  pattern = '*',
  command = ":%s/\\s\\+$//e",
})
-- open terminal with insert mode
autocmd("TermOpen", {
  pattern = '*',
  command = "startinsert",
})
-- highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 250 }
  end,
})
-- prevent neovim from exiting with status code 134
autocmd({ "VimLeave" }, {
  callback = function()
    vim.cmd("sleep 1m")
  end,
})
-- wsl
if os.getenv("WSL_DISTRO_NAME") ~= nil then
  -- clipboard sharing
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "win32yank.exe -i",
      ["*"] = "win32yank.exe -i",
    },
    paste = {
      ["+"] = "win32yank.exe -o",
      ["*"] = "win32yank.exe -o",
    },
    cache_enable = 0,
  }
  -- ime off when leave insert mode
  vim.cmd [[
    if executable("spzenhan.exe")
      autocmd InsertLeave *  :call system("spzenhan.exe 0")
      autocmd CmdlineLeave * :call system("spzenhan.exe 0")
    endif
  ]]
end
