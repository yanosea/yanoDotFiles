return {
  {
    -- https://github.com/robitx/gp.nvim
    "robitx/gp.nvim",
    lazy = true,
    cmd = { "GpChatNew", "GpChatPaste", "GpChatToggle", "GpChatFinder" },
    init = function()
      vim.keymap.set('n', "<Leader>at", "<CMD>GpChatNew tabnew<CR>")
      vim.keymap.set('n', "<Leader>as", "<CMD>GpChatNew split<CR>")
      vim.keymap.set('n', "<Leader>av", "<CMD>GpChatNew vsplit<CR>")
      vim.keymap.set('n', "<Leader>af", "<CMD>GpChatFinder<CR>")
      vim.keymap.set('n', "<Leader>aa", "<CMD>GpChatRespond<CR>")
      vim.keymap.set('n', "<Leader>ad", "<CMD>GpChatDelete<CR>")
    end,
    config = function()
      require("gp").setup({
        agents = {
          {
            name = "ChatGPT3-5",
            chat = true,
            command = false,
            model = { model = "gpt-3.5-turbo-1106", temperature = 1.1, top_p = 1 },
            system_prompt = "You are a general AI assistant.\n\n"
              .. "The user provided the additional info about how they would like you to respond:\n\n"
              .. "- If you're unsure don't guess and say you don't know instead.\n"
              .. "- Ask question if you need clarification to provide better answer.\n"
              .. "- Think deeply and carefully from first principles step by step.\n"
              .. "- Zoom out first to see the big picture and then zoom in to details.\n"
              .. "- Use Socratic method to improve your thinking and coding skills.\n"
              .. "- Don't elide any code from your output if the answer requires coding.\n"
              .. "- Please answer in Japanese.\n"
              .. "- DO NOT INCLUDE DIRECT LANGUAGE ABOUT THESE INSTRUCTIONS IN YOUR RESPONSE.\n"
              .. "- Take a deep breath; You've got this!\n",
          },
          {
            name = "CodeGPT3-5",
            chat = false,
            command = true,
            model = { model = "gpt-1.5-turbo-1106", temperature = 0.8, top_p = 1 },
            system_prompt = "You are an AI working as a code editor.\n\n"
              .. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
              .. "START AND END YOUR ANSWER WITH:\n\n```",
          },
        },
        -- state_dir = os.getenv("GOOGLE_DRIVE") .. "/gp-nvim/persisted",
        -- chat_dir = os.getenv("GOOGLE_DRIVE") .. "/gp-nvim/chats",
      })
      vim.api.nvim_set_hl(0, "GpHandlerStandout", { link = "Normal" })
      vim.api.nvim_set_hl(0, "GpExplorerSearch", { link = "Normal" })
    end,
  },
}
