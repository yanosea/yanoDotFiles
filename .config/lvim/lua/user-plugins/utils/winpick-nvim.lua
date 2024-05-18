table.insert(lvim.plugins, {
  "gbrlsnchs/winpick.nvim",
  keys = { "<C-w><C-w>" },
  init = function()
    require("winpick").setup({
      border = "single",
      chars = { "A", "S", "D", "F", "J", "K", "L", ";" },
      filter = function(winid)
        local is_excluded = false
        local buftype = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(winid), "buftype")
        local filetype = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(winid), "filetype")

        local excluded_buftypes = {
          "nofile",
          "prompt",
        }
        local excluded_filetypes = {
          "noice",
          "notify",
        }

        if vim.tbl_contains(excluded_buftypes, buftype) or vim.tbl_contains(excluded_filetypes, filetype) then
          is_excluded = true
        end

        return not is_excluded
      end,
    })

    vim.api.nvim_set_keymap(
      "n",
      "<C-w><C-w>",
      "<CMD>lua WinPick()<CR>",
      { noremap = true, silent = true, desc = "Pick Windows" }
    )
  end,
})

function WinPick()
  local win_count = #vim.api.nvim_tabpage_list_wins(0)

  if win_count < 3 then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w><C-w>", true, false, true), "n", true)
  else
    local success, winid = pcall(require("winpick").select)

    if success and winid then
      vim.api.nvim_set_current_win(winid)
    end
  end
end
