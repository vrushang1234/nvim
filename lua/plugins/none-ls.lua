return {
	{
		"nvimtools/none-ls.nvim",
		event = "BufReadPre",
		dependencies = { "nvimtools/none-ls-extras.nvim" },
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.completion.spell,
					require("none-ls.diagnostics.eslint"),
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function(args)
					vim.lsp.buf.format({
						bufnr = args.buf,
						filter = function(client)
							return client.name == "null-ls"
						end,
						timeout_ms = 2000,
					})
				end,
			})
		end,
	},
}
