local fn = vim.fn
local diagnostic = vim.diagnostic
local lsp = vim.lsp

function SetDiagnosticSign()
    local error = "DiagnosticSignError"
    local warn = "DiagnosticSignWarn"
    local info = "DiagnosticSignInfo"
    local hint = "DiagnosticSignHint"
    fn.sign_define(error, { text = "󰅙", texthl = error })
    fn.sign_define(warn, { text = "", texthl = warn })
    fn.sign_define(info, { text = "󰋼", texthl = info })
    fn.sign_define(hint, { text = "", texthl = hint })
end

function Handlers()
    local handlers = lsp.handlers
    handlers["textDocument/hover"] = lsp.with(handlers.hover, {
        border = "single",
    })

    handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, {
        border = "single",
        focusable = false,
        relative = "cursor",
    })
end

local M = {}

M.setup = function()
    SetDiagnosticSign()
    Handlers()

    diagnostic.config {
        virtual_text = {
            severity = {
                min = diagnostic.severity.WARN,
            },
            prefix = "",
        },
        signs = true,
        severity_sort = true,
        underline = false,
    }

end

return M
