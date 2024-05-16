lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  "yuki-yano/fuzzy-motion.vim",
  dependencies = {
    "vim-denops/denops.vim",
    "lambdalisue/kensaku.vim",
  },
  event = "VimEnter",
  init = function()
    vim.g.fuzzy_motion_matchers = { "fzf", "kensaku" }

    vim.keymap.set("n", "<LEADER><SPACE>", "<CMD>FuzzyMotion<CR>", { silent = true, desc = "FuzzyMotion" })
  end,
})
