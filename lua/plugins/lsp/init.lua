local diagnostic = require("plugins.lsp.diagnostic")
local mason = require("plugins.lsp.mason")
local null_ls = require("plugins.lsp.null_ls")
local lsp_config = require("plugins.lsp.lsp_config")

null_ls.setup()
mason.setup()
diagnostic.setup()

lsp_config.setup()
