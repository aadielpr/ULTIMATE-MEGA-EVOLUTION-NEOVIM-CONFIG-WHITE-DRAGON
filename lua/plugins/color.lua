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
    highlight_groups = {
        CursorLine = { bg = "none" },
    },
    styles = {
        italic = false,
    },
}

SetTheme()
