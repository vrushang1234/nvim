return {
  {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "ts_ls",
          "lua_ls",
          "clangd",
          "rust_analyzer",
        },
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = {
        "pyright",
        "ts_ls",
        "lua_ls",
        "clangd",
        "rust_analyzer",
      }

      for _, server in ipairs(servers) do
        local opts = {
          capabilities = capabilities,
        }

        -- 💡 Special config for Lua language server
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

