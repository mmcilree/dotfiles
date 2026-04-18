-- Show oil by default on startup
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- Only open if no file was passed as argument
		if vim.fn.argc() == 0 then
			require("oil").open()
		end
	end,
})

-- treesitter folding for python and rust
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python", "rust" },
	callback = function()
		vim.treesitter.start()
		vim.wo[0][0].foldmethod = "expr"
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.opt.foldtext = ""
		vim.wo[0][0].foldcolumn = "1"
	end,
})

-- vimtex folding for tex
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "tex" },
	callback = function()
		vim.wo[0][0].foldmethod = "expr"
		vim.wo[0][0].foldexpr = "vimtex#fold#level(v:lnum)"
		vim.opt.foldtext = "vimtex#fold#text()"
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.opt.foldtext = ""
		vim.wo[0][0].foldcolumn = "1"
	end,
})

-- manim
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.py",
	callback = function()
		local root = vim.fs.root(0, "manim.cfg")
		if not root then
			return
		end

		vim.opt_local.makeprg = "manim %:p -ql 2>&1"
		vim.opt_local.errorformat = table.concat({
			'%E  File "%f"\\ line %l',
			"%C%.%#",
			"%-G%.%#",
		}, ",")
		vim.keymap.set("n", "<leader>m", ":make<CR>", { buffer = true, desc = "Run Manim" })

		-- surround with starth() endh()
		vim.keymap.set("v", "<leader>sh", function()
			local start_line = vim.fn.line("v")
			local end_line = vim.fn.line(".")
			if start_line > end_line then
				start_line, end_line = end_line, start_line
			end

			-- Delete any existing self.starth() / self.endh() lines
			local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
			local to_delete = {}
			for i, line in ipairs(lines) do
				if line:match("self%.starth%(%)") or line:match("self%.endh%(%)") then
					table.insert(to_delete, i)
				end
			end
			-- Delete in reverse order to preserve line numbers
			for i = #to_delete, 1, -1 do
				vim.fn.deletebufline("%", to_delete[i])
				-- Adjust selection range if deleted line was above it
				if to_delete[i] < start_line then
					start_line = start_line - 1
					end_line = end_line - 1
				elseif to_delete[i] <= end_line then
					end_line = end_line - 1
				end
			end

			local indent = string.rep(" ", vim.fn.indent(start_line))
			vim.fn.append(end_line, indent .. "self.endh()")
			vim.fn.append(start_line - 1, indent .. "self.starth()")
		end, { desc = "Surround selection with self.starth() / self.endh()" })
	end,
})

-- Terminal keymaps
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		local nobuff = { buffer = 0 }
		vim.keymap.set("t", "jk", [[<C-\><C-n>]], nobuff)
	end,
})
