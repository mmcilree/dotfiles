return {
	"quarto-dev/quarto-nvim",
	ft = { "quarto" },
	dependencies = {
		"jmbuhr/otter.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		lspFeatures = {
			languages = { "python", "bash", "sql" },
		},
		codeRunner = { enabled = false }, -- you're not executing cells
	},
}
