" vim plug section
call plug#begin('~/.vim/plugged')

" plugins from github repos:
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'klappradla/klappradla.vim'
Plug 'bling/vim-airline'
" add plugins to runtime path
call plug#end()

" plugin specific config
" NERDTree
let NERDTreeShowHidden=1
" CTRLP
let g:ctrlp_show_hidden=1
" airlines
set noshowmode
set laststatus=2
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

colorscheme default
"set t_Co=256
set background=dark
syntax on

set nocompatible

" use os clipboard by default
set clipboard=unnamed

" disable backups
set nobackup
set nowritebackup
set noswapfile 

" set encoding to utf-8
set encoding=utf-8

" make backspace behave in a sane manner
set backspace=indent,eol,start

" set tabsize to 2 (softtabs)
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" enable syntax highlighting
syntax enable
" ad ruby operators
let ruby_operators = 1

" allow mouse in all modes
set mouse=a

" show cursor position (line number, etc.)
set ruler

" show filename in window bar
set title

" Enable file type detection and do language-dependent indenting.
filetype on
filetype plugin on
filetype plugin indent on

" Show line numbers
set number

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden
