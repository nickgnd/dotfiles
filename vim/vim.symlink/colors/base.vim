" Vim color file

" Set 'background' back to the default.
set background&

" Remove all existing highlighting and set the defaults.
highlight clear

" Load the syntax highlighting defaults, if highlighting is enabled.
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'base'

" Terminal color definitions (see :help cterm-colors)
let s:c00 = '00'    " Black
let s:c01 = '01'    " DarkBlue
let s:c02 = '02'    " DarkGreen
let s:c03 = '03'    " DarkCyan
let s:c04 = '04'    " DarkRed
let s:c05 = '05'    " DarkMagenta
let s:c06 = '06'    " Brown, DarkYellow
let s:c07 = '07'    " LightGray, LightGrey, Gray, Grey
let s:c08 = '08'    " DarkGray, DarkGrey
let s:c09 = '09'    " Blue, LightBlue
let s:c10 = '10'    " Green, LightGreen
let s:c11 = '11'    " Cyan, LightCyan
let s:c12 = '12'    " Red, LightRed
let s:c13 = '13'    " Magenta, LightMagenta
let s:c14 = '14'    " Yellow, LightYellow
let s:c15 = '15'    " White
let s:cno = 'none'  " Remove color
let s:cxx = ''      " Ignore


" Highlighting function
function! g:Hi(group, ctermfg, ctermbg, ...)
  let l:attr = get(a:, 1, '')

  if a:ctermfg != ''
    exec 'hi ' . a:group . ' ctermfg=' . a:ctermfg
  endif
  if a:ctermbg != ''
    exec 'hi ' . a:group . ' ctermbg=' . a:ctermbg
  endif
  if l:attr != ''
    exec 'hi ' . a:group . ' cterm=' . l:attr
  endif
endfunction


function <sid>hi(group, ctermfg, ctermbg, attr)
  call g:Hi(a:group, a:ctermfg, a:ctermbg, a:attr)
endfun


" Vim editor colors
call <sid>hi('Normal',        s:c07, s:c00, '')
call <sid>hi('Bold',          s:cxx, s:cxx, 'bold')
call <sid>hi('Debug',         s:c01, s:cxx, '')
call <sid>hi('Directory',     s:c04, s:cxx, '')
call <sid>hi('Error',         s:c00, s:c01, '')
call <sid>hi('ErrorMsg',      s:c01, s:c00, '')
call <sid>hi('Exception',     s:c01, s:cxx, '')
call <sid>hi('FoldColumn',    s:c06, s:c00, '')
call <sid>hi('Folded',        s:c06, s:c00, '')
call <sid>hi('IncSearch',     s:c10, s:c09, 'none')
call <sid>hi('Italic',        s:cxx, s:cxx, 'none')
call <sid>hi('Macro',         s:c01, s:cxx, '')
call <sid>hi('MatchParen',    s:cxx, s:c08, '')
call <sid>hi('ModeMsg',       s:c06, s:cxx, '')
call <sid>hi('MoreMsg',       s:c06, s:cxx, '')
call <sid>hi('Question',      s:c04, s:cxx, '')
call <sid>hi('Search',        s:c00, s:c03, '')
call <sid>hi('Substitute',    s:c00, s:c03, 'none')
call <sid>hi('SpecialKey',    s:c06, s:cxx, '')
call <sid>hi('TooLong',       s:c01, s:cxx, '')
call <sid>hi('Underlined',    s:c01, s:cxx, '')
call <sid>hi('Visual',        s:c00, s:c11, '')
call <sid>hi('VisualNOS',     s:c01, s:cxx, '')
call <sid>hi('WarningMsg',    s:c01, s:cxx, '')
call <sid>hi('WildMenu',      s:c00, s:c15, 'bold')
call <sid>hi('Title',         s:c04, s:cno, 'none')
call <sid>hi('Conceal',       s:c04, s:c00, '')
call <sid>hi('Cursor',        s:c00, s:c07, '')
call <sid>hi('NonText',       s:c08, s:cno, '')
call <sid>hi('LineNr',        s:c08, s:cno, '')
call <sid>hi('SignColumn',    s:c08, s:cno, '')
call <sid>hi('StatusLine',    s:c00, s:c08, 'bold')
call <sid>hi('StatusLineNC',  s:c00, s:c08, 'none')
call <sid>hi('VertSplit',     s:c08, s:cno, 'none')
call <sid>hi('ColorColumn',   s:cxx, s:c08, 'none')
call <sid>hi('CursorColumn',  s:cxx, s:cxx, '')
call <sid>hi('CursorLine',    s:cxx, s:cxx, 'bold')
call <sid>hi('CursorLineNr',  s:c15, s:cno, '')
call <sid>hi('QuickFixLine',  s:cxx, s:cxx, 'standout')
call <sid>hi('Pmenu',         s:c08, s:c15, 'none')
call <sid>hi('PmenuSel',      s:c00, s:c07, '')
call <sid>hi('PmenuSbar',     s:cxx, s:cxx, '')
call <sid>hi('PmenuThumb',    s:cxx, s:c08, '')
call <sid>hi('TabLine',       s:c00, s:c07, 'none')
call <sid>hi('TabLineFill',   s:c00, s:c07, 'none')
call <sid>hi('TabLineSel',    s:c07, s:c00, 'bold')

