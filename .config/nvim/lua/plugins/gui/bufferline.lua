return {
  {
    -- https://github.com/akinsho/bufferline.nvim
    "akinsho/bufferline.nvim",
    lazy = false,
    -- https://github.com/nvim-tree/nvim-web-devicons
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          numbers = "ordinal",
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = true,
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            if context.buffer:current() then
              return ""
            end
            return ''
          end,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            }
          },
          color_icon = true,
          get_element_icon = function(element)
            local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(element.filetype,
              { default = false })
            return icon, hl
          end,
          show_buffer_icons = true,
          show_tab_indicators = true,
          show_duplicate_prefix = false,
          persist_buffer_sort = true,
          separator_style = "slope",
          enforce_regular_tabs = true,
          always_show_bufferline = true,
        },
      })
    end,
  },
}