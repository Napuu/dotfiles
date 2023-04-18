-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>ag', function()
--   builtin.live_grep({grep_open_files=false})
-- end, {})
-- vim.keymap.set('n', '<leader>fb', function()
--   builtin.buffers({ sort_mru = true })
-- end, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- vim.keymap.set('n', '<leader>gf', builtin.git_files, {})

-- local actions = require('telescope.actions')
-- require('telescope').setup{
--   defaults = {
--     mappings = {
--       i = {
--         ["<C-w>"] = actions.send_selected_to_qflist,
--         ["<C-q>"] = actions.send_to_qflist,
--       },
--       n = {
--         ["<C-w>"] = actions.send_selected_to_qflist,
--         ["<C-q>"] = actions.send_to_qflist,
--       },
--     },
--   }
-- }

vim.cmd [[
  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    let spec = fzf#vim#with_preview(spec, 'right', 'ctrl-/')
    call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
  endfunction

  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
  if has('nvim')
    tnoremap <expr> <c-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
  endif
]]

local api = vim.api
api.nvim_set_keymap('n', '<leader>fb', ':Buffers<CR>', { noremap = true, nowait = true })
api.nvim_set_keymap('n', '<leader>ag', ':RG<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>fag', ':Rg<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>ff', ':Files<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>gf', ':GFiles<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>bl', ':BLines<CR>', { noremap = true })

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = "all"
}

require('lualine').setup()

require('lazy-lsp').setup {
  excluded_servers = {
    "sqls", "denols"
  },
  default_config = {
    flags = {
      debounce_text_changes = 150,
    },
    -- on_attach = function (client, bufnr)
    --   local opts = { noremap=true, silent=true }
    -- end,
    -- capabilities = capabilities,
  },
  configs = {
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
        },
      },
    },
  }
}

local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  }
})


vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]


vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

local success, confidential = pcall(require, 'confidential')
if success then
  require'confidential'
end

