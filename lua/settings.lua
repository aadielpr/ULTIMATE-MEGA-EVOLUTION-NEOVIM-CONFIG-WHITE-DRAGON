local opt = vim.opt

opt.cursorline = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.belloff = "all"
opt.history = 50
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.fileformat = "unix"
opt.wrap = false
opt.iskeyword:append("-") -- consider string-string as whole word
opt.updatetime = 200

-- Indenting
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

--[[ opt.shiftwidth = 4 ]]
--[[ opt.tabstop = 4 ]]
--[[ opt.softtabstop = 4 ]]
opt.autoindent = true
opt.breakindent = true
opt.smartindent = true
opt.expandtab = true
opt.smarttab = true

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.ruler = false

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
