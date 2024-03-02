return {
  {
    -- https://github.com/yukimemi/futago.vim
    "yukimemi/futago.vim",
    dependencies = {
      -- https://github.com/vim-denops/denops.vim
      "vim-denops/denops.vim",
    },
    lazy = false,
    init = function()
      vim.g['denops#server#deno_args'] = {'-q', '--no-lock', '--unstable-kv', '-A'}
      vim.g['futago_chat_path'] = os.getenv("GOOGLE_DRIVE") .. "/futago/chat"
      vim.g['futago_log_file'] = os.getenv("GOOGLE_DRIVE") .. "/futago/log/futago.log"
      vim.g['futago_history_db'] = os.getenv("GOOGLE_DRIVE") .. "/futago/db/history.db"
      vim.keymap.set('n', "<LEADER>gt", "<CMD>call futago#start_chat()<CR>")
      vim.keymap.set('n', "<LEADER>gf", "<CMD>FutagoHistory<CR>")
    end,
  },
}
