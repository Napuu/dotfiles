local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
  "folke/which-key.nvim", -- emacs like keybind popups
  { "folke/neoconf.nvim", cmd = "Neoconf" }, -- global and project settings
  "ellisonleao/gruvbox.nvim", -- colors
  "folke/neodev.nvim", -- helps with lua dev

  "nvim-lua/plenary.nvim", -- helper lua functions
  "junegunn/fzf",
  "junegunn/fzf.vim",
  "kevinhwang91/nvim-bqf",

  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}, -- highlighting

  "tpope/vim-surround", -- cs"'
  "tpope/vim-commentary", -- gcc to comment selection, gcgc to uncomment
  "tpope/vim-sensible", -- sensible defaults and stuff
  "tpope/vim-sleuth", -- adjust shift options accordingly

  -- disabled for now, got to find a way to make sure that this doesn't interfere with other plugins
  -- "justinmk/vim-sneak", -- two character s

  "airblade/vim-gitgutter",
  "tpope/vim-fugitive",
  "shumphrey/fugitive-gitlab.vim",
  "sindrets/diffview.nvim",
  "f-person/git-blame.nvim",
  "kdheepak/lazygit.nvim",

  "nvim-lualine/lualine.nvim",
  "nvim-tree/nvim-web-devicons",

  "kassio/neoterm",

  --  curl -L https://nixos.org/nix/install | sh
  "dundalek/lazy-lsp.nvim",
  "neovim/nvim-lspconfig",
  "glepnir/lspsaga.nvim",
  {"glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({})
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  },

  -- lsp stuff
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'onsails/lspkind-nvim',

  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',


  --breadcrumbs/context of where we are inside file
  'SmiteshP/nvim-navic',

})
