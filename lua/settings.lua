local opt = vim.opt
local cmd = vim.cmd

opt.splitbelow = true
opt.splitright = true
opt.showmode = false
opt.mouse = 'a'
opt.termguicolors = true
opt.hidden = true
opt.updatetime = 300
opt.history = 50
opt.lazyredraw = true
opt.synmaxcol = 150
opt.backup = false
opt.writebackup = false
opt.number = true
opt.cursorline = true
opt.belloff = 'all'
opt.pumheight = 10
opt.signcolumn = 'yes'
opt.tagrelative = false
opt.fileformat = 'unix'
opt.wrap = false
opt.smartindent = true
opt.autoindent = true
opt.expandtab = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.shiftwidth = 4
opt.softtabstop = 4
opt.relativenumber = true
opt.list = true
opt.listchars:append('tab:> ')

--opt.colorcolumn = '100'

--vim.cmd 'colorscheme minimal-base16'

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
      opt.shiftwidth = 8
      opt.softtabstop = 8
      opt.expandtab = false
    end
})
