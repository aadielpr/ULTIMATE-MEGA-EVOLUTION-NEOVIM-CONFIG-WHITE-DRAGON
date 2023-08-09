local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
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
        error = "DiagnosticSignError",
        warn = "DiagnosticSignWarn",
        info = "DiagnosticSignInfo",
        hint = "DiagnosticSignHint",
    },
}

local mode = {
    "mode",
    fmt = function(str)
        if str == "NORMAL" then
            return "[ N ]"
        elseif str == "INSERT" then
            return "[ I ]"
        elseif str == "VISUAL" then
            return "[ V ]"
        elseif str == "COMMAND" then
            return "[ CMD ]"
        elseif str == "V-BLOCK" then
            return "[ V-B ]"
        elseif str == "V-LINE" then
            return "[ V-L ]"
        elseif str == "TERMINAL" then
            return "[ TERM ]"
        else
            return "[" .. str .. "]"
        end
    end,
}

local filetype = {
    "filetype",
    icon_only = true,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

local location = {
    "location",
    padding = 0,
}

local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = "ayu",
        component_separators = {
            left = "",
            right = "",
        },
        section_separators = {
            left = "",
            right = "",
        },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch, diagnostics },
        lualine_c = { "filename" },
        lualine_x = { spaces, "encoding" },
        lualine_y = { filetype },
        lualine_z = { location },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
}
