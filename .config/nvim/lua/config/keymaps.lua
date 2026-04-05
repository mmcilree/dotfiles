vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
vim.keymap.set('n', '<leader><leader>', '<C-^>', {})
