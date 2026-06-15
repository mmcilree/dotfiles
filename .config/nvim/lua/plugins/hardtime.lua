return {
	"m4xshen/hardtime.nvim",
	lazy = false,
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		disabled_keys = {
			["<Left>"] = false, -- Allow <Up> key
			["<Right>"] = false, -- Allow <Up> key
		},
	},
}
