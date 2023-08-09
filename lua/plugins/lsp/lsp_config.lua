local lsp = require("lspconfig")
local util = require("lspconfig/util")
local opt = require("plugins.lsp.options")

local M = {}

M.setup = function()
    local lua = lsp.lua_ls
    local typescript = lsp.tsserver
    local golang = lsp.gopls

    lua.setup({
        on_attach = opt.onAttach,
        capabilities = opt.capabilities,

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
    })

    typescript.setup({
        on_attach = opt.onAttach,
        capabilities = opt.capabilities,
        filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
        },
    })

    golang.setup({
        on_attach = opt.onAttach,
        capabilities = opt.capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
            gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                    unusedparams = true,
                },
            },
        },
    })
end

return M
