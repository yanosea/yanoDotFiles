return {
  {
    -- https://github.com/glacambre/firenvim
    "glacambre/firenvim",
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn["firenvim#install"](0)
    end,
    init = function()
      vim.g.firenvim_config = {
        globalSettings = { alt = "all" },
        localSettings = {
          [".*"] = {
            cmdline  = "neovim",
            content  = "text",
            priority = 0,
            selector = 'textarea:not([readonly], [aria-readonly]), div[role="textbox"]',
            takeover = "always"
          },
        },
      }
    end,
  }
}
