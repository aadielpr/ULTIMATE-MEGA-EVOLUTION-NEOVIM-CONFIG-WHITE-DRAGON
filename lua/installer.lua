local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system {
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        }
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
    -- packer
    use { "wbthomason/packer.nvim" }

    -- colorscheme
    use { "rose-pine/neovim", as = "rose-pine" }

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use { "JoosepAlviste/nvim-ts-context-commentstring" }

    -- completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
        },
    }

    -- LSP stuff
    use { "williamboman/mason.nvim" }
    use { "jose-elias-alvarez/null-ls.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "neovim/nvim-lspconfig" }

    -- comment plugin
    use { "numToStr/Comment.nvim" }

    -- terminal
    use {
        "akinsho/toggleterm.nvim",
        tag = "*",
    }

    -- bracket stuff
    use { "windwp/nvim-autopairs" }
    use { "windwp/nvim-ts-autotag" }

    -- lualine
    use { "nvim-lualine/lualine.nvim" }

    -- nvim tree
    use { "kyazdani42/nvim-tree.lua" }

    -- telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    }

    -- icon & stuff
    use { "onsails/lspkind-nvim" }
    use { "kyazdani42/nvim-web-devicons" }

    -- git stuff
    use { "tpope/vim-fugitive" }
    use {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }

    -- harpoon
    use { "theprimeagen/harpoon" }

    if packer_bootstrap then
        require("packer").sync()
    end
end)
