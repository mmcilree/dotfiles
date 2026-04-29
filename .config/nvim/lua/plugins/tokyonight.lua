return {
	"folke/tokyonight.nvim",
	lazy = false,
	opts = {
		transparent = true,
		style = "moon",
		styles = {
			floats = "transparent",
			sidebars = "transparent",
		},
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd([[colorscheme tokyonight]])
	end,
}
