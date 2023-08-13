local harpoon = require("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

harpoon.setup {}

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-s>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-d>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-f>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-g>", function() ui.nav_file(4) end)

