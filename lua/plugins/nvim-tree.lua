-- set number on tree
-- require('nvim-tree.view').View.winopts.number = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require'nvim-tree'.setup {
    diagnostics = {
        enable = true
    },
    view = {
        width = 35,
        hide_root_folder = true,
        side = 'left'
    },
    renderer = {
      indent_markers = {
        enable = true
      },
    },
    filters = {
        dotfiles = true,
        custom = {'node_modules', '.cache', '.bin', '.DS_Store'}
    }
}

-- NvimTree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {
    noremap = true
})
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', {
    noremap = true
})
