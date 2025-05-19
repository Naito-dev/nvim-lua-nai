return {
  {
    "akinsho/bufferline.nvim",
    tag = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "none",
          close_command = "bdelete! %d",       -- fecha buffer
          right_mouse_command = "bdelete! %d", -- fecha buffer com clique direito
          left_mouse_command = "buffer %d",    -- muda buffer com clique esquerdo
          diagnostics = "nvim_lsp",
          offsets = {
            {
              filetype = "NvimTree",
              text = "Explorer",
              highlight = "Directory",
              text_align = "left",
            },
          },
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = false,
          separator_style = "thin",
          always_show_bufferline = true,
        },
      })
    end,
  },
}

