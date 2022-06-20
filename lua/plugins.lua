local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function ()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'mhartington/oceanic-next'
  use {
    'folke/tokyonight.nvim',
    config = function() require 'plugins.tokyonight' end
  }

  use {
    'numToStr/Comment.nvim',
    config = function() require 'plugins.comment' end
  }
  -- TERMINAL
  use {
    'akinsho/toggleterm.nvim',
    config = function() require 'plugins.toggleterm' end
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function() require 'plugins.nvim-lspconfig' end
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require 'plugins.autopairs' end
  }

  -- TREESITTER
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require 'plugins.treesitter' end
  }

  -- ICONS FOR LUA-LINE & NVIM-TREE
  use {
    'kyazdani42/nvim-web-devicons',
    config = function() require 'plugins.dev-icons' end
  }

  -- LUALINE / AIRLINE(lua)
  use {
    'nvim-lualine/lualine.nvim',
    config = function() require 'plugins.lualine' end
  }
  -- NVIM TREE
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require 'plugins.nvim-tree' end
  }

  -- TELESCOPE
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require 'plugins.telescope' end
  }

  -- COMPLETION
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'L3MON4D3/LuaSnip'
    },
    config = function() require 'plugins.nvim-cmp' end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }
  
  if packer_bootstrap then
    require('packer').sync()
  end
end)
