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

let g:colors_name = "lichen"
let s:lichen_vim_version = "0.0.1"
set background=dark


let s:lichen1_term = "0" " black
let s:lichen3_term = "245" " grey 54 (vim numbers and window lines)
let s:lichen5_term = "249" " grey 70 (default text)
let s:lichen6_term = "94" " faded lichen orange (colons, brackets, semicolons, etc)
let s:lichen7_term = "30" " spring green i don't see this much (types, and primitives)
let s:lichen8_term = "22" " dark lichen green (function and classes)
let s:lichen9_term = "65" " muted lighter green (support chars, operators, punctuation, etc.)
let s:lichen10_term = "29" " orange4 i don't see this much (tertiary, comment keywords, preprocessor statements, etc.)
let s:lichen11_term = "88" " dark red i don't see this much (syntax elements detetced as errors)
let s:lichen12_term = "130" " dark orange 3 i don't see this much (annotations or decorators)
let s:lichen13_term = "137" " light salmon / dark orangish (escape chars in regex like \n)
let s:lichen14_term = "66" " light mossy green (strings)
let s:lichen15_term = "52" " muted red rock / dark clay (numbers)

if !exists("g:lichen_bold")
  let g:lichen_bold = 1
endif

let s:bold = "bold,"
if g:lichen_bold == 0
  let s:bold = ""
endif