" Standard syntax highlighting
call <sid>hi('Boolean',      s:c09, s:cxx, '')
call <sid>hi('Character',    s:c01, s:cxx, '')
call <sid>hi('Comment',      s:c02, s:cxx, '')
call <sid>hi('Conditional',  s:c05, s:cxx, '')
call <sid>hi('Constant',     s:c09, s:cxx, '')
call <sid>hi('Define',       s:c05, s:cxx, 'none')
call <sid>hi('Delimiter',    s:c14, s:cxx, '')
call <sid>hi('Float',        s:c09, s:cxx, '')
call <sid>hi('Function',     s:c04, s:cxx, '')
call <sid>hi('Identifier',   s:c01, s:cxx, 'none')
call <sid>hi('Include',      s:c04, s:cxx, '')
call <sid>hi('Keyword',      s:c05, s:cxx, '')
call <sid>hi('Label',        s:c03, s:cxx, '')
call <sid>hi('Number',       s:c09, s:cxx, '')
call <sid>hi('Operator',     s:c07, s:cxx, 'none')
call <sid>hi('PreProc',      s:c03, s:cxx, '')
call <sid>hi('Repeat',       s:c03, s:cxx, '')
call <sid>hi('Special',      s:c06, s:cxx, '')
call <sid>hi('SpecialChar',  s:c14, s:cxx, '')
call <sid>hi('Statement',    s:c01, s:cxx, '')
call <sid>hi('StorageClass', s:c03, s:cxx, '')
call <sid>hi('String',       s:c06, s:cxx, '')
call <sid>hi('Structure',    s:c05, s:cxx, '')
call <sid>hi('Tag',          s:c03, s:cxx, '')
call <sid>hi('Todo',         s:c03, s:cno, 'bold')
call <sid>hi('Type',         s:c03, s:cxx, 'none')
call <sid>hi('Typedef',      s:c03, s:cxx, '')

" C highlighting
call <sid>hi('cOperator',   s:c06, s:cxx, '')
call <sid>hi('cPreCondit',  s:c05, s:cxx, '')

" CSS highlighting
call <sid>hi('cssBraces',     s:c07, s:cxx, '')
call <sid>hi('cssClassName',  s:c05, s:cxx, '')
call <sid>hi('cssColor',      s:c06, s:cxx, '')

" Diff highlighting
call <sid>hi('DiffAdd',       s:c02, s:c10, '')
call <sid>hi('DiffChange',    s:c08, s:c10, '')
call <sid>hi('DiffDelete',    s:c01, s:c10, '')
call <sid>hi('DiffText',      s:c04, s:c10, '')
call <sid>hi('DiffAdded',     s:c02, s:cno, '')
call <sid>hi('DiffFile',      s:c01, s:cno, '')
call <sid>hi('DiffNewFile',   s:c02, s:cno, '')
call <sid>hi('DiffLine',      s:c04, s:cno, '')
call <sid>hi('DiffRemoved',   s:c01, s:cno, '')

" Git highlighting
call <sid>hi('gitcommitOverflow',       s:c01, s:cxx, '')
call <sid>hi('gitcommitSummary',        s:c02, s:cxx, '')
call <sid>hi('gitcommitComment',        s:c06, s:cxx, '')
call <sid>hi('gitcommitUntracked',      s:c06, s:cxx, '')
call <sid>hi('gitcommitDiscarded',      s:c06, s:cxx, '')
call <sid>hi('gitcommitSelected',       s:c06, s:cxx, '')
call <sid>hi('gitcommitHeader',         s:c05, s:cxx, '')
call <sid>hi('gitcommitSelectedType',   s:c04, s:cxx, '')
call <sid>hi('gitcommitUnmergedType',   s:c04, s:cxx, '')
call <sid>hi('gitcommitDiscardedType',  s:c04, s:cxx, '')
call <sid>hi('gitcommitBranch',         s:c09, s:cxx, 'bold')
call <sid>hi('gitcommitUntrackedFile',  s:c03, s:cxx, '')
call <sid>hi('gitcommitUnmergedFile',   s:c01, s:cxx, 'bold')
call <sid>hi('gitcommitDiscardedFile',  s:c01, s:cxx, 'bold')
call <sid>hi('gitcommitSelectedFile',   s:c02, s:cxx, 'bold')

" HTML highlighting
call <sid>hi('htmlBold',    s:c03, s:cxx, '')
call <sid>hi('htmlItalic',  s:c05, s:cxx, '')
call <sid>hi('htmlEndTag',  s:c07, s:cxx, '')
call <sid>hi('htmlTag',     s:c07, s:cxx, '')

