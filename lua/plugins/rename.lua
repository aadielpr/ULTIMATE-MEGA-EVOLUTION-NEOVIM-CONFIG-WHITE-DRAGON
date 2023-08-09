local setKeymap = require("plugins.utils.keymap").setKeyMap

require("inc_rename").setup {}

setKeymap("n", "<leader>rn", ":IncRename ")
