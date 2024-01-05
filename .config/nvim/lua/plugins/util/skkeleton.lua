return {
  {
    -- https://github.com/vim-skk/skkeleton
    "vim-skk/skkeleton",
    lazy = false,
    -- https://github.com/vim-denops/denops.vim
    dependencies = { "vim-denops/denops.vim" },
    init = function()
      vim.keymap.set('i',"<C-Space>", "<Plug>(skkeleton-toggle)")
      vim.keymap.set('c',"<C-Space>", "<Plug>(skkeleton-toggle)")
      local dictionaries = {}
      local handle = io.popen("ls $XDG_CONFIG_HOME/skk/*")
      if handle then
        for file in handle:lines() do
          table.insert(dictionaries, file)
        end
        handle:close()
      end
      vim.api.nvim_create_autocmd("User", {
        pattern = "skkeleton-initialize-pre",
        callback = function()
          vim.fn["skkeleton#config"]({
            eggLikeNewline = true,
            registerConvertResult = true,
            globalDictionaries = dictionaries,
            userJisyo = os.getenv("XDG_CONFIG_HOME") .. "/skk/.skkeleton",
          })
        end,
      })
    end,
  },
}
