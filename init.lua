vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("installer")
require("settings")
require("mapping")

require("plugins.color")

require("plugins.lsp")

require("plugins.harpoon")
require("plugins.rename")
require("plugins.autopairs")
require("plugins.comment")
require("plugins.nvim-icons")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.nvim-cmp")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.toggleterm")
require("plugins.treesitter")
