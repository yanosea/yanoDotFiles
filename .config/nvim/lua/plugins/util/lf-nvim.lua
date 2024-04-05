return {
  {
    -- https://github.com/lmburns/lf.nvim
    "lmburns/lf.nvim",
    lazy = false,
    dependencies = {
      -- https://github.com/akinsho/toggleterm.nvim
      "akinsho/toggleterm.nvim",
    },
    init = function()
      require("lf").setup({
        default_action = "drop",
        default_actions = {
          ["<C-t>"] = "tabedit",
          ["<C-s>"] = "split",
          ["<C-v>"] = "vsplit",
          ["<C-o>"] = "tab drop",
        },
        dir = "",
        direction = "float",
        border = "single",
        escape_quit = true,
        focus_on_open = true,
        mappings = true,
        default_file_manager = true,
      })
      vim.g.lf_netrw = true
      vim.keymap.set("n", "<LEADER>f", "<CMD>Lf<CR>", {noremap = true})
    end,
  },
}
