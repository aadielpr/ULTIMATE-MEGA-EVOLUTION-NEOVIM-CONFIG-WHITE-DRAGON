local neotree = require("neo-tree")

neotree.setup {
    filesystem = {
        filtered_items = {
            hide_by_name = { "node_modules" },
            always_show = { ".gitignore" },
            always_show_by_pattern = { ".env*" },
            never_show = { ".DS_Store" },
        },
    },
}

vim.keymap.set("n", "<C-p>", ":Neotree toggle=true<CR>", { silent = true, noremap = true })
