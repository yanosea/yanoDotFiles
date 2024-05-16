lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  "gbrlsnchs/winpick.nvim",
  event = "VimEnter",
  init = function()
    require("winpick").setup({
      border = "single",
      chars = { "A", "S", "D", "F", "J", "K", "L", ";" }
    })

    vim.api.nvim_set_keymap("n", "<C-w><C-w>", "<CMD>lua WinPick()<CR>", { noremap = true, silent = true, desc = "Pick Windows"})
  end,
})

function WinPick()
  local win_count = #vim.api.nvim_tabpage_list_wins(0)

  if win_count < 3 then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w><C-w>", true, false, true), 'n', true)
  else
    local success, winid = pcall(require("winpick").select)

    if success and winid then
      vim.api.nvim_set_current_win(winid)
    end
  end
end
