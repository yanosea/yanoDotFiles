-- which-key.nvim
-- chatgpt
lvim.builtin.which_key.mappings["a"] = {
  name = "+chatgpt",
  t = { "<CMD>GpChatNew tabnew<CR>", "GpChatNew tabnew" },
  s = { "<CMD>GpChatNew split<<CR>", "GpChatNew split" },
  v = { "<CMD>GpChatNew vsplit<CR>", "GpChatNew vsplit" },
  p = { "<CMD>GpChatNew popup<CR>", "GpChatNew popup" },
  e = { "<CMD>GpChatFinder<CR>", "GpChat finder" },
}
-- toggleterm
lvim.builtin.which_key.mappings["t"] = { "<CMD>ToggleTerm<CR>", "ToggleTerm" }
