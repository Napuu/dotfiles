local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ag', function()
  builtin.live_grep({grep_open_files=false})
end, {})
vim.keymap.set('n', '<leader>fb', function()
  builtin.buffers({ sort_mru = true })
end, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = "all"
}

require('lualine').setup()

require("neogit").setup {
  integrations = {
    diffview = true
  },
}

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

vim.cmd 'command! G Neogit'
