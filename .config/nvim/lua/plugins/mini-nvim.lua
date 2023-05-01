return {
  {
    -- https://github.com/echasnovski/mini.nvim
    'echasnovski/mini.nvim',
    lazy = false,
    config = function()
      vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
        pattern = '*',
        callback = function()
          require('mini.comment').setup({
            options = {
              ignore_blank_line = true,
              start_of_line = false,
              pad_comment_parts = true,
            },
            mappings = {
              comment_line = 'gcc',
              textobject = 'gc',
            },
          })
          require('mini.pairs').setup({})
          require('mini.splitjoin').setup({
            mappings = {
              toggle = 'gS',
              split = '',
              join = '',
            },
          })
          require('mini.surround').setup({
            mappings = {
              add = 'sa',
              delete = 'sd',
              find = 'sf',
              find_left = 'sF',
              highlight = 'sh',
              replace = 'sc',
              update_n_lines = 'sn',
              suffix_last = 'l',
              suffix_next = 'n',
            },
            silent = true,
          })
        end,
        once = true,
      })
    end,
  },
}
