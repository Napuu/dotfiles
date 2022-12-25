local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
-- vim.cmd [[packadd packer.nvim]]
-- sometimes running :packadd packer.nvim is needed
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-fugitive'

  use 'tpope/vim-surround'

  use 'tpope/vim-commentary'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-treesitter/nvim-treesitter'


  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use 'neovim/nvim-lspconfig'


  use 'Olical/conjure'
  use 'Olical/aniseed'
  use 'terryma/vim-expand-region'

  use 'guns/vim-sexp'
  use 'tpope/vim-sexp-mappings-for-regular-people'
  use 'luochen1990/rainbow'

  use 'xolox/vim-misc'
  use 'xolox/vim-notes'

  use 'wfxr/minimap.vim'
  use 'shaunsingh/solarized.nvim'
  use 'marko-cerovac/material.nvim'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
