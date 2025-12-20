return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "pyright",
        "ts_ls",
        "lua_ls",
        "clangd",
        "rust_analyzer",
        "cssls",
        "html",
      },
      automatic_installation = false,
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })

      for _, server in ipairs({
        "pyright",
        "ts_ls",
        "lua_ls",
        "clangd",
        "rust_analyzer",
        "cssls",
        "html",
      }) do
        vim.lsp.enable(server)
      end
    end,
  },
}

