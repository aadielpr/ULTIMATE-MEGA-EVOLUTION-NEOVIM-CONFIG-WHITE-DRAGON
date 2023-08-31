local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = {
        error = " ",
        warn = " ",
    },
    update_in_insert = false,
    always_visible = true,
    diagnostics_color = {
        error = "DiagnosticSignError", -- Changes diagnostics' error color.
        warn = "DiagnosticSignWarn", -- Changes diagnostics' warn color.
        info = "DiagnosticSignInfo", -- Changes diagnostics' info color.
        hint = "DiagnosticSignHint", -- Changes diagnostics' hint color.
    },
}

lualine.setup {
    options = {
        icons_enabled = false,
        component_separators = {
            left = "",
            right = "",
        },
        section_separators = {
            left = "",
            right = "",
        },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
        always_divide_middle = false,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { { "filename", path = 2 } },
        lualine_x = { diagnostics, spaces },
        lualine_y = { "filetype" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 2 } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
}
