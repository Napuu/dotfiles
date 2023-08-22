vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.localleader = ","

-- how often stuff is checked (e.g. git next to line would be slow otherwise)
vim.api.nvim_command('set updatetime=100')
--?? not sure about these ones
vim.api.nvim_command('set laststatus=3')
vim.api.nvim_command('set completeopt=menu,menuone,noselect')
