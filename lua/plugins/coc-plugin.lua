return {
  {
    "neoclide/coc.nvim",
    dependencies = { "neoclide/coc.nvim" },
    branch = "release",
    build = "npm ci", -- ou "yarn install" dependendo do que você usa

    config = function()
      -- você pode configurar aqui, se quiser
    end,
  },
}
