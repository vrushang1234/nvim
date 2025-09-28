return {
  "sainnhe/everforest",
  name = "everforest",
  priority = 1000,
  config = function()
    vim.g.everforest_background = "hard"

    vim.cmd.colorscheme("everforest")
  end,
}

