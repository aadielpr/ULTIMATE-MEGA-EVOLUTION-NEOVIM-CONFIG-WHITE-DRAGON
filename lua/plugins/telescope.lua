local actions = require('telescope.actions')

local function tele_map(map, cmd)
    local opt = {
        noremap = true,
        silent = true
    }
    local v_cmd = "<cmd>lua require('telescope.builtin')." .. cmd .. "()<cr>"
    return vim.api.nvim_set_keymap('n', map, v_cmd, opt)
end

tele_map('ff', 'find_files')
tele_map('fb', 'current_buffer_fuzzy_find')
tele_map('fg', 'live_grep')

require('telescope').setup {
    defaults = {
        vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column",
                             "--smart-case"},
        prompt_prefix = "  ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8
            },
            vertical = {
                mirror = false
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120
        },
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        file_ignore_patterns = {"node_modules", "package-lock"},
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = {"truncate"},
        winblend = 0,
        border = {},
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
        color_devicons = true,
        use_less = true,
        set_env = {
            ["COLORTERM"] = "truecolor"
        }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous
            }
        }
    }
    -- pickers = {
    --   find_files = {
    --     theme = "dropdown",
    --   },
    --   live_grep = {
    --     theme = "dropdown",
    --   },
    --   current_buffer_fuzzy_find = {
    --     theme = "dropdown",
    --   }
    -- },
}
