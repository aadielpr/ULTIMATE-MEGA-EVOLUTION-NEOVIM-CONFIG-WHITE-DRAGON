local setKeymap = require("plugins.utils.keymap").setKeyMap

require("toggleterm").setup {
    size = 10,
    direction = "horizontal",
    open_mapping = [[<c-\>]],
    close_on_exit = true,
    hide_numbers = true,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
}

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    setKeymap("t", "<esc>", [[<C-\><C-n>]], opts)
    setKeymap("t", "jk", [[<C-\><C-n>]], opts)
    setKeymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    setKeymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    setKeymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    setKeymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    setKeymap("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
