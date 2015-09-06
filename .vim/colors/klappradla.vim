" Vim color scheme
"
" Name:        klappradla
" Maintainer:  klappradla@gmail.com
" URL:	       github.com/klappradla/...	

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

" your pick:
set background=dark	" or light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="klappradla"

" normal text
hi Normal         guifg=#d0d0d0 ctermfg=252

" OR

" highlight clear Normal
" set background&
" highlight clear
" if &background == "light"
"   highlight Error ...
"   ...
" else
"   highlight Error ...
"   ...
" endif

" A good way to see what your colorscheme does is to follow this procedure:
" :w 
" :so % 
"
" Then to see what the current setting is use the highlight command.  
" For example,
" 	:hi Cursor
" gives
"	Cursor         xxx guifg=bg guibg=fg 
 	
" Uncomment and complete the commands you want to change from the default.

"hi Cursor		
"hi CursorIM	
"hi Directory	
"hi DiffAdd		
"hi DiffChange	
"hi DiffDelete	
"hi DiffText	
"hi ErrorMsg	
"hi VertSplit	
"hi Folded		
"hi FoldColumn	
"hi IncSearch	
hi LineNr	      	guifg=#E4BF7A ctermfg=180 gui=NONE
"hi ModeMsg		
"hi MoreMsg		
"hi NonText		
"hi Question	
"hi Search		
"hi SpecialKey	
"hi StatusLine	
"hi StatusLineNC	
"hi Title		
"hi Visual		
"hi VisualNOS	
"hi WarningMsg	
"hi WildMenu	
"hi Menu		
"hi Scrollbar	
"hi Tooltip		

" syntax highlighting groups

" quotation marks, strings
"hi Character     guifg=#8AD6F2 ctermfg=117

" comments
hi Comment        guifg=#P6D6D6 ctermfg=59 gui=NONE

" nil, ruby symbols, etc.
hi Constant	      guifg=#8AD6F2 ctermfg=117

hi Conditional    guifg=#E88388 ctermfg=174 gui=NONE

" ruby-class /-module, def, end, ect.
hi Define         guifg=#E88388 ctermfg=174 gui=NONE

" ruby function
hi Function       guifg=#f2aaec ctermfg=219 gui=NONE

" ruby identifier, @... @@
hi Identifier     guifg=#E4BF7A ctermfg=180

" ruby include, extend, etc.
hi Include        guifg=#E88388 ctermfg=174 gui=NONE

" ruby integer
hi Number 	      guifg=#8AD6F2 ctermfg=117

" +, *, etc.
hi Operator       guifg=#E88388 ctermfg=174 gui=NONE

" ruby "#{}", etc.
hi Special        guifg=#8CEDDC ctermfg=122 gui=NONE

" if else, unless, begin, case, etc.
hi Statement      guifg=#E88388 ctermfg=174

hi String 	      guifg=#8AD6F2 ctermfg=117


" Ruby
" ----
hi rubyClass                 guifg=#E88388 ctermfg=174
hi rubyModule                guifg=#E88388 ctermfg=174
hi rubyConstant              guifg=#F7FCA2 ctermfg=229
hi rubyInterpolation         guifg=#dfdfff ctermfg=122
hi rubyKeyword               guifg=#E88388 ctermfg=174
hi rubyBlockParameter        guifg=#E4BF7A ctermfg=180

" self, etc.
hi rubyPseudoVariable        guifg=#E4BF7A ctermfg=180
hi rubyStringDelimiter       guifg=#8AD6F2 ctermfg=117
hi rubyInstanceVariable      guifg=#E4BF7A ctermfg=180
"hi rubyPredefinedConstant    guifg=#df5f5f ctermfg=167
hi rubyLocalVariableOrMethod guifg=#dfdfff ctermfg=189


" ERB
hi erubyDelimiter            guifg=#E4BF7A ctermfg=180
" XML
" ---
hi xmlTag                    guifg=#F7FCA2 ctermfg=229
hi xmlTagName                guifg=#BAE682 ctermfg=150
hi xmlEndTag                 guifg=#F7FCA2 ctermfg=229
hi xmlAttrib                 guifg=#F7FCA2 ctermfg=229
hi xmlTagName                guifg=#BAE682 ctermfg=150


" HTML
" ----
hi! link htmlTag              xmlTag
hi! link htmlTagName          xmlTagName
hi! link htmlTagN          xmlTagName
hi htmlArg                guifg=#BAE682 ctermfg=150
hi! link htmlSpecialTagName   xmlTagName
hi! link htmlEndTag           xmlEndTag
	
"hi PreProc	
"hi Type		
"hi Special	
"hi Underlined	
"hi Ignore		
"hi Error		
"hi Todo		

