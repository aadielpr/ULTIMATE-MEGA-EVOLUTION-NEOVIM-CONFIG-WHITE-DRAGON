local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

local M = {}

M.setup = function()
    mason.setup({
        ui = {
            icons = {
                package_pending = " ",
                package_installed = "󰄳 ",
                package_uninstalled = " 󰚌",
            },
        },
    })

    mason_lsp.setup({
        ensure_installed = {
            "tsserver",
            "html",
            "tailwindcss",
            "lua_ls",
            "gopls",
        },
    })
end

return M
