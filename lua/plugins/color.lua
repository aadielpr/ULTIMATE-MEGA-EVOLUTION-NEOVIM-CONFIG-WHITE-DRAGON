local rosepine = require("rose-pine")

rosepine.setup {
    variant = "moon", -- auto, main, moon, or dawn
    styles = {
        bold = true,
        italic = true,
        transparency = true,
    },
}

vim.cmd.colorscheme("rose-pine")
