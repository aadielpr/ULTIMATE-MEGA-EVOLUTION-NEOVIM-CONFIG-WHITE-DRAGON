local colors = require 'material.colors'

require('material').setup({
    plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
        -- "dashboard",
        "gitsigns",
        -- "hop",
        -- "indent-blankline",
        -- "lspsaga",
        -- "mini",
        -- "neogit",
        "nvim-cmp",
        -- "nvim-navic",
        "nvim-tree",
        "nvim-web-devicons",
        -- "sneak",
        "telescope",
        -- "trouble",
        -- "which-key",
    },

    disable = {
        colored_cursor = false, -- Disable the colored cursor
        borders = false, -- Disable borders between verticaly split windows
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false -- Hide the end-of-buffer lines
    },

    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false -- Enable higher contrast text for darker style
    },

    lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

    custom_highlights = {
      NvimTreeFolderIcon = {fg = colors.main.green},
      NvimTreeFolderName = {fg = colors.editor.fg},
      ["@type"] = {fg = colors.main.yellow},
      ["@type.builtin"] = {fg = colors.main.yellow},
      ['@type.qualifier'] = {fg = colors.main.purple},
      ['@keyword'] = {fg = colors.main.purple},
      ['@keyword.return'] = {fg = colors.main.cyan},
      ['@constructor'] = {fg = colors.main.yellow},
      ['@conditional.ternary'] = {fg = colors.main.cyan},
      ['@variable.builtin'] = {fg = colors.main.cyan},

  },
})

vim.g.material_style = 'deep ocean'
vim.cmd 'colorscheme material'
