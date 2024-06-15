local tree = require("nvim-tree")
local devicons = require("nvim-web-devicons")
local api = require("nvim-tree.api")

devicons.setup {}

tree.setup {
    hijack_netrw = true,
    diagnostics = {
        enable = true,
        severity = {
            min = vim.diagnostic.severity.ERROR,
        },
    },
    renderer = {
        icons = {
            git_placement = "after",
        },
        root_folder_label = false,
    },
    filters = {
        dotfiles = false,
        custom = { "node_modules", ".bin", ".DS_Store", ".git" },
    },
    trash = {
        cmd = "trash",
    },
    view = {
        side = "left",
        width = 40,
    },
}

vim.keymap.set("n", "<C-p>", api.tree.toggle, {
    noremap = true,
    silent = true,
})
