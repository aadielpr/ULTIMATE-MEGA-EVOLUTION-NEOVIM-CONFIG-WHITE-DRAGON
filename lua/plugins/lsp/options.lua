local setKeymap = require("plugins.utils.keymap").setKeyMap

local M = {}

M.onAttach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    local opts = { noremap = true, silent = true, buffer = bufnr }

    setKeymap("n", "gD", vim.lsp.buf.declaration, opts)
    setKeymap("n", "gd", vim.lsp.buf.definition, opts)
    setKeymap("n", "gi", vim.lsp.buf.implementation, opts)
    setKeymap("n", "K", vim.lsp.buf.hover, opts)
    setKeymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    --[[ setKeymap("n", "<leader>rn", vim.lsp.buf.rename, opts) ]]
    setKeymap("n", "<leader>fm", function()
        vim.lsp.buf.format({ async = true })
    end, opts)

    -- diagnostic
    setKeymap("n", "E", vim.diagnostic.open_float, opts)
    setKeymap("n", "[d", vim.diagnostic.goto_prev, opts)
    setKeymap("n", "]d", vim.diagnostic.goto_next, opts)
end

-- credit: github.com/NvChad/NvChad
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

return M
