function SetTheme(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

require("rose-pine").setup {
    variant = "moon",
    disable_background = true,
    disable_italics = true,
    groups = {
        panel = "#1c1c21",
    },
    highlight_groups = {
        CursorLine = { bg = "none" },
    },
    styles = {
        bold = true,
        italic = false,
    },
}

require("nordic").setup {
    -- Enable bold keywords.
    bold_keywords = true,
    -- Enable italic comments.
    italic_comments = true,
    -- Enable general editor background transparency.
    transparent_bg = false,
    cursorline = {
        bold = false,
    },
    override = {
        Visual = {
            bg = "#242933",
        },
    },
}

SetTheme("nordic")
