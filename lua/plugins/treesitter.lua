require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "tsx", "html", "typescript", "json", "javascript" },
    auto_install = true,

    sync_install = false,
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    autotag = { enable = true },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}
