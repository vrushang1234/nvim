return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope", -- lazy load on :Telescope command
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
  },
  config = function()
   require("telescope").setup({
  defaults = {
    layout_strategy = "vertical",
    sorting_strategy = "ascending",
    layout_config = {
      vertical = {
        width = 0.9,
        height = 0.95,
        preview_height = 0.6,
        prompt_position = "top",
      },
    },
    winblend = 0,
  },
})
   local hl = vim.api.nvim_set_hl
    local groups = {
      "TelescopeNormal",
      "TelescopeBorder",
      "TelescopePromptNormal",
      "TelescopePromptBorder",
      "TelescopeResultsNormal",
      "TelescopeResultsBorder",
      "TelescopePreviewNormal",
      "TelescopePreviewBorder",
      "TelescopeTitle",
      "TelescopePromptTitle",
      "TelescopeResultsTitle",
      "TelescopePreviewTitle",
    }

    for _, group in ipairs(groups) do
      hl(0, group, { bg = "none" })
    end
  end,
}


