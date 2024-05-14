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
  {
    -- https://github.com/williamboman/mason-lspconfig.nvim
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      -- https://github.com/williamboman/mason.nvim
      "williamboman/mason.nvim",
    },
    init = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- "awk_ls",
          "angularls",
          "arduino_language_server",
          "asm_lsp",
          "astro",
          "bashls",
          "clangd",
          "cssls",
          "denols",
          "diagnosticls",
          "docker_compose_language_service",
          "dockerls",
          "efm",
          "elmls",
          "eslint",
          "gopls",
          "gradle_ls",
          "html",
          "intelephense",
          "jedi_language_server",
          "jsonls",
          "jdtls",
          "kotlin_language_server",
          "lua_ls",
          "marksman",
          "neocmake",
          "omnisharp_mono",
          "perlnavigator",
          "powershell_es",
          "pyright",
          "rust_analyzer",
          "spectral",
          "sqlls",
          "tailwindcss",
          "taplo",
          "terraformls",
          "tsserver",
          "volar",
          "lemminx",
          "yamlls",
        },
        automatic_installation = true,
      })
    end,
  },
}
