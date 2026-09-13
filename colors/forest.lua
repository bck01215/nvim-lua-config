-- Forest colorscheme: ported from the iTerm2 "Forest" color preset (Ansi/Background/
-- Foreground/Selection/Cursor/Badge/Link colors) plus the finer-grained syntax token
-- colors from the matching VSCode workbench.colorCustomizations / tokenColorCustomizations.
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "forest"

local c = {
  bg = "#0d180f", -- editor background
  bg_dim = "#0a130c", -- sidebar/panel/statusline/tabline background
  bg_alt = "#0e180f", -- input/dropdown/popup background
  bg_highlight = "#132215", -- cursorline / hover
  bg_selection = "#2c4a30",
  bg_visual = "#24391f",
  border = "#1e3324",
  border_focus = "#3d5142",
  fg = "#eef4ec",
  fg_dim = "#d3e0cc",
  fg_dark = "#94aa8c",
  whitespace = "#22331f",
  comment = "#5f7d61",

  cursor = "#9ece6a",
  green = "#9ece6a", -- Ansi 10 / cursor / activitybar fg
  green_bright = "#7bc47f", -- Ansi 2 / tags / added
  green_pale = "#bff06f", -- functions
  teal = "#83e6c0", -- Ansi 6 / types
  teal_dim = "#56b6a0", -- Ansi 4 / info / links / untracked
  aqua = "#6fd0b8", -- Ansi 12 / hints
  aqua_bright = "#a6f0d5", -- Ansi 14
  yellow = "#e2cd86", -- Ansi 3 / strings
  orange = "#e0a35f", -- Ansi 11 / numbers/constants
  orange_dark = "#d98e5c", -- keywords/storage
  tan = "#c9a26b", -- attribute names / modified
  red = "#d97a7a", -- Ansi 1 / errors
  red_bright = "#e8918f", -- Ansi 9
  pink = "#c98fb3", -- Ansi 13
  magenta = "#b3799d", -- Ansi 5
  white = "#f2f6f0", -- variables / bold
  white_dim = "#dfe9da", -- parameters
  white_dimmer = "#cfe6c4", -- properties
  blue_light = "#7fb3e8", -- untracked files (explorer)
  gray = "#556e58", -- Ansi 8 / line numbers
  badge = "#5a9c5e", -- button/badge/activitybarbadge
  badge_hover = "#6ab06e",
}

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor UI
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalNC", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.bg_alt })
hl("FloatBorder", { fg = c.border, bg = c.bg_alt })
hl("FloatTitle", { fg = c.green, bg = c.bg_alt })
hl("Cursor", { fg = c.bg, bg = c.cursor })
hl("CursorLine", { bg = c.bg_highlight })
hl("CursorLineNr", { fg = c.fg, bold = true })
hl("LineNr", { fg = c.gray })
hl("SignColumn", { bg = c.bg })
hl("ColorColumn", { bg = c.bg_highlight })
hl("Visual", { bg = c.bg_selection })
hl("VisualNOS", { bg = c.bg_selection })
hl("Search", { fg = c.bg, bg = c.orange })
hl("IncSearch", { fg = c.bg, bg = c.green })
hl("CurSearch", { fg = c.bg, bg = c.green })
hl("Whitespace", { fg = c.whitespace })
hl("NonText", { fg = c.whitespace })
hl("EndOfBuffer", { fg = c.bg })
hl("Folded", { fg = c.fg_dark, bg = c.bg_dim })
hl("FoldColumn", { fg = c.gray, bg = c.bg })
hl("MatchParen", { bg = c.bg_selection, fg = c.green_bright, bold = true })
hl("WinSeparator", { fg = c.border, bg = c.bg })
hl("VertSplit", { fg = c.border, bg = c.bg })
hl("Pmenu", { fg = c.fg, bg = c.bg_alt })
hl("PmenuSel", { fg = c.fg_dim, bg = c.bg_selection })
hl("PmenuSbar", { bg = c.bg_alt })
hl("PmenuThumb", { bg = c.border_focus })
hl("Directory", { fg = c.green })
hl("Title", { fg = c.green, bold = true })
hl("ErrorMsg", { fg = c.red })
hl("WarningMsg", { fg = c.tan })
hl("ModeMsg", { fg = c.fg_dim })
hl("MoreMsg", { fg = c.green })
hl("Question", { fg = c.green })

-- Statusline / Tabline / Winbar
hl("StatusLine", { fg = c.fg_dim, bg = c.bg_dim })
hl("StatusLineNC", { fg = c.fg_dark, bg = c.bg_dim })
hl("WinBar", { fg = c.fg_dim, bg = c.bg })
hl("WinBarNC", { fg = c.fg_dark, bg = c.bg })
hl("TabLine", { fg = c.fg_dark, bg = c.bg_dim })
hl("TabLineSel", { fg = c.fg_dim, bg = c.bg })
hl("TabLineFill", { bg = c.bg_dim })

-- Diffs / VCS
hl("DiffAdd", { fg = c.green_bright, bg = "NONE" })
hl("DiffChange", { fg = c.tan, bg = "NONE" })
hl("DiffDelete", { fg = c.red_bright, bg = "NONE" })
hl("DiffText", { fg = c.yellow, bg = "NONE" })
hl("GitSignsAdd", { fg = c.green_bright })
hl("GitSignsChange", { fg = c.tan })
hl("GitSignsDelete", { fg = c.red_bright })

