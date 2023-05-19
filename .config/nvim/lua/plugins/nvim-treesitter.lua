return {
  {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = 'BufRead',
    config = function()
      require('nvim-treesitter.configs').setup({
        autotag = { enable = true },
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        ensure_installed = {
          'bash',
          'blueprint',
          'c',
          'c_sharp',
          'cmake',
          'comment',
          'cpp',
          'css',
          'dart',
          'diff',
          'dockerfile',
          'elm',
          'fish',
          'git_config',
          'git_rebase',
          'gitattributes',
          'gitcommit',
          'gitignore',
          'go',
          'gomod',
          'gosum',
          'graphql',
          'html',
          'ini',
          'java',
          'javascript',
          'jsdoc',
          'json',
          'jsonc',
          'kotlin',
          'lua',
          'make',
          'markdown',
          'markdown_inline',
          'passwd',
          'php',
          'prisma',
          'python',
          'regex',
          'ruby',
          'rust',
          'scss',
          'scala',
          'sparql',
          'sql',
          'swift',
          'terraform',
          'toml',
          'tsx',
          'typescript',
          'vhs',
          'vim',
          'vue',
          'yaml',
        }
      })
    end
  },
}
