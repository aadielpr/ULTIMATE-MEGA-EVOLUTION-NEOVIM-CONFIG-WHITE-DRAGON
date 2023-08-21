local setKeymap = require("plugins.utils.keymap").setKeyMap

require("nvim-tree").setup {
    hijack_netrw = true,
    diagnostics = {
        enable = true,
        severity = {
            min = vim.diagnostic.severity.ERROR,
        },
    },
    git = {
        enable = false,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    filters = {
        dotfiles = false,
        custom = { "node_modules", ".cache", ".bin", ".DS_Store", ".git" },
    },
}

setKeymap("n", "<C-p>", function()
    require("nvim-tree.api").tree.toggle { current_window = true }
end, {
    noremap = true,
    silent = true,
})
