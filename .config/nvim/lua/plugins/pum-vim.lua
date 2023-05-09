return {
  {
    -- https://github.com/Shougo/pum.vim
    'Shougo/pum.vim',
    config = function()
      vim.fn['pum#set_option']({
        auto_select = true,
        padding = true,
        max_horizontal_items = 3,
      })

      local opts = { silent = true, noremap = true }
      vim.keymap.set('i', '<TAB>', '<Cmd>call pum#map#confirm()<CR>', opts)
    end,
  },
}
