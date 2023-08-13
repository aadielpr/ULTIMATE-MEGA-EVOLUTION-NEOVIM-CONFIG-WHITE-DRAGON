local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local setKeymap = require("plugins.utils.keymap").setKeyMap

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
        initial_mode = "insert",
        file_ignore_patterns = { "node_modules", ".git" },
    },
}

setKeymap("n", "ff", builtin.find_files)
setKeymap("n", "fb", builtin.current_buffer_fuzzy_find)
setKeymap("n", "fg", builtin.live_grep)
setKeymap("n", "<C-p>", builtin.git_files)
