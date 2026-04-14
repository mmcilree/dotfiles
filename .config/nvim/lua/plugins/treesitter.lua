return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	-- requires: cargo install --locked tree-sitter-cli
	init = function()
		local installed = require("nvim-treesitter.config").get_installed()
		local to_install = vim.iter({ "vimdoc", "rust", "cpp", "python", "lua", "vim", "latex", "bash" })
			:filter(function(p)
				return not vim.tbl_contains(installed, p)
			end)
			:totable()
		if #to_install > 0 then
			require("nvim-treesitter").install(to_install)
		end
	end,
}
