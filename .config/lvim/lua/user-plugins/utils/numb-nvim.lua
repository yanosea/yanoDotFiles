lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  "/nacro90/numb.nvim",
  event = "CmdlineEnter",
  init = function()
    require("numb").setup({
      show_numbers = true,
      show_cursorline = true,
      hide_relativenumbers = true,
      number_only = false,
      centered_peeking = true,
    })
  end,
})
