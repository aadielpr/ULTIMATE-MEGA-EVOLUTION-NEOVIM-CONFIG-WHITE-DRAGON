require('lualine').setup {
  options = {
    component_separators = '|',
    section_separators = '',
    theme = 'tokyonight',
    disabled_filetypes = {'NvimTree'},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename', 'branch'},
    lualine_c = {
      { 'diagnostics',
        sources = {"nvim_diagnostic"},
        symbols = {error = " ", warn = " ", info = " ", hint = " "}
      },
    },
    lualine_x = {},
    lualine_y = {
      {'filetype',
        icon_only = true
      }
    },
    lualine_z = {'location'},
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
