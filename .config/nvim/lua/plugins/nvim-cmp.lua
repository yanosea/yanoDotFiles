return {
  {
    -- https://github.com/hrsh7th/nvim-cmp
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = { 'BufReadPre', 'LspAttach' },
    dependencies = {
      -- https://github.com/hrsh7th/cmp-nvim-lsp
      'hrsh7th/cmp-nvim-lsp',
      -- https://github.com/hrsh7tth/vim-vsnip
      'hrsh7th/vim-vsnip',
      -- https://github.com/roobert/tailwindcss-colorizer-cmp.nvim
      'roobert/tailwindcss-colorizer-cmp.nvim',
    },
    config = function()
      require('cmp').setup({
        window = {
          completion = require('cmp').config.window.bordered(),
          documentation = require('cmp').config.window.bordered(),
        },
        mapping = require('cmp').mapping.preset.insert({
          ['<C-k>'] = require('cmp').mapping.select_prev_item(),
          ['<C-j>'] = require('cmp').mapping.select_next_item(),
          ['<C-Space>'] = require('cmp').mapping.complete(),
          ['<TAB>'] = require('cmp').mapping.confirm({ select = true }),
        }),
        sources = require('cmp').config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'path' },
          { name = 'buffer' },
          { name = 'nvim_lua' },
          { name = 'luasnip' },
          { name = 'cmdline' },
          { name = 'git' },
        }),
      })
      require('tailwindcss-colorizer-cmp').setup({})
      require('cmp').config.formatting = {
        format = require('tailwindcss-colorizer-cmp').formatter
      }
      require('mason-lspconfig').setup_handlers({ function(server)
        local opt = {
          capabilities = require('cmp_nvim_lsp').update_capabilities(
            vim.lsp.protocol.make_client_capabilities()
          )
        }
        require('lspconfig')[server].setup(opt)
      end })
      vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
      )
    end,
  },
}
