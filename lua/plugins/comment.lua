local comment = require("Comment")

require("ts_context_commentstring").setup {
    enable_autocmd = false,
}

comment.setup {
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
}
