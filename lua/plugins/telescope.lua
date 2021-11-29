local actions = require('telescope.actions')

local function tele_map(map, cmd)
  local opt = { noremap = true, silent = true }
  local v_cmd = "<cmd>lua require('telescope.builtin')."..cmd.."()<cr>"
  return vim.api.nvim_set_keymap('n', map, v_cmd, opt)
end

tele_map('ff', 'find_files')
tele_map('fb', 'current_buffer_fuzzy_find')
tele_map('fg', 'live_grep')

require('telescope').setup{
  defaults = {
    prompt_prefix = " ",
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
    current_buffer_fuzzy_find = {
      theme = "dropdown",
    }
  },
}