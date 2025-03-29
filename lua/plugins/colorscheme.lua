return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Make sure it loads first
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
        },
        telescope = true,
        which_key = true,
        cmp = true,
        gitsigns = true,
        nvimtree = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")

    -- Optional: extra transparent highlights
    vim.cmd([[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight Pmenu guibg=NONE ctermbg=NONE
      highlight SignColumn guibg=NONE ctermbg=NONE
      highlight VertSplit guibg=NONE ctermbg=NONE
    ]])
  end,
}

