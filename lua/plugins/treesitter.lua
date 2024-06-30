require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "tsx", "html", "typescript", "json", "javascript", "go" },
    auto_install = false,

    sync_install = false,
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    autotag = {
        enable = true,
        filetypes = { "html", "xml" },
    },
}