if !exists("g:lichen_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:lichen_italic = 1
  else
    let g:lichen_italic = 0
  endif
endif

let s:italic = "italic,"
if g:lichen_italic == 0
  let s:italic = ""
endif

let s:underline = "underline,"
if ! get(g:, "lichen_underline", 1)
  let s:underline = "NONE,"
endif

let s:italicize_comments = ""
if exists("g:lichen_italic_comments")
  if g:lichen_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif

if !exists('g:lichen_uniform_status_lines')
  let g:lichen_uniform_status_lines = 0
endif

function! s:logWarning(msg)
  echohl WarningMsg
  echomsg 'lichen: warning: ' . a:msg
  echohl None
endfunction

if !exists("g:lichen_uniform_diff_background")
  let g:lichen_uniform_diff_background = 0
endif

if !exists("g:lichen_cursor_line_number_background")
  let g:lichen_cursor_line_number_background = 0
endif

if !exists("g:lichen_bold_vertical_split_line")
  let g:lichen_bold_vertical_split_line = 0
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", s:bold, "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", "", "NONE", s:lichen1_term, "", "")
call s:hi("Cursor", "", "", "", "NONE", "", "")
call s:hi("CursorLine", "", "", "NONE", s:lichen1_term, "NONE", "")
call s:hi("Error", "", "", "", s:lichen11_term, "", "")
call s:hi("iCursor", "", "", "", "NONE", "", "")
call s:hi("LineNr", "", "NONE", s:lichen3_term, "NONE", "", "")
call s:hi("MatchParen", "", "", s:lichen8_term, s:lichen3_term, "", "")
call s:hi("NonText", "", "", s:lichen3_term, "", "", "")
call s:hi("Normal", "", "", s:lichen5_term, "NONE", "", "")
call s:hi("PMenu", "", "", "NONE", s:lichen1_term, "NONE", "")
call s:hi("PmenuSbar", "", "", "NONE", s:lichen1_term, "", "")
call s:hi("PMenuSel", "", "", s:lichen8_term, s:lichen3_term, "", "")
call s:hi("PmenuThumb", "", "", "NONE", s:lichen3_term, "", "")
call s:hi("SpecialKey", "", "", s:lichen3_term, "", "", "")
call s:hi("SpellBad", "", "", s:lichen11_term, "NONE", "undercurl", "")
call s:hi("SpellCap", "", "", s:lichen13_term, "NONE", "undercurl", "")
call s:hi("SpellLocal", "", "", s:lichen5_term, "NONE", "undercurl", "")
call s:hi("SpellRare", "", "", s:lichen6_term, "NONE", "undercurl", "")
call s:hi("Visual", "", "", "", s:lichen1_term, "", "")
call s:hi("VisualNOS", "", "", "", s:lichen1_term, "", "")
"+- Neovim Support -+
call s:hi("healthError", "", "", s:lichen11_term, s:lichen1_term, "", "")
call s:hi("healthSuccess", "", "", s:lichen14_term, s:lichen1_term, "", "")
call s:hi("healthWarning", "", "", s:lichen13_term, s:lichen1_term, "", "")
call s:hi("TermCursorNC", "", "", "", s:lichen1_term, "", "")

"+--- Gutter ---+
call s:hi("CursorColumn", "", "", "NONE", s:lichen1_term, "", "")
if g:lichen_cursor_line_number_background == 0
  call s:hi("CursorLineNr", "", "", "NONE", "", "NONE", "")
else
  call s:hi("CursorLineNr", "", "", "NONE", s:lichen1_term, "NONE", "")
endif
call s:hi("Folded", "", "", s:lichen3_term, s:lichen1_term, s:bold, "")
call s:hi("FoldColumn", "", "", s:lichen3_term, "NONE", "", "")
call s:hi("SignColumn", "", "", s:lichen1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", "", "", s:lichen8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", "", "", s:lichen1_term, "NONE", "", "")
call s:hi("ErrorMsg", "", "", "NONE", s:lichen11_term, "", "")
call s:hi("ModeMsg", "", "", "", "", "", "")
call s:hi("MoreMsg", "", "", s:lichen8_term, "", "", "")
call s:hi("Question", "", "", "NONE", "", "", "")
if g:lichen_uniform_status_lines == 0
  call s:hi("StatusLine", "", "", s:lichen8_term, s:lichen3_term, "NONE", "")
  call s:hi("StatusLineNC", "", "", "NONE", s:lichen1_term, "NONE", "")
  call s:hi("StatusLineTerm", "", "", s:lichen8_term, s:lichen3_term, "NONE", "")
  call s:hi("StatusLineTermNC", "", "", "NONE", s:lichen1_term, "NONE", "")
else
  call s:hi("StatusLine", "", "", s:lichen8_term, s:lichen3_term, "NONE", "")
  call s:hi("StatusLineNC", "", "", "NONE", s:lichen3_term, "NONE", "")
  call s:hi("StatusLineTerm", "", "", s:lichen8_term, s:lichen3_term, "NONE", "")
  call s:hi("StatusLineTermNC", "", "", "NONE", s:lichen3_term, "NONE", "")
endif
call s:hi("WarningMsg", "", "", s:lichen1_term, s:lichen13_term, "", "")
call s:hi("WildMenu", "", "", s:lichen8_term, s:lichen1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", "", "", s:lichen6_term, s:lichen10_term, s:underline, "")
call s:hi("Search", "", "", s:lichen1_term, s:lichen8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", "", "", "NONE", s:lichen1_term, "NONE", "")
call s:hi("TabLineFill", "", "", "NONE", s:lichen1_term, "NONE", "")
call s:hi("TabLineSel", "", "", s:lichen8_term, s:lichen3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", "", "", "NONE", "", "NONE", "")

if g:lichen_bold_vertical_split_line == 0
  call s:hi("VertSplit", "", "", s:lichen3_term, "NONE", "NONE", "")
else
  call s:hi("VertSplit", "", "", s:lichen3_term, s:lichen1_term, "NONE", "")
endif

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", "", "", s:lichen9_term, "", "", "")
call s:hi("Character", "", "", s:lichen14_term, "", "", "")
call s:hi("Comment", "", "", s:lichen3_term, "", s:italicize_comments, "")
call s:hi("Conditional", "", "", s:lichen9_term, "", "", "")
call s:hi("Constant", "", "", "NONE", "", "", "")
call s:hi("Define", "", "", s:lichen9_term, "", "", "")
call s:hi("Delimiter", "", "", s:lichen6_term, "", "", "")
call s:hi("Exception", "", "", s:lichen9_term, "", "", "")
call s:hi("Float", "", "", s:lichen15_term, "", "", "")
call s:hi("Function", "", "", s:lichen8_term, "", "", "")
call s:hi("Identifier", "", "", "NONE", "", "NONE", "")
call s:hi("Include", "", "", s:lichen9_term, "", "", "")
call s:hi("Keyword", "", "", s:lichen9_term, "", "", "")
call s:hi("Label", "", "", s:lichen9_term, "", "", "")
call s:hi("Number", "", "", s:lichen15_term, "", "", "")
call s:hi("Operator", "", "", s:lichen9_term, "", "NONE", "")
call s:hi("PreProc", "", "", s:lichen9_term, "", "NONE", "")
call s:hi("Repeat", "", "", s:lichen9_term, "", "", "")
call s:hi("Special", "", "", "NONE", "", "", "")
call s:hi("SpecialChar", "", "", s:lichen13_term, "", "", "")
call s:hi("SpecialComment", "", "", s:lichen8_term, "", s:italicize_comments, "")
call s:hi("Statement", "", "", s:lichen9_term, "", "", "")
call s:hi("StorageClass", "", "", s:lichen9_term, "", "", "")
call s:hi("String", "", "", s:lichen14_term, "", "", "")
call s:hi("Structure", "", "", s:lichen9_term, "", "", "")
call s:hi("Tag", "", "", "", "", "", "")
call s:hi("Todo", "", "NONE", s:lichen13_term, "NONE", "", "")
call s:hi("Type", "", "", s:lichen9_term, "", "NONE", "")
call s:hi("Typedef", "", "", s:lichen9_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", "", "", s:lichen10_term, "", "", "")
call s:hi("asciidocAttributeList", "", "", s:lichen10_term, "", "", "")
call s:hi("asciidocAttributeRef", "", "", s:lichen10_term, "", "", "")
call s:hi("asciidocHLabel", "", "", s:lichen9_term, "", "", "")
call s:hi("asciidocListingBlock", "", "", s:lichen7_term, "", "", "")
call s:hi("asciidocMacroAttributes", "", "", s:lichen8_term, "", "", "")
call s:hi("asciidocOneLineTitle", "", "", s:lichen8_term, "", "", "")
call s:hi("asciidocPassthroughBlock", "", "", s:lichen9_term, "", "", "")
call s:hi("asciidocQuotedMonospaced", "", "", s:lichen7_term, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", "", "", s:lichen7_term, "", "", "")
hi! link asciidocAdmonition Keyword
hi! link asciidocAttributeRef markdownH1
hi! link asciidocBackslash Keyword
hi! link asciidocMacro Keyword
hi! link asciidocQuotedBold Bold
hi! link asciidocQuotedEmphasized Italic
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownLinkText

call s:hi("awkCharClass", "", "", s:lichen7_term, "", "", "")
call s:hi("awkPatterns", "", "", s:lichen9_term, "", s:bold, "")
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi("cIncluded", "", "", s:lichen7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

call s:hi("cmakeGeneratorExpression", "", "", s:lichen10_term, "", "", "")

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", "", "", s:lichen7_term, "", "", "")
call s:hi("cssDefinition", "", "", s:lichen7_term, "", "NONE", "")
call s:hi("cssIdentifier", "", "", s:lichen7_term, "", s:underline, "")
call s:hi("cssStringQ", "", "", s:lichen7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", "", "", s:lichen8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", "", "", s:lichen7_term, "", "", "")
call s:hi("dtExecKey", "", "", s:lichen7_term, "", "", "")
call s:hi("dtLocaleKey", "", "", s:lichen7_term, "", "", "")
call s:hi("dtNumericKey", "", "", s:lichen7_term, "", "", "")
call s:hi("dtTypeKey", "", "", s:lichen7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:lichen_uniform_diff_background == 0
  call s:hi("DiffAdd", "", "", s:lichen14_term, "NONE", "inverse", "")
  call s:hi("DiffChange", "", "", s:lichen13_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", "", "", s:lichen11_term, "NONE", "inverse", "")
  call s:hi("DiffText", "", "", s:lichen9_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", "", "", s:lichen14_term, s:lichen1_term, "", "")
  call s:hi("DiffChange", "", "", s:lichen13_term, s:lichen1_term, "", "")
  call s:hi("DiffDelete", "", "", s:lichen11_term, s:lichen1_term, "", "")
  call s:hi("DiffText", "", "", s:lichen9_term, s:lichen1_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", "", "", s:lichen7_term, "", "", "")

call s:hi("goBuiltins", "", "", s:lichen7_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", "", "", s:lichen3_term, "", "", "")
call s:hi("helpHyperTextJump", "", "", s:lichen8_term, "", s:underline, "")

call s:hi("htmlArg", "", "", s:lichen7_term, "", "", "")
call s:hi("htmlLink", "", "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", "", "", s:lichen7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", "", "", s:lichen7_term, "", "", "")

call s:hi("lessClass", "", "", s:lichen7_term, "", "", "")
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote", "", "", s:lichen7_term, "", "", "")
call s:hi("markdownCode", "", "", s:lichen7_term, "", "", "")
call s:hi("markdownCodeDelimiter", "", "", s:lichen7_term, "", "", "")
call s:hi("markdownFootnote", "", "", s:lichen7_term, "", "", "")
call s:hi("markdownId", "", "", s:lichen7_term, "", "", "")
call s:hi("markdownIdDeclaration", "", "", s:lichen7_term, "", "", "")
call s:hi("markdownH1", "", "", s:lichen8_term, "", "", "")
call s:hi("markdownLinkText", "", "", s:lichen8_term, "", "", "")
call s:hi("markdownUrl", "", "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", "", "", s:lichen7_term, "", "", "")

call s:hi("phpClasses", "", "", s:lichen7_term, "", "", "")
call s:hi("phpClass", "", "", s:lichen7_term, "", "", "")
call s:hi("phpDocTags", "", "", s:lichen7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword
hi! link phpMethod Function
hi! link phpFunction Function

call s:hi("podCmdText", "", "", s:lichen7_term, "", "", "")
call s:hi("podVerbatimLine", "", "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", "", "", s:lichen7_term, "", "", "")
call s:hi("rubySymbol", "", "", s:lichen6_term, "", s:bold, "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("rustAttribute", "", "", s:lichen10_term, "", "", "")
call s:hi("rustEnum", "", "", s:lichen7_term, "", s:bold, "")
call s:hi("rustMacro", "", "", s:lichen8_term, "", s:bold, "")
call s:hi("rustModPath", "", "", s:lichen7_term, "", "", "")
call s:hi("rustPanic", "", "", s:lichen9_term, "", s:bold, "")
call s:hi("rustTrait", "", "", s:lichen7_term, "", s:italic, "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi("sassClass", "", "", s:lichen7_term, "", "", "")
call s:hi("sassId", "", "", s:lichen7_term, "", s:underline, "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", "", "", s:lichen7_term, "", "", "")
call s:hi("vimMapRhs", "", "", s:lichen7_term, "", "", "")
call s:hi("vimNotation", "", "", s:lichen7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", "", "", s:lichen7_term, "", "", "")
call s:hi("xmlCdataStart", "", "", s:lichen3_term, "", s:bold, "")
call s:hi("xmlNamespace", "", "", s:lichen7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", "", "", s:lichen7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword
