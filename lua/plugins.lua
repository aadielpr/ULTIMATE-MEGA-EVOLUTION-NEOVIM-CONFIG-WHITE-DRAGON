local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use {'marko-cerovac/material.nvim', config = function() require 'plugins.material' end}

    use {
        'numToStr/Comment.nvim',
        config = function()
            require 'plugins.comment'
        end
    }

    use {
        'akinsho/toggleterm.nvim',
        config = function()
            require 'plugins.toggleterm'
        end
    }

    use {
        'neovim/nvim-lspconfig',
        config = function()
            require 'plugins.nvim-lspconfig'
            require'plugins.nvim-lspdiagnostic'.setup()
        end
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require 'plugins.autopairs'
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require 'plugins.treesitter'
        end
    }

    use 'nvim-treesitter/playground'

    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use "windwp/nvim-ts-autotag"

    use {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require 'plugins.dev-icons'
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require 'plugins.lualine'
        end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require 'plugins.nvim-tree'
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}},
        config = function()
            require 'plugins.telescope'
        end
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'L3MON4D3/LuaSnip'},
        config = function()
            require 'plugins.nvim-cmp'
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('plugins.gitsigns')
        end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
