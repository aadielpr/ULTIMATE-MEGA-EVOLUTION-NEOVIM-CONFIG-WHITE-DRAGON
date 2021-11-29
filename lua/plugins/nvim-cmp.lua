local cmp = require'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "[]",
  Class = "פּ",
  Interface = "蘒",
  Module = "",
  Property = " ",
  Unit = "塞",
  Value = "",
  Enum = "練",
  Keyword = "",
  Snippet = "",
  Color = " ",
  File = "",
  Reference = "",
  Folder = "ﱮ",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "<>"
}

cmp.setup({
  formatting = {
    fields = { 'kind', 'abbr' },
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
      return vim_item
    end
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  completion = {
    keyword_length = 3,
    autocomplete = false
  },
  mapping = {
    ['<Esc>'] = cmp.mapping.abort(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }
  }, {
    { name = 'buffer' },
  }),
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
  }
})

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
