require 'plugins/material-custom'
local opt = vim.opt
local cmd = vim.cmd

vim.g.material_style = "deep ocean"
cmd 'colorscheme material'

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
opt.colorcolumn = '100'
opt.tagrelative = false
opt.fileformat = 'unix'
opt.wrap = false
opt.smartindent = true
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
--opt.shiftwidth = 4
--opt.softtabstop = 4

opt.signcolumn = 'yes'
