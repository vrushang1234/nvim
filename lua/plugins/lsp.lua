return {
	-- Mason: LSP/DAP/Formatter installer
	{
  "mason-org/mason-lspconfig.nvim",
  dependencies = { "mason-org/mason.nvim" },
  opts = {
    ensure_installed = { "pyright", "ts_ls", "lua_ls", "clangd", "rust_analyzer", "cssls", "html" },
    -- If you prefer auto-enabling, set this to true (default) and
    -- you can remove the vim.lsp.enable loop above.
    automatic_enable = false,
  },
},

	-- Mason-LSPConfig: bridges mason and nvim-lspconfig
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"ts_ls",
					"lua_ls",
					"clangd",
					"rust_analyzer",
					"cssls",
					"html",
				},
				automatic_enable = false,
			})
		end,
	},

	-- LSPConfig: actual LSP client configuration
	{
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    -- Diagnostics UI
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      float = { border = "rounded", source = "always" },
    })

    -- Capabilities for nvim-cmp, apply to ALL servers
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    vim.lsp.config("*", { capabilities = capabilities })  -- default for every server (0.11+)

    -- Per-server settings (only when you need them)
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })

    -- If you keep auto-enable OFF below, enable explicitly:
    for _, server in ipairs({ "pyright", "ts_ls", "lua_ls", "clangd", "rust_analyzer", "cssls", "html" }) do
      vim.lsp.enable(server)
    end
  end,
},
}
