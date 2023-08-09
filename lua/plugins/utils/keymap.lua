local keymap = vim.keymap

local M = {}

function M.setKeyMap(mode, l, r, opts)
    opts = opts or {}
    opts.silent = true
    keymap.set(mode, l, r, opts)
end

return M
