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

    -- harpoon
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } },
    }

    -- undotree
    use {
        "mbbill/undotree",
    }

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
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
        },
    }
    use { "onsails/lspkind.nvim" }

    -- LSP stuff
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "neovim/nvim-lspconfig" }
    use {
        "creativenull/efmls-configs-nvim",
        tag = "v1.*", -- tag is optional, but recommended
        requires = { "neovim/nvim-lspconfig" },
    }

    -- formatter
    use { "stevearc/conform.nvim" }

    -- comment plugin
    use { "numToStr/Comment.nvim" }

    -- bracket stuff
    use { "windwp/nvim-autopairs" }
    use { "windwp/nvim-ts-autotag" }
    use { "lukas-reineke/indent-blankline.nvim" }

    -- nvim tree
    use { "kyazdani42/nvim-tree.lua" }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
    }

    -- telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    }

    -- icon & stuff
    use { "kyazdani42/nvim-web-devicons" }

    -- git stuff
    use { "tpope/vim-fugitive" }
    use {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }

    if packer_bootstrap then
        require("packer").sync()
    end
end)
