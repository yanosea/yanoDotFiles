table.insert(lvim.plugins, {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  event = { "BufRead", "BufEnter" },
  init = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
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
})
-- formatters
require("lvim.lsp.null-ls.formatters").setup({
  {
    name = "stylua",
    filetypes = { "lua" },
  },
  {
    name = "prettier",
    args = { "--print-width", "100" },
    filetypes = { "typescript", "typescriptreact" },
  },
})
-- linters
require("lvim.lsp.null-ls.linters").setup({
  {
    name = "shellcheck",
    args = { "--severity", "warning" },
  },
})
-- code actions
require("lvim.lsp.null-ls.code_actions").setup({
  {
    name = "proselint",
  },
})
