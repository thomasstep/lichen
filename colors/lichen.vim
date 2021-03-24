" Copyright (C) 2021-present Thomas Step <tstep916@gmail.com>

" Project: lichen
" Repository: https://github.com/thomasstep/lichen
" LIcense: MIT

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name="lichen"
let s:lichen_vim_version="0.0.1"
set background=dark

let s:lichen1_term = "0" " black
let s:lichen3_term = "245" " grey 54 (vim numbers and window lines)
let s:lichen5_term = "249" " grey 70 (default text)
let s:lichen6_term = "94" " faded lichen orange (colons, brackets, semicolons, etc)
let s:lichen7_term = "30" " spring green i don't see this much (types, and primitives)
let s:lichen8_term = "22" " dark pine green (function and classes)
let s:lichen9_term = "66" " light mossy green (support chars, operators, punctuation, etc.)
let s:lichen10_term = "29" " orange4 i don't see this much (tertiary, comment keywords, preprocessor statements, etc.)
let s:lichen11_term = "88" " dark red i don't see this much (syntax elements detetced as errors)
let s:lichen12_term = "130" " dark orange 3 i don't see this much (annotations or decorators)
let s:lichen13_term = "143" " dark khaki i don't see this much (syntax elements detected as warning and escape chars in regex)
let s:lichen14_term = "65" " muted lighter green (strings)
let s:lichen15_term = "52" " muted red rock / dark clay (numbers)
