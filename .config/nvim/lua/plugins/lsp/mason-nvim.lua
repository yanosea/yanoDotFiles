return{
  {
    -- https://github.com/williamboman/mason.nvim
    "williamboman/mason.nvim",
    opt = {
      ui = {
        border = "single",
        icons = {
          package_installed = ' ',
          package_pending = '↻ ',
          package_uninstalled = ' ',
        },
      },
    },
  },
}
