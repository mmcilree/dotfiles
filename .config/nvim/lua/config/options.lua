vim.opt.linebreak = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.foldlevel = 99
vim.opt.relativenumber = true

-- Inline diagnostics
vim.diagnostic.config({ virtual_text = true })

-- So I can copy over ssh
local function paste()
	return {
		vim.fn.split(vim.fn.getreg(""), "\n"),
		vim.fn.getregtype(""),
	}
end

vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("+"),
	},
	pase = {
		["+"] = paste,
		["*"] = paste,
	},
}
