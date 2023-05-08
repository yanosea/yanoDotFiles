return {
  {
    -- https://github.com/sindrets/diffview.nvim
    'sindrets/diffview.nvim',
    lazy = true,
    dependencies = {
      -- https://github.com/nvim-lua/plenary.nvim
      'nvim-lua/plenary.nvim',
      -- https://github.com/nvim-tree/nvim-web-devicons
      'nvim-tree/nvim-web-devicons',
    },
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
    init = function()
      vim.keymap.set('n', '<Leader>gd', '<CMD>DiffviewOpen<CR>', { desc = 'show git diff' })
      vim.keymap.set('n', '<Leader>gh', '<CMD>DiffviewFileHistory<CR>', { desc = 'show current branch file history' })
      vim.keymap.set('n', '<Leader>gl', '<CMD>DiffviewFileHistory %<CR>', { desc = 'show current file history' })
    end,
    config = function()
      local act = require('diffview.actions')
      require('diffview').setup({
        diff_binaries = false,
        enhanced_diff_hl = false,
        use_icons = true,
        show_help_hints = true,
        watch_index = true,
        icons = {
          folder_closed = '',
          folder_open = '',
        },
        signs = {
          fold_closed = '',
          fold_open = '',
          done = '✓',
        },
        view = {
          default = {
            layout = 'diff2_horizontal',
            winbar_info = false,
          },
          merge_tool = {
            layout = 'diff3_horizontal',
            disable_diagnostics = true,
            winbar_info = true,
          },
          file_history = {
            layout = 'diff2_horizontal',
            winbar_info = false,
          },
        },
        file_panel = {
          listing_style = 'tree',
          tree_options = {
            flatten_dirs = true,
            folder_statuses = 'only_folded',
          },
          win_config = {
            position = 'left',
            width = 32,
            win_opts = {}
          },
        },
        file_history_panel = {
          log_options = {
            git = {
              single_file = { diff_merges = 'combined' },
              multi_file = { diff_merges = 'first-parent' },
            },
            hg = {
              single_file = {},
              multi_file = {},
            },
          },
          win_config = {
            position = 'bottom',
            height = 16,
            win_opts = {}
          },
        },
        commit_log_panel = {
          win_config = {
            win_opts = {},
          }
        },
        default_args = {
          DiffviewOpen = {},
          DiffviewFileHistory = {},
        },
        hooks = {},
        keymaps = {
          disable_defaults = true,
          view = {
            { 'n', '<ESC>',      act.close,                     { desc = 'close view' } },
            { 'n', 'q',          act.close,                     { desc = 'close view' } },
            { 'n', '<TAB>',      act.select_next_entry,         { desc = 'open the diff for the next file' } },
            { 'n', '<S-TAB>',    act.select_prev_entry,         { desc = 'open the diff for the previous file' } },
            { 'n', '<C-n>',      act.select_next_entry,         { desc = 'open the diff for the next file' } },
            { 'n', '<C-p>',      act.select_prev_entry,         { desc = 'open the diff for the previous file' } },
            { 'n', 'gf',         act.goto_file_edit,            { desc = 'open the file in the previous tabpage' } },
            { 'n', 'gF',         act.goto_file_tab,             { desc = 'open the file in a new tabpage' } },
            { 'n', '<Leader>e',  act.focus_files,               { desc = 'bring focus to the file panel' } },
            { 'n', '<Leader>b',  act.toggle_files,              { desc = 'toggle the file panel.' } },
            { 'n', 'gx',         act.cycle_layout,              { desc = 'cycle through available layouts.' } },
            { 'n', 'x[',         act.prev_conflict,             { desc = 'merge-tool: jump to the previous conflict' } },
            { 'n', 'x]',         act.next_conflict,             { desc = 'merge-tool: jump to the next conflict' } },
            { 'n', '<Leader>co', act.conflict_choose('ours'),   { desc = 'choose the OURS version of a conflict' } },
            { 'n', '<Leader>ct', act.conflict_choose('theirs'), { desc = 'choose the THEIRS version of a conflict' } },
            { 'n', '<Leader>cb', act.conflict_choose('base'),   { desc = 'choose the BASE version of a conflict' } },
            { 'n', '<Leader>ca', act.conflict_choose('all'),    { desc = 'choose all the versions of a conflict' } },
            { 'n', 'dx',         act.conflict_choose('none'),   { desc = 'delete the conflict region' } },
          },
          diff1 = {
            { 'n', '?', act.help({ 'view', 'diff1' }), { desc = 'open the help panel' } },
          },
          diff2 = {
            { 'n', '?', act.help({ 'view', 'diff2' }), { desc = 'open the help panel' } },
          },
          diff3 = {
            {
              { 'n', 'x' }, '2do', act.diffget('ours'),
              {
                desc = 'obtain the diff hunk from the OURS version of the file',
              },
            },
            {
              { 'n', 'x' }, '3do', act.diffget('theirs'),
              {
                desc = 'obtain the diff hunk from the THEIRS version of the file',
              },
            },
            { 'n', '?', act.help({ 'view', 'diff3' }), { desc = 'open the help panel' } }
          },
          diff4 = {
            -- Mappings in 4-way diff layouts
            {
              { 'n', 'x' }, '1do', act.diffget('base'),
              {
                desc = 'obtain the diff hunk from the BASE version of the file',
              }
            },
            {
              { 'n', 'x' }, '2do', act.diffget('ours'),
              {
                desc = 'obtain the diff hunk from the OURS version of the file',
              },
            },
            {
              { 'n', 'x' }, '3do', act.diffget('theirs'),
              {
                desc = 'obtain the diff hunk from the THEIRS version of the file',
              },
            },
            { 'n', '?', act.help({ 'view', 'diff4' }), { desc = 'open the help panel' } },
          },
          file_panel = {
            { 'n', '<ESC>',     act.close,               { desc = 'close file panel' } },
            { 'n', 'q',         act.close,               { desc = 'close file panel' } },
            { 'n', 'j',         act.next_entry,          { desc = 'bring the cursor to the next file entry' } },
            { 'n', '<DOWN>',    act.next_entry,          { desc = 'bring the cursor to the next file entry' } },
            { 'n', 'k',         act.prev_entry,          { desc = 'bring the cursor to the previous file entry.' } },
            { 'n', '<UP>',      act.prev_entry,          { desc = 'bring the cursor to the previous file entry.' } },
            { 'n', '<CR>',      act.select_entry,        { desc = 'open the diff for the selected entry.' } },
            { 'n', '-',         act.toggle_stage_entry,  { desc = 'stage / unstage the selected entry.' } },
            { 'n', 'S',         act.stage_all,           { desc = 'stage all entries.' } },
            { 'n', 'U',         act.unstage_all,         { desc = 'unstage all entries.' } },
            { 'n', 'X',         act.restore_entry,       { desc = 'restore entry to the state on the left side.' } },
            { 'n', 'L',         act.open_commit_log,     { desc = 'open the commit log panel.' } },
            { 'n', '<C-b>',     act.scroll_view(-0.25),  { desc = 'scroll the view up' } },
            { 'n', '<C-f>',     act.scroll_view(0.25),   { desc = 'scroll the view down' } },
            { 'n', '<C-j>',     act.select_next_entry,   { desc = 'open the diff for the next file' } },
            { 'n', '<C-k>',     act.select_prev_entry,   { desc = 'open the diff for the previous file' } },
            { 'n', 'gf',        act.goto_file_edit,      { desc = 'open the file in the previous tabpage' } },
            { 'n', 'gF',        act.goto_file_tab,       { desc = 'open the file in a new tabpage' } },
            { 'n', 'i',         act.listing_style,       { desc = 'toggle between "list " and "tree " views' } },
            { 'n', 'f',         act.toggle_flatten_dirs, { desc = 'flatten empty subdirectories in tree listing style.' } },
            { 'n', 'R',         act.refresh_files,       { desc = 'update stats and entries in the file list.' } },
            { 'n', '<Leader>e', act.focus_files,         { desc = 'bring focus to the file panel' } },
            { 'n', '<Leader>b', act.toggle_files,        { desc = 'toggle the file panel' } },
            { 'n', 'gx',        act.cycle_layout,        { desc = 'cycle available layouts' } },
            { 'n', 'x]',        act.prev_conflict,       { desc = 'go to the previous conflict' } },
            { 'n', 'x[',        act.next_conflict,       { desc = 'go to the next conflict' } },
            { 'n', '?',         act.help('file_panel'),  { desc = 'open the help panel' } },
          },
          file_history_panel = {
            { 'n', '<ESC>',     act.close,                      { desc = 'close file panel' } },
            { 'n', 'q',         act.close,                      { desc = 'close file panel' } },
            { 'n', '!',         act.options,                    { desc = 'open the option panel' } },
            { 'n', '<C-A-d>',   act.open_in_diffview,           { desc = 'open the entry under the cursor in a diffview' } },
            { 'n', 'L',         act.open_commit_log,            { desc = 'show commit details' } },
            { 'n', 'zR',        act.open_all_folds,             { desc = 'expand all folds' } },
            { 'n', 'zM',        act.close_all_folds,            { desc = 'collapse all folds' } },
            { 'n', 'j',         act.next_entry,                 { desc = 'bring the cursor to the next file entry' } },
            { 'n', '<DOWN>',    act.next_entry,                 { desc = 'bring the cursor to the next file entry' } },
            { 'n', 'k',         act.prev_entry,                 { desc = 'bring the cursor to the previous file entry.' } },
            { 'n', '<UP>',      act.prev_entry,                 { desc = 'bring the cursor to the previous file entry.' } },
            { 'n', '<CR>',      act.select_entry,               { desc = 'open the diff for the selected entry.' } },
            { 'n', '<C-b>',     act.scroll_view(-0.25),         { desc = 'scroll the view up' } },
            { 'n', '<C-f>',     act.scroll_view(0.25),          { desc = 'scroll the view down' } },
            { 'n', '<C-j>',     act.select_next_entry,          { desc = 'open the diff for the next file' } },
            { 'n', '<C-k>',     act.select_prev_entry,          { desc = 'open the diff for the previous file' } },
            { 'n', 'gf',        act.goto_file_edit,             { desc = 'open the file in the previous tabpage' } },
            { 'n', 'gF',        act.goto_file_tab,              { desc = 'open the file in a new tabpage' } },
            { 'n', '<Leader>e', act.focus_files,                { desc = 'bring focus to the file panel' } },
            { 'n', '<Leader>b', act.toggle_files,               { desc = 'toggle the file panel' } },
            { 'n', 'gx',        act.cycle_layout,               { desc = 'cycle available layouts' } },
            { 'n', '?',         act.help('file_history_panel'), { desc = 'open the help panel' } },
            { 'n', 'y', act.copy_hash,
              { desc = 'copy the commit hash of the entry under the cursor', },
            },
          },
          option_panel = {
            { 'n', '<TAB>', act.select_entry,         { desc = 'change the current option' } },
            { 'n', 'q',     act.close,                { desc = 'close the panel' } },
            { 'n', '?',     act.help('option_panel'), { desc = 'open the help panel' } },
          },
          help_panel = {
            { 'n', 'q',     act.close, { desc = 'close help menu' } },
            { 'n', '<ESC>', act.close, { desc = 'close help menu' } },
          },
        },
      })
    end,
  },
}
