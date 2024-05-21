local lspconfig = require("lspconfig")

local function on_attach(client, bufnr)
    if client.name ~= "efm" then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end

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

require("mason").setup {}
require("mason-lspconfig").setup {
    ensure_installed = {
        "tsserver",
        "lua_ls",
        "gopls",
        "clangd",
    },
    automatic_installation = true,
    handlers = {
        function(server_name) -- default handler (optional)
            lspconfig[server_name].setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
        end,
        ["lua_ls"] = function()
            lspconfig.lua_ls.setup {
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
        end,
        ["efm"] = function()
            local prettier = require("efmls-configs.formatters.prettier_d")
            local stylua = require("efmls-configs.formatters.stylua")
            local gofumpt = require("efmls-configs.formatters.gofumpt")
            local goimports = require("efmls-configs.formatters.goimports")
            local golines = require("efmls-configs.formatters.golines")
            local c_formatter = require("efmls-configs.formatters.clang_format")

            local languages = {
                typescript = { prettier },
                typescriptreact = { prettier },
                json = { prettier },
                javascript = { prettier },
                go = { gofumpt, goimports, golines },
                lua = { stylua },
                c = { c_formatter },
            }

            lspconfig.efm.setup {
                on_attach = on_attach,
                filetypes = vim.tbl_keys(languages),
                settings = {
                    rootMarkers = { ".git/" },
                    languages = languages,
                },
                init_options = {
                    documentFormatting = true,
                    documentRangeFormatting = true,
                },
            }
        end,
    },
}

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered {
            winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        },
        documentation = cmp.config.window.bordered { winhighlight = "FloatBorder:FloatBorder" },
    },
    mapping = {
        ["<Esc>"] = cmp.mapping.close(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ["<C-n>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ["<C-p>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
    },
}

vim.diagnostic.config {
    -- update_in_insert = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}

-- Decorate floating windows
vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
