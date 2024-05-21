local t = require("trouble")

t.setup {
    icons = false,
}

vim.keymap.set("n", "<leader>tt", function()
    t.toggle()
end)
vim.keymap.set("n", "<leader>tw", function()
    t.toggle("workspace_diagnostics")
end)
vim.keymap.set("n", "<leader>td", function()
    t.toggle("document_diagnostics")
end)
vim.keymap.set("n", "<leader>tq", function()
    t.toggle("quickfix")
end)
vim.keymap.set("n", "<leader>tl", function()
    t.toggle("loclist")
end)
vim.keymap.set("n", "[t", function()
    t.next { skip_groups = true, jump = true }
end)

vim.keymap.set("n", "]t", function()
    t.previous { skip_groups = true, jump = true }
end)
