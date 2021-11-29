require('lualine').setup {
  options = {
    section_separators = '', 
    component_separators = '',
    theme = 'nord',
    disabled_filetypes = {'NvimTree'},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {
      { 'diagnostics',
        sources = {"nvim_lsp"},
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}
      },
      'encoding',
      'filetype'
    },
    lualine_y = {}
  }
}
