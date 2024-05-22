vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

require("installer")
require("settings")
require("mapping")

require("plugins.color")
require("plugins.lsp")
require("plugins.autopairs")
require("plugins.comment")
require("plugins.gitsigns")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.harpoon")
require("plugins.treesitter")
require("plugins.undotree")
require("plugins.trouble")
