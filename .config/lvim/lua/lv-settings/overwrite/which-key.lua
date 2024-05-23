-- which-key.nvim
-- chatgpt
lvim.builtin.which_key.mappings["a"] = {
  name = "+Chatgpt",
  t = { "<CMD>GpChatNew tabnew<CR>", "GpChatNew tabnew" },
  s = { "<CMD>GpChatNew split<<CR>", "GpChatNew split" },
  v = { "<CMD>GpChatNew vsplit<CR>", "GpChatNew vsplit" },
  p = { "<CMD>GpChatNew popup<CR>", "GpChatNew popup" },
  e = { "<CMD>GpChatFinder<CR>", "GpChat finder" },
}
-- copilot chat
lvim.builtin.which_key.mappings["C"] = {
  name = "+Copilot chat",
  t = { "<CMD>CopilotChat<CR>", "CopilotChat chat" },
  q = { "<CMD>lua CopilotChatBuffer()<CR>", "CopilotChat quick chat" },
}
-- toggleterm
lvim.builtin.which_key.mappings["t"] = { "<CMD>ToggleTerm<CR>", "ToggleTerm" }
-- fuzzy motion
lvim.builtin.which_key.mappings["<SPACE>"] = { "<CMD>FuzzyMotion<CR>", "FuzzyMotion" }
-- yankring
lvim.builtin.which_key.mappings["y"] = {
  name = "+Yankring",
  h = { "<CMD>YRShow<CR>", "YankRing show" },
}
-- outline
lvim.builtin.which_key.mappings["o"] = { "<CMD>Outline<CR>", "Outline" }
-- lsp
table.insert(lvim.builtin.which_key.mappings["l"], {
  -- todo-comments
  t = { "<CMD>TodoLocList<CR>", "TodoLocList" },
  -- trouble
  T = { "<CMD>TroubleToggle<CR>", "TroubleToggle" },
})
