return {
  {
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    'lukas-reineke/indent-blankline.nvim',
    lazy = false,
    -- https://github.com/nvim-treesitter/nvim-treesitter
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufRead", "BufNewFile" },
    main = 'ibl',
    init = function()
      vim.opt.list = true
      vim.opt.listchars:append ''
      vim.opt.listchars:append 'space:⋅'
    end,
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        show_start = true,
        show_end = false,
        highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
        },
        exclude = {
          node_type = {
            c = { "preproc_include" },
          },
        },
        include = {
          node_type = {
            go = { "import_declaration" },
            lua = { "return_statement", "table_constructor" },
          },
        },
      },
      exclude = {
        filetypes = {
          "NvimTree",
          "Trouble",
          "dashboard",
          "floaterm",
          "fugitive",
          "help",
          "lazy",
          "log",
          "mason",
          "neogit",
        },
      },
    },
    config = function(_, opts)
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)
      vim.g.rainbow_delimiters = { highlight = opts.scope.highlight }
      require("ibl").setup(opts)
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
}
