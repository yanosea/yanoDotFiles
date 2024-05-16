lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "github/copilot.vim",
    "nvim-lua/plenary.nvim",
  },
  event = "VimEnter",
  opts = {
    debug = true,
  },
  init = function()
    vim.keymap.set("n", "<LEADER>Ct", "<CMD>CopilotChat<CR>", { silent = true, desc = "CopilotChat chat" })
    vim.keymap.set("n", "<LEADER>Cc", "<CMD>CopilotChatStop<CR>", { silent = true, desc = "CopilotChat stop" })
    vim.api.nvim_set_keymap(
      "n",
      "<LEADER>Cq",
      "<CMD>lua CopilotChatBuffer()<CR>",
      { noremap = true, silent = true, desc = "CopilotChat quick chat" }
    )
  end,
})

function CopilotChatBuffer()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end
