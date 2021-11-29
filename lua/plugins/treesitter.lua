if not pcall(require, "nvim-treesitter") then
  return
end

require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  }
}
