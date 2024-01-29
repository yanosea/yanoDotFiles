return {
  {
    -- https://github.com/williamboman/mason.nvim
    "williamboman/mason.nvim",
    dependencies = {
      -- https://github.com/williamboman/mason-lspconfig.nvim
      "williamboman/mason-lspconfig.nvim",
    },
    init = function()
      require("mason").setup({
        ui = {
          border = "single",
          icons = {
            package_installed = ' ',
            package_pending = '↻ ',
            package_uninstalled = ' ',
          },
        },
      })
    end,
  },
}