" Java highlighting
call <sid>hi('javaOperator',  s:c04, s:cxx, '')

" JavaScript highlighting
call <sid>hi('javaScript',          s:c07, s:cxx, '')
call <sid>hi('javaScriptBraces',    s:c07, s:cxx, '')
call <sid>hi('javaScriptNumber',    s:c09, s:cxx, '')
" pangloss/vim-javascript highlighting
call <sid>hi('jsOperator',          s:c04, s:cxx, '')
call <sid>hi('jsStatement',         s:c05, s:cxx, '')
call <sid>hi('jsReturn',            s:c05, s:cxx, '')
call <sid>hi('jsThis',              s:c01, s:cxx, '')
call <sid>hi('jsClassDefinition',   s:c03, s:cxx, '')
call <sid>hi('jsFunction',          s:c05, s:cxx, '')
call <sid>hi('jsFuncName',          s:c04, s:cxx, '')
call <sid>hi('jsFuncCall',          s:c04, s:cxx, '')
call <sid>hi('jsClassFuncName',     s:c04, s:cxx, '')
call <sid>hi('jsClassMethodType',   s:c05, s:cxx, '')
call <sid>hi('jsRegexpString',      s:c06, s:cxx, '')
call <sid>hi('jsGlobalObjects',     s:c03, s:cxx, '')
call <sid>hi('jsGlobalNodeObjects', s:c03, s:cxx, '')
call <sid>hi('jsExceptions',        s:c03, s:cxx, '')
call <sid>hi('jsBuiltins',          s:c03, s:cxx, '')

" Mail highlighting
call <sid>hi('mailQuoted1',  s:c03, s:cxx, '')
call <sid>hi('mailQuoted2',  s:c02, s:cxx, '')
call <sid>hi('mailQuoted3',  s:c05, s:cxx, '')
call <sid>hi('mailQuoted4',  s:c06, s:cxx, '')
call <sid>hi('mailQuoted5',  s:c04, s:cxx, '')
call <sid>hi('mailQuoted6',  s:c03, s:cxx, '')
call <sid>hi('mailURL',      s:c04, s:cxx, '')
call <sid>hi('mailEmail',    s:c04, s:cxx, '')

" Markdown highlighting
call <sid>hi('markdownCode',              s:c02, s:cxx, '')
call <sid>hi('markdownError',             s:c07, s:c00, '')
call <sid>hi('markdownCodeBlock',         s:c02, s:cxx, '')
call <sid>hi('markdownHeadingDelimiter',  s:c04, s:cxx, '')

" PHP highlighting
call <sid>hi('phpMemberSelector',  s:c07, s:cxx, '')
call <sid>hi('phpComparison',      s:c07, s:cxx, '')
call <sid>hi('phpParent',          s:c07, s:cxx, '')
call <sid>hi('phpMethodsVar',      s:c06, s:cxx, '')

" Python highlighting
call <sid>hi('pythonOperator',  s:c05, s:cxx, '')
call <sid>hi('pythonRepeat',    s:c05, s:cxx, '')
call <sid>hi('pythonInclude',   s:c05, s:cxx, '')
call <sid>hi('pythonStatement', s:c05, s:cxx, '')

" Ruby highlighting
call <sid>hi('rubyAttribute',               s:c04, s:cxx, '')
call <sid>hi('rubyConstant',                s:c03, s:cxx, '')
call <sid>hi('rubyInterpolationDelimiter',  s:c14, s:cxx, '')
call <sid>hi('rubyRegexp',                  s:c06, s:cxx, '')
call <sid>hi('rubySymbol',                  s:c02, s:cxx, '')
call <sid>hi('rubyStringDelimiter',         s:c02, s:cxx, '')

" Sass highlighting
call <sid>hi('sassidChar',     s:c01, s:cxx, '')
call <sid>hi('sassClassChar',  s:c09, s:cxx, '')
call <sid>hi('sassInclude',    s:c05, s:cxx, '')
call <sid>hi('sassMixing',     s:c05, s:cxx, '')
call <sid>hi('sassMixinName',  s:c04, s:cxx, '')

" Spelling highlighting
call <sid>hi('SpellBad',     s:cxx, s:cxx, 'undercurl')
call <sid>hi('SpellLocal',   s:cxx, s:cxx, 'undercurl')
call <sid>hi('SpellCap',     s:cxx, s:cxx, 'undercurl')
call <sid>hi('SpellRare',    s:cxx, s:cxx, 'undercurl')

" Remove functions
delfunction <sid>hi

" Remove color variables
unlet s:c00 s:c01 s:c02 s:c03 s:c04 s:c05 s:c06 s:c07 s:c08 s:c09 s:c10 s:c11 s:c12 s:c13 s:c14 s:c15