-- Diagnostics
hl("DiagnosticError", { fg = c.red })
hl("DiagnosticWarn", { fg = c.tan })
hl("DiagnosticInfo", { fg = c.teal_dim })
hl("DiagnosticHint", { fg = c.aqua })
hl("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = c.tan })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = c.teal_dim })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = c.aqua })

-- Syntax (classic groups)
hl("Comment", { fg = c.comment, italic = true })
hl("Constant", { fg = c.orange })
hl("String", { fg = c.yellow })
hl("Character", { fg = c.orange })
hl("Number", { fg = c.orange })
hl("Boolean", { fg = c.orange })
hl("Float", { fg = c.orange })
hl("Identifier", { fg = c.white })
hl("Function", { fg = c.green_pale, bold = true })
hl("Statement", { fg = c.orange_dark })
hl("Conditional", { fg = c.orange_dark })
hl("Repeat", { fg = c.orange_dark })
hl("Label", { fg = c.orange_dark })
hl("Operator", { fg = c.fg_dim })
hl("Keyword", { fg = c.orange_dark })
hl("Exception", { fg = c.orange_dark })
hl("PreProc", { fg = c.teal })
hl("Include", { fg = c.orange_dark })
hl("Define", { fg = c.orange_dark })
hl("Macro", { fg = c.teal })
hl("Type", { fg = c.teal })
hl("StorageClass", { fg = c.orange_dark })
hl("Structure", { fg = c.teal })
hl("Typedef", { fg = c.teal })
hl("Special", { fg = c.tan })
hl("SpecialChar", { fg = c.tan })
hl("Tag", { fg = c.green_bright })
hl("Delimiter", { fg = c.fg_dim })
hl("Underlined", { underline = true, fg = c.teal_dim })
hl("Ignore", { fg = c.gray })
hl("Todo", { fg = c.bg, bg = c.orange, bold = true })

-- Treesitter
hl("@comment", { link = "Comment" })
hl("@string", { link = "String" })
hl("@number", { link = "Number" })
hl("@boolean", { link = "Boolean" })
hl("@constant", { link = "Constant" })
hl("@constant.builtin", { fg = c.orange, bold = true })
hl("@function", { link = "Function" })
hl("@function.call", { fg = c.green_pale })
hl("@function.builtin", { fg = c.green_pale, italic = true })
hl("@method", { link = "Function" })
hl("@keyword", { link = "Keyword" })
hl("@keyword.function", { fg = c.orange_dark })
hl("@keyword.return", { fg = c.orange_dark })
hl("@keyword.operator", { fg = c.fg_dim })
hl("@operator", { link = "Operator" })
hl("@variable", { fg = c.white })
hl("@variable.parameter", { fg = c.white_dim })
hl("@variable.member", { fg = c.white_dimmer })
hl("@variable.builtin", { fg = c.orange, italic = true })
hl("@property", { fg = c.white_dimmer })
hl("@field", { fg = c.white_dimmer })
hl("@type", { link = "Type" })
hl("@type.builtin", { fg = c.teal, italic = true })
hl("@tag", { link = "Tag" })
hl("@tag.attribute", { fg = c.tan })
hl("@tag.delimiter", { fg = c.fg_dim })
hl("@punctuation.bracket", { fg = c.fg_dim })
hl("@punctuation.delimiter", { fg = c.fg_dim })
hl("@punctuation.special", { fg = c.tan })
hl("@module", { fg = c.teal })
hl("@namespace", { fg = c.teal })

-- LSP semantic tokens (fall back to Treesitter mapping)
hl("@lsp.type.class", { link = "@type" })
hl("@lsp.type.enum", { link = "@type" })
hl("@lsp.type.interface", { link = "@type" })
hl("@lsp.type.struct", { link = "@type" })
hl("@lsp.type.parameter", { link = "@variable.parameter" })
hl("@lsp.type.property", { link = "@property" })
hl("@lsp.type.variable", { link = "@variable" })
hl("@lsp.type.function", { link = "@function" })
hl("@lsp.type.method", { link = "@function" })

-- Snacks explorer / picker
hl("SnacksPickerGitStatusUntracked", { fg = c.blue_light }) -- distinct from PathHidden (NonText)

-- Terminal colors (also used by :terminal / toggleterm — matches the iTerm2 Forest preset)
vim.g.terminal_color_0 = "#0d180f"
vim.g.terminal_color_1 = "#d97a7a"
vim.g.terminal_color_2 = "#7bc47f"
vim.g.terminal_color_3 = "#e2cd86"
vim.g.terminal_color_4 = "#56b6a0"
vim.g.terminal_color_5 = "#b3799d"
vim.g.terminal_color_6 = "#83e6c0"
vim.g.terminal_color_7 = "#d3e0cc"
vim.g.terminal_color_8 = "#556e58"
vim.g.terminal_color_9 = "#e8918f"
vim.g.terminal_color_10 = "#9ece6a"
vim.g.terminal_color_11 = "#e0a35f"
vim.g.terminal_color_12 = "#6fd0b8"
vim.g.terminal_color_13 = "#c98fb3"
vim.g.terminal_color_14 = "#a6f0d5"
vim.g.terminal_color_15 = "#eef4ec"
vim.g.terminal_color_background = "#0a130c"
vim.g.terminal_color_foreground = "#eef4ec"
