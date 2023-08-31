local error = "DiagnosticSignError"
local warn = "DiagnosticSignWarn"
local info = "DiagnosticSignInfo"
local hint = "DiagnosticSignHint"
local icons = require("plugins.utils.icons")

vim.fn.sign_define(error, { text = icons.diagnostic.Error, texthl = error })
vim.fn.sign_define(warn, { text = icons.diagnostic.Warning, texthl = warn })
vim.fn.sign_define(info, { text = icons.diagnostic.Information, texthl = info })
vim.fn.sign_define(hint, { text = icons.diagnostic.Hint, texthl = hint })

vim.diagnostic.config {
    virtual_text = {
        severity = {
            min = vim.diagnostic.severity.WARN,
        },
        prefix = "",
    },
    signs = true,
    severity_sort = true,
    underline = false,
}

-- handlers
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
    focusable = false,
    relative = "cursor",
})
