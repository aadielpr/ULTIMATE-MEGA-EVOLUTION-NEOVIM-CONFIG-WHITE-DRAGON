require('lualine').setup {
  options = {
    section_separators = '',
    component_separators = {left = '', right = ''},
    theme = 'material-nvim',
    disabled_filetypes = {'NvimTree'},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {
      { 'diagnostics',
        sources = {"nvim_diagnostic"},
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}
      },
      'encoding',
      {'filetype',
        icon_only = true
      }
    },
    lualine_y = {}
  }
}
