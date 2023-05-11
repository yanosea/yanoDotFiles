return {
  {
    -- https://github.com/Shougo/ddc.vim
    'Shougo/ddc.vim',
    lazy = false,
    dependencies = {
      -- https://github.com/vim-denops/denops.vim
      'vim-denops/denops.vim',
      -- UI
      -- https://github.com/Shougo/pum.vim
      'Shougo/pum.vim',
      -- https://github.com/Shougo/ddc-ui-pum
      'Shougo/ddc-ui-pum',
      -- Source
      -- https://github.com/Shougo/ddc-source-around
      'Shougo/ddc-source-around',
      -- https://github.com/Shougo/ddc-source-nvim-lsp
      'Shougo/ddc-source-nvim-lsp',
      -- https://github.com/LumaKernel/ddc-source-file
      'LumaKernel/ddc-source-file',
      -- Matcher
      -- https://github.com/Shougo/ddc-filter-matcher_head
      'Shougo/ddc-matcher_head',
      -- https://github.com/Shougo/ddc-filter-matcher_length
      'Shougo/ddc-matcher_length',
      -- Sorter
      -- https://github.com/Shougo/ddc-filter-sorter_rank
      'Shougo/ddc-sorter_rank',
      -- Converter
      -- https://github.com/Shougo/ddc-filter-converter_remove_overlap
      'Shougo/ddc-converter_remove_overlap',
      -- Preview
      -- https://github.com/matsui54/denops-popup-preview.vim
      'matsui54/denops-popup-preview.vim',
      -- https://github.com/matsui54/denops-signature_help
      'matsui54/denops-signature_help',
    },
    config = function()
      local patch_global = vim.fn['ddc#custom#patch_global']

      patch_global('ui', 'pum')

      patch_global('sources', {
        'nvim-lsp',
        'file',
        'around',
      })

      patch_global('sourceOptions', {
        _ = {
          matchers = { 'matcher_head', 'matcher_length' },
          sorters = { 'sorter_rank' },
          converters = { 'converter_remove_overlap' },
          ignoreCase = true,
        },
        around = { mark = '[A]' },
        ['nvim-lsp'] = {
          mark = '[LS]',
          forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
        },
      })

      local opts = { silent = true, noremap = true }
      vim.keymap.set('i', '<DOWN>', '<Cmd>call pum#map#select_relative(+1)<CR>', opts)
      vim.keymap.set('i', '<UP>', '<Cmd>call pum#map#select_relative(-1)<CR>', opts)

      vim.fn['ddc#enable']()
    end,
  },
}
