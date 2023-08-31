local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

null_ls.setup {
    sources = {
        formatting.prettier,
        formatting.stylua,
        formatting.gofumpt,
        formatting.goimports_reviser,
        formatting.golines,
    },
}