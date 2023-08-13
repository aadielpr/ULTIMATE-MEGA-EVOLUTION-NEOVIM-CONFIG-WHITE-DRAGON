local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local luasnip = require("luasnip")

local function border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end

cmp.setup {
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(_, item)
            local icons = require("plugins.utils.icons").lspkind
            local icon = (" " .. icons[item.kind] .. " ") or ""
            item.kind = string.format("%s %s", icon, item.kind)
            return item
        end,
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
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
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    window = {
        documentation = {
            border = border("CmpDocBorder"),
            max_height = 15,
            max_width = 60,
        },
    },
}

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
