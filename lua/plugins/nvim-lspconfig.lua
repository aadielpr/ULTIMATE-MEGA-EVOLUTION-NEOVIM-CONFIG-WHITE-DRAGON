local root_pattern = require'lspconfig.util'.root_pattern
local lspconfig = require 'lspconfig'

local function lsp_keymaps(bufnr)
    local opts = {
        noremap = true,
        silent = true,
        buffer = bufnr
    }
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.keymap.set('n', '<space>.', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.keymap.set('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    vim.keymap.set('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
end

local on_attach = function(client, bufnr)

    if client.name == 'tsserver' then
        client.server_capabilities.document_formatting = false
    end

    lsp_keymaps(bufnr)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.tsserver.setup {
    on_attach = on_attach,
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
    root_dir = root_pattern("package.json"),
    capabilities = capabilities
}

lspconfig.pyright.setup {
    on_attach = on_attach,
    filetypes = {"python"},
    capabilities = capabilities
}

lspconfig.gopls.setup {
    on_attach = on_attach,
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true
            },
            experimentalPostfixCompletions = true,
            gofumpt = true,
            staticcheck = true,
            usePlaceholders = true
        }
    }
}

local prettier = {
    formatCommand = 'prettier --stdin-filepath ${INPUT}',
    formatStdin = true
}

lspconfig.efm.setup {
    init_options = {
        documentFormatting = true
    },
    on_attach = on_attach,
    root_dir = root_pattern(".git/", "package.json"),
    settings = {
        rootMarkers = {".git/"},
        languages = {
            javascript = {prettier},
            typescript = {prettier},
            typescriptreact = {prettier},
            javascriptreact = {prettier},
            html = {prettier}
        }
    },
    filetypes = {"javascript", "typescript", "typescriptreact", "javascriptreact", "html"}
}
