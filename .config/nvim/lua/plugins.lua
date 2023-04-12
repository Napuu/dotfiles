local fn = vim.fn

-- packer installation
--[[
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  ]]--

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- git plugins
  use 'tpope/vim-fugitive'
  use 'shumphrey/fugitive-gitlab.vim'
  -- git diff at gutter
  use 'airblade/vim-gitgutter'
  -- cs'" = 'test' -> "test" etc.
  use 'tpope/vim-surround'
  -- gcc to comment selection, gcgc to uncomment
  use 'tpope/vim-commentary'

  -- sensible defaults and stuff
  use 'tpope/vim-sensible'
  -- adjust shift options accordingly
  use 'tpope/vim-sleuth'

  -- two character s
  use 'justinmk/vim-sneak'

  -- reusing terminals
  use 'kassio/neoterm'
  
  -- navigation between files, make sure 'fzf', 'bat' and 'git-delta' are installed (with brew)
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'


  -- nim support
  use 'zah/nim.vim'

  --lsp stuff
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- lsp status at bar
  use 'nvim-lua/lsp-status.nvim'

  --completion stuff
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'onsails/lspkind-nvim'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-treesitter/nvim-treesitter'

  use({
    "glepnir/lspsaga.nvim",
    opt = true,
    branch = "main",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({})
    end,
    requires = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
    }
  })

  --file explorer at left side
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons'
    }
  }

  --git blame on line
  use 'f-person/git-blame.nvim'

  --colo
  use 'ellisonleao/gruvbox.nvim'

  --statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  --breadcrumbs/context of where we are inside file
  --use "wellle/context.vim"
  use "SmiteshP/nvim-navic"

  --sexp stuff
  use 'guns/vim-sexp'
  use 'tpope/vim-sexp-mappings-for-regular-people'
  use 'tpope/vim-repeat'

  use {
    "windwp/nvim-autopairs",
    config = require("nvim-autopairs").setup()
  }

  use 'luochen1990/rainbow'
end)
