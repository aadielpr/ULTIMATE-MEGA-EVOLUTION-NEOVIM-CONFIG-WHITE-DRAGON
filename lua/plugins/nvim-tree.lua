local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5 -- You can change this too

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
        width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
        float = {
            enable = true,
            quit_on_focus_loss = true,
            open_win_config = function()
                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local window_w = screen_w * WIDTH_RATIO
                local window_h = screen_h * HEIGHT_RATIO
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = (screen_w - window_w) / 2
                local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
                return {
                    border = "rounded",
                    relative = "editor",
                    row = center_y,
                    col = center_x,
                    width = window_w_int,
                    height = window_h_int,
                }
            end,
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
