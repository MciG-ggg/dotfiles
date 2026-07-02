" Minimal Catppuccin Latte airline theme fallback.

let g:airline#themes#catppuccin#palette = {}

let s:base = "#eff1f5"
let s:mantle = "#e6e9ef"
let s:surface0 = "#ccd0da"
let s:surface1 = "#bcc0cc"
let s:text = "#4c4f69"
let s:blue = "#1e66f5"
let s:green = "#40a02b"
let s:yellow = "#df8e1d"
let s:red = "#d20f39"
let s:mauve = "#8839ef"

let s:N1 = [s:base, s:blue, 15, 33]
let s:N2 = [s:text, s:surface1, 239, 250]
let s:N3 = [s:text, s:surface0, 239, 252]
let g:airline#themes#catppuccin#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:I1 = [s:base, s:green, 15, 70]
let s:I2 = [s:text, s:surface1, 239, 250]
let s:I3 = [s:text, s:surface0, 239, 252]
let g:airline#themes#catppuccin#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let s:V1 = [s:base, s:mauve, 15, 93]
let s:V2 = [s:text, s:surface1, 239, 250]
let s:V3 = [s:text, s:surface0, 239, 252]
let g:airline#themes#catppuccin#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let s:R1 = [s:base, s:red, 15, 160]
let s:R2 = [s:text, s:surface1, 239, 250]
let s:R3 = [s:text, s:surface0, 239, 252]
let g:airline#themes#catppuccin#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

let s:IA1 = [s:text, s:mantle, 239, 253]
let s:IA2 = [s:text, s:mantle, 239, 253]
let s:IA3 = [s:text, s:mantle, 239, 253]
let g:airline#themes#catppuccin#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

let g:airline#themes#catppuccin#palette.normal.airline_warning = [s:base, s:yellow, 15, 178]
let g:airline#themes#catppuccin#palette.normal.airline_error = [s:base, s:red, 15, 160]
