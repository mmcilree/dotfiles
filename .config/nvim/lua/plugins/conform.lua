return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			html = { "djlint" },
			bash = { "shfmt", "shellcheck" },
			zsh = { "shfmt", "shellcheck" },
			sh = { "shfmt", "shellcheck" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			tex = { "latexindent" },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 1500 },
		-- Customize formatters
		formatters = {
			shfmt = {
				append_args = { "-i", "2" },
			},
			latexindent = {
				command = "latexindent",
				stdin = true,
				-- -l: load localSettings.yaml from the cwd (set to project root below)
				-- -c: write indent.log / backups to the cache dir, not the repo
				-- -m enables modifyLineBreaks (required for oneSentencePerLine)
				args = { "-m", "-l=latexindent.yaml", "-c", vim.fn.stdpath("cache"), "-" },
				cwd = function(_, ctx)
					return vim.fs.root(ctx.dirname, { "latexindent.yaml", ".git" })
				end,
				require_cwd = false,
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
