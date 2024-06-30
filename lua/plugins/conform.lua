local conform = require("conform")

conform.setup {
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        markdown = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        go = { { "gofumpt", "goimports", "golines" } },
        c = { { "c_formatter" } },
    },
}

vim.keymap.set("n", "fm", function()
    conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    }
end, { silent = true, noremap = true })
