local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- UI

  -- Colorscheme
  -- use 'folke/tokyonight.nvim'
  use 'marko-cerovac/material.nvim'

  -- NvimTree as File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- TabBar
  use 'romgrk/barbar.nvim'

  -- Status Line
  use 'hoob3rt/lualine.nvim'

  -- Indent Line
  use {'lukas-reineke/indent-blankline.nvim', branch = 'lua' }

  -- Vista Sidebar
  use 'liuchengxu/vista.vim'

  -- Git Signs
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Mechanics
  -- AutoPairs
  use 'windwp/nvim-autopairs'
  -- Comments
  use 'b3nj5m1n/kommentary'
  -- Last Place
  use 'farmergreg/vim-lastplace'
  -- Fuzzyfinder
  use {'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  -- Horizonal Motion
  use 'unblevable/quick-scope'

  -- Treesitter for syntax
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'

  -- Autocomplete
  use 'hrsh7th/nvim-compe'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'

  -- Saga
  use 'glepnir/lspsaga.nvim'
end)

