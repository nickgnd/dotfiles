" don't traverse $PATH to find Ruby
let g:ruby_path = "$HOME/.asdf/shims/ruby"

""""""
""" plugins
""""""
call plug#begin()
Plug 'iCyMind/NeoSolarized'
Plug 'morhetz/gruvbox'

Plug 'mileszs/ack.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'bogado/file-line'              " open files directly at line number
Plug 'tpope/vim-eunuch'
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'
Plug 'tpope/vim-endwise'             " for automatically adding 'ends' in ruby
Plug 'machakann/vim-highlightedyank'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'tonekk/vim-binding-pry',    { 'for': 'ruby' }
Plug 'slim-template/vim-slim',    { 'for': 'slim' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'mhinz/vim-mix-format',      { 'for': 'elixir' }
Plug 'pangloss/vim-javascript',   { 'for': 'javascipt' }
Plug 'maxmellon/vim-jsx-pretty',  { 'for': 'javascipt' }
call plug#end()

""""""
""" general
""""""
" map leader to space
let mapleader="\<Space>"
" utf8 encoding
set encoding=utf8
" use the system clipboard
set clipboard=unnamedplus
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
set inccommand=nosplit
" start scrolling before end
set scrolloff=2
" don't wrap lines (except markdown)
set nowrap
  autocmd FileType markdown setlocal wrap
" keep an undo file (in the default location)
set undofile
" enable mouse to stay compatible with tmux scrolling
set mouse=a
" fzf: use fd and show hidden files
let $FZF_DEFAULT_COMMAND = 'fd --type file --hidden --follow --exclude .git'
" use thesilversearcher with ack
let g:ackprg = 'ag --vimgrep --smart-case'
" don't show the command history
set noshowcmd
" disable tree view history
let g:netrw_dirhistmax=0
" automatically format elxir code
let g:mix_format_on_save = 1
" enable deoplete autocompletion
let g:deoplete#enable_at_startup = 1


"""""
""" layout
""""""
" show line numbers
set number
" highlight the cursorline (this may be slow with ruby files)
set cursorline
" highlight 80 and 120 columns
set colorcolumn=80,120
" use true colors
set termguicolors
" dark background
set background=dark
" use neosolarized
colorscheme NeoSolarized
" transparent split bars
let g:neosolarized_vertSplitBgTrans = 1
" hide status line when using FZF
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" configure test runner to run tests in small tmux split
let test#strategy = "vimux"
" disable highlighting bold and italic text in markdown
hi! link markdownItalic Italic
hi! link markdownBold Bold
" highlight fenced code in markdown files
let g:markdown_fenced_languages = ['bash=sh', 'ruby', 'json', 'html']
" split down and right by default
set splitbelow
set splitright
" statusline
set statusline=
set statusline+=%r\     " readonly flag
set statusline+=%t\     " file name
set statusline+=%m      " modfied flag
set statusline+=%=      " --- right side ---
set statusline+=%l:%c\  " cursor position


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
" use ag for Ack
cnoreabbrev ag Ack
" run tests in tmux split
map <leader>t :TestNearest<cr>
map <leader>f :TestFile<cr>
map <leader>l :TestLast<cr>
" fuzzy find buffers
map <leader><space> :Buffers<cr>
" clear search highlights with ESC in normal mode
nnoremap <silent><ESC> :noh<return><ESC>


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
