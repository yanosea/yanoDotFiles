return {
  {
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufReadPre',
    config = function()
      local null_ls = require('null-ls')

      null_ls.setup({
        sources = {
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.diagnostics.textlint.with({
            filetypes = { 'markdown' },
            prefer_local = 'node_modules/.bin',
            condition = function(utils)
              return utils.has_file({ '.textlintrc', '.textlintrc.yml', '.textlintrc.json' })
            end,
          }),
        },
        on_attach = common_on_attach,
        diagnostics_format = '#{m} (#{s}: #{c})',
      })
    end,
  }
}
