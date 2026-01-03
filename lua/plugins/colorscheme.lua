return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- Make sure it loads first
	config = function()
		require("catppuccin").setup({
            transparent_background = true,

			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},

			flavour = "mocha",
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
	end,
}
