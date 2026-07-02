" Catppuccin Latte fallback colorscheme for Vim.
" Keeps Vim usable even before vim-plug has installed catppuccin/vim.

set background=light
highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "catppuccin_latte"

let s:rosewater = "#dc8a78"
let s:flamingo = "#dd7878"
let s:pink = "#ea76cb"
let s:mauve = "#8839ef"
let s:red = "#d20f39"
let s:maroon = "#e64553"
let s:peach = "#fe640b"
let s:yellow = "#df8e1d"
let s:green = "#40a02b"
let s:teal = "#179299"
let s:sky = "#04a5e5"
let s:sapphire = "#209fb5"
let s:blue = "#1e66f5"
let s:lavender = "#7287fd"
let s:text = "#4c4f69"
let s:subtext1 = "#5c5f77"
let s:subtext0 = "#6c6f85"
let s:overlay2 = "#7c7f93"
let s:overlay1 = "#8c8fa1"
let s:overlay0 = "#9ca0b0"
let s:surface2 = "#acb0be"
let s:surface1 = "#bcc0cc"
let s:surface0 = "#ccd0da"
let s:base = "#eff1f5"
let s:mantle = "#e6e9ef"
let s:crust = "#dce0e8"

function! s:hi(group, fg, bg, attr) abort
  let l:cmd = "highlight " . a:group
  let l:cmd .= empty(a:fg) ? " guifg=NONE ctermfg=NONE" : " guifg=" . a:fg
  let l:cmd .= empty(a:bg) ? " guibg=NONE ctermbg=NONE" : " guibg=" . a:bg
  let l:cmd .= empty(a:attr) ? " gui=NONE cterm=NONE" : " gui=" . a:attr . " cterm=" . a:attr
  execute l:cmd
endfunction

call s:hi("Normal", s:text, s:base, "")
call s:hi("NormalFloat", s:text, s:mantle, "")
call s:hi("Comment", s:overlay1, "", "italic")
call s:hi("Constant", s:peach, "", "")
call s:hi("String", s:green, "", "")
call s:hi("Character", s:teal, "", "")
call s:hi("Number", s:peach, "", "")
call s:hi("Boolean", s:peach, "", "")
call s:hi("Identifier", s:blue, "", "")
call s:hi("Function", s:blue, "", "")
call s:hi("Statement", s:mauve, "", "")
call s:hi("Conditional", s:mauve, "", "")
call s:hi("Repeat", s:mauve, "", "")
call s:hi("Label", s:sapphire, "", "")
call s:hi("Operator", s:sky, "", "")
call s:hi("Keyword", s:mauve, "", "")
call s:hi("PreProc", s:pink, "", "")
call s:hi("Include", s:mauve, "", "")
call s:hi("Define", s:mauve, "", "")
call s:hi("Type", s:yellow, "", "")
call s:hi("StorageClass", s:yellow, "", "")
call s:hi("Structure", s:yellow, "", "")
call s:hi("Special", s:pink, "", "")
call s:hi("Underlined", s:blue, "", "underline")
call s:hi("Error", s:red, s:base, "bold")
call s:hi("Todo", s:base, s:yellow, "bold")

call s:hi("Cursor", s:base, s:text, "")
call s:hi("CursorLine", "", s:surface0, "")
call s:hi("CursorColumn", "", s:surface0, "")
call s:hi("LineNr", s:overlay0, s:base, "")
call s:hi("CursorLineNr", s:blue, s:surface0, "bold")
call s:hi("SignColumn", s:overlay0, s:base, "")
call s:hi("ColorColumn", "", s:surface0, "")
call s:hi("VertSplit", s:surface2, s:base, "")
call s:hi("StatusLine", s:text, s:surface1, "")
call s:hi("StatusLineNC", s:overlay1, s:surface0, "")
call s:hi("TabLine", s:subtext0, s:surface0, "")
call s:hi("TabLineSel", s:blue, s:base, "bold")
call s:hi("TabLineFill", s:overlay0, s:surface0, "")
call s:hi("Pmenu", s:text, s:mantle, "")
call s:hi("PmenuSel", s:base, s:blue, "")
call s:hi("PmenuSbar", "", s:surface1, "")
call s:hi("PmenuThumb", "", s:surface2, "")
call s:hi("Search", s:base, s:yellow, "")
call s:hi("IncSearch", s:base, s:peach, "")
call s:hi("Visual", "", s:surface1, "")
call s:hi("MatchParen", s:red, s:surface1, "bold")
call s:hi("NonText", s:overlay0, "", "")
call s:hi("SpecialKey", s:overlay0, "", "")
call s:hi("Folded", s:subtext0, s:mantle, "")
call s:hi("FoldColumn", s:overlay0, s:base, "")
call s:hi("DiffAdd", s:green, s:surface0, "")
call s:hi("DiffChange", s:yellow, s:surface0, "")
call s:hi("DiffDelete", s:red, s:surface0, "")
call s:hi("DiffText", s:blue, s:surface1, "bold")

call s:hi("GitGutterAdd", s:green, s:base, "")
call s:hi("GitGutterChange", s:yellow, s:base, "")
call s:hi("GitGutterDelete", s:red, s:base, "")

hi! link markdownHeadingDelimiter Keyword
hi! link markdownCode String
hi! link markdownCodeBlock String
hi! link markdownLinkText Identifier

