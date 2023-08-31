local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local luasnip = require("luasnip")
local compare = require("cmp.config.compare")

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

compare.lsp_scores = function(entry1, entry2)
    local diff
    if entry1.completion_item.score and entry2.completion_item.score then
        diff = (entry2.completion_item.score * entry2.score)
            - (entry1.completion_item.score * entry1.score)
    else
        diff = entry2.score - entry1.score
    end
    return (diff < 0)
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
    sorting = {
        priority_weight = 2,
        comparator = {
            compare.offset, -- Items closer to cursor will have lower priority
            compare.exact,
            -- compare.scopes,
            compare.lsp_scores,
            compare.sort_text,
            compare.score,
            compare.recently_used,
            compare.kind,
            compare.length,
            compare.order,
        },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
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
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = "nvim_lsp", max_item_count = 350 },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
    },
    window = {
        completion = {
            winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:PmenuSel",
            scrollbar = false,
        },
        documentation = {
            border = border("CmpDocBorder"),
            winhighlight = "Normal:CmpDoc",
        },
    },
}

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
