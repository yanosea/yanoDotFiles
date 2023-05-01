return {
  {
    -- https://github.com/lewis6991/gitsigns.nvim
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = 'BufReadPost',
    -- https://github.com/nvim-lua/plenary.nvim
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function()
      vim.keymap.set('n', '<Leader>hb', '<CMD>Gitsigns blame_line<CR>', { desc = 'Show git blame on the current line' })
      vim.keymap.set('n', '<Leader>hp', '<CMD>Gitsigns preview_hunk<CR>', { desc = 'Show preview the hunk' })
      vim.keymap.set('n', '<Leader>hs', '<CMD>Gitsigns stage_hunk<CR>', { desc = 'Stage the hunk' })
      vim.keymap.set('n', '<Leader>hu', '<CMD>Gitsigns undo_stage_hunk<CR>',
      { desc = 'Undo the last call of stage hunk' })
      vim.keymap.set('n', '<Leader>hr', '<CMD>Gitsigns reset_hunk<CR>', { desc = 'Reset the lines of the hunk' })
    end,
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { hl = 'GitSignsAdd', text = ' ▎', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
          change = { hl = 'GitSignsChange', text = ' ▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          delete = { hl = 'GitSignsDelete', text = ' ', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          topdelete = { hl = 'GitSignsDelete', text = ' ', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '▎ ', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        },
        preview_config = {
          border = 'none',
          style = 'minimal',
        },
      })
    end,
  },
}
