" Vim color scheme
"
" Name:        klappradla
" Maintainer:  klappradla@gmail.com
" URL:	       github.com/klappradla/...	

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark	" or light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="klappradla"

" ---------------------------
" Editor Settings
" ---------------------------
hi Normal            guifg=#ffffff    ctermfg=231    gui=NONE
"hi Cursor
"hi CursorLine
hi LineNr            guifg=#B9C0CB    ctermfg=146    gui=NONE
"hi CursorLineNR

" -----------------
" - Number column -
" -----------------
"hi CursorColumn
"hi FoldColumn
"hi SignColumn
"hi Folded

" -------------------------
" - Window/Tab delimiters - 
" -------------------------
"hi VertSplit
"hi ColorColumn
"hi TabLine
"hi TabLineFill
"hi TabLineSel

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
"hi Directory
"hi Search
"hi IncSearch

" -----------------
" - Prompt/Status -
" -----------------
"hi StatusLine
"hi StatusLineNC
"hi WildMenu
"hi Question
"hi Title
"hi ModeMsg
"hi MoreMsg

" --------------
" - Visual aid -
" --------------
"hi MatchParen
"hi Visual
"hi VisualNOS
"hi NonText

"hi Todo
"hi Underlined
"hi Error
"hi ErrorMsg
"hi WarningMsg
"hi Ignore
"hi SpecialKey

" --------------------------------
" Code
" --------------------------------
" ruby: nil, symbols
hi Constant          guifg=#8AD6F2    ctermfg=117    gui=NONE
hi String            guifg=#8AD6F2    ctermfg=117    gui=NONE
hi StringDelimiter   guifg=#8AD6F2    ctermfg=117    gui=NONE
"hi Character
hi Number            guifg=#8AD6F2    ctermfg=117    gui=NONE
"hi Boolean
"hi Float
" ruby: @variable, @@variable
hi Identifier        guifg=#E4BF7A    ctermfg=180    gui=NONE
hi Function          guifg=#f2aaec    ctermfg=219    gui=NONE

" --------------------------------
" Language constructs
" --------------------------------
" if, else, begin
hi Statement          guifg=#E88388   ctermfg=174    gui=NONE
hi Conditional        guifg=#E88388   ctermfg=174    gui=NONE
"hi Repeat
"hi Label
hi Operator          guifg=#E88388    ctermfg=174    gui=NONE
"hi Keyword
"hi Exception
hi Comment           guifg=#4A515D    ctermfg=59     gui=NONE
" ruby "#{}"
hi Special           guifg=#8CEDDC    ctermfg=122    gui=NONE
"hi SpecialChar
"hi Tag
"hi Delimiter
"hi SpecialComment
"hi Debug

" -------------------------------
" - C like -
"" ------------------------------
"hi PreProc
" include, extend
hi Include           guifg=#E88388    ctermfg=174    gui=NONE
" class, module, def end
hi Define            guifg=#E88388    ctermfg=174    gui=NONE
"hi Macro
"hi PreCondit

"hi Type
"hi StorageClass
"hi Structure
"hi Typedef

" --------------------------------
" Diff
" --------------------------------
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText

" --------------------------------
" Completion menu
" --------------------------------
"hi Pmenu
"hi PmenuSel
"hi PmenuSbar
"hi PmenuThumb

" --------------------------------
" Spelling
" --------------------------------
"hi SpellBad
"hi SpellCap
"hi SpellLocal
"hi SpellRare

" --------------------------------
" Ruby
" --------------------------------
"hi rubyTodo
hi rubyClass           guifg=#E88388    ctermfg=174    gui=NONE
" class names
hi rubyConstant        guifg=#F7FCA2    ctermfg=229
"hi rubyInterpolation
"hi rubyKeyword
hi rubyBlockParameter  guifg=#E4BF7A    ctermfg=180
hi rubyOperator        guifg=#E88388   ctermfg=174    gui=NONE
hi rubyPseudoVariable  guifg=#E4BF7A    ctermfg=180
"hi rubyStringDelimiter
"hi rubyInstanceVariable
"hi rubyPredefinedConstant
"hi rubyLocalVariableOrMethod

" --------------------------------
" - Rails
" --------------------------------
" erb tags
hi erubyDelimiter                guifg=#E4BF7A       ctermfg=180

" --------------------------------
" XML 
" --------------------------------
hi xmlTag                        guifg=#F7FCA2       ctermfg=229
hi xmlTagName                    guifg=#BAE682       ctermfg=150
hi xmlEndTag                     guifg=#F7FCA2       ctermfg=229
hi xmlAttrib                     guifg=#F7FCA2       ctermfg=229
hi xmlTagName                    guifg=#BAE682       ctermfg=150

" --------------------------------
" HTML
" --------------------------------
hi! link htmlTag                 xmlTag
hi! link htmlTagName             xmlTagName
hi! link htmlTagN                xmlTagName
hi htmlArg                       guifg=#BAE682       ctermfg=150
hi! link htmlSpecialTagName      xmlTagName
hi! link htmlEndTag              xmlEndTag
