local o = vim.o
local g = vim.g
local api = vim.api

-- expandtab makes sure spaces are used
o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2

g.mapleader = " "
g.maplocalleader = ","
g.localleader = ","

-- show relative row numbers
vim.opt.rnu = true 

-- allow leader + w for window navigation
api.nvim_set_keymap('n', '<leader>w', '<C-w>', { noremap = true})
api.nvim_set_keymap('n', '<leader>wt', ':NvimTreeFocus<CR>', { noremap = true})
-- escaping from terminal is a bit easier
api.nvim_set_keymap('t', '<leader>w<Esc>', '<C-\\><C-n>', { noremap = true })
-- allow certain commands to run directly without manual escape
api.nvim_set_keymap('t', 'gt', '<C-\\><C-n>:tabprevious<CR>', { noremap = true })
api.nvim_set_keymap('t', '<leader>wv', '<C-\\><C-n>:vsplit<CR>', { noremap = true })
api.nvim_set_keymap('t', '<leader>ws', '<C-\\><C-n>:split<CR>', { noremap = true })

-- this needs fish function 'repeat_previous_command' to be defined
-- also might need to think about which terminal commands are sent to
api.nvim_set_keymap('n', '<leader>tr', ':Tkill<CR>:T repeat_previous_command<CR>', { noremap = true})

-- terminal always in insert mode
-- NOTE - this worked, but was kinda annoying at least
-- with arvaus stuff
--[[
api.nvim_create_autocmd(
  {'BufEnter', 'TermOpen'},
  { pattern = '*', command = "if &buftype == 'terminal' | :startinsert | endif" })
api.nvim_create_autocmd(
  {'BufEnter', 'TermOpen'},
  { pattern = '*', command = ":let leader=','" })
]]--

-- disable relative rownumbers in terminal
api.nvim_create_autocmd('TermOpen',{ pattern = '*', command = ":set nornu nonu" })


-- nnoremap <leader>sv :source $MYVIMRC<CR>
api.nvim_set_keymap('n', '<leader>sv', ':source $MYVIMRC<CR>', { noremap = true })

require'plugins'

--fzf
api.nvim_set_keymap('n', '<leader>bb', ':Buffers<CR>', { noremap = true, nowait = true })
-- api.nvim_set_keymap('t', '<leader>bb', ':b ', { noremap = true })
-- api.nvim_del_keymap('t', '<leader>bb')
api.nvim_set_keymap('n', '<leader>ag', ':RG<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>fag', ':Rg<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>ff', ':Files<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>gf', ':GFiles<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>bl', ':BLines<CR>', { noremap = true })

--lualine setup
-- require('lualine').setup()
--
require('lualine').setup {
  options = {
    globalstatus = false
  }
}
o.laststatus=3

-- automatic lsp installation
require("mason").setup()
require("mason-lspconfig").setup({
  -- nim requires
  -- nimble install nimlsp
  ensure_installed = { "tsserver", "eslint", "clojure_lsp", "nimls", "cssls" }
})

local navic = require("nvim-navic")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_status = require('lsp-status')
-- setting up actual lsp's
require("mason-lspconfig").setup_handlers {
  function (server_name)
    require("lspconfig")[server_name].setup {
      -- no idea if this capability thingy does anything
      capabilities = capabilities,
      on_attach = function (client, bufnr)
        print("attached")
        --asdf
        local opts = { noremap=true, silent=true }

        local function quickfix()
            vim.lsp.buf.code_action({
                filter = function(a) return a.isPreferred end,
                apply = true
            })
        end

        vim.keymap.set('n', '<leader>qf', quickfix, opts)

        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
        
        --asdf
        lsp_status.on_attach(client)
        local opts = { noremap=true, silent=true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'L', '<cmd>lua vim.lsp.codelens.display()<CR>', opts)
        
        -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      end,
     
    }
  end
}

o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
g.lsp_log_verbose = 1
g.lsp_log_file = '/tmp/vim-lsp.log'


--color setup
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

--gitgutter commands
-- api.nvim_set_keymap('n', '<leader>gph', ':GitGutterPreviewHunk<CR>', { noremap = true})


-- lsp keys
-- completion
 -- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
    { name = 'nvim_lsp_signature_help' }
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


  -- Set up lspconfig.
  --local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --  capabilities = capabilities
  --}
  --
-- tree stuff
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  update_focused_file = {
    enable = true
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
  },
  view = {
    adaptive_size = true,
    --mappings = {
    --  list = {
    --    { key = "u", action = "dir_up" },
    --  },
    --},
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require "pears".setup()
-- api.nvim_create_autocmd('BufEnter',{ pattern = '*', command = ":NvimTreeFindFile" })
-- api.nvim_create_autocmd(
--   {'BufEnter'},
--   { pattern = '*', command = "if &buftype == '' | :NvimTreeFindFile | endif" })
