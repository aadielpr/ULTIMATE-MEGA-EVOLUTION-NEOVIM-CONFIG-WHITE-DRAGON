require("rose-pine").setup {
    variant = "moon", -- auto, main, moon, or dawn
    styles = {
        bold = true,
        italic = false,
        transparency = true,
    },
}

vim.cmd.colorscheme("rose-pine")
