local g = vim.g

g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_disable_window_picker = 1
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

g.nvim_tree_icons = {
	default = "",
        git = {
          untracked = "",
          unstaged = ""
        }
}
-- set number on tree
-- require('nvim-tree.view').View.winopts.number = true

require'nvim-tree'.setup {
  auto_close = false,
  diagnostics = {
    enable = true,
  },
  system_open = {
    cmd = nil,
    args = {}
  },
  view = {
    width = 35,
    auto_resize = true,
    hide_root_folder = true,
    side = 'left'
  },
  filters = { 
    dotfiles = true,
    custom = { '.git', 'node_modules', '.cache', '.bin', '.DS_Store' },
  }
}

-- NvimTree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true })
