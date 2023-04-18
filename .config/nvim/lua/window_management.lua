
-- allow leader + w for window navigation
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>', { noremap = true})
-- api.nvim_set_keymap('n', '<leader>wt', ':NvimTreeFocus<CR>', { noremap = true})

-- escaping from terminal is a bit easier
vim.api.nvim_set_keymap('t', '<leader>w<Esc>', '<C-\\><C-n>', { noremap = true })
-- allow certain commands to run directly without manual escape
vim.api.nvim_set_keymap('t', 'gt', '<C-\\><C-n>:tabprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<leader>wv', '<C-\\><C-n>:vsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<leader>ws', '<C-\\><C-n>:split<CR>', { noremap = true })

