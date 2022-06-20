require 'Comment'.setup({

    ---LHS of toggle mappings in NORMAL + VISUAL mode
    ---@type table
    toggler = {
        ---Line-comment toggle keymap
        line = '<leader>/',
        ---Block-comment toggle keymap
        block = 'gbc',
    },

    ---LHS of operator-pending mappings in NORMAL + VISUAL mode
    ---@type table
    opleader = {
        ---Line-comment keymap
        line = '<leader>/',
        ---Block-comment keymap
        block = 'gb',
    },

    ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
    ---NOTE: If `mappings = false` then the plugin won't create any mappings
    ---@type boolean|table
    mappings = {
        ---Operator-pending mapping
        ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
        ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
        basic = false,
    },

})

 -- Toggle in Op-pending mode
 vim.keymap.set('n', '<leader>/', '<Plug>(comment_toggle_linewise)')
 vim.keymap.set('n', 'gb', '<Plug>(comment_toggle_blockwise)')

 -- Toggle in VISUAL mode
 vim.keymap.set('x', '<leader>/', '<Plug>(comment_toggle_linewise_visual)')
 vim.keymap.set('x', 'gb', '<Plug>(comment_toggle_blockwise_visual)')
