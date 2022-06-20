-- set number on tree
-- require('nvim-tree.view').View.winopts.number = true

require'nvim-tree'.setup {
  diagnostics = {
    enable = true,
  },
  view = {
    adaptive_size = true,
    hide_root_folder = true,
    side = 'left'
  },
  renderer = {
    icons = {
      git_placement = "signcolumn",
      show = {
        folder_arrow = false
      }
    }
  },
  filters = { 
    dotfiles = true,
    custom = { '.git', 'node_modules', '.cache', '.bin', '.DS_Store' },
  }
}

-- NvimTree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true })
