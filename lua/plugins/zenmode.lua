local setKeymap = require("plugins.utils.keymap").setKeyMap
local zenmode = require("zen-mode")

setKeymap("n", "<leader>z", function()
    zenmode.toggle {}
end, { silent = true, noremap = true })
