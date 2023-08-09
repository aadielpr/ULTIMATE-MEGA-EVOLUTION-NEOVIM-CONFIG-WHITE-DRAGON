local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local setKeymap = require("plugins.utils.keymap").setKeyMap

telescope.setup {
    pickers = {
        find_files = {
            theme = "dropdown",
            previewer = false,
        },
        live_grep = {
            theme = "dropdown",
            previewer = false,
        },
        current_buffer_fuzzy_find = {
            theme = "dropdown",
            previewer = false,
        },
    },
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
        vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        file_ignore_patterns = { "node_modules", ".git" },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
        },
    },
}

setKeymap("n", "<leader>ff", builtin.find_files)
setKeymap("n", "<leader>fb", builtin.current_buffer_fuzzy_find)
setKeymap("n", "<leader>fg", builtin.live_grep)

telescope.load_extension("ui-select")
