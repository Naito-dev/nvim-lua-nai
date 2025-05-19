return {
  {
    "Chiel92/vim-autoformat",
    config = function()
      vim.keymap.set("n", "<C-f>", ":Autoformat<CR>", { desc = "Formatar código", noremap = true, silent = true })
    end,
  },
}

