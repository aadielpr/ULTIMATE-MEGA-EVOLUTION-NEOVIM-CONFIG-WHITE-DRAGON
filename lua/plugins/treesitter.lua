if not pcall(require, "nvim-treesitter") then
    return
end

require'nvim-treesitter.configs'.setup {
    --[[ autotag = { ]]
    --[[     enable = true, ]]
    --[[     disable = {"xml", "markdown"} ]]
    --[[ }, ]]
  --  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "help", "typescript", "json", "javascript" },
  auto_install = true,

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
    highlight = {
        enable = true,
        disable = {}
    },
    indent = {
        enable = true,
        disable = {}
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    },
    playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
