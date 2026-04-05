return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	ensure_installed = {"help", "rust", "cpp", "python", "lua", "vim", "latex"},
}
