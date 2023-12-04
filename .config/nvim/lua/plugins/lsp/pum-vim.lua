return {
  {
    -- https://github.com/Shougo/pum.vim
    "Shougo/pum.vim",
    config = function()
      vim.fn["pum#set_option"]({
        auto_select = true,
        padding = true,
        border = "none",
        preview = false,
        scrollbar_char = '▋',
      })

      local opts = { silent = true, noremap = true }
      vim.keymap.set('i', "<C-j>", "<Cmd>call pum#map#select_relative(+1)<CR>", opts)
      vim.keymap.set('i', "<C-k>", "<Cmd>call pum#map#select_relative(-1)<CR>", opts)
      vim.keymap.set('i', "<TAB>", "<Cmd>call pum#map#confirm()<CR>", opts)
      vim.keymap.set('i', "<TAB>", "<Cmd>call pum#map#confirm()<CR>", opts)
      vim.keymap.set('i', "<C-e>", "<Cmd>call pum#map#cancel()<CR>", opts)
    end,
  },
}
