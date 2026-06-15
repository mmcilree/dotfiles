return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			function()
				require("trouble").toggle({
					mode = "diagnostics",
					filter = { buf = 0, severity = vim.diagnostic.severity.ERROR },
				})
			end,
			desc = "Buffer Errors (Trouble)",
		},

		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
		{
			"]d",
			function()
				if require("trouble").is_open() then
					require("trouble").next({ skip_groups = true, jump = true })
				else
					vim.diagnostic.goto_next()
				end
			end,
			desc = "Next diagnostic (Trouble)",
		},
		{
			"[d",
			function()
				if require("trouble").is_open() then
					require("trouble").prev({ skip_groups = true, jump = true })
				else
					vim.diagnostic.goto_prev()
				end
			end,
			desc = "Previous diagnostic (Trouble)",
		},
	},
}
