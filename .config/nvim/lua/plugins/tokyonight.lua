return {
	"folke/tokyonight.nvim",
	lazy = false,
	opts = {
		transparent = true,
		style = "moon",
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
	},
	config = function()
		vim.cmd([[colorscheme tokyonight]])
	end,
}
