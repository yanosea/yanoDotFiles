return {
  {
    -- https://github.com/nvimdev/dashboard-nvim
    'glepnir/dashboard-nvim',
    lazy = true,
    event = 'VimEnter',
    -- https://github.com/nvim-tree/nvim-web-devicons
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    config = function()
      require('dashboard').setup({
        theme = 'hyper',
        disable_move = true,
        shortcut_type = 'number',
        change_to_vcs_root = true,
        hide = {
          statusline = false,
          tabline = false,
          winbar = false,
        },
        config = {
          packages = { enable = true },
          project = {
            enable = true,
            action = 'Telescope find_files cwd='
          },
          mru = { enable = true, },
          shortcut = {
            {
              icon = '󰒲',
              icon_hl = '@variable',
              desc = '  Lazy',
              group = 'Label',
              action = 'Lazy',
              key = 'L',
            },
            {
              icon = ',',
              desc = ' Update',
              icon_hl = '@variable',
              group = 'Label',
              action = 'Lazy update',
              key = 'U',
            },
            {
              icon = '󰈢 ',
              desc = ' Files',
              group = 'Number',
              action = 'Telescope find_files',
              key = 'F',
            },
            {
              icon = '󰭎',
              desc = '  Explorer',
              group = 'Number',
              action = 'Telescope file_browser',
              key = 'E',
            },
            {
              icon = '',
              desc = '  Grep',
              group = 'Number',
              action = 'Telescope live_grep',
              key = 'G',
            },
          },
          header = {
            '',
            '██╗   ██╗ █████╗ ███╗   ██╗ ██████╗ ███████╗███████╗ █████╗ ',
            '╚██╗ ██╔╝██╔══██╗████╗  ██║██╔═══██╗██╔════╝██╔════╝██╔══██╗',
            ' ╚████╔╝ ███████║██╔██╗ ██║██║   ██║███████╗█████╗  ███████║',
            '  ╚██╔╝  ██╔══██║██║╚██╗██║██║   ██║╚════██║██╔══╝  ██╔══██║',
            '   ██║   ██║  ██║██║ ╚████║╚██████╔╝███████║███████╗██║  ██║',
            '   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝',
            '',
          },
          footer = {
            '',
            '[ 🏹 yanosea ]',
            '',
          },
        },
      })
    end,
  },
}
