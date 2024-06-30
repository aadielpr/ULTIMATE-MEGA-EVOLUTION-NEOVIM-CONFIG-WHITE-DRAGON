local luasnip = require("luasnip")
local cmp = require("cmp")
local lspkind = require("lspkind")
local npairs = require("nvim-autopairs")
local ibl = require("ibl")

vim.opt.completeopt = { "menu", "menuone", "noselect" }

npairs.setup { enable_check_bracket_line = false }
ibl.setup {}

cmp.setup {
    completion = {
        keyword_length = 3,
    },
    formatting = { format = lspkind.cmp_format() },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered {
            winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
            border = "single",
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
