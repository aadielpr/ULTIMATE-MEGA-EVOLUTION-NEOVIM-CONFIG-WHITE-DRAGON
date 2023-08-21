local setKeymap = require("plugins.utils.keymap").setKeyMap

local opt = { noremap = true, silent = true }
-- Split window
setKeymap("n", "ss", "<Cmd>split<CR><C-w>w", opt)
setKeymap("n", "sv", "<Cmd>vsplit<CR><C-w>w", opt)

setKeymap("n", "<C-j>", "<C-w>j")
setKeymap("n", "<C-k>", "<C-w>k")
setKeymap("n", "<C-l>", "<C-w>l")
setKeymap("n", "<C-h>", "<C-w>h")

setKeymap("n", "Q", "")
setKeymap("n", "<F1>", "")
setKeymap("i", "<F1>", "")
setKeymap("n", "<leader>v", ":noh<CR>", opt)

-- Copy, Cut, Paste
setKeymap("", "<leader>c", '"+y', opt)
setKeymap("", "<leader>x", '"+d', opt)
setKeymap("", "<leader>p", '"+p', opt)

setKeymap("n", "sj", ":m+<CR>", opt)
setKeymap("n", "sk", ":m-2<CR>", opt)

-- go to normal mode when pressing jk
setKeymap('i', '<C-c>', '<Esc>', opt)
