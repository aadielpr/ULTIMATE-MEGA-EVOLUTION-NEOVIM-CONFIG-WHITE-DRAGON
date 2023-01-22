local M = {}

M.setup = function()
    local signs = {{
        name = "DiagnosticSignError",
        text = ""
    }, {
        name = "DiagnosticSignWarn",
        text = ""
    }, {
        name = "DiagnosticSignHint",
        text = ""
    }, {
        name = "DiagnosticSignInfo",
        text = ""
    }}

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, {
            texthl = sign.name,
            text = sign.text,
            numhl = ""
        })
    end

    local config = {
        virtual_text = {
            severity = {
                min = vim.diagnostic.severity.WARN
            },
            prefix = ''
        },
        signs = {
            active = signs
        },
        update_in_insert = false,
        severity_sort = true,
        underline = false
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded"
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded"
    })
end

return M
