return {
	'neovim/nvim-lspconfig',
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		vim.lsp.config('*', {
			capabilities = capabilities,
		})

		vim.lsp.config('lua_ls', {
			settings = {
				Lua = {
					runtime = { version = 'LuaJIT' },
					diagnostics = {
						globals = { 'vim' },
					},
				},
			},
		})
		vim.lsp.enable({ "lua_ls" })
		vim.lsp.enable({ "basedpyright" })
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	end
}
