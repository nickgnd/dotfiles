""""""
""" plugins
""""""
call plug#begin()
Plug 'iCyMind/NeoSolarized'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'mileszs/ack.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'ajh17/VimCompletesMe'
Plug 'bogado/file-line'
" not sure about this one yet...
" Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-eunuch'
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'

Plug 'machakann/vim-highlightedyank'
Plug 'tonekk/vim-binding-pry'

Plug 'slim-template/vim-slim'
call plug#end()

""""""
""" general
""""""
" map leader to space
let mapleader=" "
" utf8 encoding
set encoding=utf8
" automatically write buffers when switching focus
set autowriteall
" 2 spaces indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
" convert tabs to spaces
set expandtab
" search smart about the case
set ignorecase
set smartcase
" interactive substitute
set inccommand=split
" start scrolling before end
set scrolloff=2
" don't wrap lines (except markdown)
set nowrap
  autocmd FileType markdown setlocal wrap
" keep an undo file (in the default location)
set undofile
" enable mouse to stay compatible with tmux scrolling
set mouse=a
" fzf: use ag and show hidden files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
" use thesilversearcher with ack
let g:ackprg = 'ag --vimgrep --smart-case'


""""""
""" layout
""""""
" show line numbers
set number
" speed up scrolling ruby files (by not showing the cursorline)
set nocursorline
" use true colors
set termguicolors
" dark background
set background=dark
" use neosolarized
colorscheme NeoSolarized
" transparent split bars
let g:neosolarized_vertSplitBgTrans = 1
" configure lightline
let g:lightline = { 'colorscheme': 'solarized',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo']]
  \     }
  \ }
" hide default status line
set noshowmode
" hide status line when using FZF
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" configure nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeWinSize=40
let NERDTreeShowHidden=1
" configure test runner to run tests in small tmux split
let test#strategy = "vimux"
" disable highlighting bold and italic text in markdown
hi! link markdownItalic Italic
hi! link markdownBold Bold
" split down and right by default
set splitbelow
set splitright


""""""
""" spelling
""""""
" spell check for commit messages
autocmd FileType gitcommit setlocal spell
" spell check for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
" autocomplete words
set complete+=kspell


""""""
""" mappings
""""""
" quickly navigate splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" ctrl p for fzf
nnoremap <silent> <c-p> :Files<cr>
" ctrl n to toggle tree view
map <silent> <C-n> :NERDTreeToggle<cr>
" use ag for Ack
cnoreabbrev ag Ack
" run tests in tmux split
map <leader>t :TestNearest<cr>
map <leader>f :TestFile<cr>


""""""
""" functions
""""""
" strip trailing whitespace
fun! StripTrailingWhiteSpace()
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
autocmd bufwritepre * :call StripTrailingWhiteSpace()
