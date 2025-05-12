return {
	-- Mason: LSP/DAP/Formatter installer
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		opts = {
			ensure_installed = { "prettier" },
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
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				"pyright",
				"ts_ls",
				"lua_ls",
				"clangd",
				"rust_analyzer",
				"cssls",
				"html",
			}

			for _, server in ipairs(servers) do
				local opts = { capabilities = capabilities }

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
