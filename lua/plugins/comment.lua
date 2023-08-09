local comment = require("Comment")

comment.setup {
    pre_hook = function(ctx)
        local U = require("Comment.utils")
        local txU = require("ts_context_commentstring.utils")
        local txI = require("ts_context_commentstring.internal")

        local location = nil
        if ctx.ctype == U.ctype.block then
            location = txU.get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = txU.get_visual_start_location()
        end

        return txI.calculate_commentstring {
            key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
            location = location,
        }
    end,
}
