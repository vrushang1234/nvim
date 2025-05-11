return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "ts_ls", -- ✅ use "ts_ls" here even if "ts_ls" is internally mapped
          "lua_ls",
          "clangd",
          "rust_analyzer",
        },
        automatic_installation = false, -- optional but safe
        automatic_enable = false,       -- ✅ prevents the `.enable()` error
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = {
        "pyright",
        "ts_ls", -- ✅ match the mason alias
        "lua_ls",
        "clangd",
        "rust_analyzer",
      }

      for _, server in ipairs(servers) do
        local opts = {
          capabilities = capabilities,
        }

        if server == "lua_ls" then
          opts.settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          }
        end

        lspconfig[server].setup(opts)
      end
    end,
  },
}

