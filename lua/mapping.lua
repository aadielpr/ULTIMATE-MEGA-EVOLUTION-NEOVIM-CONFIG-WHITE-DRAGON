-- Split window
vim.keymap.set("n", "ss", "<Cmd>split<CR><C-w>w")
vim.keymap.set("n", "sv", "<Cmd>vsplit<CR><C-w>w")

vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")

vim.keymap.set("n", "Q", "")
vim.keymap.set("n", "<F1>", "")
vim.keymap.set("i", "<F1>", "")
vim.keymap.set("n", "<leader>v", ":noh<CR>")

-- Copy, Cut, Paste
vim.keymap.set("", "<leader>c", '"+y')
vim.keymap.set("", "<leader>x", '"+d')
vim.keymap.set("", "<leader>p", '"+p')

vim.keymap.set("n", "sj", ":m+<CR>")
vim.keymap.set("n", "sk", ":m-2<CR>")

-- go to normal mode when pressing CTRL+C
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
