vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
vim.keymap.set('n', '<leader><leader>', '<C-^>', {})

-- manim-specific keymaps and rendering
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
