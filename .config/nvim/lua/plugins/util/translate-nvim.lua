return {
  {
    -- https://github.com/uga-rosa/translate.nvim
    "uga-rosa/translate.nvim",
    lazy = false,
    cmd = "Translate",
    init = function()
      require("translate").setup({
        default = {
          command = "google",
        },
        preset = {
          output = {
            split = {
              append = true,
            },
          },
        }
      })
    end
  },
}
