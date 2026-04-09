-- python
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'python' },
	callback = function()
		vim.treesitter.start()
		vim.wo[0][0].foldmethod = 'expr'
		vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.opt.foldtext = ''
		vim.wo[0][0].foldcolumn = '1'
	end,
})

-- manim
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.py",
	callback = function()
		local root = vim.fs.root(0, "manim.cfg")
		if not root then return end

		vim.opt_local.makeprg = "manim %:p -ql 2>&1"
		vim.opt_local.errorformat = table.concat({
			"%E  File \"%f\"\\ line %l",
			"%C%.%#",
			"%-G%.%#",
		}, ",")
		vim.keymap.set("n", "<leader>m", ":make<CR>", { buffer = true, desc = "Run Manim" })
	end
})
