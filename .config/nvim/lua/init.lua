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


vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>NvimTreeToggle<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>NvimTreeRefresh<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>NvimTreeFindFile<cr>', { noremap = true })

-- moving between windows
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>', { noremap = true })

vim.g.rainbow_active = 1

-- vim.g.conjure.mapping.prefix = "<leader>"
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>', { noremap = true })

vim.api.nvim_set_keymap('t', '<leader>w<Esc>', '<C-\\><C-n>', { noremap = true })


-- require'lspconfig'.clojure_lsp.setup{}
--
require'lspconfigurations'

vim.g.notes_directories = '~/notes'
vim.cmd(":let g:notes_directories = ['~/notes']")
-- vim.g["notes_directories"] = '~/notes'

vim.cmd 'colorscheme material'
vim.g.material_style = "palenight"
require('material').setup({

  contrast = {
    terminal = false, -- Enable contrast for the built-in terminal
    sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = true, -- Enable contrast for floating windows
    cursor_line = true, -- Enable darker background for the cursor line
    non_current_windows = true, -- Enable darker background for non-current windows
    filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
  },

  styles = { -- Give comments style such as bold, italic, underline etc.
  comments = { [[ italic = true ]] },
  strings = { [[ bold = true ]] },
  keywords = { [[ underline = true ]] },
  functions = { [[ bold = true, undercurl = true ]] },
  variables = {},
  operators = {},
  types = {},
},

plugins = { -- Uncomment the plugins that you use to highlight them
-- Available plugins:
-- "dap",
-- "dashboard",
-- "gitsigns",
-- "hop",
-- "indent-blankline",
-- "lspsaga",
-- "mini",
-- "neogit",
-- "nvim-cmp",
-- "nvim-navic",
-- "nvim-tree",
-- "nvim-web-devicons",
-- "sneak",
-- "telescope",
-- "trouble",
-- "which-key",
    },

    disable = {
      colored_cursor = false, -- Disable the colored cursor
      borders = false, -- Disable borders between verticaly split windows
      background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
      term_colors = false, -- Prevent the theme from setting terminal colors
      eob_lines = false -- Hide the end-of-buffer lines
    },

    high_visibility = {
      lighter = false, -- Enable higher contrast text for lighter style
      darker = false -- Enable higher contrast text for darker style
    },

    lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

    custom_colors = nil, -- If you want to everride the default colors, set this to a function

    custom_highlights = {}, -- Overwrite highlights with your own
  })
