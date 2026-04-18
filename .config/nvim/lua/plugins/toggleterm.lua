return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		shell = "fish",
		size = function(term)
			if term.direction == "horizontal" then
				return math.floor(vim.o.lines * 0.5)
			elseif term.direction == "vertical" then
				return math.floor(vim.o.columns * 0.5)
			end
		end,
	},
	keys = {
		{
			"<C-\\>",
			'<Cmd>execute v:count . "ToggleTerm direction=vertical"<CR>',
			mode = { "i", "n", "t" },
			desc = "Terminal vertical",
			silent = true,
		},
		{
			"<C-`>",
			'<Cmd>execute v:count . "ToggleTerm direction=horizontal"<CR>',
			mode = { "i", "n", "t" },
			desc = "Terminal horizontal",
			silent = true,
		},
	},
}
