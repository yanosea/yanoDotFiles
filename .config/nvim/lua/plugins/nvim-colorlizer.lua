return {
  {
    -- https://github.com/norcalli/nvim-colorizer.lua
    'norcalli/nvim-colorizer.lua',
    lazy = true,
    event = 'BufRead',
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
    init = function()
      require('colorizer').setup({})
    end,
  },
}
