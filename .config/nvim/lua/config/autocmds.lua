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
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
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
  if vim.fn.executable("win32yank.exe") ~= 0 then
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
  end
  -- ime off when leave insert mode
  if vim.fn.executable("spzenhan.exe") ~= 0 then
    vim.cmd [[
      autocmd InsertLeave *  :call system("spzenhan.exe 0")
      autocmd CmdlineLeave * :call system("spzenhan.exe 0")
    ]]
  end
end
