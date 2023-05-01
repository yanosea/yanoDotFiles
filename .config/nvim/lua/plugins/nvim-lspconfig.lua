local common_on_attach = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil

  if client.supports_method('textDocument/formatting') then
    local augroup = vim.api.nvim_create_augroup('LspFormatting', { clear = false })
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
      end,
      group = augroup,
      buffer = bufnr,
    })
  end
end

local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " "
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

return {
  {
    -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
    lazy = true,
    event = { 'BufReadPre', 'LspAttach' },
    opts = {
      servers = {
        tailwindcss = {},
      },
    },
    config = function()
      local lspconfig = require('lspconfig')

      require('mason-lspconfig').setup_handlers({
        function(server)
          local buf_full_filename = vim.api.nvim_buf_get_name(0)
          local opts = { on_attach = common_on_attach }

          local node_root_dir = lspconfig.util.root_pattern('package.json')
          local is_node_repo = node_root_dir(buf_full_filename) ~= nil

          if server == 'denols' then
            if is_node_repo then return end
            opts.cmd = { 'deno', 'lsp', '--unstable' }
            opts.root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc')
            opts.init_options = { lint = true, unstable = true }
          elseif server == 'tsserver' then
            if not is_node_repo then return end
            opts.root_dir = node_root_dir
            opts.on_attach = disable_fmt_on_attach
          elseif server == 'tailwindcss' then
            local tailwind_root_dir = lspconfig.util.root_pattern('tailwind.config.[jt]s',
              'twind.config.[jt]s')
            if tailwind_root_dir(buf_full_filename) == nil then return end
          elseif server == 'jsonls' then
            opts.on_attach = disable_fmt_on_attach
          elseif server == 'cssls' then
            opts.filetypes = { 'css', 'scss', 'sass', 'less' }
          end

          lspconfig[server].setup(opts)
        end
      })

      vim.keymap.set('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>', { desc = 'show hover' })
      vim.keymap.set('n', 'gf', '<CMD>lua vim.lsp.buf.format({ async = true })<CR>', { desc = 'formatting' })
      vim.keymap.set('n', 'ga', '<CMD>lua vim.lsp.buf.code_action()<CR>', { desc = 'show available code actions' })
      vim.keymap.set('n', 'gn', '<CMD>lua vim.lsp.buf.rename()<CR>', { desc = 'rename definition' })
      vim.keymap.set('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>', { desc = 'show declarations' })
      vim.keymap.set('n', 'ge', '<CMD>lua vim.diagnostic.open_float()<CR>', { desc = 'show diagnostic' })
      vim.keymap.set('n', 'gi', '<CMD>Telescope lsp_implementations<CR>', { desc = 'lists all the implementations' })
      vim.keymap.set('n', 'gd', '<CMD>Telescope lsp_definitions<CR>', { desc = 'lists all the definitions' })
      vim.keymap.set('n', 'gt', '<CMD>Telescope lsp_type_definitions<CR>', { desc = 'lists all the type definitions' })
      vim.keymap.set('n', 'gr', '<CMD>Telescope lsp_references<CR>', { desc = 'lists all the references' })
      vim.keymap.set('n', 'gE', '<CMD>Telescope diagnostics<CR>', { desc = 'lists all the diagnostics' })
      vim.keymap.set('n', ']g', '<CMD>lua vim.diagnostic.goto_next()<CR>', { desc = 'go to next diagnostic' })
      vim.keymap.set('n', '[g', '<CMD>lua vim.diagnostic.goto_prev()<CR>', { desc = 'go to previous diagnostic' })
    end
  },
}
