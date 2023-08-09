local setKeymap = require("plugins.utils.keymap").setKeyMap

require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = false,
    },
    diagnostics = {
        enable = true,
    },
    view = {
        width = 35,
        side = "left",
    },
    filesystem_watchers = {
        enable = true,
    },
    git = {
        enable = false,
        ignore = true,
    },
    actions = {
        open_file = {
            resize_window = true,
        },
    },
    renderer = {
        root_folder_label = false,
        highlight_git = false,
        highlight_opened_files = "none",
        indent_markers = {
            enable = true,
        },
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                    symlink_open = "",
                    arrow_open = "",
                    arrow_closed = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    filters = {
        dotfiles = false,
        custom = { "node_modules", ".cache", ".bin", ".DS_Store", ".git" },
    },
}

setKeymap("n", "<leader>e", ":NvimTreeToggle<CR>", {
    noremap = true,
    silent = true,
})
