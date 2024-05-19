require("nvim-web-devicons").setup {}
require("nvim-tree").setup {
    hijack_netrw = true,
    diagnostics = {
        enable = false,
        severity = {
            min = vim.diagnostic.severity.ERROR,
        },
    },
    git = {
        enable = false,
    },
    actions = {
        open_file = {
            quit_on_open = false,
        },
    },
    filters = {
        dotfiles = false,
        custom = { "node_modules", ".bin", ".DS_Store", ".git" },
    },
    view = {
        side = "right",
        width = {
            min = 40,
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = false,
    },
}

vim.keymap.set("n", "<C-p>", function()
    require("nvim-tree.api").tree.toggle { --[[ current_window = true ]]
    }
end, {
    noremap = true,
    silent = true,
})
