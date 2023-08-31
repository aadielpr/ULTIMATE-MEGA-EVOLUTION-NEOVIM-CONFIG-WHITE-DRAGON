local lsp = require("lspconfig")
local util = require("lspconfig/util")

require("plugins.lsp.diagnostic")
require("plugins.lsp.mason")
require("plugins.lsp.null-ls")

local function on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "fm", function()
        vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set("n", "H", vim.lsp.buf.signature_help, opts)

    -- diagnostic
    vim.keymap.set("n", "E", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- SETUP
lsp.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
}

lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
}

lsp.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            -- analyses = {
            --     nilness = true,
            --     unusedparams = false,
            --     unusedwrite = true,
            --     useany = true,
            -- },
        },
    },
}

lsp.dockerls.setup {
    on_attach = on_attach,
}

require("lsp_signature").setup {
    hint_enable = false, -- virtual hint enable
}
