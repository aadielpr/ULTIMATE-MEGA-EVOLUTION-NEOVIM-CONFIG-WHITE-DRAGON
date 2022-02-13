local root_pattern = require'lspconfig.util'.root_pattern
local lspconfig = require 'lspconfig'

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  if client.name == 'efm' then
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.goto_definition = false
    return
  end

  if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false
  end

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--  buf_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n','<space>.','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        severity_limit = 'Warning',
        prefix = ''
      },
      signs = true,
      update_in_insert = false,
      severity_sort = true,
      underline = false
    }
  )
}

local prettier = {
   formatCommand = 'prettier --stdin-filepath ${INPUT}',
   formatStdin = true
}

-- setup
lspconfig.tsserver.setup {
  on_attach = on_attach,
  --filetypes = { "typescript" },
  filetypes = { "typescript", "javascript" },
  root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  capabilities = capabilities,
  handlers = handlers
}

lspconfig.efm.setup {
  on_attach = on_attach,
  settings = {
    rootMarkers = {".git/"},
    languages = {
      javascript = {prettier},
      typescript = {prettier},
    }
  },
  filetypes = {
    "javascript",
    "typescript",
  },
}
-- auto popup diagnostic & help doc (insert mode) under cursor hover
-- vim.api.nvim_command [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
-- vim.api.nvim_command [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

vim.fn.sign_define("DiagnosticSignError", {text = "", texthl = "LspDiagnosticsSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", texthl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", texthl = "LspDiagnosticsSignInformation"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "LspDiagnosticsSignHint"})
