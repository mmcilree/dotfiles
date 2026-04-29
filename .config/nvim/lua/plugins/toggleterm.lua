return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		shell = "fish",
		shade_terminals = false,
		size = function(term)
			if term.direction == "horizontal" then
				return math.floor(vim.o.lines * 0.5)
			elseif term.direction == "vertical" then
				return math.floor(vim.o.columns * 0.5)
			end
		end,
	},
	config = function(_, opts)
		local colors = require("tokyonight.colors").setup()
		opts.highlights = {
			Normal = { guibg = colors.bg_dark },
		}
		require("toggleterm").setup(opts)
	end,
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
		{
			"<C-Space>", -- So this also works inside tmux
			'<Cmd>execute v:count . "ToggleTerm direction=horizontal"<CR>',
			mode = { "i", "n", "t" },
			desc = "Terminal horizontal",
			silent = true,
		},
	},
}
