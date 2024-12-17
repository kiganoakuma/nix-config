-- Catppuccin Mocha colors
local colors = {
	-- Base colors
	rosewater = "#f5e0dc",
	flamingo = "#f2cdcd",
	pink = "#f5c2e7",
	mauve = "#cba6f7",
	red = "#f38ba8",
	maroon = "#eba0ac",
	peach = "#fab387",
	yellow = "#f9e2af",
	green = "#a6e3a1",
	teal = "#94e2d5",
	sky = "#89dceb",
	sapphire = "#74c7ec",
	blue = "#89b4fa",
	lavender = "#b4befe",

	-- Surface colors
	text = "#cdd6f4",
	subtext1 = "#bac2de",
	subtext0 = "#a6adc8",
	overlay2 = "#9399b2",
	overlay1 = "#7f849c",
	overlay0 = "#6c7086",
	surface2 = "#585b70",
	surface1 = "#45475a",
	surface0 = "#313244",

	-- Base backgrounds
	base = "#1e1e2e",
	mantle = "#181825",
	crust = "#11111b",
}

local highlights = {
	-- Editor UI
	Normal = { fg = colors.text, bg = colors.base },
	NormalFloat = { fg = colors.text, bg = colors.mantle },
	FloatBorder = { fg = colors.blue },
	Visual = { bg = colors.surface1 },
	VisualNOS = { bg = colors.surface1 },
	LineNr = { fg = colors.surface1 },
	CursorLineNr = { fg = colors.lavender },
	CursorLine = { bg = colors.surface0 },
	CursorColumn = { bg = colors.surface0 },
	SignColumn = { bg = colors.base },
	ColorColumn = { bg = colors.surface0 },
	Whitespace = { fg = colors.surface2 },
	VertSplit = { fg = colors.surface0 },

	-- Syntax
	Comment = { fg = colors.overlay0, italic = true },
	Constant = { fg = colors.peach },
	String = { fg = colors.green },
	Character = { fg = colors.teal },
	Number = { fg = colors.peach },
	Boolean = { fg = colors.peach },
	Float = { fg = colors.peach },

	Identifier = { fg = colors.mauve },
	Function = { fg = colors.blue },
	Statement = { fg = colors.mauve },
	Conditional = { fg = colors.mauve },
	Repeat = { fg = colors.mauve },
	Label = { fg = colors.sapphire },
	Operator = { fg = colors.sky },
	Keyword = { fg = colors.red },
	Exception = { fg = colors.red },

	PreProc = { fg = colors.pink },
	Include = { fg = colors.pink },
	Define = { fg = colors.pink },
	Macro = { fg = colors.pink },
	PreCondit = { fg = colors.pink },

	Type = { fg = colors.yellow },
	StorageClass = { fg = colors.yellow },
	Structure = { fg = colors.yellow },
	Typedef = { fg = colors.yellow },

	Special = { fg = colors.pink },
	SpecialChar = { fg = colors.pink },
	Tag = { fg = colors.blue },
	Delimiter = { fg = colors.overlay2 },
	SpecialComment = { fg = colors.surface2 },
	Debug = { fg = colors.yellow },

	-- Menus
	Pmenu = { fg = colors.overlay2, bg = colors.surface0 },
	PmenuSel = { fg = colors.text, bg = colors.surface1 },
	PmenuSbar = { bg = colors.surface0 },
	PmenuThumb = { bg = colors.overlay0 },

	-- Search
	Search = { bg = colors.surface1, fg = colors.pink },
	IncSearch = { bg = colors.pink, fg = colors.mantle },

	-- Messages
	ErrorMsg = { fg = colors.red },
	WarningMsg = { fg = colors.yellow },
	MoreMsg = { fg = colors.blue },
	Question = { fg = colors.blue },

	-- Diagnostics
	DiagnosticError = { fg = colors.red },
	DiagnosticWarn = { fg = colors.yellow },
	DiagnosticInfo = { fg = colors.blue },
	DiagnosticHint = { fg = colors.teal },
	DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
	DiagnosticUnderlineWarn = { sp = colors.yellow, undercurl = true },
	DiagnosticUnderlineInfo = { sp = colors.blue, undercurl = true },
	DiagnosticUnderlineHint = { sp = colors.teal, undercurl = true },

	-- Status and Tab Line
	StatusLine = { fg = colors.text, bg = colors.mantle },
	StatusLineNC = { fg = colors.surface1, bg = colors.mantle },
	TabLine = { fg = colors.surface1, bg = colors.mantle },
	TabLineSel = { fg = colors.text, bg = colors.surface0 },
	TabLineFill = { bg = colors.mantle },

	-- Git
	DiffAdd = { bg = colors.surface0, fg = colors.green },
	DiffChange = { bg = colors.surface0, fg = colors.yellow },
	DiffDelete = { bg = colors.surface0, fg = colors.red },
	DiffText = { bg = colors.surface0, fg = colors.blue },

	-- Misc
	MatchParen = { bg = colors.surface2 },
	NonText = { fg = colors.surface2 },
	SpecialKey = { fg = colors.surface2 },
	Folded = { fg = colors.blue, bg = colors.surface0 },
	FoldColumn = { fg = colors.overlay0, bg = colors.base },
	WildMenu = { bg = colors.surface0 },
	Directory = { fg = colors.blue },
	Title = { fg = colors.blue, bold = true },
	Bold = { bold = true },
	Italic = { italic = true },
}

-- Apply highlights
for group, settings in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, settings)
end

-- Terminal colors
vim.g.terminal_color_0 = colors.surface1
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.pink
vim.g.terminal_color_6 = colors.teal
vim.g.terminal_color_7 = colors.subtext1
vim.g.terminal_color_8 = colors.surface2
vim.g.terminal_color_9 = colors.red
vim.g.terminal_color_10 = colors.green
vim.g.terminal_color_11 = colors.yellow
vim.g.terminal_color_12 = colors.blue
vim.g.terminal_color_13 = colors.pink
vim.g.terminal_color_14 = colors.teal
vim.g.terminal_color_15 = colors.subtext0
