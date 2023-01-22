local function map(mod, lhs, rhs, opt)
  return vim.api.nvim_set_keymap(mod, lhs, rhs, opt or {})
end

local opt = { noremap = true, silent = true }
-- Split window
map('n', 'ss', '<Cmd>split<CR><C-w>w', { noremap = true })
map('n', 'sv', '<Cmd>vsplit<CR><C-w>w', { noremap = true })

map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')

map('n', 'Q', '')
map('n', '<F1>', '')
map('i', '<F1>', '')
map('n', '<leader>v', ':noh<CR>', { silent = true })

-- Copy, Cut, Paste
map('', '<leader>c', '"+y', opt)
map('', '<leader>x', '"+d', opt)
map('', '<leader>p', '"+p', opt)

map('n', 'sj', ':m+<CR>', opt)
map('n', 'sk', ':m-2<CR>', opt)

