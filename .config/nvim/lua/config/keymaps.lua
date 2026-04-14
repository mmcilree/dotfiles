vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<leader><leader>", "<C-^>", opts)
vim.keymap.set("n", "-", function()
	require("oil").open()
end, opts)
vim.keymap.set("n", "<leader>b", ":Neotree toggle<CR>", opts)
