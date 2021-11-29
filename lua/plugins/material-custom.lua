local yellow = '#FFCB6B'
local cyan = '#89DDFF'
local fg = '#BFC7D5'
local pink = '#FF8A9D'
local gold = '#FFD700'

require('material').setup({
  custom_highlights = {
      TSConstructor = { fg = yellow },
      TSType = { fg = yellow },
      TSTypeBuiltin = { fg = yellow },
      TSProperty = { fg = fg },
      TSParameter = { fg = fg },
      TSPunctDelimiter = { fg = cyan },
      TSPunctSpecial = { fg = cyan },
      TSPunctBracket = { fg = gold },
      TSRepeat = { fg = cyan },
      TSParameterReference = { fg = fg },
      TSConditional = { fg = cyan },
      TSBoolean = { fg = pink },
      TSConstant = { fg = fg },
      TSConstBuiltin = { fg = cyan },
      TSKeywordOperator = { fg = cyan },
      TSField = { fg = fg },
      TSVariable = { fg = fg },
      TSVariableBuiltin = { fg = cyan },
      LineNr = { fg = '#6c7187' },
      CursorLineNr = { fg = fg },
      ModeMsg = { fg = fg },
      MatchParen = { fg = '#C792EA', bg = 'NONE', style = 'bold' },
      NvimTreeNormal = { fg = '#8f97a6', bg = '#1B1E2B' },
      NvimTreeFolderName = { fg = fg },
      NvimTreeOpenedFolderName = { fg = fg },
      NvimTreeIndentMarker = { fg = fg },
      NvimTreeFolderIcon = { fg = fg },
      TelescopePromptBorder = { fg = cyan },
      TelescopeResultsBorder = { fg = cyan },
      TelescopePreviewBorder = { fg = cyan },
      TelescopeSelectionCaret = { fg = '#FF8A9D' },
      TelescopeSelection = { fg = fg, bg = '#414863'},
      TelescopeNormal = { fg = '#8f97a6' },
      Pmenu = { fg = fg, bg = '#202331' },
      PmenuSel = { bg = "#414863", fg = "#71c6e7" }
  }
})
