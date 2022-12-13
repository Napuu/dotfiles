vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.o.shiftwidth = 2
-- vim.g.localleader = ","
vim.opt.rnu = true
require'plugins'

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>Telescope grep_string<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })
require'nvim-tree'.setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
}


vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>NvimTreeToggle<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>NvimTreeRefresh<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>NvimTreeFindFile<cr>', { noremap = true })

-- moving between windows
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>', { noremap = true })

vim.g.rainbow_active = 1

-- vim.g.conjure.mapping.prefix = "<leader>"
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>', { noremap = true })


-- require'lspconfig'.clojure_lsp.setup{}
--
require'lspconfigurations'

vim.g.notes_directories = '~/notes'
vim.cmd(":let g:notes_directories = ['~/notes']")
-- vim.g["notes_directories"] = '~/notes'

